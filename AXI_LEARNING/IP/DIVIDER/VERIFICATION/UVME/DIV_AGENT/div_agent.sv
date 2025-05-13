class div_agent extends uvm_agent;

   `uvm_component_utils(div_agent)

    div_driver    driver;
    div_monitor   monitor;
    div_sequencer sequencer;
   
   uvm_analysis_port #(div_seq_item) analysis_port_agent;

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    analysis_port_agent = new("analysis_port_agent",this);
    driver    = div_driver :: type_id :: create("driver",this);
    monitor   = div_monitor :: type_id :: create("monitor",this);
    sequencer = div_sequencer :: type_id :: create("sequencer",this);

  endfunction

  function void connect_phase(uvm_phase phase);

    driver.seq_item_port.connect(sequencer.seq_item_export);
    monitor.analysis_port_monitor.connect(analysis_port_agent);

 endfunction

endclass 



