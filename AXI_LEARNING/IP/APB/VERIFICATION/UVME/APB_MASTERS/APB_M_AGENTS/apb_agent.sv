class apb_agent extends uvm_agent;

  `uvm_component_utils(apb_agent)
 
  apb_driver drv;
  apb_sequencer seq;
  apb_monitor mon;
 
  uvm_analysis_port #(apb_item) analysis_port_agent;
 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
  
    analysis_port_agent = new("analysis_port_agent",this);
    drv = apb_driver::type_id::create("drv",this);
    seq = apb_sequencer::type_id::create("seq",this);
    mon = apb_monitor::type_id::create("mon",this);
 
  endfunction
 
  function void connect_phase(uvm_phase phase);

    drv.seq_item_port.connect(seq.seq_item_export);
    mon.analysis_port_monitor.connect(analysis_port_agent);
  
  endfunction
 
endclass
