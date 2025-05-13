/*******************************************************************************
Project name:ahb_slave 
Description: This is the module which connects sequence and driver for handshake transaction
File name:ahb_slave_sequencer.sv
********************************************************************************/

//user defined class derived from base class 
class ahb_slave_sequencer_tb extends uvm_sequencer#(ahb_slave_seq_item_tb);

  //factory registration
  `uvm_component_utils(ahb_slave_sequencer_tb) 

  //constructor
  function new(string name="ahb_slave_sequencer_tb",uvm_component parent);
    super.new(name,parent);
    `uvm_info( "TRACE", $sformatf( "%m" ) , UVM_HIGH);
  endfunction

endclass
