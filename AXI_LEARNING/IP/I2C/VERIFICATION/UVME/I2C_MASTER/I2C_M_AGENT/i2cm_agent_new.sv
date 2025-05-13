

class i2cm_agent_new extends uvm_agent;

  `uvm_component_utils(i2cm_agent_new)
  
 // i2cm_sequencer sequencer_inst;
 // i2cm_driver driver_inst;
  i2cm_monitor_new monitor_inst_new;
   
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	`uvm_info(get_name(),$sformatf("Inside Agent build phase"),UVM_MEDIUM)
	//if(get_is_active==UVM_ACTIVE)
	//begin
	 // sequencer_inst=i2cm_sequencer::type_id::create("sequencer_inst",this);
	 // driver_inst=i2cm_driver::type_id::create("driver_inst",this);	  
	//end
	
	 monitor_inst_new=i2cm_monitor_new::type_id::create("monitor_inst_new",this);	  
  endfunction
  
  function void connect_phase(uvm_phase phase);
    //if(get_is_active==UVM_ACTIVE)
	//begin
	  `uvm_info(get_name(),$sformatf("Inside Agent new connect phase"),UVM_MEDIUM)
	 // driver_inst.seq_item_port.connect(sequencer_inst.seq_item_export);
	//end
  endfunction
endclass
