/*************************************************
File name:pmp_seq_item_tb.sv
Description:

**************************************************/

class pmp_seq_item_tb extends uvm_sequence_item;


  parameter RANGE_WIDTH=35;
  parameter DATA_WIDTH=32;
   //INPUTS--------------------------
  rand logic  		csr_rst		;                   
  rand logic  [11:0]	csr_write_addr  ;                
  rand logic csr_write_en	;
  rand  logic [31:0] csr_write_data;
  rand logic kernel_mode_signal;
  rand logic machine_mode_valid;
  rand logic csr_read_en;
  rand logic [11:0] csr_read_addr;
  rand logic pmp_en;
  rand logic [DATA_WIDTH-1:0] memory_access_write_address;
  rand logic memory_access_write_en;
  rand logic [DATA_WIDTH-1:0]  memory_access_read_address;
  rand logic memory_access_read_en;

  
  

  //OUTPUTS-----------------
	  //OUTPUTS-----------------
  logic  [31:0]	csr_read_out;   // data out
  logic pmpcfg0_exception;
  logic pmpcfg1_exception;
  logic pmpcfg2_exception;
  logic pmpcfg3_exception;

  logic pmpaddr0_exception;
  logic pmpaddr1_exception;
  logic pmpaddr2_exception;
  logic pmpaddr3_exception;
  logic pmpaddr4_exception;
  logic pmpaddr5_exception;
  logic pmpaddr6_exception;
  logic pmpaddr7_exception;
  logic pmpaddr8_exception;
  logic pmpaddr9_exception;
  logic pmpaddr10_exception;
  logic pmpaddr11_exception;
  logic pmpaddr12_exception;
  logic pmpaddr13_exception;
  logic pmpaddr14_exception;
  logic pmpaddr15_exception;
  

  
/*logic  [RANGE_WIDTH-1:0] start_address0;
logic  [RANGE_WIDTH-1:0] start_address1;
logic  [RANGE_WIDTH-1:0] start_address2;
logic  [RANGE_WIDTH-1:0] start_address3;
logic  [RANGE_WIDTH-1:0] start_address4;
logic  [RANGE_WIDTH-1:0] start_address5;
logic  [RANGE_WIDTH-1:0] start_address6;
logic  [RANGE_WIDTH-1:0] start_address7;
logic  [RANGE_WIDTH-1:0] start_address8;
logic  [RANGE_WIDTH-1:0] start_address9;
logic  [RANGE_WIDTH-1:0] start_address10;
logic  [RANGE_WIDTH-1:0] start_address11;
logic  [RANGE_WIDTH-1:0] start_address12;
logic  [RANGE_WIDTH-1:0] start_address13;
logic  [RANGE_WIDTH-1:0] start_address14;
logic  [RANGE_WIDTH-1:0] start_address15;
logic  [RANGE_WIDTH-1:0] end_address0;
logic  [RANGE_WIDTH-1:0] end_address1;
logic  [RANGE_WIDTH-1:0] end_address2;
logic  [RANGE_WIDTH-1:0] end_address3;
logic  [RANGE_WIDTH-1:0] end_address4;
logic  [RANGE_WIDTH-1:0] end_address5;
logic  [RANGE_WIDTH-1:0] end_address6;
logic  [RANGE_WIDTH-1:0] end_address7;
logic  [RANGE_WIDTH-1:0] end_address8;
logic  [RANGE_WIDTH-1:0] end_address9;
logic  [RANGE_WIDTH-1:0] end_address10;
logic  [RANGE_WIDTH-1:0] end_address11;
logic  [RANGE_WIDTH-1:0] end_address12;
logic  [RANGE_WIDTH-1:0] end_address13;
logic  [RANGE_WIDTH-1:0] end_address14;
logic [RANGE_WIDTH-1:0] end_address15;*/
logic region0_range_exception;
logic region1_range_exception;
logic region2_range_exception;
logic region3_range_exception;
logic region4_range_exception;
logic region5_range_exception;
logic region6_range_exception;
logic region7_range_exception;
logic region8_range_exception;
logic region9_range_exception;
logic region10_range_exception;
logic region11_range_exception;
logic region12_range_exception;
logic region13_range_exception;
logic region14_range_exception;
logic region15_range_exception;

logic  overlapping_region_exception0;//if there is overlapping between two regions then this
logic  overlapping_region_exception1;//exception is raised
logic  overlapping_region_exception2;
logic  overlapping_region_exception3;
logic  overlapping_region_exception4;
logic  overlapping_region_exception5;
logic  overlapping_region_exception6;
logic  overlapping_region_exception7;
logic  overlapping_region_exception8;
logic  overlapping_region_exception9;
logic  overlapping_region_exception10;
logic  overlapping_region_exception11;
logic  overlapping_region_exception12;
logic  overlapping_region_exception13;
logic  overlapping_region_exception14;
logic  overlapping_region_exception15;
logic  valid_memory_access_write_address;
logic  valid_memory_access_read_address;


logic load_exception;
logic store_exception;
  
      
  function new(string name="pmp_seq_item_tb");
    super.new(name);
	// if you want any logic during creation of the object
  endfunction

  `uvm_object_utils_begin(pmp_seq_item_tb)
  `uvm_field_int(csr_rst ,UVM_ALL_ON)
  `uvm_field_int(csr_write_en  ,UVM_ALL_ON)
  `uvm_field_int(csr_write_data ,UVM_ALL_ON)
   `uvm_field_int(csr_write_addr ,UVM_ALL_ON)

  `uvm_field_int(kernel_mode_signal ,UVM_ALL_ON)
  `uvm_field_int(machine_mode_valid ,UVM_ALL_ON)
  `uvm_field_int(csr_read_en ,UVM_ALL_ON)
  `uvm_field_int(csr_read_addr ,UVM_ALL_ON)
  `uvm_field_int(csr_read_out ,UVM_ALL_ON)
  `uvm_field_int(pmp_en ,UVM_ALL_ON)
  `uvm_field_int(memory_access_write_address,UVM_ALL_ON)
  `uvm_field_int(memory_access_write_en,UVM_ALL_ON)
  `uvm_field_int(memory_access_read_address,UVM_ALL_ON)
  `uvm_field_int(memory_access_read_en,UVM_ALL_ON)
  `uvm_field_int(pmpcfg0_exception ,UVM_ALL_ON)
   `uvm_field_int(pmpcfg1_exception ,UVM_ALL_ON)
 `uvm_field_int(pmpcfg2_exception ,UVM_ALL_ON)
 `uvm_field_int(pmpcfg3_exception ,UVM_ALL_ON)

  `uvm_field_int(pmpaddr0_exception ,UVM_ALL_ON)
  `uvm_field_int(pmpaddr1_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr2_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr3_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr4_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr5_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr6_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr7_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr8_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr9_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr10_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr11_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr12_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr13_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr14_exception ,UVM_ALL_ON)
`uvm_field_int(pmpaddr15_exception ,UVM_ALL_ON)
/*`uvm_field_int(start_address0 ,UVM_ALL_ON)
`uvm_field_int(start_address1 ,UVM_ALL_ON)
`uvm_field_int(start_address2 ,UVM_ALL_ON)
`uvm_field_int(start_address3 ,UVM_ALL_ON)
`uvm_field_int(start_address4 ,UVM_ALL_ON)
`uvm_field_int(start_address5 ,UVM_ALL_ON)
`uvm_field_int(start_address6 ,UVM_ALL_ON)
`uvm_field_int(start_address7 ,UVM_ALL_ON)
`uvm_field_int(start_address8 ,UVM_ALL_ON)
`uvm_field_int(start_address9 ,UVM_ALL_ON)
`uvm_field_int(start_address10 ,UVM_ALL_ON)
`uvm_field_int(start_address11 ,UVM_ALL_ON)
`uvm_field_int(start_address12 ,UVM_ALL_ON)
`uvm_field_int(start_address13 ,UVM_ALL_ON)
`uvm_field_int(start_address14 ,UVM_ALL_ON)
`uvm_field_int(start_address15 ,UVM_ALL_ON)
`uvm_field_int(end_address0 ,UVM_ALL_ON)
`uvm_field_int(end_address1 ,UVM_ALL_ON)
`uvm_field_int(end_address2 ,UVM_ALL_ON)
`uvm_field_int(end_address3 ,UVM_ALL_ON)
`uvm_field_int(end_address4 ,UVM_ALL_ON)
`uvm_field_int(end_address5 ,UVM_ALL_ON)
`uvm_field_int(end_address6 ,UVM_ALL_ON)
`uvm_field_int(end_address7 ,UVM_ALL_ON)
`uvm_field_int(end_address8 ,UVM_ALL_ON)
`uvm_field_int(end_address9 ,UVM_ALL_ON)
`uvm_field_int(end_address10 ,UVM_ALL_ON)
`uvm_field_int(end_address11 ,UVM_ALL_ON)
`uvm_field_int(end_address12 ,UVM_ALL_ON)
`uvm_field_int(end_address13 ,UVM_ALL_ON)
`uvm_field_int(end_address14 ,UVM_ALL_ON)
`uvm_field_int(end_address15 ,UVM_ALL_ON)L*/
`uvm_field_int(region0_range_exception ,UVM_ALL_ON)
`uvm_field_int(region1_range_exception ,UVM_ALL_ON)
`uvm_field_int(region2_range_exception ,UVM_ALL_ON)
`uvm_field_int(region3_range_exception ,UVM_ALL_ON)
`uvm_field_int(region4_range_exception ,UVM_ALL_ON)
`uvm_field_int(region5_range_exception ,UVM_ALL_ON)
`uvm_field_int(region6_range_exception ,UVM_ALL_ON)
`uvm_field_int(region7_range_exception ,UVM_ALL_ON)
`uvm_field_int(region8_range_exception ,UVM_ALL_ON)
`uvm_field_int(region9_range_exception ,UVM_ALL_ON)
`uvm_field_int(region10_range_exception ,UVM_ALL_ON)
`uvm_field_int(region11_range_exception ,UVM_ALL_ON)
`uvm_field_int(region12_range_exception ,UVM_ALL_ON)
`uvm_field_int(region13_range_exception ,UVM_ALL_ON)
`uvm_field_int(region14_range_exception ,UVM_ALL_ON)
`uvm_field_int(region15_range_exception ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception0 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception1 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception2 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception3 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception4 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception5 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception6 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception7 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception8 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception9 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception10 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception11 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception12 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception13 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception14 ,UVM_ALL_ON)
`uvm_field_int(overlapping_region_exception15 ,UVM_ALL_ON)
`uvm_field_int(valid_memory_access_write_address ,UVM_ALL_ON)
`uvm_field_int(valid_memory_access_read_address ,UVM_ALL_ON)
`uvm_field_int(load_exception ,UVM_ALL_ON)
`uvm_field_int(store_exception ,UVM_ALL_ON)




`uvm_object_utils_end

endclass

