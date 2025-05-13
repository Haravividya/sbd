//`timescale 1ns/1ps

 interface intf#(`ifdef STROBE_8BITS
		  parameter ADDR_WIDTH = 64,
		  parameter DATA_WIDTH = 64,
		  parameter STRB_WIDTH = 8
		  
	  `else
		  parameter ADDR_WIDTH = 32,
		  parameter DATA_WIDTH = 32,
		  parameter STRB_WIDTH = 4
		  
	  `endif)(input logic axi4_lite_clk);
       
       logic        axi4_lite_rstn;
 // WRITE ADDRESS CHANNEL //
       logic [ADDR_WIDTH-1:0] M_AW_ADDR_OUT;  
       logic                  M_AW_VALID_OUT; 
       logic  	              M_AW_READY_IN;  
			
//WRITE DATA CHANNEL//
       logic [DATA_WIDTH-1:0] M_W_DATA_OUT;  
       logic [STRB_WIDTH-1:0] M_W_STRB_OUT;   
       logic                  M_W_VALID_OUT; 
       logic 	              M_W_READY_IN;  

//WRITE RESPONSE CHANNEL//
       logic [1:0]            M_B_RESP_IN;    
       logic                  M_B_VALID_IN; 
       logic 		          M_B_READY_OUT;

//READ ADDRESS CHANNEL//
       logic [ADDR_WIDTH-1:0] M_AR_ADDR_OUT;  
       logic 		          M_AR_VALID_OUT; 
       logic     	          M_AR_READY_IN;  
							
//READ DATA CHANNEL//
       logic [DATA_WIDTH-1:0] M_R_DATA_IN;     
       logic [1:0]            M_R_RESP_IN;  
       logic 		          M_R_VALID_IN; 
       logic     	          M_R_READY_OUT;


//CONTROL SIGNALS//
       logic                  wr_en_in;   
       logic                  rd_en_in;  
       logic [1:0]            byte_en;   
       logic [ADDR_WIDTH-1:0] wr_addr_in;
       logic [ADDR_WIDTH-1:0] rd_addr_in;
       logic [DATA_WIDTH-1:0] m_data_in; 
       logic [DATA_WIDTH-1:0] m_data_out;
  
endinterface
