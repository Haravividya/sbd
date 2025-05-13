`timescale 1ns/1ps
interface apb_slave2_interface#(
		`ifdef ADDR_WIDTH_64
		    parameter ADDR_WIDTH = 64,
			parameter DATA_WIDTH = 64
		  
	    `else
			parameter ADDR_WIDTH = 32,
			parameter DATA_WIDTH = 32
		  
		`endif
			)(input logic pclock);
       

	 
	    //System control ports
		logic presetn;
					
		//logic signals comming from Master
		logic psel2;
		logic penable;
		logic pwrite;
		logic [ADDR_WIDTH-1:0] paddr; 
		logic [DATA_WIDTH-1:0] pwdata;
					
		//slave2 output signals
		logic [DATA_WIDTH-1:0] prdata2; 
		logic pready2;
		logic pslverr2;
 	 
endinterface:apb_slave2_interface
