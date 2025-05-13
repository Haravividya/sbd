
//......................................................................................................
//file name : i2cs_agent.sv
//project name : i2c _slave
//....................................................



class i2cs_agent_tb extends uvm_agent;

   `uvm_component_utils(i2cs_agent_tb) // component registration
  
  // creating handles for sequencer, driver and monitor
  i2cs_seqncr_tb sequencer_inst;
  i2cs_driver_tb driver_inst;
  i2cs_monitor_tb monitor_inst;
  
  // creating component 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  // build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      sequencer_inst=i2cs_seqncr_tb::type_id::create("sequencer_inst",this); //  creating memory for sequencer 
      driver_inst=i2cs_driver_tb::type_id::create("driver_inst",this);  // creating memory for driver	  
      monitor_inst=i2cs_monitor_tb::type_id::create("monitor_inst",this); // creating memory for monitor
  endfunction
  

  // connect phase
  function void connect_phase(uvm_phase phase);

	`uvm_info(get_name(),$sformatf("Inside Agent connect phase"),UVM_MEDIUM)
	 driver_inst.seq_item_port.connect(sequencer_inst.seq_item_export);
	
  endfunction

endclass
