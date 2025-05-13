class div_sequencer extends uvm_sequencer#(div_seq_item);

  `uvm_component_utils(div_sequencer)


  function new(string name , uvm_component parent);
    super.new(name,parent);
  endfunction


endclass
