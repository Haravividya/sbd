/*************************************************
File name:pmp_interface_tb.sv
Description:

**************************************************/

interface pmp_interface_tb (input logic clk);

parameter RANGE_WIDTH=35;
parameter DATA_WIDTH=32;

  //INPUTS--------------------------
  logic  		csr_rst		;                   
  logic  [11:0]	csr_write_addr  ;                
  logic csr_write_en	;
  logic [31:0] csr_write_data;
  logic kernel_mode_signal;
  logic machine_mode_valid;
  logic csr_read_en;
  logic [11:0] csr_read_addr;
  logic pmp_en;
  logic [DATA_WIDTH-1:0] memory_access_write_address;
  logic memory_access_write_en;
  logic [DATA_WIDTH-1:0] memory_access_read_address;
  logic memory_access_read_en;

  //OUTPUTS-----------------
  logic  [31:0]	csr_read_out  ;   // data out
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
  
            
`include "../UVME/top/pmp_assertion.sv"

endinterface

