//agent

class apb_slave2_agent extends uvm_agent;
  //declaring agent components
  apb_slave2_driver    driver;
  apb_slave2_sequencer sequencer;
  apb_slave2_monitor   monitor;
 
  // UVM automation macros for general components
  `uvm_component_utils(apb_slave2_agent)
 
  // constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  // build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
 
    if(get_is_active() == UVM_ACTIVE) begin
      driver = apb_slave2_driver::type_id::create("driver", this);
      sequencer =apb_slave2_sequencer::type_id::create("sequencer", this);
    end
 
    monitor = apb_slave2_monitor::type_id::create("monitor", this);
  endfunction : build_phase
 
  // connect_phase
  function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
      //monitor.item_collected_port.connect(analysis_port_agent sequencer.seq_item_export);
     // monitor.item_collected_port.connect(sequencer.seq_item_export);

    end
  endfunction : connect_phase
 
endclass : apb_slave2_agent
