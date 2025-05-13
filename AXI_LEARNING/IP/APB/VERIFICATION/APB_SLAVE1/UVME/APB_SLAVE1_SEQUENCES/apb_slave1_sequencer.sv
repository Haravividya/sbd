//sequencer


class apb_slave1_sequencer extends uvm_sequencer#(apb_slave1_seq_item);
 
  `uvm_component_utils(apb_slave1_sequencer)
 
  //constructor
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
   
endclass
