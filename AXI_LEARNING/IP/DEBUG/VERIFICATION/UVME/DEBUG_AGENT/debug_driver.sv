class debug_driver extends uvm_driver#(debug_seq_item);

  `uvm_component_utils(debug_driver)
  virtual dut_if vif;
  debug_seq_item seq_item;
  debug_seq_item temp_req;
  
  tap_state current_state = X;
  bit        exit = 0;
  bit dr_shifted_out = 0;
  bit ir_shifted_out = 0;
  logic [63:0]reg_file [16'h1000:16'h101f] ;
  logic [63:0]memory[int] ; 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dut_if)::get(this,"","vif",vif)) begin
      `uvm_error("build_phase","driver virtual interface failed")
    end
    load_reg_file();
  endfunction

 task reset_phase(uvm_phase phase); 
        phase.raise_objection(this);
        vif.trstn   = 1'b1;
        vif.presetn = 1'b1;
        @(negedge vif.pclock) ; 
        vif.trstn   = 1'b0;
        vif.presetn = 1'b0;
        repeat($urandom_range(2,3)) @(negedge vif.tck) ; 
        vif.trstn   = 1'b1;
        vif.presetn = 1'b1;
        phase.drop_objection(this);
 endtask: reset_phase  //reset phase


 task run_phase(uvm_phase phase);
   
   repeat(2)@(posedge vif.pclock) ;
   vif.set_tms(1);
   wait(vif.trstn == 1'b1);
   fork
     exception_check();
     data_driver();
   join_none
    vif.ebreak = 1'b0;
    vif.step   = 1'b0 ; 
    forever 
    begin
       seq_item_port.get_next_item(seq_item) ;
       $cast(temp_req, seq_item.clone()); // temp_req will be modified
       if(temp_req.ebreak || temp_req.step ) 
           begin
           `uvm_info("Driver" , "inside ebreak condition " , UVM_LOW) ;
             @(negedge vif.pclock) ; 
             vif.ebreak = temp_req.ebreak;
             vif.step   = temp_req.step ;
             repeat(1)@(negedge vif.pclock);
             vif.ebreak = 1'b0;
             vif.step   = 1'b0 ;
           
             temp_req.instr = DMI_ACCESS ;
             temp_req.data = (`DM_CONTROL | `DM_ACTIVE  | `OP_WRITE | `RESUMEREQ ); 
             ir_seq();
             dr_seq();

             temp_req.data = (`DM_CONTROL | `DM_ACTIVE  | `OP_WRITE  ); 
             dr_seq();
             temp_req.ir_dr = 2'b11 ; //no operation
           end

       if(temp_req.instr != DMI_ACCESS)
            temp_req.data_sz = 32-1 ; 
       //temp_req.print();
       if ((!temp_req.ir_dr[1]) && (!temp_req.ir_dr[0]))
          begin
            ir_seq();
            dr_seq();
          end
       else if ((!temp_req.ir_dr[1]) && (temp_req.ir_dr[0]))
          begin
            dr_seq();
          end
       else if ((temp_req.ir_dr[1]) && (!temp_req.ir_dr[0]))
          begin
            ir_seq();
        end
      seq_item_port.item_done();

    end

 endtask:run_phase
  
  extern task dr_seq();
  extern task ir_seq();
  extern function void compute_state();
  extern function void drive_tms_ir();
  extern function void drive_tms_dr();
  extern task data_driver();
  extern task exception_check();
  extern function void load_reg_file();
endclass 

function void debug_driver::load_reg_file();
    foreach(reg_file[i]) begin
        reg_file[i] = {$urandom() , $urandom()} ;  
    end
endfunction

task debug_driver::exception_check();
//forever begin
forever @(negedge vif.pclock) begin
 if( vif.debug_mem_write_enable ) begin
    if(vif.debug_mem_strobe == 16'hFF && vif.debug_mem_write_addr[2:0] != 3'b00)begin
        vif.exception = 1'b1 ;
     end
    else if(vif.debug_mem_strobe == 16'h0F && vif.debug_mem_write_addr[1:0] != 2'b00)
        vif.exception = 1'b1 ;
    else if(vif.debug_mem_strobe == 16'h03 && vif.debug_mem_write_addr[0] != 1'b0 )
        vif.exception = 1'b1 ;
    else 
        vif.exception = 1'b0 ; 
  end
  
  else if((vif.debug_mem_read_enable == 1'b1 ) || (vif.debug_mem_read_valid == 1'b1 ))begin
        if(vif.debug_mem_strobe == 16'hFF && vif.debug_mem_read_addr[2:0] != 3'b00)
             vif.exception = 1'b1 ;
        else if(vif.debug_mem_strobe == 16'h0F && vif.debug_mem_read_addr[1:0] != 2'b00)
            vif.exception = 1'b1 ;
        else if(vif.debug_mem_strobe == 16'h03 && vif.debug_mem_read_addr[0] != 1'b0 )
            vif.exception = 1'b1 ;
        else 
            vif.exception = 1'b0 ;  
   end

  else
      vif.exception = 1'b0 ; 
 end
 //end
endtask

task debug_driver::data_driver();
  //        forever begin
       forever @(posedge vif.pclock ) begin 
            if(vif.debug_reg_read_enable) begin
                vif.debug_reg_read_valid = 1'b1 ;
                vif.debug_reg_read_data  = reg_file[vif.debug_reg_address] ;
              end
            else if(vif.debug_reg_write_enable)begin
                reg_file[vif.debug_reg_address] = vif.debug_reg_write_data ;
                end
            else begin
                vif.debug_reg_read_valid = 1'b0 ;
                vif.debug_reg_read_data  = 0 ; 
                end 
            if(vif.debug_mem_read_enable)
                begin
                   // @(posedge vif.pclock) ;
                    vif.debug_mem_read_valid = 1'b1;
                    vif.debug_mem_read_data  = {$urandom() , $urandom()} ; // memory[vif.debug_mem_read_addr] ;
                end
             else
                 begin
                   // @(posedge vif.pclock)
                    vif.debug_mem_read_valid = 1'b0 ;
                    vif.debug_mem_read_data  = 0 ;
                 end
            if(vif.debug_mem_write_enable)
                begin
                    memory[vif.debug_mem_write_addr] = vif.debug_mem_write_data ; 
                end
        end
        //end
endtask

task debug_driver::dr_seq();
  
  this.exit = 0;
  
  while (!this.exit)
    begin
      drive_tms_dr();
      @vif.tb_ck;
      compute_state();
    end
  
endtask // dr_seq

task debug_driver::ir_seq();
  
  this.exit = 0;
  
  while (!this.exit)
    begin
      drive_tms_ir();
      @vif.tb_ck;
      compute_state();
    end

endtask // ir_seq

// compute tms based on current state
function void debug_driver::drive_tms_dr();
    
  static int cnt = 0;
  
  this.exit = 0;
  
  vif.set_tms(0);
  
  case (this.current_state)
    X:
      begin
        vif.set_tms(1);
      end
    IDLE:
      begin
        vif.set_tms(1);
      end
    SHIFT_DR:
      begin
        if (this.temp_req.data_sz > cnt)
          begin
            this.vif.set_tdi(this.temp_req.data[cnt]);
            cnt++;
          end
        else
          begin
           
            this.vif.set_tdi(this.temp_req.data[cnt]);
            
            vif.set_tms(1);
            cnt = 0 ; 
          end
      end
    EXIT_DR:
      begin
        vif.set_tms(1);
      end
    UPDATE_DR:
      begin
        this.exit = 1;
      end
    default:
      begin
        vif.set_tms(0);
      end
  endcase 
  
endfunction 


// compute tms based on current state
function void debug_driver::drive_tms_ir();
    
  this.exit = 0;
  
  vif.set_tms(0);
  
  case (this.current_state)
    X:
      begin
        vif.set_tms(1);
      end
    IDLE:
      begin
        vif.set_tms(1);
      end
    SELECT_DR:
      begin
        vif.set_tms(1);
      end
    SHIFT_IR:
      begin
        if (this.temp_req.instr_sz > 0)
          begin
            vif.jtag_tb_mod.tb_ck.tdi <= this.temp_req.instr[this.temp_req.instr_sz];
            this.temp_req.instr_sz--;
          end
        else
          begin
            vif.jtag_tb_mod.tb_ck.tdi <= this.temp_req.instr[this.temp_req.instr_sz];
            vif.set_tms(1);
          end
      end
    EXIT_IR:
      begin
        vif.set_tms(1);
      end
    UPDATE_IR:
      begin
        this.exit = 1;
      end
    default:
      begin
        vif.jtag_tb_mod.tb_ck.tms <= 0;
        vif.set_tms(0);
      end
  endcase 

endfunction 

// compute next state based on tms
function void debug_driver::compute_state();
  
  case (this.current_state)
    X:
      begin 
        if(vif.jtag_tb_mod.tb_ck.tms == 1) 
          this.current_state = RESET;
      end        
    RESET:
      begin 
        if(vif.jtag_tb_mod.tb_ck.tms == 0) 
          this.current_state = IDLE;
        else 
          this.current_state = RESET; 
      end
    IDLE: 
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1) 
          this.current_state = SELECT_DR;
        else 
          this.current_state = IDLE;
      end
    SELECT_DR: 
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1) 
          this.current_state = SELECT_IR;
        else
          this.current_state = CAPTURE_DR;
      end
    SELECT_IR: 
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = RESET;
        else
          this.current_state = CAPTURE_IR;
      end
    CAPTURE_DR: 
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = EXIT_DR;
        else
          this.current_state = SHIFT_DR;
      end
    CAPTURE_IR: 
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = EXIT_IR;
        else
          this.current_state = SHIFT_IR;
      end
    SHIFT_DR: 
      begin
        //rsp.data = {vif.jtag_tb_mod.tb_ck.tdo, rsp.data[40:1]};
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = EXIT_DR;
      end
    SHIFT_IR: 
      begin
       // rsp.instr = {vif.jtag_tb_mod.tb_ck.tdo, rsp.instr[4:1]};
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = EXIT_IR;
      end
    EXIT_DR:
      begin
       // rsp.data = {vif.jtag_tb_mod.tb_ck.tdo, rsp.data[40:1]};
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = UPDATE_DR;
        else
          this.current_state = PAUSE_DR;
      end
    EXIT_IR:
      begin
        //rsp.instr = {vif.jtag_tb_mod.tb_ck.tdo, rsp.instr[4:1]};
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = UPDATE_IR;
        else
          this.current_state = PAUSE_IR;
      end
    PAUSE_DR:
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = EXIT2_DR;
      end
    PAUSE_IR:
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = EXIT2_IR;
      end
    EXIT2_DR:
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = UPDATE_DR;
        else
          this.current_state = SHIFT_DR;
      end
    EXIT2_IR:
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = UPDATE_IR;
        else
          this.current_state = SHIFT_IR;
      end
    UPDATE_DR, UPDATE_IR:
      begin
        if(vif.jtag_tb_mod.tb_ck.tms == 1)
          this.current_state = SELECT_DR;
        else
          this.current_state = IDLE;
      end
  endcase // case (this.current_state)
  
endfunction // compute_state
