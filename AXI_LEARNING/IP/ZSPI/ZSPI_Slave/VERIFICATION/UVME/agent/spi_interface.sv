/*************************************************
Project:Spi_slave
Author: B Bhagavantu
File name:spi_interface.sv
Description: This module contains the interface construct 
is used to connect the design and testbench.
**************************************************/
interface spi_intf(input logic sclk);

  //INPUTS--------------------------
  logic  	    reset		;   
  logic		    mosi,rx_e,load,ss;                
  logic  [7:0]	data_in		;                
  
  //OUTPUTS-------------------------
  logic  [7:0]	data_out    	;   
  logic  	    miso,tx_done,rx_done ;
  
endinterface

