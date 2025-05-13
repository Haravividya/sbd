/***********************************************************

File name   : apb_protocol_interface.svh
Description : RAMP G interface - to encapsulate signals into a block , all related signals are grouped together to form an
	      interface block, and the same interface -can be re-used for other modules. It becomes easier to connect with DUT 
	      and other verification components. 

***********************************************************/

`timescale 1ns/1ps

interface apb_protocol_interface(input logic pclock);
	
	logic presetn;
	
	logic transfer; 
	logic read_write; 
	logic [31:0] apb_write_paddr; 
	logic [31:0] apb_write_data; 
	logic [31:0] apb_read_paddr; 
					
	//Outputs of APB Top
	logic [31:0] apb_read_data_out;
	
 
endinterface : apb_protocol_interface


//logic : 0,1,X,Z . Also - can be used both in procedural blocks and assignment statements.

  

