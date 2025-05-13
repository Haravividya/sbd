class debug_monitor extends uvm_monitor;

  virtual dut_if vif;

  //Analysis port -parameterized to seq_item_tb transaction
  ///Monitor writes transaction objects to this port once detected on interface
 uvm_analysis_port #(debug_seq_item) port_con1;
 uvm_analysis_port #(debug_seq_item) port_con2;

 `uvm_component_utils(debug_monitor)
  debug_seq_item debug_item;
  debug_seq_item jtag_item;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Build Phase - Get handle to virtual if from agent/config_db
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //monitor_analysis_port = new("monitor_analysis_port", this);
    //mon_analysis_port = new("mon_analysis_port", this);
    port_con1 = new("port_con1",this);
    port_con2 = new("port_con2",this);
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) 
    begin
      `uvm_fatal("build_phase", "No virtual interface specified for this monitor instance")
    end
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    fork
    begin//process 1
    @(posedge vif.pclock);
    forever
    begin  
      //create a seq_item object
      debug_item = debug_seq_item::type_id::create("debug_item", this);
      @(posedge vif.pclock);
      //@(negedge vif.pclock  iff ( (vif.presetn == 1'b1) && (vif.trstn ==1'b1 )) );
      //@(posedge vif.pclock);
      //#1 ; 
      //  $display("Inside monitor posedge  statement");
        debug_item.trstn                          = vif.trstn;
        debug_item.presetn                        = vif.presetn;
        debug_item.step                           = vif.step;
        debug_item.ebreak                         = vif.ebreak;
        debug_item.exception                      = vif.exception;
        debug_item.ndmreset	    	              = vif.ndmreset ;						
        debug_item.h_reset                        = vif.h_reset  ;                        
        debug_item.haltreq	    	              = vif.haltreq	;					
        debug_item.resumereq	                  = vif.resumereq;			    		    
        debug_item.setresethaltreq                = vif.setresethaltreq;				
        debug_item.clrresethaltreq                = vif.clrresethaltreq;		
        debug_item.resethaltreq                   = vif.resethaltreq;  
        debug_item.debug_reg_write_enable         = vif.debug_reg_write_enable;
        debug_item.debug_reg_write_data           = vif.debug_reg_write_data  ;
        debug_item.debug_reg_read_enable          = vif.debug_reg_read_enable ;
        debug_item.debug_reg_address              = vif.debug_reg_address     ;
        debug_item.debug_mem_read_enable          = vif.debug_mem_read_enable ;  
        debug_item.debug_mem_write_enable         = vif.debug_mem_write_enable; 
        debug_item.debug_mem_read_addr            = vif.debug_mem_read_addr   ;
        debug_item.debug_mem_write_addr           = vif.debug_mem_write_addr  ;
        debug_item.debug_mem_write_data           = vif.debug_mem_write_data  ;                             
        debug_item.debug_mem_strobe               = vif.debug_mem_strobe      ;
        debug_item.abstractcs_reg                 = vif.abstractcs_reg        ;
        debug_item.command_reg                    = vif.command_reg           ;
        debug_item.dmstatus_reg                   = vif.dmstatus_reg          ;
        debug_item.dmcontrol_reg                  = vif.dmcontrol_reg         ;
        debug_item.fsm_state                      = vif.fsm_state             ;
        debug_item.data0_reg                      = vif.data0_reg             ;
        debug_item.data1_reg                      = vif.data1_reg             ;
        debug_item.data2_reg                      = vif.data2_reg             ;
        debug_item.data3_reg                      = vif.data3_reg             ;
       // monitor_analysis_port.write(debug_item);
        port_con1.write(debug_item);    
    end//forever
    end//process 1

    begin //process 2
    forever
    begin
    jtag_item=debug_seq_item::type_id::create("jtag_item",this);
    @(posedge vif.tck);//check this
        jtag_item.Update_IR                      = vif.Update_IR             ;
        jtag_item.Update_DR                      = vif.Update_DR             ;
        jtag_item.Capture_IR                     = vif.Capture_IR            ;
        jtag_item.Capture_DR                     = vif.Capture_DR            ;
        jtag_item.dr_scan                        = vif.dr_scan               ;//select_dr_scan
        jtag_item.Shift_DR                       = vif.Shift_DR              ;
        jtag_item.Shift_IR                       = vif.Shift_IR              ;
        jtag_item.Reset                          = vif.Reset                 ;//test_logic_reset
        jtag_item.select_ir_scan                 = vif.select_ir_scan        ;
        jtag_item.exit1_dr                       = vif.exit1_dr              ;
        jtag_item.exit2_dr                       = vif.exit2_dr              ;
        jtag_item.pause_dr                       = vif.pause_dr              ;
        jtag_item.resetn                         = vif.resetn                ;
        jtag_item.tms_reset                      = vif.tms_reset             ;
        jtag_item.tms                            = vif.tms                   ;
        jtag_item.pause_ir                       = vif.pause_ir              ;
        jtag_item.trstn                          = vif.trstn                 ;
        jtag_item.tdi                            = vif.tdi                   ;
        jtag_item.tdo                            = vif.tdo                   ;
       // debug_item.print();
       // mon_analysis_port.write(debug_item);
        //monitor_analysis_port.write(debug_item);
        port_con2.write(jtag_item);        
      end//forever
      end//process 2
    join

  endtask:run_phase


endclass


//we will have 2 tlm ports, from one monitor to SB w.r.t pclock, tclk
//fork
//process 1 - capturing clock 1 pclock -> write function 1
//process 2 - capturing clock 2 tck -> write function 2
//join

    //jtag_item.print();
    
   // `uvm_info("Monitor", $sformatf("Monitor_Check"), UVM_LOW); 
    //  debug_item.print();
     
  
