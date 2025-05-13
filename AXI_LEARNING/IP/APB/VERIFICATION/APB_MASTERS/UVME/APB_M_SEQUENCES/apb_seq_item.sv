class apb_item extends uvm_sequence_item;

//Data and control signals

//  rand logic pclock;
//  rand logic presetn;
  rand logic pready;
  rand logic pslverr;
  rand logic [31:0] prdata;
  rand logic [31:0] apb_write_data;
  rand logic [31:0] apb_write_paddr;
  rand logic [31:0] apb_read_paddr;
  rand logic read_write;
  rand logic transfer;
//regs
       logic psel1;
       logic psel2;
       logic penable;
       logic pwrite;
       logic [31:0] paddr;
       logic [31:0] pwdata;
       logic [31:0] apb_read_data_out;

    rand int wait_time;
// Factory registration
	  
  `uvm_object_utils_begin(apb_item)
 
// Utility and field macros

//    `uvm_field_int(pclock,UVM_ALL_ON)
//    `uvm_field_int(presetn,UVM_ALL_ON)
    `uvm_field_int(pready,UVM_ALL_ON)
    `uvm_field_int(pslverr,UVM_ALL_ON)    
    `uvm_field_int(prdata,UVM_ALL_ON)    
    `uvm_field_int(apb_write_data,UVM_ALL_ON)    
    `uvm_field_int(apb_write_paddr,UVM_ALL_ON)    
    `uvm_field_int(apb_read_paddr,UVM_ALL_ON)    
    `uvm_field_int(read_write,UVM_ALL_ON)    
    `uvm_field_int(transfer,UVM_ALL_ON)    
    `uvm_field_int(psel1,UVM_ALL_ON)    
    `uvm_field_int(psel2,UVM_ALL_ON)    
    `uvm_field_int(penable,UVM_ALL_ON)    
    `uvm_field_int(pwrite,UVM_ALL_ON)    
    `uvm_field_int(paddr,UVM_ALL_ON)    
    `uvm_field_int(pwdata,UVM_ALL_ON)    
    `uvm_field_int(apb_read_data_out,UVM_ALL_ON)    
    `uvm_field_int(wait_time, UVM_ALL_ON)

  `uvm_object_utils_end 
 
  function new (string name = "apb_item");
    super.new(name);
  endfunction

	constraint wait_time_c {wait_time>=0; wait_time<41;wait_time%10 == 0; }
  
endclass
