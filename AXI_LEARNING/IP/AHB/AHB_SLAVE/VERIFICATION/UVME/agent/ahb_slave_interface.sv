/*************************************************************************************
Project name: ahb_slave 
Description: This will make the connection between DUT and top_tb and all components of top_tb)
File name:ahb_slave_interface.sv
*************************************************************************************/

`timescale 1ns/1ps

//Interface declaration
interface ahb_slave_interface_tb (input logic hclk);
  
  //global signals
  logic hreset_n;

  //signals from master to slave       
  logic  [31 : 0]  haddr ;
  logic  [31 : 0] hwdata ;
  logic           hwrite ;
  logic           hready ;
  logic             hsel ;
  logic  [2  : 0] hburst ;
  
  //signals to slave to master
  logic [31 : 0] hrdata    ;
  logic          hresp     ;
  logic          hreadyout ;
        
endinterface

