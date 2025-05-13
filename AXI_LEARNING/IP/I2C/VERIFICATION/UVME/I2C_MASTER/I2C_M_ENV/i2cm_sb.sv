
`uvm_analysis_imp_decl(_old)
`uvm_analysis_imp_decl(_new)

class i2cm_sb extends uvm_scoreboard;
  
  `uvm_component_utils(i2cm_sb)
  uvm_analysis_imp_old#(i2cm_seq_item, i2cm_sb) item_collected_export;
  uvm_analysis_imp_new#(i2cm_seq_item, i2cm_sb) item_chk_export;
  
  i2cm_seq_item sb_i2cm_seq_item_old;
  i2cm_seq_item sb_i2cm_seq_item;

  static  logic [7:0] sb_i2cm_master_addr_wr;
  static  logic [7:0] sb_i2cm_master_data_wr;
  static logic  [7:0] sb_i2cm_master_data_rd;

  logic [7:0] sb_i2cm_master_addr_wr_old;
  logic [7:0] sb_i2cm_master_data_wr_old;
  logic  [7:0] sb_i2cm_master_data_rd_old;
  logic sb_i2c_reset_in_old;
  logic sb_i2c_start_old;
  logic sb_rw;
  logic sb_ready_out_old;
  logic sb_sdam_in;
  logic sb_sdam_out;
  logic sb_sclm_in;
 // logic sb_sdam_in_old;
 // logic sb_sdam_out_old;
  //logic sb_sclm_in_old;


  parameter idle =4'b0000,
            start=4'b0001,
            addr=4'b0010,
            addack=4'b0011,
            read =4'b0100,
            rdack=4'b0101,
            write=4'b0110,
            wrack=4'b0111,
            stop=4'b1000;


  static reg [3:0] present_state;
  static reg [3:0] next_state; 


  static logic [2:0] addcount=3'd7;
  static logic [2:0]  rdcount=3'd7;
  static logic [2:0]  wrcount=3'd7;
  
  function new(string name="i2cm_sb", uvm_component parent=null);
    super.new(name, parent);
	sb_i2cm_seq_item=new("sb_i2cm_seq_item");
    sb_i2cm_seq_item_old=new("sb_i2cm_seq_item_old");
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	item_collected_export=new("item_collected_export",this);
    item_chk_export=new("item_chk_export",this);
  endfunction
    virtual function void write_new(i2cm_seq_item sb_i2cm_seq_item_new);
  
    `uvm_info(get_name(),$sformatf("Inside sb write new "),UVM_MEDIUM)
    $display("pkt received");
	sb_i2cm_seq_item_new.print();  
    sb_sdam_in=sb_i2cm_seq_item_new.sdam_in;
    sb_sdam_out=sb_i2cm_seq_item_new.sdam_out;
   // sb_sclm_in=sb_i2cm_seq_item_new.i2c_scl_inout;
	
  endfunction 
  virtual function void write_old(i2cm_seq_item sb_i2cm_seq_item_old);
    `uvm_info(get_name(),$sformatf("Inside sb write old "),UVM_MEDIUM)
    $display("pkt received");
	sb_i2cm_seq_item_old.print(); 
	
    sb_i2c_reset_in_old=sb_i2cm_seq_item_old.i2c_reset_in;
    sb_i2c_start_old=sb_i2cm_seq_item_old.i2c_start;
    sb_rw=sb_i2cm_seq_item_old.rw;
    sb_ready_out_old=sb_i2cm_seq_item_old.ready_out;  
	
    sb_i2cm_master_addr_wr_old= {sb_i2cm_seq_item_old.i2c_master_addr_wr,sb_i2cm_seq_item_old.rw};
    sb_i2cm_master_data_wr_old= sb_i2cm_seq_item_old.i2c_master_data_wr;
    sb_i2cm_master_data_rd_old= sb_i2cm_seq_item_old.i2c_master_data_rd;
	
    //sb_sdam_in_old=sb_i2cm_seq_item_old.sdam_in;
    //sb_sdam_out_old=sb_i2cm_seq_item_old.sdam_out;
    //sb_sclm_in_old=sb_i2cm_seq_item_old.sclm_in;

    fork
    begin
	
      if(sb_i2c_reset_in_old)  //for reset is 1
        present_state = idle;  
      else
        present_state = next_state;	
		
    end


    begin
	case(present_state)
	
    idle :  begin

              `uvm_info(" inside idle"," going to start state",UVM_LOW)  
              if(sb_ready_out_old==0 && sb_i2c_start_old==0 && sb_i2c_reset_in_old==0)               
		        next_state = start;
		      else
			    next_state = idle;
				
		    end

	start : begin
	
              `uvm_info(" inside start"," going to address state",UVM_LOW)
			  next_state = addr;				 
			  addcount=3'b111;
			  
		   	end
           
			
	addr  : begin
	
              if(addcount>3'b000)
			  begin
			  
                sb_i2cm_master_addr_wr[addcount] = sb_sdam_in;
	            `uvm_info(" inside addr",$sformatf("sdamin is %h",sb_sdam_in),UVM_LOW)
			    addcount=addcount-3'b001;
			    next_state= addr;
				
                if(addcount==0)  //after receiving 7 bits of address
                begin
				
                  if(sb_i2cm_master_addr_wr_old[7:1]==sb_i2cm_master_addr_wr[7:1])
                  begin
				  
                    `uvm_info("add rxvd","add matched",UVM_MEDIUM)
                    `uvm_info("expected addr is",$sformatf("sb_i2cm_master_addr_wr %h",sb_i2cm_master_addr_wr[7:1]),UVM_MEDIUM)                
                    `uvm_info("actual addr is",$sformatf("sb_i2cm_master_addr_wr_old %h ",sb_i2cm_master_addr_wr_old[7:1]),UVM_MEDIUM)
					
                  end
				  
                  else
                  begin
				  
                    `uvm_error("ERROR add rxvd","not matched")
                    `uvm_info("expected addr is",$sformatf("sb_i2cm_master_addr_wr %h",sb_i2cm_master_addr_wr[7:1]),UVM_MEDIUM)                
                    `uvm_info("actual addr is",$sformatf("sb_i2cm_master_addr_wr_old %h ",sb_i2cm_master_addr_wr_old[7:1]),UVM_MEDIUM)

                  end
				  
                end
				
			  end	
			  
              else
			  begin   
			  
                sb_i2cm_master_addr_wr[0]=sb_i2cm_seq_item_old.rw;
                next_state=addack;	
               // addcount=3'b000;
	            `uvm_info(" rw bit is received ",$sformatf("rw is %h ",sb_i2cm_seq_item_old.rw),UVM_MEDIUM)
				
              end				
            end

    addack: begin	

              if(sb_sdam_in==0)
              begin	
			  
                `uvm_info("inside add ack rxvd"," ack received from slave",UVM_MEDIUM)           
                if(sb_i2cm_master_addr_wr[0]==0) //rw bit
			    begin //3
				
			      next_state=write;
			  	  wrcount=7;	
				  
                end//3
				
			    else
			    begin //4
				
			      next_state=read;
			      rdcount=7;
				  
			    end//4
				
              end
			  
              else
              begin
			  
               `uvm_info("inside add ack not rxvd"," ack not received from slave",UVM_MEDIUM)           
               `uvm_error("ERROR ack  not rxvd","from slave")
                next_state= stop;
				
              end
			  
            end

	write : begin

            if(wrcount>0)
	       	begin
			
              `uvm_info(" inside write",$sformatf("wrcount is %h ",wrcount),UVM_MEDIUM)
	          sb_i2cm_master_data_wr[wrcount]=sb_sdam_in;
			  wrcount=wrcount-1;
			  next_state=write;
			  
            end
			
			else
			begin
			
              //wrcount=0;
              sb_i2cm_master_data_wr[wrcount]=sb_sdam_in;
              next_state=wrack;             
              if(sb_i2cm_master_data_wr==sb_i2cm_master_data_wr_old)
              begin
			  
                `uvm_info(" data rxvd from master",$sformatf("data is %h ",sb_i2cm_master_data_wr),UVM_MEDIUM)
				
              end
			  
              else
			  
                `uvm_error("ERROR data rxvd", "not matched")
				
			end
			
			end
			
	wrack : begin

            if(sb_sdam_in==0)
			begin

		  	  `uvm_info(" inside write ack ",$sformatf("wrack is %h ",sb_sdam_out),UVM_MEDIUM)
			  next_state=idle;
			  
			end
			
			else
			  `uvm_error("ERROR write ack not rxvd","from slave")

			  next_state=stop;
			  
			end
			
	read :  begin

	        if(rdcount>0)
			begin
			
              `uvm_info(" inside read",$sformatf("rdcount is %h ",rdcount),UVM_MEDIUM)
			  sb_i2cm_master_data_rd[rdcount]=sb_sdam_in;
              `uvm_info(" Reading data from slave  ",$sformatf("rd data is is %h ",sb_sdam_in),UVM_MEDIUM)
			  rdcount=rdcount-1;
			  next_state=read;
			  
			end
			
			else
            begin
			
              //rdcount=0;
              sb_i2cm_master_data_rd[rdcount]=sb_sdam_in;
			  `uvm_info(" inside read",$sformatf("rdcount is %h ",rdcount),UVM_MEDIUM)         
              next_state=rdack;            
		      if(sb_i2cm_master_data_rd==sb_i2cm_master_data_rd_old)
              begin
			  
               // `uvm_info("data rxvd from slave", "matched", UVM_MEDIUM)
                `uvm_info(" data rxvd from slave ",$sformatf("rd data is is %h ",sb_i2cm_master_data_rd),UVM_MEDIUM)
				
              end
			  
              else
			  
                `uvm_error("ERROR data rxvd from slave ", "not matched")
				
			end
			
			end
			
	rdack : begin
	
	           next_state=stop;  
              `uvm_info(" read ack rxvd ",$sformatf("rd data is is %h ",sb_sdam_in),UVM_MEDIUM)			  
              //`uvm_info("rd ack","rxvd",UVM_MEDIUM)
			  
			end
			
	stop :  begin
		     `uvm_info("inside stop", "going to idle state", UVM_MEDIUM)
			  next_state=idle;
			  
			end
			
    default: next_state=idle;            
    endcase	    
	
    end
	
    join	
  
  endfunction


        
endclass

  
	
	
	
 
 
