/*******************************************************************************
Project name:ahb_master 
Description: This is the module which connects sequence and driver for handshake transaction
File name:ahb_master_sequencer.sv
********************************************************************************/

//user defined class derived from base class 
class ahb_master_sequencer_tb extends uvm_sequencer#(ahb_master_seq_item_tb);

//factory registration
 `uvm_component_utils(ahb_master_sequencer_tb) 

//constructor
 function new(string name="ahb_master_sequencer_tb",uvm_component parent);
  super.new(name,parent);
   `uvm_info( "TRACE", $sformatf( "%m" ) , UVM_HIGH);
 endfunction

endclass
