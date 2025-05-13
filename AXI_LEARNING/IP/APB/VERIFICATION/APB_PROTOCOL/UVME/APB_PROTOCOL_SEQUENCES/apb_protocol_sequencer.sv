/***********************************************************

File name   : apb_protocol_sequencer.svh
Description : Sequencer controls - flow of request and response for seq_items between the sequences and the driver.
	
Use : TLM Interface to communicate transactions.  - uvm sequencer and uvm driver - have base classes : 
seq_item_export and seq_item_port respectively.  :: user need to connect these using TLM connect method.

Sequencer extended from uvm_sequencer base class - has all functionality reqd to allow a sequence to communicate with a driver. 

Base class - is parameterized by request and response item types - that can be handled by sequencer.

***********************************************************/


class apb_protocol_sequencer extends uvm_sequencer #(apb_protocol_seq_item);
	
//factory registration
  `uvm_component_utils(apb_protocol_sequencer)
	
//constructor
  function new (string name ="apb_protocol_sequencer", uvm_component parent);
    super.new(name,parent);
    `uvm_info("Sequencer ", $sformatf("Initial : Sequencer Entry : default sequencer"), UVM_LOW)
  endfunction

endclass : apb_protocol_sequencer



 

  

