
class i2cm_agentin extends uvm_agent;

  `uvm_component_utils(i2cm_agentin)
  
  i2cm_sequencer sequencer_inst;
  i2cm_driver driver_inst;
  i2cm_monitor monitor_inst;
 

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  

  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    `uvm_info(get_name(),$sformatf("Inside Agent build phase"),UVM_MEDIUM)
    sequencer_inst=i2cm_sequencer::type_id::create("sequencer_inst",this);
    driver_inst=i2cm_driver::type_id::create("driver_inst",this);	  	
    monitor_inst=i2cm_monitor::type_id::create("monitor_inst",this);		
  endfunction
  

  function void connect_phase(uvm_phase phase);
    `uvm_info(get_name(),$sformatf("Inside Agent connect phase"),UVM_MEDIUM)
    driver_inst.seq_item_port.connect(sequencer_inst.seq_item_export);
  endfunction


endclass
