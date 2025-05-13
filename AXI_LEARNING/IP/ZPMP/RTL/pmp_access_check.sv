module pmp_access_check
#
(
  parameter DATA_WIDTH = 32,
  parameter RANGE_WIDTH = 35   
  
)
(
input logic csr_clk,
input logic csr_rst,
input logic pmp_en,
input logic [DATA_WIDTH-1:0] memory_access_write_address,
input logic  memory_access_write_en,
input logic [DATA_WIDTH-1:0] memory_access_read_address,
input logic  memory_access_read_en,
input logic  machine_mode_valid,
input logic  kernal_mode_signal,
input logic [DATA_WIDTH-1:0]pmpcfg0_i,
input logic [DATA_WIDTH-1:0]pmpcfg1_i,
input logic [DATA_WIDTH-1:0]pmpcfg2_i,
input logic [DATA_WIDTH-1:0]pmpcfg3_i,
input logic [RANGE_WIDTH-1:0] start_address0,
input logic [RANGE_WIDTH-1:0] start_address1,
input logic [RANGE_WIDTH-1:0] start_address2,
input logic [RANGE_WIDTH-1:0] start_address3,
input logic [RANGE_WIDTH-1:0] start_address4,
input logic [RANGE_WIDTH-1:0] start_address5,
input logic [RANGE_WIDTH-1:0] start_address6,
input logic [RANGE_WIDTH-1:0] start_address7,
input logic [RANGE_WIDTH-1:0] start_address8,
input logic [RANGE_WIDTH-1:0] start_address9,
input logic [RANGE_WIDTH-1:0] start_address10,
input logic [RANGE_WIDTH-1:0] start_address11,
input logic [RANGE_WIDTH-1:0] start_address12,
input logic [RANGE_WIDTH-1:0] start_address13,
input logic [RANGE_WIDTH-1:0] start_address14,
input logic [RANGE_WIDTH-1:0] start_address15,
input logic [RANGE_WIDTH-1:0] end_address0,
input logic [RANGE_WIDTH-1:0] end_address1,
input logic [RANGE_WIDTH-1:0] end_address2,
input logic [RANGE_WIDTH-1:0] end_address3,
input logic [RANGE_WIDTH-1:0] end_address4,
input logic [RANGE_WIDTH-1:0] end_address5,
input logic [RANGE_WIDTH-1:0] end_address6,
input logic [RANGE_WIDTH-1:0] end_address7,
input logic [RANGE_WIDTH-1:0] end_address8,
input logic [RANGE_WIDTH-1:0] end_address9,
input logic [RANGE_WIDTH-1:0] end_address10,
input logic [RANGE_WIDTH-1:0] end_address11,
input logic [RANGE_WIDTH-1:0] end_address12,
input logic [RANGE_WIDTH-1:0] end_address13,
input logic [RANGE_WIDTH-1:0] end_address14,
input logic [RANGE_WIDTH-1:0] end_address15,
output  logic overlapping_region_exception0,
output  logic overlapping_region_exception1,
output  logic overlapping_region_exception2,
output  logic overlapping_region_exception3,
output  logic overlapping_region_exception4,
output  logic overlapping_region_exception5,
output  logic overlapping_region_exception6,
output  logic overlapping_region_exception7,
output  logic overlapping_region_exception8,
output  logic overlapping_region_exception9,
output  logic overlapping_region_exception10,
output  logic overlapping_region_exception11,
output  logic overlapping_region_exception12,
output  logic overlapping_region_exception13,
output  logic overlapping_region_exception14,
output  logic overlapping_region_exception15,

output  logic load_exception,
output  logic store_exception,

output  logic valid_memory_access_write_address,
output  logic valid_memory_access_read_address
//output  logic valid_execute_instruction_access

);

 timeunit 1ns;
 timeprecision 1ps;

 logic user_mode_access;
 logic machine_mode_access;

 logic range_check_write0 ; 
 logic range_check_write1 ;
 logic range_check_write2 ;
 logic range_check_write3 ;
 logic range_check_write4 ;
 logic range_check_write5 ; 
 logic range_check_write6 ; 
 logic range_check_write7 ; 
 logic range_check_write8 ; 
 logic range_check_write9 ;
 logic range_check_write10 ;
 logic range_check_write11 ;
 logic range_check_write12 ;
 logic range_check_write13 ; 
 logic range_check_write14 ; 
 logic range_check_write15 ; 

 logic range_check_read0 ; 
 logic range_check_read1 ;
 logic range_check_read2 ;
 logic range_check_read3 ;
 logic range_check_read4 ;
 logic range_check_read5 ; 
 logic range_check_read6 ; 
 logic range_check_read7 ; 
 logic range_check_read8 ; 
 logic range_check_read9 ;
 logic range_check_read10 ;
 logic range_check_read11 ;
 logic range_check_read12 ;
 logic range_check_read13 ; 
 logic range_check_read14 ; 
 logic range_check_read15 ; 


 logic non_zero_region0;
 logic non_zero_region1;
 logic non_zero_region2;
 logic non_zero_region3;
 logic non_zero_region4;
 logic non_zero_region5;
 logic non_zero_region6;
 logic non_zero_region7;
 logic non_zero_region8;
 logic non_zero_region9;
 logic non_zero_region10;
 logic non_zero_region11;
 logic non_zero_region12;
 logic non_zero_region13;
 logic non_zero_region14;
 logic non_zero_region15;



 logic overlapping_region0;
 logic overlapping_region1;
 logic overlapping_region2;
 logic overlapping_region3;
 logic overlapping_region4;
 logic overlapping_region5;
 logic overlapping_region6;
 logic overlapping_region7;
 logic overlapping_region8;
 logic overlapping_region9;
 logic overlapping_region10;
 logic overlapping_region11;
 logic overlapping_region12;
 logic overlapping_region13;
 logic overlapping_region14;
 logic overlapping_region15;





assign non_zero_region0 = (end_address0 != 0) ? 1 : 0;
assign non_zero_region1 = (start_address1 != 0 ) && (end_address1 != 0) ? 1 : 0;
assign non_zero_region2 = (start_address2 != 0 ) && (end_address2 != 0) ? 1 : 0;
assign non_zero_region3 = (start_address3 != 0 ) && (end_address3 != 0) ? 1 : 0;
assign non_zero_region4 = (start_address4 != 0 ) && (end_address4 != 0) ? 1 : 0;
assign non_zero_region5 = (start_address5 != 0 ) && (end_address5 != 0) ? 1 : 0;
assign non_zero_region6 = (start_address6 != 0 ) && (end_address6 != 0) ? 1 : 0;
assign non_zero_region7 = (start_address7 != 0 ) && (end_address7 != 0) ? 1 : 0;
assign non_zero_region8 = (start_address8 != 0 ) && (end_address8 != 0) ? 1 : 0;
assign non_zero_region9 = (start_address9 != 0 ) && (end_address9 != 0) ? 1 : 0;
assign non_zero_region10 = (start_address10 != 0 ) && (end_address10 != 0) ? 1 : 0;
assign non_zero_region11 = (start_address11 != 0 ) && (end_address11 != 0) ? 1 : 0;
assign non_zero_region12 = (start_address12 != 0 ) && (end_address12 != 0) ? 1 : 0;
assign non_zero_region13 = (start_address13 != 0 ) && (end_address13 != 0) ? 1 : 0;
assign non_zero_region14 = (start_address14 != 0 ) && (end_address14 != 0) ? 1 : 0;
assign non_zero_region15 = (start_address15 != 0 ) && (end_address15 != 0) ? 1 : 0;



assign range_check_write0 = ( start_address0 <= memory_access_write_address && memory_access_write_address <= end_address0) ? 1:0;
assign range_check_write1 = ( start_address1 <= memory_access_write_address && memory_access_write_address <= end_address1) ? 1:0;
assign range_check_write2 = ( start_address2 <= memory_access_write_address && memory_access_write_address <= end_address2) ? 1:0;
assign range_check_write3 = ( start_address3 <= memory_access_write_address && memory_access_write_address <= end_address3) ? 1:0;
assign range_check_write4 = ( start_address4 <= memory_access_write_address && memory_access_write_address <= end_address4) ? 1:0;
assign range_check_write5 = ( start_address5 <= memory_access_write_address && memory_access_write_address <= end_address5) ? 1:0;
assign range_check_write6 = ( start_address6 <= memory_access_write_address && memory_access_write_address <= end_address6) ? 1:0;
assign range_check_write7 = ( start_address7 <= memory_access_write_address && memory_access_write_address <= end_address7) ? 1:0;
assign range_check_write8 = ( start_address8 <= memory_access_write_address && memory_access_write_address <= end_address8) ? 1:0;
assign range_check_write9 = ( start_address9 <= memory_access_write_address && memory_access_write_address <= end_address9) ? 1:0;
assign range_check_write10 = ( start_address10 <= memory_access_write_address && memory_access_write_address <= end_address10) ? 1:0;
assign range_check_write11 = ( start_address11 <= memory_access_write_address && memory_access_write_address <= end_address11) ? 1:0;
assign range_check_write12 = ( start_address12 <= memory_access_write_address && memory_access_write_address <= end_address12) ? 1:0;
assign range_check_write13 = ( start_address13 <= memory_access_write_address && memory_access_write_address <= end_address13) ? 1:0;
assign range_check_write14 = ( start_address14 <= memory_access_write_address && memory_access_write_address <= end_address14) ? 1:0;
assign range_check_write15 = ( start_address15 <= memory_access_write_address && memory_access_write_address <= end_address15) ? 1:0;

assign range_check_read0 = ( start_address0 <= memory_access_read_address && memory_access_read_address <= end_address0) ? 1:0;
assign range_check_read1 = ( start_address1 <= memory_access_read_address && memory_access_read_address <= end_address1) ? 1:0;
assign range_check_read2 = ( start_address2 <= memory_access_read_address && memory_access_read_address <= end_address2) ? 1:0;
assign range_check_read3 = ( start_address3 <= memory_access_read_address && memory_access_read_address <= end_address3) ? 1:0;
assign range_check_read4 = ( start_address4 <= memory_access_read_address && memory_access_read_address <= end_address4) ? 1:0;
assign range_check_read5 = ( start_address5 <= memory_access_read_address && memory_access_read_address <= end_address5) ? 1:0;
assign range_check_read6 = ( start_address6 <= memory_access_read_address && memory_access_read_address <= end_address6) ? 1:0;
assign range_check_read7 = ( start_address7 <= memory_access_read_address && memory_access_read_address <= end_address7) ? 1:0;
assign range_check_read8 = ( start_address8 <= memory_access_read_address && memory_access_read_address <= end_address8) ? 1:0;
assign range_check_read9 = ( start_address9 <= memory_access_read_address && memory_access_read_address <= end_address9) ? 1:0;
assign range_check_read10 = ( start_address10 <= memory_access_read_address && memory_access_read_address <= end_address10) ? 1:0;
assign range_check_read11 = ( start_address11 <= memory_access_read_address && memory_access_read_address <= end_address11) ? 1:0;
assign range_check_read12 = ( start_address12 <= memory_access_read_address && memory_access_read_address <= end_address12) ? 1:0;
assign range_check_read13 = ( start_address13 <= memory_access_read_address && memory_access_read_address <= end_address13) ? 1:0;
assign range_check_read14 = ( start_address14 <= memory_access_read_address && memory_access_read_address <= end_address14) ? 1:0;
assign range_check_read15 = ( start_address15 <= memory_access_read_address && memory_access_read_address <= end_address15) ? 1:0;

assign overlapping_region0 = 
      ((start_address15 <=start_address0  && start_address0 <= end_address15 ) ||
      (start_address1 <= start_address0  && start_address0 <= end_address1 ) || 
      (start_address2 <= start_address0  && start_address0 <= end_address2 ) ||
      (start_address3 <= start_address0  && start_address0 <= end_address3 ) ||
      (start_address4 <= start_address0  && start_address0 <= end_address4 ) ||
      (start_address5 <= start_address0  && start_address0 <= end_address5 ) ||
      (start_address6 <= start_address0  && start_address0 <= end_address6 ) ||
      (start_address7 <= start_address0  && start_address0 <= end_address7 ) ||
      (start_address8 <= start_address0  && start_address0 <= end_address8 ) ||
      (start_address9 <= start_address0  && start_address0 <= end_address9 ) ||
      (start_address10<= start_address0 &&  start_address0 <= end_address10) ||
      (start_address11<= start_address0 &&  start_address0 <= end_address11) ||
      (start_address12<= start_address0 &&  start_address0 <= end_address12) || 
      (start_address13<= start_address0 &&  start_address0 <= end_address13) ||
      (start_address14<= start_address0 &&  start_address0 <= end_address14) ||
      (start_address15 <= end_address0  && end_address0 <= end_address15     ) ||
      (start_address1 <= end_address0  && end_address0 <= end_address1     ) ||
      (start_address2 <= end_address0  && end_address0 <= end_address2     ) ||
      (start_address3 <= end_address0  && end_address0 <= end_address3     ) ||
      (start_address4 <= end_address0  && end_address0 <= end_address4     ) ||
      (start_address5 <= end_address0  && end_address0 <= end_address5     ) ||
      (start_address6 <= end_address0  && end_address0 <= end_address6     ) ||
      (start_address7 <= end_address0  && end_address0 <= end_address7     ) ||
      (start_address8 <= end_address0  && end_address0 <= end_address8     ) ||
      (start_address9 <= end_address0  && end_address0 <= end_address9     ) ||
      (start_address10 <= end_address0 && end_address0 <= end_address10    ) ||
      (start_address11 <= end_address0 && end_address0 <= end_address11    ) ||
      (start_address12 <= end_address0 && end_address0 <= end_address12    ) ||
      (start_address13 <= end_address0 && end_address0 <= end_address13    ) ||
      (start_address14 <= end_address0 && end_address0 <= end_address14 ))? 1 : 0;
assign overlapping_region1 = 
      ((start_address0 <=start_address1  && start_address1 <= end_address0 ) ||
      (start_address15 <= start_address1  && start_address1 <= end_address15 ) || 
      (start_address2 <= start_address1  && start_address1 <= end_address2 ) ||
      (start_address3 <= start_address1  && start_address1 <= end_address3 ) ||
      (start_address4 <= start_address1  && start_address1 <= end_address4 ) ||
      (start_address5 <= start_address1  && start_address1 <= end_address5 ) ||
      (start_address6 <= start_address1  && start_address1 <= end_address6 ) ||
      (start_address7 <= start_address1  && start_address1 <= end_address7 ) ||
      (start_address8 <= start_address1  && start_address1 <= end_address8 ) ||
      (start_address9 <= start_address1  && start_address1 <= end_address9 ) ||
      (start_address10 <= start_address1 && start_address1 <= end_address10) ||
      (start_address11 <= start_address1 && start_address1 <= end_address11) ||
      (start_address12 <= start_address1 && start_address1 <= end_address12) || 
      (start_address13 <= start_address1 && start_address1 <= end_address13) ||
      (start_address14 <= start_address1 && start_address1 <= end_address14) ||
      (start_address0 <= end_address1  && end_address1 <= end_address0     ) ||
      (start_address15 <= end_address1  && end_address1 <= end_address15     ) ||
      (start_address2 <= end_address1  && end_address1 <= end_address2     ) ||
      (start_address3 <= end_address1  && end_address1 <= end_address3     ) ||
      (start_address4 <= end_address1  && end_address1 <= end_address4     ) ||
      (start_address5 <= end_address1  && end_address1 <= end_address5     ) ||
      (start_address6 <= end_address1  && end_address1 <= end_address6     ) ||
      (start_address7 <= end_address1  && end_address1 <= end_address7     ) ||
      (start_address8 <= end_address1  && end_address1 <= end_address8     ) ||
      (start_address9 <= end_address1  && end_address1 <= end_address9     ) ||
      (start_address10 <= end_address1 && end_address1 <= end_address10    ) ||
      (start_address11 <= end_address1 && end_address1 <= end_address11    ) ||
      (start_address12 <= end_address1 && end_address1 <= end_address12    ) ||
      (start_address13 <= end_address1 && end_address1 <= end_address13    ) ||
      (start_address14 <= end_address1 && end_address1 <= end_address14 ))? 1 : 0;
assign overlapping_region2 = 
      ((start_address0 <=start_address2  && start_address2 <= end_address0 ) ||
      (start_address1 <= start_address2  && start_address2 <= end_address1 ) || 
      (start_address15 <= start_address2  && start_address2 <= end_address15 ) ||
      (start_address3 <= start_address2  && start_address2 <= end_address3 ) ||
      (start_address4 <= start_address2  && start_address2 <= end_address4 ) ||
      (start_address5 <= start_address2  && start_address2 <= end_address5 ) ||
      (start_address6 <= start_address2  && start_address2 <= end_address6 ) ||
      (start_address7 <= start_address2  && start_address2 <= end_address7 ) ||
      (start_address8 <= start_address2  && start_address2 <= end_address8 ) ||
      (start_address9 <= start_address2  && start_address2 <= end_address9 ) ||
      (start_address10 <= start_address2 && start_address2 <= end_address10) ||
      (start_address11 <= start_address2 && start_address2 <= end_address11) ||
      (start_address12 <= start_address2 && start_address2 <= end_address12) || 
      (start_address13 <= start_address2 && start_address2 <= end_address13) ||
      (start_address14 <= start_address2 && start_address2 <= end_address14) ||
      (start_address0 <= end_address2  && end_address2 <= end_address0     ) ||
      (start_address1 <= end_address2  && end_address2 <= end_address1     ) ||
      (start_address15 <= end_address2  && end_address2 <= end_address15     ) ||
      (start_address3 <= end_address2  && end_address2 <= end_address3     ) ||
      (start_address4 <= end_address2  && end_address2 <= end_address4     ) ||
      (start_address5 <= end_address2  && end_address2 <= end_address5     ) ||
      (start_address6 <= end_address2  && end_address2 <= end_address6     ) ||
      (start_address7 <= end_address2  && end_address2 <= end_address7     ) ||
      (start_address8 <= end_address2  && end_address2 <= end_address8     ) ||
      (start_address9 <= end_address2  && end_address2 <= end_address9     ) ||
      (start_address10 <= end_address2 && end_address2 <= end_address10    ) ||
      (start_address11 <= end_address2 && end_address2 <= end_address11    ) ||
      (start_address12 <= end_address2 && end_address2 <= end_address12    ) ||
      (start_address13 <= end_address2 && end_address2 <= end_address13    ) ||
      (start_address14 <= end_address2 && end_address2 <= end_address14 ))? 1 : 0;
assign overlapping_region3 = 
      ((start_address0 <=start_address3  && start_address3 <= end_address0 ) ||
      (start_address1 <= start_address3  && start_address3 <= end_address1 ) || 
      (start_address2 <= start_address3  && start_address3 <= end_address2 ) ||
      (start_address15 <= start_address3  && start_address3 <= end_address15 ) ||
      (start_address4 <= start_address3  && start_address3 <= end_address4 ) ||
      (start_address5 <= start_address3  && start_address3 <= end_address5 ) ||
      (start_address6 <= start_address3  && start_address3 <= end_address6 ) ||
      (start_address7 <= start_address3  && start_address3 <= end_address7 ) ||
      (start_address8 <= start_address3  && start_address3 <= end_address8 ) ||
      (start_address9 <= start_address3  && start_address3 <= end_address9 ) ||
      (start_address10 <= start_address3 && start_address3 <= end_address10) ||
      (start_address11 <= start_address3 && start_address3 <= end_address11) ||
      (start_address12 <= start_address3 && start_address3 <= end_address12) || 
      (start_address13 <= start_address3 && start_address3 <= end_address13) ||
      (start_address14 <= start_address3 && start_address3 <= end_address14) ||
      (start_address0 <= end_address3  && end_address3 <= end_address0     ) ||
      (start_address1 <= end_address3  && end_address3 <= end_address1     ) ||
      (start_address2 <= end_address3  && end_address3 <= end_address2     ) ||
      (start_address15 <= end_address3  && end_address3 <= end_address15     ) ||
      (start_address4 <= end_address3  && end_address3 <= end_address4     ) ||
      (start_address5 <= end_address3  && end_address3 <= end_address5     ) ||
      (start_address6 <= end_address3  && end_address3 <= end_address6     ) ||
      (start_address7 <= end_address3  && end_address3 <= end_address7     ) ||
      (start_address8 <= end_address3  && end_address3 <= end_address8     ) ||
      (start_address9 <= end_address3  && end_address3 <= end_address9     ) ||
      (start_address10 <= end_address3 && end_address3 <= end_address10    ) ||
      (start_address11 <= end_address3 && end_address3 <= end_address11    ) ||
      (start_address12 <= end_address3 && end_address3 <= end_address12    ) ||
      (start_address13 <= end_address3 && end_address3 <= end_address13    ) ||
      (start_address14 <= end_address3 && end_address3 <= end_address14 ))? 1 : 0;
assign overlapping_region4 = 
      ((start_address0<= start_address4  && start_address4 <= end_address0 ) ||
      (start_address1 <= start_address4  && start_address4 <= end_address1 ) || 
      (start_address2 <= start_address4  && start_address4 <= end_address2 ) ||
      (start_address3 <= start_address4  && start_address4 <= end_address3 ) ||
      (start_address15 <= start_address4  && start_address4 <= end_address15 ) ||
      (start_address5 <= start_address4  && start_address4 <= end_address5 ) ||
      (start_address6 <= start_address4  && start_address4 <= end_address6 ) ||
      (start_address7 <= start_address4  && start_address4 <= end_address7 ) ||
      (start_address8 <= start_address4  && start_address4 <= end_address8 ) ||
      (start_address9 <= start_address4  && start_address4 <= end_address9 ) ||
      (start_address10 <= start_address4 && start_address4 <= end_address10) ||
      (start_address11 <= start_address4 && start_address4 <= end_address11) ||
      (start_address12 <= start_address4 && start_address4 <= end_address12) || 
      (start_address13 <= start_address4 && start_address4 <= end_address13) ||
      (start_address14 <= start_address4 && start_address4 <= end_address14) ||
      (start_address0 <= end_address4  && end_address4 <= end_address0     ) ||
      (start_address1 <= end_address4  && end_address4 <= end_address1     ) ||
      (start_address2 <= end_address4  && end_address4 <= end_address2     ) ||
      (start_address3 <= end_address4  && end_address4 <= end_address3     ) ||
      (start_address15 <= end_address4  && end_address4 <= end_address15     ) ||
      (start_address5 <= end_address4  && end_address4 <= end_address5     ) ||
      (start_address6 <= end_address4  && end_address4 <= end_address6     ) ||
      (start_address7 <= end_address4  && end_address4 <= end_address7     ) ||
      (start_address8 <= end_address4  && end_address4 <= end_address8     ) ||
      (start_address9 <= end_address4  && end_address4 <= end_address9     ) ||
      (start_address10 <= end_address4 && end_address4 <= end_address10    ) ||
      (start_address11 <= end_address4 && end_address4 <= end_address11    ) ||
      (start_address12 <= end_address4 && end_address4 <= end_address12    ) ||
      (start_address13 <= end_address4 && end_address4 <= end_address13    ) ||
      (start_address14 <= end_address4 && end_address4 <= end_address14 ))? 1 : 0;
assign overlapping_region5 = 
      ((start_address0 <=start_address5  && start_address5 <= end_address0 ) ||
      (start_address1 <= start_address5  && start_address5 <= end_address1 ) || 
      (start_address2 <= start_address5  && start_address5 <= end_address2 ) ||
      (start_address3 <= start_address5  && start_address5 <= end_address3 ) ||
      (start_address4 <= start_address5  && start_address5 <= end_address4 ) ||
      (start_address15 <= start_address5  && start_address5 <= end_address15 ) ||
      (start_address6 <= start_address5  && start_address5 <= end_address6 ) ||
      (start_address7 <= start_address5  && start_address5 <= end_address7 ) ||
      (start_address8 <= start_address5  && start_address5 <= end_address8 ) ||
      (start_address9 <= start_address5  && start_address5 <= end_address9 ) ||
      (start_address10 <= start_address5 && start_address5 <= end_address10) ||
      (start_address11 <= start_address5 && start_address5 <= end_address11) ||
      (start_address12 <= start_address5 && start_address5 <= end_address12) || 
      (start_address13 <= start_address5 && start_address5 <= end_address13) ||
      (start_address14 <= start_address5 && start_address5 <= end_address14) ||
      (start_address0 <= end_address5  && end_address5 <= end_address0     ) ||
      (start_address1 <= end_address5  && end_address5 <= end_address1     ) ||
      (start_address2 <= end_address5  && end_address5 <= end_address2     ) ||
      (start_address3 <= end_address5  && end_address5 <= end_address3     ) ||
      (start_address4 <= end_address5  && end_address5 <= end_address4     ) ||
      (start_address15 <= end_address5  && end_address5 <= end_address15     ) ||
      (start_address6 <= end_address5  && end_address5 <= end_address6     ) ||
      (start_address7 <= end_address5  && end_address5 <= end_address7     ) ||
      (start_address8 <= end_address5  && end_address5 <= end_address8     ) ||
      (start_address9 <= end_address5  && end_address5 <= end_address9     ) ||
      (start_address10 <= end_address5 && end_address5 <= end_address10    ) ||
      (start_address11 <= end_address5 && end_address5 <= end_address11    ) ||
      (start_address12 <= end_address5 && end_address5 <= end_address12    ) ||
      (start_address13 <= end_address5 && end_address5 <= end_address13    ) ||
      (start_address14 <= end_address5 && end_address5 <= end_address14 ))? 1 : 0;
assign overlapping_region6 = 
      ((start_address0 <=start_address6  && start_address6 <= end_address0 ) ||
      (start_address1 <= start_address6  && start_address6 <= end_address1 ) || 
      (start_address2 <= start_address6  && start_address6 <= end_address2 ) ||
      (start_address3 <= start_address6  && start_address6 <= end_address3 ) ||
      (start_address4 <= start_address6  && start_address6 <= end_address4 ) ||
      (start_address5 <= start_address6  && start_address6 <= end_address5 ) ||
      (start_address15 <= start_address6  && start_address6 <= end_address15 ) ||
      (start_address7 <= start_address6  && start_address6 <= end_address7 ) ||
      (start_address8 <= start_address6  && start_address6 <= end_address8 ) ||
      (start_address9 <= start_address6  && start_address6 <= end_address9 ) ||
      (start_address10 <= start_address6 && start_address6 <= end_address10) ||
      (start_address11 <= start_address6 && start_address6 <= end_address11) ||
      (start_address12 <= start_address6 && start_address6 <= end_address12) || 
      (start_address13 <= start_address6 && start_address6 <= end_address13) ||
      (start_address14 <= start_address6 && start_address6 <= end_address14) ||
      (start_address0 <= end_address6  && end_address6 <= end_address0     ) ||
      (start_address1 <= end_address6  && end_address6 <= end_address1     ) ||
      (start_address2 <= end_address6  && end_address6 <= end_address2     ) ||
      (start_address3 <= end_address6  && end_address6 <= end_address3     ) ||
      (start_address4 <= end_address6  && end_address6 <= end_address4     ) ||
      (start_address5 <= end_address6  && end_address6 <= end_address5     ) ||
      (start_address15 <= end_address6  && end_address6 <= end_address15     ) ||
      (start_address7 <= end_address6  && end_address6 <= end_address7     ) ||
      (start_address8 <= end_address6  && end_address6 <= end_address8     ) ||
      (start_address9 <= end_address6  && end_address6 <= end_address9     ) ||
      (start_address10 <= end_address6 && end_address6 <= end_address10    ) ||
      (start_address11 <= end_address6 && end_address6 <= end_address11    ) ||
      (start_address12 <= end_address6 && end_address6 <= end_address12    ) ||
      (start_address13 <= end_address6 && end_address6 <= end_address13    ) ||
      (start_address14 <= end_address6 && end_address6 <= end_address14 ))? 1 : 0;
assign overlapping_region7 = 
      ((start_address0 <=start_address7  && start_address7 <= end_address0 ) ||
      (start_address1 <= start_address7  && start_address7 <= end_address1 ) || 
      (start_address2 <= start_address7  && start_address7 <= end_address2 ) ||
      (start_address3 <= start_address7  && start_address7 <= end_address3 ) ||
      (start_address4 <= start_address7  && start_address7 <= end_address4 ) ||
      (start_address5 <= start_address7  && start_address7 <= end_address5 ) ||
      (start_address6 <= start_address7  && start_address7 <= end_address6 ) ||
      (start_address15 <= start_address7  && start_address7 <= end_address15 ) ||
      (start_address8 <= start_address7  && start_address7 <= end_address8 ) ||
      (start_address9 <= start_address7  && start_address7 <= end_address9 ) ||
      (start_address10 <= start_address7 && start_address7 <= end_address10) ||
      (start_address11 <= start_address7 && start_address7 <= end_address11) ||
      (start_address12 <= start_address7 && start_address7 <= end_address12) || 
      (start_address13 <= start_address7 && start_address7 <= end_address13) ||
      (start_address14 <= start_address7 && start_address7 <= end_address14) ||
      (start_address0 <= end_address7  && end_address7 <= end_address0     ) ||
      (start_address1 <= end_address7  && end_address7 <= end_address1     ) ||
      (start_address2 <= end_address7  && end_address7 <= end_address2     ) ||
      (start_address3 <= end_address7  && end_address7 <= end_address3     ) ||
      (start_address4 <= end_address7  && end_address7 <= end_address4     ) ||
      (start_address5 <= end_address7  && end_address7 <= end_address5     ) ||
      (start_address6 <= end_address7  && end_address7 <= end_address6     ) ||
      (start_address15 <= end_address7  && end_address7 <= end_address15     ) ||
      (start_address8 <= end_address7  && end_address7 <= end_address8     ) ||
      (start_address9 <= end_address7  && end_address7 <= end_address9     ) ||
      (start_address10 <= end_address7 && end_address7 <= end_address10    ) ||
      (start_address11 <= end_address7 && end_address7 <= end_address11    ) ||
      (start_address12 <= end_address7 && end_address7 <= end_address12    ) ||
      (start_address13 <= end_address7 && end_address7 <= end_address13    ) ||
      (start_address14 <= end_address7 && end_address7 <= end_address14 ))? 1 : 0;
assign overlapping_region8 = 
      ((start_address0 <=start_address8  && start_address8 <= end_address0 ) ||
      (start_address1 <= start_address8  && start_address8 <= end_address1 ) || 
      (start_address2 <= start_address8  && start_address8 <= end_address2 ) ||
      (start_address3 <= start_address8  && start_address8 <= end_address3 ) ||
      (start_address4 <= start_address8  && start_address8 <= end_address4 ) ||
      (start_address5 <= start_address8  && start_address8 <= end_address5 ) ||
      (start_address6 <= start_address8  && start_address8 <= end_address6 ) ||
      (start_address7 <= start_address8  && start_address8 <= end_address7 ) ||
      (start_address15 <= start_address8  && start_address8 <= end_address15 ) ||
      (start_address9 <= start_address8  && start_address8 <= end_address9 ) ||
      (start_address10 <= start_address8 && start_address8 <= end_address10) ||
      (start_address11 <= start_address8 && start_address8 <= end_address11) ||
      (start_address12 <= start_address8 && start_address8 <= end_address12) || 
      (start_address13 <= start_address8 && start_address8 <= end_address13) ||
      (start_address14 <= start_address8 && start_address8 <= end_address14) ||
      (start_address0 <= end_address8  && end_address8 <= end_address0     ) ||
      (start_address1 <= end_address8  && end_address8 <= end_address1     ) ||
      (start_address2 <= end_address8  && end_address8 <= end_address2     ) ||
      (start_address3 <= end_address8  && end_address8 <= end_address3     ) ||
      (start_address4 <= end_address8  && end_address8 <= end_address4     ) ||
      (start_address5 <= end_address8  && end_address8 <= end_address5     ) ||
      (start_address6 <= end_address8  && end_address8 <= end_address6     ) ||
      (start_address7 <= end_address8  && end_address8 <= end_address7     ) ||
      (start_address15 <= end_address8  && end_address8 <= end_address15     ) ||
      (start_address9 <= end_address8  && end_address8 <= end_address9     ) ||
      (start_address10 <= end_address8 && end_address8 <= end_address10    ) ||
      (start_address11 <= end_address8 && end_address8 <= end_address11    ) ||
      (start_address12 <= end_address8 && end_address8 <= end_address12    ) ||
      (start_address13 <= end_address8 && end_address8 <= end_address13    ) ||
      (start_address14 <= end_address8 && end_address8 <= end_address14 ))? 1 : 0;
assign overlapping_region9 = 
      ((start_address0<= start_address9  && start_address9 <= end_address0 ) ||
      (start_address1 <= start_address9  && start_address9 <= end_address1 ) || 
      (start_address2 <= start_address9  && start_address9 <= end_address2 ) ||
      (start_address3 <= start_address9  && start_address9 <= end_address3 ) ||
      (start_address4 <= start_address9  && start_address9 <= end_address4 ) ||
      (start_address5 <= start_address9  && start_address9 <= end_address5 ) ||
      (start_address6 <= start_address9  && start_address9 <= end_address6 ) ||
      (start_address7 <= start_address9  && start_address9 <= end_address7 ) ||
      (start_address8 <= start_address9  && start_address9 <= end_address8 ) ||
      (start_address15 <= start_address9  && start_address9 <= end_address15 ) ||
      (start_address10 <= start_address9 && start_address9 <= end_address10) ||
      (start_address11 <= start_address9 && start_address9 <= end_address11) ||
      (start_address12 <= start_address9 && start_address9 <= end_address12) || 
      (start_address13 <= start_address9 && start_address9 <= end_address13) ||
      (start_address14 <= start_address9 && start_address9 <= end_address14) ||
      (start_address0 <= end_address9  && end_address9 <= end_address0     ) ||
      (start_address1 <= end_address9  && end_address9 <= end_address1     ) ||
      (start_address2 <= end_address9  && end_address9 <= end_address2     ) ||
      (start_address3 <= end_address9  && end_address9 <= end_address3     ) ||
      (start_address4 <= end_address9  && end_address9 <= end_address4     ) ||
      (start_address5 <= end_address9  && end_address9 <= end_address5     ) ||
      (start_address6 <= end_address9  && end_address9 <= end_address6     ) ||
      (start_address7 <= end_address9  && end_address9 <= end_address7     ) ||
      (start_address8 <= end_address9  && end_address9 <= end_address8     ) ||
      (start_address15 <= end_address9  && end_address9 <= end_address15     ) ||
      (start_address10 <= end_address9 && end_address9 <= end_address10    ) ||
      (start_address11 <= end_address9 && end_address9 <= end_address11    ) ||
      (start_address12 <= end_address9 && end_address9 <= end_address12    ) ||
      (start_address13 <= end_address9 && end_address9 <= end_address13    ) ||
      (start_address14 <= end_address9 && end_address9 <= end_address14 ))? 1 : 0;
assign overlapping_region10 = 
      ((start_address0 <=start_address10  && start_address10 <= end_address0 ) ||
      (start_address1 <= start_address10  && start_address10 <= end_address1 ) || 
      (start_address2 <= start_address10  && start_address10 <= end_address2 ) ||
      (start_address3 <= start_address10  && start_address10 <= end_address3 ) ||
      (start_address4 <= start_address10  && start_address10 <= end_address4 ) ||
      (start_address5 <= start_address10  && start_address10 <= end_address5 ) ||
      (start_address6 <= start_address10  && start_address10 <= end_address6 ) ||
      (start_address7 <= start_address10  && start_address10 <= end_address7 ) ||
      (start_address8 <= start_address10  && start_address10 <= end_address8 ) ||
      (start_address9 <= start_address10  && start_address10 <= end_address9 ) ||
      (start_address15 <= start_address10 && start_address10 <= end_address15) ||
      (start_address11 <= start_address10 && start_address10 <= end_address11) ||
      (start_address12 <= start_address10 && start_address10 <= end_address12) || 
      (start_address13 <= start_address10 && start_address10 <= end_address13) ||
      (start_address14 <= start_address10 && start_address10 <= end_address14) ||
      (start_address0 <= end_address10  && end_address10 <= end_address0     ) ||
      (start_address1 <= end_address10  && end_address10 <= end_address1     ) ||
      (start_address2 <= end_address10  && end_address10 <= end_address2     ) ||
      (start_address3 <= end_address10  && end_address10 <= end_address3     ) ||
      (start_address4 <= end_address10  && end_address10 <= end_address4     ) ||
      (start_address5 <= end_address10  && end_address10 <= end_address5     ) ||
      (start_address6 <= end_address10  && end_address10 <= end_address6     ) ||
      (start_address7 <= end_address10  && end_address10 <= end_address7     ) ||
      (start_address8 <= end_address10  && end_address10 <= end_address8     ) ||
      (start_address9 <= end_address10  && end_address10 <= end_address9     ) ||
      (start_address15 <= end_address10 && end_address10 <= end_address15    ) ||
      (start_address11 <= end_address10 && end_address10 <= end_address11    ) ||
      (start_address12 <= end_address10 && end_address10 <= end_address12    ) ||
      (start_address13 <= end_address10 && end_address10 <= end_address13    ) ||
      (start_address14 <= end_address10 && end_address10 <= end_address14 ))? 1 : 0;
assign overlapping_region11 = 
      ((start_address0 <=start_address11  && start_address11 <= end_address0 ) ||
      (start_address1 <= start_address11  && start_address11 <= end_address1 ) || 
      (start_address2 <= start_address11  && start_address11 <= end_address2 ) ||
      (start_address3 <= start_address11  && start_address11 <= end_address3 ) ||
      (start_address4 <= start_address11  && start_address11 <= end_address4 ) ||
      (start_address5 <= start_address11  && start_address11 <= end_address5 ) ||
      (start_address6 <= start_address11  && start_address11 <= end_address6 ) ||
      (start_address7 <= start_address11  && start_address11 <= end_address7 ) ||
      (start_address8 <= start_address11  && start_address11 <= end_address8 ) ||
      (start_address9 <= start_address11  && start_address11 <= end_address9 ) ||
      (start_address10 <= start_address11 && start_address11 <= end_address10) ||
      (start_address15 <= start_address11 && start_address11 <= end_address15) ||
      (start_address12 <= start_address11 && start_address11 <= end_address12) || 
      (start_address13 <= start_address11 && start_address11 <= end_address13) ||
      (start_address14 <= start_address11 && start_address11 <= end_address14) ||
      (start_address0 <= end_address11  && end_address11 <= end_address0     ) ||
      (start_address1 <= end_address11  && end_address11 <= end_address1     ) ||
      (start_address2 <= end_address11  && end_address11 <= end_address2     ) ||
      (start_address3 <= end_address11  && end_address11 <= end_address3     ) ||
      (start_address4 <= end_address11  && end_address11 <= end_address4     ) ||
      (start_address5 <= end_address11  && end_address11 <= end_address5     ) ||
      (start_address6 <= end_address11  && end_address11 <= end_address6     ) ||
      (start_address7 <= end_address11  && end_address11 <= end_address7     ) ||
      (start_address8 <= end_address11  && end_address11 <= end_address8     ) ||
      (start_address9 <= end_address11  && end_address11 <= end_address9     ) ||
      (start_address10 <= end_address11 && end_address11 <= end_address10    ) ||
      (start_address15 <= end_address11 && end_address11 <= end_address15    ) ||
      (start_address12 <= end_address11 && end_address11 <= end_address12    ) ||
      (start_address13 <= end_address11 && end_address11 <= end_address13    ) ||
      (start_address14 <= end_address11 && end_address11 <= end_address14 ))? 1 : 0;
assign overlapping_region12 = 
      ((start_address0 <=start_address12  && start_address12 <= end_address0 ) ||
      (start_address1 <= start_address12  && start_address12 <= end_address1 ) || 
      (start_address2 <= start_address12  && start_address12 <= end_address2 ) ||
      (start_address3 <= start_address12  && start_address12 <= end_address3 ) ||
      (start_address4 <= start_address12  && start_address12 <= end_address4 ) ||
      (start_address5 <= start_address12  && start_address12 <= end_address5 ) ||
      (start_address6 <= start_address12  && start_address12 <= end_address6 ) ||
      (start_address7 <= start_address12  && start_address12 <= end_address7 ) ||
      (start_address8 <= start_address12  && start_address12 <= end_address8 ) ||
      (start_address9 <= start_address12  && start_address12 <= end_address9 ) ||
      (start_address10 <= start_address12 && start_address12 <= end_address10) ||
      (start_address11 <= start_address12 && start_address12 <= end_address11) ||
      (start_address15 <= start_address12 && start_address12 <= end_address15) || 
      (start_address13 <= start_address12 && start_address12 <= end_address13) ||
      (start_address14 <= start_address12 && start_address12 <= end_address14) ||
      (start_address0 <= end_address12  && end_address12 <= end_address0     ) ||
      (start_address1 <= end_address12  && end_address12 <= end_address1     ) ||
      (start_address2 <= end_address12  && end_address12 <= end_address2     ) ||
      (start_address3 <= end_address12  && end_address12 <= end_address3     ) ||
      (start_address4 <= end_address12  && end_address12 <= end_address4     ) ||
      (start_address5 <= end_address12  && end_address12 <= end_address5     ) ||
      (start_address6 <= end_address12  && end_address12 <= end_address6     ) ||
      (start_address7 <= end_address12  && end_address12 <= end_address7     ) ||
      (start_address8 <= end_address12  && end_address12 <= end_address8     ) ||
      (start_address9 <= end_address12  && end_address12 <= end_address9     ) ||
      (start_address10 <= end_address12 && end_address12 <= end_address10    ) ||
      (start_address11 <= end_address12 && end_address12 <= end_address11    ) ||
      (start_address15 <= end_address12 && end_address12 <= end_address15    ) ||
      (start_address13 <= end_address12 && end_address12 <= end_address13    ) ||
      (start_address14 <= end_address12 && end_address12 <= end_address14 ))? 1 : 0;
assign overlapping_region13 = 
      ((start_address0 <=start_address13  && start_address13 <= end_address0 ) ||
      (start_address1 <= start_address13  && start_address13 <= end_address1 ) || 
      (start_address2 <= start_address13  && start_address13 <= end_address2 ) ||
      (start_address3 <= start_address13  && start_address13 <= end_address3 ) ||
      (start_address4 <= start_address13  && start_address13 <= end_address4 ) ||
      (start_address5 <= start_address13  && start_address13 <= end_address5 ) ||
      (start_address6 <= start_address13  && start_address13 <= end_address6 ) ||
      (start_address7 <= start_address13  && start_address13 <= end_address7 ) ||
      (start_address8 <= start_address13  && start_address13 <= end_address8 ) ||
      (start_address9 <= start_address13  && start_address13 <= end_address9 ) ||
      (start_address10 <= start_address13 && start_address13 <= end_address10) ||
      (start_address11 <= start_address13 && start_address13 <= end_address11) ||
      (start_address12 <= start_address13 && start_address13 <= end_address12) || 
      (start_address15 <= start_address13 && start_address13 <= end_address15) ||
      (start_address14 <= start_address13 && start_address13 <= end_address14) ||
      (start_address0 <= end_address13  && end_address13 <= end_address0     ) ||
      (start_address1 <= end_address13  && end_address13 <= end_address1     ) ||
      (start_address2 <= end_address13  && end_address13 <= end_address2     ) ||
      (start_address3 <= end_address13  && end_address13 <= end_address3     ) ||
      (start_address4 <= end_address13  && end_address13 <= end_address4     ) ||
      (start_address5 <= end_address13  && end_address13 <= end_address5     ) ||
      (start_address6 <= end_address13  && end_address13 <= end_address6     ) ||
      (start_address7 <= end_address13  && end_address13 <= end_address7     ) ||
      (start_address8 <= end_address13  && end_address13 <= end_address8     ) ||
      (start_address9 <= end_address13  && end_address13 <= end_address9     ) ||
      (start_address10 <= end_address13 && end_address13 <= end_address10    ) ||
      (start_address11 <= end_address13 && end_address13 <= end_address11    ) ||
      (start_address12 <= end_address13 && end_address13 <= end_address12    ) ||
      (start_address15 <= end_address13 && end_address13 <= end_address15    ) ||
      (start_address14 <= end_address13 && end_address13 <= end_address14 ))? 1 : 0;
assign overlapping_region14 = 
      ((start_address0 <=start_address14  && start_address14 <= end_address0 ) ||
      (start_address1 <= start_address14  && start_address14 <= end_address1 ) || 
      (start_address2 <= start_address14  && start_address14 <= end_address2 ) ||
      (start_address3 <= start_address14  && start_address14 <= end_address3 ) ||
      (start_address4 <= start_address14  && start_address14 <= end_address4 ) ||
      (start_address5 <= start_address14  && start_address14 <= end_address5 ) ||
      (start_address6 <= start_address14  && start_address14 <= end_address6 ) ||
      (start_address7 <= start_address14  && start_address14 <= end_address7 ) ||
      (start_address8 <= start_address14  && start_address14 <= end_address8 ) ||
      (start_address9 <= start_address14  && start_address14 <= end_address9 ) ||
      (start_address10 <= start_address14 && start_address14 <= end_address10) ||
      (start_address11 <= start_address14 && start_address14 <= end_address11) ||
      (start_address12 <= start_address14 && start_address14 <= end_address12) || 
      (start_address13 <= start_address14 && start_address14 <= end_address13) ||
      (start_address15 <= start_address14 && start_address14 <= end_address15) ||
      (start_address0 <= end_address14  && end_address14 <= end_address0     ) ||
      (start_address1 <= end_address14  && end_address14 <= end_address1     ) ||
      (start_address2 <= end_address14  && end_address14 <= end_address2     ) ||
      (start_address3 <= end_address14  && end_address14 <= end_address3     ) ||
      (start_address4 <= end_address14  && end_address14 <= end_address4     ) ||
      (start_address5 <= end_address14  && end_address14 <= end_address5     ) ||
      (start_address6 <= end_address14  && end_address14 <= end_address6     ) ||
      (start_address7 <= end_address14  && end_address14 <= end_address7     ) ||
      (start_address8 <= end_address14  && end_address14 <= end_address8     ) ||
      (start_address9 <= end_address14  && end_address14 <= end_address9     ) ||
      (start_address10 <= end_address14 && end_address14 <= end_address10    ) ||
      (start_address11 <= end_address14 && end_address14 <= end_address11    ) ||
      (start_address12 <= end_address14 && end_address14 <= end_address12    ) ||
      (start_address13 <= end_address14 && end_address14 <= end_address13    ) ||
      (start_address15 <= end_address14 && end_address14 <= end_address15 ))? 1 : 0;



assign overlapping_region15 = 
      ((start_address0 <= start_address15  && start_address15 <= end_address0 ) ||
      (start_address1 <= start_address15  && start_address15 <= end_address1 ) || 
      (start_address2 <= start_address15  && start_address15 <= end_address2 ) ||
      (start_address3 <= start_address15  && start_address15 <= end_address3 ) ||
      (start_address4 <= start_address15  && start_address15 <= end_address4 ) ||
      (start_address5 <= start_address15  && start_address15 <= end_address5 ) ||
      (start_address6 <= start_address15  && start_address15 <= end_address6 ) ||
      (start_address7 <= start_address15  && start_address15 <= end_address7 ) ||
      (start_address8 <= start_address15  && start_address15 <= end_address8 ) ||
      (start_address9 <= start_address15  && start_address15 <= end_address9 ) ||
      (start_address10 <= start_address15 && start_address15 <= end_address10) ||
      (start_address11 <= start_address15 && start_address15 <= end_address11) ||
      (start_address12 <= start_address15 && start_address15 <= end_address12) || 
      (start_address13 <= start_address15 && start_address15 <= end_address13) ||
      (start_address14 <= start_address15 && start_address15 <= end_address14) ||
      (start_address0 <= end_address15  && end_address15 <= end_address0     ) ||
      (start_address1 <= end_address15  && end_address15 <= end_address1     ) ||
      (start_address2 <= end_address15  && end_address15 <= end_address2     ) ||
      (start_address3 <= end_address15  && end_address15 <= end_address3     ) ||
      (start_address4 <= end_address15  && end_address15 <= end_address4     ) ||
      (start_address5 <= end_address15  && end_address15 <= end_address5     ) ||
      (start_address6 <= end_address15  && end_address15 <= end_address6     ) ||
      (start_address7 <= end_address15  && end_address15 <= end_address7     ) ||
      (start_address8 <= end_address15  && end_address15 <= end_address8     ) ||
      (start_address9 <= end_address15  && end_address15 <= end_address9     ) ||
      (start_address10 <= end_address15 && end_address15 <= end_address10    ) ||
      (start_address11 <= end_address15 && end_address15 <= end_address11    ) ||
      (start_address12 <= end_address15 && end_address15 <= end_address12    ) ||
      (start_address13 <= end_address15 && end_address15 <= end_address13    ) ||
      (start_address14 <= end_address15 && end_address15 <= end_address14 ))? 1 : 0;







assign user_mode_access = kernal_mode_signal | machine_mode_valid ;
assign machine_mode_access = !kernal_mode_signal & machine_mode_valid;





////// 010 and 011 are reserved
//writing and reading for 0 region 
always_comb
begin
    if(pmp_en)
    begin
    if((user_mode_access == 1'b1) && (range_check_write0==1'b1)) // pmp enable should included
    begin
        unique case(pmpcfg0_i[2:0])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

    else if((user_mode_access == 1'b1) && (range_check_write1 == 1'b1))
    begin
        unique case(pmpcfg0_i[10:8])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase

     end
    
     

    else if((user_mode_access == 1'b1) && (range_check_write2 == 1'b1))
    begin
        unique case(pmpcfg0_i[18:16])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
end


else if((user_mode_access == 1'b1) && (range_check_write3 == 1'b1))
    begin
        unique case(pmpcfg0_i[26:24])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase

    end
        
        else if((user_mode_access == 1'b1) && ( range_check_write4 == 1'b1))
    begin
        unique case(pmpcfg1_i[2:0])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

    
    else if((user_mode_access == 1'b1) && ( range_check_write5 == 1'b1))
    begin
        unique case(pmpcfg1_i[10:8])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

    else if((user_mode_access == 1'b1) && ( range_check_write6 == 1'b1))
    begin
         unique case(pmpcfg1_i[18:16])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end


        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

else if((user_mode_access == 1'b1) && ( range_check_write7 == 1'b1))
    begin
        unique case(pmpcfg1_i[26:24])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

    else if((user_mode_access == 1'b1) && ( range_check_write8 == 1'b1))
    begin
        unique case(pmpcfg2_i[2:0])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end
else if((user_mode_access == 1'b1) && ( range_check_write9 == 1'b1  ))
begin
    unique case(pmpcfg2_i[10:8])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

else if((user_mode_access == 1'b1) && ( range_check_write10 == 1'b1))
    begin
        unique case(pmpcfg2_i[18:16])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

    else if((user_mode_access == 1'b1) && ( range_check_write11 == 1'b1))
    begin
        unique case(pmpcfg2_i[26:24])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

    else if((user_mode_access == 1'b1) && ( range_check_write12 == 1'b1))
    begin
        unique case(pmpcfg3_i[2:0])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end
    
    else if((user_mode_access == 1'b1) && ( range_check_write13 == 1'b1))
    begin
        unique case(pmpcfg3_i[10:8])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

else if((user_mode_access == 1'b1) && ( range_check_write14 == 1'b1))
    begin
        unique case(pmpcfg3_i[18:16])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end

    else if((user_mode_access == 1'b1) && ( range_check_write15 == 1'b1))
    begin
        unique case(pmpcfg3_i[26:24])
            3'b000:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b001:begin
                   valid_memory_access_write_address = 1'b0;
                   end
             
            3'b100:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b101:begin
                   valid_memory_access_write_address = 1'b0;
                   end

            3'b011:begin
                   valid_memory_access_write_address = 1'b1;
                   end

            3'b111:begin
                   valid_memory_access_write_address = 1'b1;
                   end

        default:begin
                valid_memory_access_write_address = 1'b0;
                end
        endcase
    end
 else
    begin
      valid_memory_access_write_address = 1'b0;
    end
end
else
begin
  valid_memory_access_write_address = 1'b0;
end
end





always_comb
begin
    if(pmp_en)
    begin
    if((user_mode_access == 1) && (range_check_read0 == 1'b1))
    begin
        unique case(pmpcfg0_i[2:0])
            3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

    else if((user_mode_access == 1) && (range_check_read1 == 1'b1))
    begin
        unique case(pmpcfg0_i[10:8])
            3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

else if((user_mode_access == 1) && (range_check_read2 == 1'b1))
    begin
        unique case(pmpcfg0_i[18:16])
            3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end



       else if((user_mode_access == 1) && (range_check_read3 == 1'b1))
    begin
        unique case(pmpcfg0_i[26:24])
            3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

  
   else if((user_mode_access == 1) && (range_check_read4 == 1'b1))
    begin
        unique case(pmpcfg1_i[2:0])
             3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

      else if((user_mode_access == 1) && (range_check_read5 == 1'b1))
    begin
        unique case(pmpcfg1_i[10:8])
             3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

      else if((user_mode_access == 1) && (range_check_read6 == 1'b1))
    begin
        unique case(pmpcfg1_i[18:16])

         3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

      else if((user_mode_access == 1) && (range_check_read7 == 1'b1))
    begin
        unique case(pmpcfg1_i[26:24])
             3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

     else if((user_mode_access == 1) && (range_check_read8 == 1'b1))
    begin
        unique case(pmpcfg2_i[2:0])
             3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

       else if((user_mode_access == 1) && (range_check_read9 == 1'b1))
    begin
        unique case(pmpcfg2_i[10:8])
             3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

      else if((user_mode_access == 1) && (range_check_read10 == 1'b1))
    begin
        unique case(pmpcfg2_i[18:16])
             3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

       else if((user_mode_access == 1) && (range_check_read11 == 1'b1))
    begin
         unique case(pmpcfg2_i[26:24])

         3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

      else if((user_mode_access == 1) && (range_check_read12 == 1'b1))
    begin
        unique case(pmpcfg3_i[2:0])
             3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

      else if((user_mode_access == 1) && (range_check_read13 == 1'b1))
    begin
        unique case(pmpcfg3_i[10:8])
              3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

       else if((user_mode_access == 1) && (range_check_read14 == 1'b1))
    begin
        unique case(pmpcfg3_i[18:16])
            3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

      else if((user_mode_access == 1) && (range_check_read15 == 1'b1))
    begin
        unique case(pmpcfg3_i[26:24])
            3'b000:begin
                valid_memory_access_read_address = 1'b0;
                end

            3'b001:begin
                valid_memory_access_read_address = 1'b1;
                end
             
            3'b100:begin
                valid_memory_access_read_address = 1'b0;
                end
            3'b101:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b011:begin
                valid_memory_access_read_address = 1'b1;
                end
            3'b111:begin
                valid_memory_access_read_address = 1'b1;
                end
        default:begin
                valid_memory_access_read_address = 1'b0;
                end
        endcase
    end

    else
    begin
        valid_memory_access_read_address = 1'b0;
    end
end

else
begin
valid_memory_access_read_address = 1'b0;
end
end


//non overlapping logic


always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception0 = 1'b0;
    end

    else if(pmp_en && non_zero_region0 && overlapping_region0) // when na4 or napot is selected starting address will be 0 to 4 or 0 to 8.
      begin
          overlapping_region_exception0 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception0 = 1'b0;

      end
end 

always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception1 = 1'b0;
    end

    else if(pmp_en && non_zero_region1 && overlapping_region1)
      begin
          overlapping_region_exception1 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception1 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception2 = 1'b0;
    end

    else if(pmp_en && non_zero_region2 && overlapping_region2)
      begin
          overlapping_region_exception2 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception2 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception3 = 1'b0;
    end

    else if( pmp_en && non_zero_region3 && overlapping_region3)
      begin
          overlapping_region_exception3 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception3 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception4 = 1'b0;
    end

    else if( pmp_en && non_zero_region4 && overlapping_region4)
      begin
          overlapping_region_exception4 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception4 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception5 = 1'b0;
    end

    else if(pmp_en && non_zero_region5 && overlapping_region5)
      begin
          overlapping_region_exception5 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception5 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception6 = 1'b0;
    end

    else if(pmp_en && non_zero_region6 && overlapping_region6)
      begin
          overlapping_region_exception6 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception6 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception7 = 1'b0;
    end

    else if(pmp_en && non_zero_region7 && overlapping_region7)
      begin
          overlapping_region_exception7 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception7 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception8 = 1'b0;
    end

    else if(pmp_en && non_zero_region8 && overlapping_region8)
      begin
          overlapping_region_exception8 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception8 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception9 = 1'b0;
    end

    else if(pmp_en && non_zero_region9 && overlapping_region9)
      begin
          overlapping_region_exception9 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception9 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception10 = 1'b0;
    end

    else if(pmp_en && non_zero_region10 && overlapping_region10)
      begin
          overlapping_region_exception10 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception10 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception11 = 1'b0;
    end

    else if(pmp_en && non_zero_region11 && overlapping_region11)
      begin
          overlapping_region_exception11 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception11 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception12 = 1'b0;
    end

    else if(pmp_en && non_zero_region12 && overlapping_region12)
      begin
          overlapping_region_exception12 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception12 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception13 = 1'b0;
    end

    else if(pmp_en && non_zero_region13 && overlapping_region13)
      begin
          overlapping_region_exception13 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception13 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception14 = 1'b0;
    end

    else if(pmp_en && non_zero_region14 && overlapping_region14)
      begin
          overlapping_region_exception14 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception14 = 1'b0;

      end
end 
always_ff @ (posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        overlapping_region_exception15 = 1'b0;
    end

    else if(pmp_en && non_zero_region15 && overlapping_region15)
      begin
          overlapping_region_exception15 = 1'b1;
      end
      
      else
      begin
          overlapping_region_exception15 = 1'b0;

      end
end 

//load and store exception logic

always_comb
begin
   
    if(pmp_en && valid_memory_access_write_address && valid_memory_access_read_address)
    begin
        load_exception = 1'b0;
        store_exception = 1'b0;
    end
    else if( pmp_en && memory_access_write_en && valid_memory_access_read_address)
    begin
        load_exception = 1'b0;
        store_exception = 1'b1;
    end
     else if( pmp_en && memory_access_read_en && valid_memory_access_write_address)
    begin
        load_exception = 1'b1;
        store_exception = 1'b0;
    end
    else
        begin
        load_exception = 1'b0;
        store_exception = 1'b0;
    end
    
end




endmodule
