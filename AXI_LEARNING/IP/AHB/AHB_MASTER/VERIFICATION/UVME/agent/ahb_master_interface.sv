/*************************************************************************************
Project name: ahb_master 
Description: This will make the connection between DUT and top_tb and all components of top_tb)
File name:ahb_master_interface.sv
*************************************************************************************/

`timescale 1ns/1ps

// Interface declaration
interface ahb_master_interface_tb (input logic hclk);

// global signals

    logic hrst_n;

// signals from slave to master
   
    logic  [31 : 0]   addr ;
    logic  [31 : 0]  wdata ;
    logic  [31 : 0] hrdata ;
    logic           iwrite ;
    logic           hready ;
    logic            hresp ;
    logic  [2  : 0] iburst ;
    logic  [2  : 0] isize  ;
    logic  [1  : 0] itrans ;
    logic           busreq ;
    logic           hgrant ;
   

// signals to slave from master
    
    logic [31 : 0] rdata  ;
    logic [31 : 0] haddr  ;
    logic [31 : 0] hwdata ;
    logic [2  : 0] hburst ; 
    logic [2  : 0] hsize  ;
    logic [1  : 0] htrans ;
    logic          hwrite ;
    logic         hbusreq ;

    
endinterface

