class axi_m_agent extends uvm_agent;

   `uvm_component_utils(axi_m_agent)

    axi_m_driver    driver;
    axi_m_sequencer sequencer;
    axi_m_monitor   monitor;

   uvm_analysis_port #(axi_m_seq_item) analysis_port_agent;

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    analysis_port_agent = new("analysis_port_agent",this);
    driver    = axi_m_driver :: type_id :: create("driver",this);
    monitor   = axi_m_monitor :: type_id :: create("monitor",this);
    sequencer = axi_m_sequencer :: type_id :: create("sequencer",this);

  endfunction

  function void connect_phase(uvm_phase phase);

    driver.seq_item_port.connect(sequencer.seq_item_export);
    monitor.analysis_port_monitor.connect(analysis_port_agent);

 endfunction

endclass 

