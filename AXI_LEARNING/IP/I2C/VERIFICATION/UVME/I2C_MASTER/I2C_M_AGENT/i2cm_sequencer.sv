

class i2cm_sequencer extends uvm_sequencer #(i2cm_seq_item);
  
  `uvm_sequencer_utils(i2cm_sequencer)
  
  function new(string name, uvm_component parent);
    super.new(name);
  endfunction

endclass
