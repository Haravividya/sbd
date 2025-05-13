class apb_agentout extends uvm_agent;

  `uvm_component_utils(apb_agentout)
 
  //apb_driver drv;
  //apb_sequencer seq;
  apb_monitorout mon1;
 
  uvm_analysis_port #(apb_item) analysis_port_agentout;
 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
  
    analysis_port_agentout = new("analysis_port_agentout",this);
    //drv = apb_driver::type_id::create("drv",this);
    //seq = apb_sequencer::type_id::create("seq",this);
    mon1 = apb_monitorout::type_id::create("mon1",this);
 
  endfunction
 
  function void connect_phase(uvm_phase phase);

    //drv.seq_item_port.connect(seq.seq_item_export);
    mon1.analysis_port_monitorout.connect(analysis_port_agentout);
  
  endfunction
 
endclass
