//--------------------------------------------------------------------------
//------------------------file name - i2cs_seq_item.sv-----------------------
//-----------------------project name - i2c_slave---------------------------
//--------------------------------------------------------------------------


class i2cs_seq_item_tb extends uvm_sequence_item;

  // properties of sequence item
   rand logic i2c_rst;
   rand logic [6:0] addr_test;
   rand logic rw_test;
   rand logic [7:0] data_test;
   rand logic en_test;
   
  
   logic sdas_en;
   logic sdas_in;
   logic sdas_out;


  // logic scls_en;
  // logic scls_in;
   //logic scls_out;

   logic clk_test;

   rand bit rd_ack_test;
  
  // object utilities 
 
  `uvm_object_utils_begin(i2cs_seq_item_tb)
  `uvm_field_int(i2c_rst,UVM_ALL_ON)
  `uvm_field_int(sdas_en,UVM_ALL_ON)
  `uvm_field_int(sdas_out,UVM_ALL_ON)
  `uvm_field_int(sdas_in,UVM_ALL_ON)
  `uvm_field_int(addr_test,UVM_ALL_ON)
  `uvm_field_int(rw_test,UVM_ALL_ON)
  `uvm_field_int(data_test,UVM_ALL_ON)
  `uvm_field_int(en_test,UVM_ALL_ON)
 // `uvm_field_int(scls_en,UVM_ALL_ON)
 // `uvm_field_int(scls_in,UVM_ALL_ON)
  //`uvm_field_int(scls_out,UVM_ALL_ON)
  `uvm_field_int(rd_ack_test,UVM_ALL_ON)
  `uvm_field_int(clk_test,UVM_ALL_ON)
  `uvm_object_utils_end
  
    
  // constructor
  function new(string name="i2cs_seq_item_tb");
    super.new(name);
  endfunction
  
     
endclass
