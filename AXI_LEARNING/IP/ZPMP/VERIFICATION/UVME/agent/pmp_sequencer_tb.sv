/*************************************************
File name:pmp_sequencer_tb.sv
Description:

**************************************************/

class pmp_sequencer_tb extends uvm_sequencer#(pmp_seq_item_tb);
  `uvm_component_utils(pmp_sequencer_tb) 

  function new(string name = "pmp_sequencer_tb", uvm_component parent);
    super.new(name,parent);     
  endfunction 
  
endclass

