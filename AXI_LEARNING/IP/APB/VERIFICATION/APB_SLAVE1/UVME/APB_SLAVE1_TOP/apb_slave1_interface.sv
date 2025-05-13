`timescale 1ns/1ps

interface apb_slave1_interface(input logic pclock);
     
	 //logic presetn;
	 
	 
	 logic presetn,psel1,penable;
     logic [31:0] paddr;
     logic [31:0]pwdata;
     logic pwrite;
     logic pslverr1;
	 logic pready1;
     logic [31:0] prdata1;
 	 
endinterface:apb_slave1_interface
