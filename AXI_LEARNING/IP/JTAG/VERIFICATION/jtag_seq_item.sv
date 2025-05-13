class jtag_seq_item extends uvm_sequence_item;

  rand logic TRST;
  rand logic TMS; 
  rand logic TDI; 
  rand logic [7:0] user_data_in;
  
  logic [7:0] user_data_out;
  logic TDO;

  //utility macros & field macros
  `uvm_object_utils_begin(jtag_seq_item) 
    `uvm_field_int(TRST, UVM_ALL_ON) //int : int,bit, bytes. (ARG: name, FLAG )
    `uvm_field_int(TMS, UVM_ALL_ON)
    `uvm_field_int(TDI, UVM_ALL_ON)
    `uvm_field_int(user_data_in, UVM_ALL_ON)
    `uvm_field_int(TDO, UVM_ALL_ON)
    `uvm_field_int(user_data_out, UVM_ALL_ON)
  `uvm_object_utils_end


  //constructor 
  function new (string name ="jtag_seq_item");
    super.new(name);
  endfunction	 

  //constraint c{a=b;}
  constraint trst_c {soft TRST ==1;}
  constraint user_data_c {soft user_data_in == 0;} //normally - user_data_in : 0 , unless user_data register is selected.
  
endclass
