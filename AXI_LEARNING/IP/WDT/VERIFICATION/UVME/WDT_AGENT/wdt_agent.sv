class wdt_agent extends uvm_agent;

  `uvm_component_utils(wdt_agent)

  wdt_driver    wdt_drv;
  wdt_monitor   wdt_mon;
  wdt_sequencer wdt_seqcr;

  uvm_analysis_port#(wdt_seq_item) analysis_port_agent;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    wdt_drv = wdt_driver::type_id::create("wdt_drv",this);
    wdt_mon = wdt_monitor::type_id::create("wdt_mon",this);
    wdt_seqcr = wdt_sequencer::type_id::create("wdt_seqcr",this);
    analysis_port_agent = new("analysis_port_agent",this);

  endfunction


  function void connect_phase(uvm_phase phase);

    wdt_drv.seq_item_port.connect(wdt_seqcr.seq_item_export);
    wdt_mon.analysis_port_monitor.connect(analysis_port_agent);

  endfunction

endclass
