class mul_agent extends uvm_agent;

   `uvm_component_utils(mul_agent)

    mul_driver    driver;
    mul_monitor   monitor;
    mul_sequencer sequencer;
   
   uvm_analysis_port #(mul_seq_item) analysis_port_agent;

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    analysis_port_agent = new("analysis_port_agent",this);
    driver    = mul_driver :: type_id :: create("driver",this);
    monitor   = mul_monitor :: type_id :: create("monitor",this);
    sequencer = mul_sequencer :: type_id :: create("sequencer",this);

  endfunction

  function void connect_phase(uvm_phase phase);

    driver.seq_item_port.connect(sequencer.seq_item_export);
    monitor.analysis_port_monitor.connect(analysis_port_agent);

 endfunction

endclass 


