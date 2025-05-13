//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////Copyright © 2022 Vivartan Technologies., All rights reserved////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
//All works published under Zilla_Gen_0 by Vivartan Technologies is copyrighted by the Association and ownership// 
//of all right, title and interest in and to the works remains with Vivartan Technologies. No works or documents//
//published under Zilla_Gen_0 by Vivartan Technologies may be reproduced,transmitted or copied without the expre//
//-ss written permission of Vivartan Technologies will be considered as a violations of Copyright Act and it may//
//lead to legal action.                                                                                         //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////
* File Name : pmp_assertion.sv

* Purpose :

* Creation Date : 25-11-2022

* Last Modified : Wed 21 Dec 2022 06:48:33 PM IST

* Created By :  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
sequence rst_sequence;
((!pmpcfg0_exception)&&(!pmpcfg1_exception)&&(!pmpcfg2_exception)&&(!pmpcfg3_exception)&&(!pmpaddr0_exception)&&(!pmpaddr1_exception)&&(!pmpaddr2_exception)
&&(!pmpaddr3_exception)&&(!pmpaddr4_exception)&&(!pmpaddr5_exception)&&(!pmpaddr6_exception)&&(!pmpaddr7_exception)&&(!pmpaddr8_exception)&&(!pmpaddr8_exception)
&&(!pmpaddr10_exception)&&(!pmpaddr11_exception)&&(!pmpaddr12_exception)&&(!pmpaddr14_exception)&&(!pmpaddr15_exception)&&(!region0_range_exception)&&(!region1_range_exception)
&&(!region2_range_exception)&&(!region3_range_exception)&&(!region4_range_exception)&&(!region5_range_exception)&&(!region6_range_exception)&&(!region7_range_exception)
&&(!region8_range_exception)&&(!region9_range_exception)&&(!region10_range_exception)&&(!region11_range_exception)&&(!region12_range_exception)&&(!region13_range_exception)&&(!region14_range_exception)
&&(!region15_range_exception)&&(!overlapping_region_exception0)&&(!overlapping_region_exception1)&&(!overlapping_region_exception2)&&(!overlapping_region_exception3)
&&(!overlapping_region_exception4)&&(!overlapping_region_exception5)&&(!overlapping_region_exception6)&&(!overlapping_region_exception7)&&(!overlapping_region_exception8)
&&(!overlapping_region_exception9)&&(!overlapping_region_exception10)&&(!overlapping_region_exception11)&&(!overlapping_region_exception12)&&(!overlapping_region_exception13)
&&(!overlapping_region_exception14)&&(!overlapping_region_exception15));
endsequence


property rst;
@(posedge clk) (~csr_rst) |-> rst_sequence;
endproperty



property pmp_cfg0_execption;
@(posedge clk)  ((csr_write_addr==12'h3A0) && csr_write_en && kernel_mode_signal) |=> (pmpcfg0_exception==1) ;
endproperty



property pmp_cfg1_execption;
@(posedge clk) ((csr_write_addr==12'h3A1) && csr_write_en && kernel_mode_signal) |=> (pmpcfg1_exception==1);
endproperty


property pmp_cfg2_execption;
@(posedge clk)  ((csr_write_addr==12'h3A2) && csr_write_en && kernel_mode_signal) |=> (pmpcfg2_exception==1);
endproperty


property pmp_cfg3_execption;
@(posedge clk) ((csr_write_addr==12'h3A3) && csr_write_en && kernel_mode_signal) |=> (pmpcfg3_exception==1);
endproperty




property pmp_addr0_execption;
@(posedge clk) ((csr_write_addr==12'h3B0) && csr_write_en && kernel_mode_signal) |=> (pmpaddr0_exception==1);
endproperty


property pmp_addr1_execption;
@(posedge clk) ((csr_write_addr==12'h3B1) && csr_write_en && kernel_mode_signal) |=> (pmpaddr1_exception==1);
endproperty


property pmp_addr2_execption;
@(posedge clk) ((csr_write_addr==12'h3B2) && csr_write_en && kernel_mode_signal) |=> (pmpaddr2_exception==1);
endproperty



property pmp_addr3_execption;
@(posedge clk) ((csr_write_addr==12'h3B3) && csr_write_en && kernel_mode_signal) |=> (pmpaddr3_exception==1);
endproperty


property pmp_addr4_execption;
@(posedge clk) ((csr_write_addr==12'h3B4) && csr_write_en && kernel_mode_signal) |=> (pmpaddr4_exception==1);
endproperty




property pmp_addr5_execption;
@(posedge clk) ((csr_write_addr==12'h3B5) && csr_write_en && kernel_mode_signal) |=> (pmpaddr5_exception==1);
endproperty





property pmp_addr6_execption;
@(posedge clk) ((csr_write_addr==12'h3B6) && csr_write_en && kernel_mode_signal) |=> (pmpaddr6_exception==1);
endproperty



property pmp_addr7_execption;
@(posedge clk) ((csr_write_addr==12'h3B7) && csr_write_en && kernel_mode_signal) |=> (pmpaddr7_exception==1);
endproperty



property pmp_addr8_execption;
@(posedge clk) ((csr_write_addr==12'h3B8) && csr_write_en && kernel_mode_signal) |=> (pmpaddr8_exception==1);
endproperty


property pmp_addr9_execption;
@(posedge clk) ((csr_write_addr==12'h3B9) && csr_write_en && kernel_mode_signal) |=> (pmpaddr9_exception==1);
endproperty

property pmp_addr10_execption;
@(posedge clk) ((csr_write_addr==12'h3BA) && csr_write_en && kernel_mode_signal) |=> (pmpaddr10_exception==1);
endproperty



property pmp_addr11_execption;
@(posedge clk) ((csr_write_addr==12'h3BB)&&csr_write_en && kernel_mode_signal) |=>(pmpaddr11_exception==1);
endproperty



property pmp_addr12_execption;
@(posedge clk) ((csr_write_addr==12'h3BC)&&csr_write_en&&kernel_mode_signal) |=>(pmpaddr12_exception==1);
endproperty


property pmp_addr13_execption;
@(posedge clk) ((csr_write_addr==12'h3BD)&&csr_write_en&&kernel_mode_signal) |=>(pmpaddr13_exception==1);
endproperty




property pmp_addr14_execption;
@(posedge clk) ((csr_write_addr==12'h3BE)&&csr_write_en&&kernel_mode_signal) |=>(pmpaddr14_exception==1);
endproperty



property pmp_addr15_execption;
@(posedge clk) ((csr_write_addr==12'h3BF) && csr_write_en && kernel_mode_signal) |=> (pmpaddr15_exception==1);
endproperty


/*
property range_execption0;
@(posedge clk) (start_address0>end_address0) |=>(region0_range_exception==1);
endproperty

property range_execption1;
@(posedge clk) (start_address1>end_address1) |=>(region1_range_exception==1);
endproperty

property range_execption2;
@(posedge clk) (start_address2>end_address2) |=>(region2_range_exception==1);
endproperty

property range_execption3;
@(posedge clk) (start_address3>end_address3) |=>(region3_range_exception==1);
endproperty

property range_execption4;
@(posedge clk) (start_address4>end_address4) |=>(region4_range_exception==1);
endproperty

property range_execption5;
@(posedge clk) (start_address5>end_address5) |=>(region5_range_exception==1);
endproperty

property range_execption6;
@(posedge clk) (start_address6>end_address6) |=>(region6_range_exception==1);
endproperty

property range_execption7;
@(posedge clk) (start_address7>end_address0) |=>(region7_range_exception==1);
endproperty

property range_execption8;
@(posedge clk) (start_address8>end_address8) |=>(region8_range_exception==1);
endproperty

property range_execption9;
@(posedge clk) (start_address9>end_address9) |=>(region9_range_exception==1);
endproperty

property range_execption10;
@(posedge clk) (start_address10>end_address10) |=>(region10_range_exception==1);
endproperty

property range_execption11;
@(posedge clk) (start_address11>end_address11) |=>(region11_range_exception==1);
endproperty

property range_execption12;
@(posedge clk) (start_address12>end_address12) |=>(region12_range_exception==1);
endproperty

property range_execption13;
@(posedge clk) (start_address13>end_address13) |=>(region13_range_exception==1);
endproperty

property range_execption14;
@(posedge clk) (start_address14>end_address14) |=>(region14_range_exception==1);
endproperty

property range_execption15;
@(posedge clk) (start_address15>end_address12) |=>(region15_range_exception==1);
endproperty*/

property zeroexecption;
 @(posedge clk)(pmp_en && valid_memory_access_write_address && valid_memory_access_read_address) |-> (load_exception==0 && store_exception ==0);
endproperty

property loadexecption;
@(posedge clk or csr_rst) (pmp_en && memory_access_read_en && valid_memory_access_write_address) |-> (load_exception==1&& store_exception==0);
endproperty

property storeexecption;
@(posedge clk or csr_rst) (pmp_en && memory_access_write_en && valid_memory_access_read_address) |-> (load_exception==0 && store_exception==1);
endproperty


RESET: assert property (rst);
CFG_EXECPTION0: assert property (pmp_cfg0_execption);
CFG_EXECPTION1: assert property (pmp_cfg1_execption);
CFG_EXECPTION2: assert property (pmp_cfg2_execption);
CFG_EXECPTION3: assert property (pmp_cfg3_execption);
ADDR0_EXECPTION: assert property (pmp_addr0_execption);
ADDR1_EXECPTION: assert property (pmp_addr1_execption);
ADDR2_EXECPTION: assert property (pmp_addr2_execption);
ADDR3_EXECPTION: assert property (pmp_addr3_execption);
ADDR4_EXECPTION: assert property (pmp_addr4_execption);
ADDR5_EXECPTION: assert property (pmp_addr5_execption);
ADDR6_EXECPTION: assert property (pmp_addr6_execption);
ADDR7_EXECPTION: assert property (pmp_addr7_execption);
ADDR8_EXECPTION: assert property (pmp_addr8_execption);
ADDR9_EXECPTION: assert property (pmp_addr9_execption);
ADDR10_EXECPTION: assert property (pmp_addr10_execption);
ADDR11_EXECPTION: assert property (pmp_addr11_execption);
ADDR12_EXECPTION: assert property (pmp_addr12_execption);
ADD13_EXECPTION: assert property (pmp_addr13_execption);
ADDR14_EXECPTION: assert property (pmp_addr14_execption);
ADDR15_EXECPTION: assert property (pmp_addr15_execption);
/*RANGE_EXECPTION0: assert property (range_execption0);
RANGE_EXECPTION1: assert property (range_execption1);
RANGE_EXECPTION2: assert property (range_execption2);
RANGE_EXECPTION3: assert property (range_execption3);
RANGE_EXECPTION4: assert property (range_execption4);
RANGE_EXECPTION5: assert property (range_execption5);
RANGE_EXECPTION6: assert property (range_execption6);
RANGE_EXECPTION7: assert property (range_execption7);
RANGE_EXECPTION8: assert property (range_execption8);
RANGE_EXECPTION9: assert property (range_execption9);
RANGE_EXECPTION10: assert property (range_execption10);
RANGE_EXECPTION11: assert property (range_execption11);
RANGE_EXECPTION12: assert property (range_execption12);
RANGE_EXECPTION13: assert property (range_execption13);
RANGE_EXECPTION14: assert property (range_execption14);
RANGE_EXECPTION15: assert property (range_execption15);*/
ZERO_EXECPTION:  assert property (zeroexecption);
LOAD_EXECPTION:  assert property (loadexecption);

STORE_EXECPTION:  assert property (storeexecption);



