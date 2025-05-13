/*************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_interface.sv
Description: This module contains the interface construct 
is used to connect the design and testbench.
**************************************************/
interface spi_intf(input logic clk,mclk);

  //INPUTS--------------------------
  logic  	    reset		;   
  logic		    miso,rx_e,tx_ready	;                
  logic  [7:0]	data_in		;                
  
  //OUTPUTS-------------------------
  logic  [7:0]	data_out    	;   
  logic  	    sclk,ss,tx_done,rx_done,mosi ;
  
endinterface

