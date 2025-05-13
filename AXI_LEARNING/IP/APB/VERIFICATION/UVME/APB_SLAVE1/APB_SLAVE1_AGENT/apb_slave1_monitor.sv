

//monitor

class apb_slave1_monitor extends uvm_monitor;
 
   // Virtual Interface
   virtual apb_slave1_interface intf;
 
   uvm_analysis_port #(apb_slave1_seq_item) item_collected_port;
 
   // Placeholder to capture transaction information.
   apb_slave1_seq_item trans_collected;
  
  `uvm_component_utils(apb_slave1_monitor)
 
   // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
    trans_collected = new();
    item_collected_port = new("item_collected_port", this);
    `uvm_info("MNTR", $sformatf("MONITOR CHECK 1"), UVM_HIGH)
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual apb_slave1_interface)::get(this, "", "intf", intf))
       `uvm_fatal("NOintf",{"virtual interface must be set for: ",get_full_name(),".intf"});
        `uvm_info("MNTR", $sformatf("MONITOR CHECK 2"), UVM_HIGH)
  endfunction: build_phase
 
  // run phase
 task run_phase(uvm_phase phase);
  //  @ (posedge intf.presetn);

   forever
     // trans_collected= apb_slave1_seq_item :: type_id :: create("trans_collected");
     begin

        @(posedge intf.pclock);
   
        trans_collected.presetn   = intf.presetn;	
	trans_collected.paddr     = intf.paddr;
	trans_collected.pwdata    = intf.pwdata;
	trans_collected.pwrite    = intf.pwrite;
	trans_collected.psel1     = intf.psel1;
	trans_collected.penable   = intf.penable;
	trans_collected.prdata1   = intf.prdata1;
        trans_collected.pready1   = intf.pready1;
        trans_collected.pslverr1  = intf.pslverr1;
		
	 //	#(trans_collected.wait_time);
       
        item_collected_port.write(trans_collected);
        // `uvm_info("MNTR", $sformatf("MONITOR CHECK 3"), UVM_LOW)
        //  trans_collected.print();
    end
  endtask : run_phase
 
endclass : apb_slave1_monitor
