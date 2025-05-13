class pc_sequencer extends uvm_sequencer#(pc_seq_item);

  //Factory Registration
  `uvm_component_utils(pc_sequencer)

  //Constructor
  function new(string name ="pc_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction

endclass: pc_sequencer
