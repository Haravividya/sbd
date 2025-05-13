class jtag_agent extends uvm_agent;
  
  jtag_sequencer sqr;
  jtag_driver drv;
  jtag_monitor mon;

  virtual dut_if  vif;

  `uvm_component_utils(jtag_agent)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  //Build phase of agent - construct sequencer, driver and monitor
     
  virtual function void build_phase(uvm_phase phase);
    sqr = jtag_sequencer::type_id::create("sqr", this);
    drv = jtag_driver::type_id::create("drv", this); 
    mon = jtag_monitor:: type_id::create("mon",this); 
  endfunction
 //Connect - driver and sequencer port to export
  virtual function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
    //uvm_report_info("JTAG_AGENT", "connect_phase, Connected driver to sequencer");
  endfunction
endclass
