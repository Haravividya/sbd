`define STROBE_8BITS 
module axi4_lite_master 
	#(
	  `ifdef STROBE_8BITS
		  parameter ADDR_WIDTH = 64,
		  parameter DATA_WIDTH = 64,
		  parameter STRB_WIDTH = 8
		  
	  `else
		  parameter ADDR_WIDTH = 32,
		  parameter DATA_WIDTH = 32,
		  parameter STRB_WIDTH = 4
		  
	  `endif                          )(
	 
	  // system control ports
	  input logic                       axi4_lite_clk , // syatem clock signal
	  input logic                       axi4_lite_rstn, // syatem reset signal: async active low reset
			
	  // write address ports
	  output logic [ADDR_WIDTH-1:0] M_AW_ADDR_OUT , 
	  output logic                  M_AW_VALID_OUT,
	  input logic                       M_AW_READY_IN ,
			
	  // write data ports
	  output logic [DATA_WIDTH-1:0] M_W_DATA_OUT  ,
	  output logic [STRB_WIDTH-1:0] M_W_STRB_OUT  ,
	  output logic                  M_W_VALID_OUT ,
	  input logic                       M_W_READY_IN  ,
			
	  // write response ports
	  input logic      [1:0]            M_B_RESP_IN   ,
	  input logic                       M_B_VALID_IN  ,
	  output logic                  M_B_READY_OUT ,
			
	  // read address ports
	  output logic [ADDR_WIDTH-1:0] M_AR_ADDR_OUT ,
	  output logic                  M_AR_VALID_OUT,
	  input logic                       M_AR_READY_IN ,
			
	  // read data ports
	  input logic      [DATA_WIDTH-1:0] M_R_DATA_IN   ,
	  input logic      [1:0]            M_R_RESP_IN   ,
	  input logic                       M_R_VALID_IN  ,
	  output logic                  M_R_READY_OUT ,
			
	  // address, data_in and data_out
	  input logic                       wr_en_in      ,
	  input logic                       rd_en_in      ,
	  input logic      [1:0]            byte_en       ,
	  input logic      [ADDR_WIDTH-1:0] wr_addr_in    ,
	  input logic      [ADDR_WIDTH-1:0] rd_addr_in    ,
	  input logic      [DATA_WIDTH-1:0] m_data_in     ,
	  output logic [DATA_WIDTH-1:0] m_data_out   
		                                   );

 timeunit 1ns;
 timeprecision 1ps;

	// parameter declaration of states
	localparam  IDLE     =  3'd0 ; // IDLE State
	localparam  WR_ADDR  =  3'd1 ; // Master Write Address
	localparam  WR_DATA  =  3'd2 ; // Master Write Data
	localparam  WR_RESP  =  3'd3 ; // Master Write Response
	localparam  RD_ADDR  =  3'd4 ; // Master Read Address
	localparam  RD_DATA  =  3'd5 ; // Master Read Data
	
	// parameter declaration of store data
	localparam  STORE_BYTE  = 2'b00 ; // store byte of data  : 8  bit data
	localparam  HALF_WORD   = 2'b01 ; // store half word data: 16 bit data 
	localparam  FULL_WORD   = 2'b10 ; // store word data     : 32 bit data
	localparam  DOUBLE_WORD = 2'b11 ; // store double word   : 64 bit data
	
	logic  [2:0] state;
	
	`ifdef STROBE_8BITS
		// select 64 bit data & addr width, also 8 bit write stroble
		always_comb
			begin
				/* =============== Case for 8 bit STRB Signal Starts ================= */
				unique case(byte_en)
					STORE_BYTE : begin // STORE BYTE STATE
							if(wr_addr_in[2:0] == 3'b000     ) // [7:0] position byte of data will written
								M_W_STRB_OUT = 8'b0000_0001; 
										
							else if(wr_addr_in[2:0] == 3'b001) // [15:8] position byte of data will written
								M_W_STRB_OUT = 8'b0000_0010;
											
							else if(wr_addr_in[2:0] == 3'b010) // [23:16] position byte of data will written
								M_W_STRB_OUT = 8'b0000_0100;
											
							else if(wr_addr_in[2:0] == 3'b011) // [31:24] position byte of data will written
								M_W_STRB_OUT = 8'b0000_1000;
											
							else if(wr_addr_in[2:0] == 3'b100) // [39:32] position byte of data will written
								M_W_STRB_OUT = 8'b0001_0000;
											
							else if(wr_addr_in[2:0] == 3'b101) // [47:40] position byte of data will written
								M_W_STRB_OUT = 8'b0010_0000;
											
							else if(wr_addr_in[2:0] == 3'b110) // [55:48] position byte of data will written
								M_W_STRB_OUT = 8'b0100_0000;
											
							else                               // [63:56] position byte of data will written
								M_W_STRB_OUT = 8'b1000_0000;
											
			 			     end   // end STORE BYTE
									 
					HALF_WORD  : begin // HALF WORD STATE
							if(wr_addr_in[2:1] == 2'b00     ) // [15:0] position 16 bits of data will written
								M_W_STRB_OUT = 8'b00_00_00_11;
											
							else if(wr_addr_in[2:1] == 2'b01) // [31:16] position 16 bits of data will written
								M_W_STRB_OUT = 8'b00_00_11_00;
											
							else if(wr_addr_in[2:1] == 2'b10) // [47:32] position 16 bits of data will written
								M_W_STRB_OUT = 8'b00_11_00_00;
											
							else                              // [63:48] position 16 bits of data will written
								M_W_STRB_OUT = 8'b11_00_00_00;
																				
						     end   // end HALF WORD
									 
					FULL_WORD  : begin // FULL WORD STATE
							if(wr_addr_in[2] == 1'b0)      // [31:0] position 32 bits of data will written     
								M_W_STRB_OUT = 8'b0000_1111;
											
							else                           // [63:32] position 32 bits of data will written
								M_W_STRB_OUT = 8'b1111_0000;
						     end   // end FULL WORD
									 
					DOUBLE_WORD: begin // DOUBLE WORD STATE
							M_W_STRB_OUT = 8'b1111_1111; // [63:0] position 64 bits of data will written
						     end   // end DOUBLE WORD
									 
					default    :    M_W_STRB_OUT = 8'b1111_1111; // [63:0] position 64 bits of data will written
				endcase
				
				/* =============== Case for 8 bit STRB Signal ends ================= */
			end
			
		
	`else
		// select 32 bit data & addr width, also 4 bit write stroble
		always_comb
			begin
				/* =============== Case for 4 bit STRB Signal Starts ================= */
				unique case(byte_en)
					STORE_BYTE : begin // STORE BYTE STATE
							if(wr_addr_in[1:0] == 2'b11     ) // [31:24] position byte of data will written
								M_W_STRB_OUT = 4'b1000; 
											
							else if(wr_addr_in[1:0] == 2'b10) // [23:16] position byte of data will written
								M_W_STRB_OUT = 4'b0100;
											
							else if(wr_addr_in[1:0] == 2'b01) // [15:8] position byte of data will written
								M_W_STRB_OUT = 4'b0010;
											
							else                              // [7:0] position byte of data will written
								M_W_STRB_OUT = 4'b0001;
						     end   // end STORE BYTE
									 
					HALF_WORD  : begin // HALF WORD STATE
							if(wr_addr_in[1] == 1'b1) // [31:16] position 16 bits of data will written
								M_W_STRB_OUT = 4'b1100;
											
							else                      // [15:0] position 16 bits of data will written
								M_W_STRB_OUT = 4'b0011;
						     end   // end HALF WORD
									 
					FULL_WORD  : begin // FULL WORD STATE
							M_W_STRB_OUT = 4'b1111; // [31:0] position 32 bits of data will written
						     end   // end FULL WORD
									 
					default    :    M_W_STRB_OUT = 4'b1111; // [31:0] position 32 bits of data will written
				endcase
				
				/* =============== Case for 4 bit STRB Signal ends ================= */
			end
			
	`endif
	
	
	
	//===================STATE-MACHINE====================
	//=============== current state logic ================
	
	always_ff @(posedge axi4_lite_clk or negedge axi4_lite_rstn)
		begin
			if(!axi4_lite_rstn)
				begin
					state       <= IDLE              ;
					m_data_out  <= {DATA_WIDTH{1'b0}};
				end
			else
				begin
					case(state)
						IDLE    : begin // IDLE state						
								if(wr_en_in)   
								// if start_wr asserted write operation performed
								// state goes to Master WR_ADDR state
									state <= WR_ADDR;											
								else if(rd_en_in)
								// if start_rd asserted read operation performed
								// state goes to Master RD_ADDR state
									state <= RD_ADDR;												
								else 
								// else state is in IDLE state
									state <= IDLE;												
							  end   // end IDLE
										
						WR_ADDR : begin // Master WR_ADDR state						
								if(M_AW_READY_IN && M_AW_VALID_OUT) 
								// If awready & awvalid are high handshaking starts
								// pass WR_ADDR to slave memory
								// state goes to Master WR_DATA state
									state <= WR_DATA;											
								else
								// Wait in Master WR_ADDR state 
								// until handshaking starts
									state <= WR_ADDR;												
							  end   // end Master WR_ADDR
										
						WR_DATA : begin // Master WR_DATA state						
								if(M_W_READY_IN && M_W_VALID_OUT)
								// If wready & wvalid are high handshaking starts
					          	        // pass WR_DATA to slave memory
								// state goes to Master WR_RESP state
									state <= WR_RESP;												
								else
								// Wait in Master WR_DATA state 
								// until handshaking starts
									state <= WR_DATA;												
							  end   // end Master WR_DATA
										
						WR_RESP : begin // Master WR_RESP state						
								if(M_B_VALID_IN && M_B_READY_OUT)
								// If bready & bvalid are high handshaking starts
									begin
										if(M_B_RESP_IN == 2'b00)
										// if response is 'OK' state goes to IDLE state
											state <= IDLE   ;
										else
										// else state goes to Master WR_DATA state
											state <= WR_DATA;
									end												 
								else
								// Wait in Master WR_RESP state 
								// until handshaking starts
									state <= WR_RESP;												
							  end   // end Master WR_RESP
										
						RD_ADDR : begin // Master RD_ADDR state						
								if(M_AR_READY_IN && M_AR_VALID_OUT)
								// If arready & arvalid are high handshaking starts
								// pass RD_ADDR to slave memory
								// state goes to Master RD_DATA state
									state <= RD_DATA;										 
								else
								// Wait in Master RD_ADDR state 
								// until handshaking starts
									state <= RD_ADDR;												
							  end   // end Master RD_ADDR
										
						RD_DATA : begin // Master RD_DATA state						
								if(M_R_READY_OUT && M_R_VALID_IN)
								// If rready & rvalid are high handshaking starts
								// pass RD_DATA and RRESP to master 
								// state goes to IDLE state
									begin
										if(M_R_RESP_IN == 2'b00)
											begin
												m_data_out <= M_R_DATA_IN;
												state      <= IDLE       ;
											end													
									end												
								else
								// Wait in Master RD_DATA state 
								// until handshaking starts
									state <= RD_DATA;												
							  end   // end Master RD_DATA 
										
						default : begin // default state
								state <= IDLE;
							  end   // end default 
					endcase
				end
		end
		
	//==============STATE-MACHINE================
	//==============output logic ================
	
	always_ff @(negedge axi4_lite_clk or negedge axi4_lite_rstn)
		begin
			if(!axi4_lite_rstn)
				begin
					M_AW_ADDR_OUT   <= {ADDR_WIDTH{1'b0}}; // write address
					M_AW_VALID_OUT  <=  1'b0             ; // write address valid
					M_W_DATA_OUT    <= {DATA_WIDTH{1'b0}}; // write data
					M_W_VALID_OUT   <=  1'b0             ; // write data valid
					M_B_READY_OUT   <=  1'b0             ; // write response ready
					M_AR_ADDR_OUT   <= {ADDR_WIDTH{1'b0}}; // read address
					M_AR_VALID_OUT  <=  1'b0             ; // read address valid
					M_R_READY_OUT   <=  1'b0             ; // read data ready
				end
			else
				begin
					M_AW_ADDR_OUT   <= {ADDR_WIDTH{1'b0}}; // write address
					M_AW_VALID_OUT  <=  1'b0             ; // write address valid
					M_W_DATA_OUT    <= {DATA_WIDTH{1'b0}}; // write data
					M_W_VALID_OUT   <=  1'b0             ; // write data valid
					M_B_READY_OUT   <=  1'b0             ; // write response ready
					M_AR_ADDR_OUT   <= {ADDR_WIDTH{1'b0}}; // read address
					M_AR_VALID_OUT  <=  1'b0             ; // read address valid
					M_R_READY_OUT   <=  1'b0             ; // read data ready
					
					case(state)
						WR_ADDR : begin // Master WR_ADDR state
								M_AW_VALID_OUT <= 1'b1      ;
								M_AW_ADDR_OUT  <= wr_addr_in;
						          end   // end Master WR_ADDR
										
						WR_DATA : begin // Master WR_DATA state
								M_W_VALID_OUT  <= 1'b1      ;
								M_W_DATA_OUT   <= m_data_in ;
						          end   // end Master WR_DATA
										 
						WR_RESP : begin // Master WR_RESP state
								M_B_READY_OUT  <= 1'b1;
						          end   // end Master WR_RESP
										
						RD_ADDR : begin // Master RD_ADDR state
								M_AR_VALID_OUT <= 1'b1      ;
								M_AR_ADDR_OUT  <= rd_addr_in;
						          end   // end Master RD_ADDR
										
						RD_DATA : begin // Master RD_DATA state
								M_R_READY_OUT  <= 1'b1;
						          end   // end Master RD_DATA
					endcase
				end
		end

endmodule
