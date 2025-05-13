/***********************************************************

File name   : apb_protocol_seq_item.svh
Description : Seq item : consists data fields required for generating the stimulus. 
	      Randomized : to generate stimulus. - rand , or can have constraints.
	
	      Methods : create, print, copy, clone , compare, pack , unpack.

***********************************************************/


class apb_protocol_seq_item extends uvm_sequence_item;

  //control info and payload info
 
  					// rand logics of APB Top 
					rand logic presetn; 
					rand logic transfer; 
					rand logic read_write; 
					rand logic [31:0] apb_write_paddr;
					rand logic [31:0] apb_write_data;
					rand logic [31:0] apb_read_paddr;
					
					//Outputs of APB Top
					logic [31:0] apb_read_data_out;
					

  rand int unsigned wait_time; //Delay - unsigned 

  // factory registration - registers the user defined class with factory
  // all classes derived directly from uvm_object or uvm_transaction - require them to be registered using `uvm_object_utils macro.

  //utility macros & field macros
  `uvm_object_utils_begin(apb_protocol_seq_item)
    `uvm_field_int(presetn, UVM_ALL_ON)     
    `uvm_field_int(transfer, UVM_ALL_ON) //int : int,bit, bytes. (ARG: name, FLAG )
    `uvm_field_int(read_write, UVM_ALL_ON)
    `uvm_field_int(apb_write_paddr, UVM_ALL_ON)
	`uvm_field_int(apb_write_data, UVM_ALL_ON)
	`uvm_field_int(apb_read_paddr, UVM_ALL_ON)
	`uvm_field_int(apb_read_data_out, UVM_ALL_ON)
    `uvm_field_int(wait_time, UVM_ALL_ON)
  `uvm_object_utils_end

  //constructor 
  function new (string name ="apb_protocol_seq_item");
    super.new(name);
   // `uvm_info("apb_protocol_seq_item ", $sformatf("Initial entry - Seq item "), UVM_LOW)
  endfunction

	
  //constraint c{a=b;};
  constraint wait_time_c{wait_time>30; wait_time<300;}

endclass : apb_protocol_seq_item



 

  

