/*************************************************
Project:Spi_slave
Author: B Bhagavantu
File name:spi_seq_item.sv
Description: This module contains Inputs to be randomized 
and constraints if any.
**************************************************/

//spi_seq_item is derived from uvm_sequence_item base class
class spi_seq_item extends uvm_sequence_item;

   //INPUTS--------------------------
  rand	logic  		  reset		    ;                 
  rand	logic  [7:0]  data_in   	;                
  rand	logic  mosi,rx_e,load,ss	;
 
  //OUTPUTS--------------------------
  	    logic  [7:0]  data_out    	;   
        logic  	      miso,tx_done,rx_done ;
  	    
  //factory registration
  `uvm_object_utils_begin(spi_seq_item)
  
    `uvm_field_int(reset ,UVM_ALL_ON)
    `uvm_field_int(mosi ,UVM_ALL_ON)
    `uvm_field_int(data_in  ,UVM_ALL_ON)
    `uvm_field_int(rx_e  ,UVM_ALL_ON)
    `uvm_field_int(load,UVM_ALL_ON)
    `uvm_field_int(ss ,UVM_ALL_ON)
    `uvm_field_int(data_out ,UVM_ALL_ON)
    `uvm_field_int(miso ,UVM_ALL_ON)
    `uvm_field_int(tx_done ,UVM_ALL_ON)
    `uvm_field_int(rx_done ,UVM_ALL_ON)
       
  `uvm_object_utils_end
 


endclass

