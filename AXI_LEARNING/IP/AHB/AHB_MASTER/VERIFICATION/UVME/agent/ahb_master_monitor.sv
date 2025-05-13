/***********************************************************************
Project name:ahb_master 
Description: This is the module will capture the input and output signals from DUT and send it to the scoreboard
File name:ahb_master_monitor.sv
***********************************************************************/

//user defined class derived from base class 
class ahb_master_monitor_tb extends uvm_monitor;

//factory registration
 `uvm_component_utils(ahb_master_monitor_tb) 

//virtual interface instance declaration
  virtual ahb_master_interface_tb i_inst;
  
//seq item handle declaration
  ahb_master_seq_item_tb trans_collected;
  
//declare handle for anaysis port
  uvm_analysis_port #(ahb_master_seq_item_tb) item_collected_port;
  
  
//constructor
  function new (string name,uvm_component parent);
   super.new(name,parent);
	`uvm_info( "TRACE", $sformatf( "%m" ) , UVM_HIGH);
  endfunction

//build phase to make connection between interface (virtual) and monitor
  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
//obj creation of tlm port using new() method  
       item_collected_port = new("item_collected_port", this);        
//connecting monitor to interface (virtual) using uvm_congifg_db get() method
        if(!uvm_config_db#(virtual ahb_master_interface_tb)::get(this,"","INTERFACE_INST_DB",i_inst))
          `uvm_fatal(get_name(),$sformatf("monitor: uvm_config_db get failed: INTERFACE_INST_DB\n"));
  endfunction
 
//run phase 
  task run_phase(uvm_phase phase);
     begin
      forever
       begin
        trans_collected = ahb_master_seq_item_tb::type_id::create("trans_collected"); //creates the obj of seq_item using create() method
	    @(posedge i_inst.hclk); // sampling of data should always be at posedge of clock

//capturing all input and output signals from interface to monitor and those signals will be assigned in seq_item instance of monitor
	     
            
         trans_collected.hrst_n  =  i_inst.hrst_n       ;           
         trans_collected.addr    =  i_inst.addr         ;           
         trans_collected.wdata   =  i_inst.wdata        ;
         trans_collected.hrdata  =  i_inst.hrdata       ;
         trans_collected.iwrite  =  i_inst.iwrite       ; 
         trans_collected.hready  =  i_inst.hready       ; 
         trans_collected.hresp   =  i_inst.hresp        ; 
         trans_collected.iburst  =  i_inst.iburst       ; 
         trans_collected.isize   =  i_inst.isize        ; 
         trans_collected.itrans  =  i_inst.itrans       ; 
         trans_collected.busreq  =  i_inst.busreq       ; 
         trans_collected.hgrant  =  i_inst.hgrant       ; 
         trans_collected.rdata   =  i_inst.rdata        ; 
         trans_collected.haddr   =  i_inst.haddr        ; 
         trans_collected.hwdata  =  i_inst.hwdata       ; 
         trans_collected.hburst  =  i_inst.hburst       ; 
         trans_collected.hsize   =  i_inst.hsize        ; 
         trans_collected.htrans  =  i_inst.htrans       ; 
         trans_collected.hwrite  =  i_inst.hwrite       ; 
         trans_collected.hbusreq =  i_inst.hbusreq      ; 
        

//sending captured seq item input and output to scoreboard and coverage through 
//analysis port with write method
              
        item_collected_port.write(trans_collected); 
        //trans_collected.print();
        end
      end

   endtask
endclass	
