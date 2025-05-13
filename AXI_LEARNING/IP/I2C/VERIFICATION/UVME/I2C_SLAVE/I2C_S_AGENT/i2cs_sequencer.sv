//--------------------------------------------------------------------------
//------------------------file name - i2cs_sequencer.sv-----------------------
//-----------------------project name - i2c_slave---------------------------
//--------------------------------------------------------------------------
class i2cs_seqncr_tb extends uvm_sequencer #(i2cs_seq_item_tb);
  
  //component registration
  `uvm_component_utils(i2cs_seqncr_tb)
  
  //factory registration
  function new(string name, uvm_component parent);
    super.new(name);
  endfunction

endclass
