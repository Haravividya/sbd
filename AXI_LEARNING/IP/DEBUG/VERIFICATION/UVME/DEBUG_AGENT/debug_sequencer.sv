class debug_sequencer extends uvm_sequencer#(debug_seq_item);

  `uvm_component_utils(debug_sequencer)

  function new ( string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
  endfunction

endclass
