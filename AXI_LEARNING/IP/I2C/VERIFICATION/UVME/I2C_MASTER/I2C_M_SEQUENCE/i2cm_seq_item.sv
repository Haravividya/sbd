class i2cm_seq_item extends uvm_sequence_item;

  //inuts and outputs
  rand bit i2c_reset_in;
  rand bit i2c_start;
  rand bit rw;
  rand logic [6:0] i2c_master_addr_wr;
  rand logic [7:0] i2c_master_data_wr;
  
  logic fifo_full;
  logic ready_out;
  logic  [7:0] i2c_master_data_rd;
  
  //inout sda signal
  logic sdam_en;
  logic sdam_in;
  logic sdam_out;

 
  logic i2c_scl_inout;

  //inout scl signal
  //logic sclm_en;
  //logic sclm_in; 
  // logic sclm_out;

  rand logic i2c_start_tst;
  rand logic sdam_en_tst;  //for blocking data processing during fifo full scenario

  rand logic wr_addr_ack;
  rand  logic wr_data_ack;
  //logic rd_data_ack;
  
  rand logic [7:0] test_sdam_out;
  
  `uvm_object_utils_begin(i2cm_seq_item)
    `uvm_field_int(i2c_reset_in,UVM_ALL_ON)
    `uvm_field_int(i2c_start,UVM_ALL_ON)
	`uvm_field_int(rw,UVM_ALL_ON)
    `uvm_field_int(i2c_master_addr_wr,UVM_ALL_ON)
    `uvm_field_int(i2c_master_data_wr,UVM_ALL_ON)
    `uvm_field_int(fifo_full,UVM_ALL_ON)
    `uvm_field_int(ready_out,UVM_ALL_ON)
    `uvm_field_int(i2c_master_data_rd,UVM_ALL_ON)
    `uvm_field_int(sdam_out,UVM_ALL_ON)
     //`uvm_field_int(sclm_out,UVM_ALL_ON)
    `uvm_field_int(sdam_en,UVM_ALL_ON)
    //`uvm_field_int(sclm_en,UVM_ALL_ON)
    `uvm_field_int(sdam_in,UVM_ALL_ON)
     //`uvm_field_int(sclm_in,UVM_ALL_ON)
    `uvm_field_int(sdam_en_tst,UVM_ALL_ON)
    `uvm_field_int(wr_addr_ack,UVM_ALL_ON)
    `uvm_field_int(wr_data_ack,UVM_ALL_ON)
    `uvm_field_int(test_sdam_out,UVM_ALL_ON)
    `uvm_field_int(i2c_start_tst,UVM_ALL_ON)

    `uvm_field_int(i2c_scl_inout,UVM_ALL_ON)
    // `uvm_field_int(sda_inout,UVM_ALL_ON)

  `uvm_object_utils_end
  
    
  function new(string name="i2cm_seq_item");
    super.new(name);
  endfunction
endclass

