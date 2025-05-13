class debug_agent extends uvm_agent;
  
  debug_sequencer sqr;
  debug_driver drv;
  debug_monitor mon;

  virtual dut_if  vif;

  `uvm_component_utils(debug_agent)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Build phase of agent - construct sequencer, driver and monitor
     
  virtual function void build_phase(uvm_phase phase);
    sqr = debug_sequencer::type_id::create("sqr", this);
    drv = debug_driver::type_id::create("drv", this); 
    mon = debug_monitor:: type_id::create("mon",this); 
  endfunction
 //Connect - driver and sequencer port to export
  virtual function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
    //uvm_report_info("JTAG_AGENT", "connect_phase, Connected driver to sequencer");
  endfunction
endclass
