//APB Matser which controls the data transfer to the Slave
// Project: APB Master
// Company: FrenusTech Pvt Ltd
// Domain : RTL Design
// Author : Vinay chowdary

`define ADDR_WIDTH_32
module APB_Master	
					#(
					`ifdef ADDR_WIDTH_64
						parameter ADDR_WIDTH = 64,
						parameter DATA_WIDTH = 64
		  
					`else
						parameter ADDR_WIDTH = 32,
						parameter DATA_WIDTH = 32
		  
					`endif
					)
					(
					//system control ports
					input pclock,   
					input presetn,
					
					//Signals comming from top
					input transfer,
					input read_write,
					input [ADDR_WIDTH-1:0] apb_write_paddr,
					input [DATA_WIDTH-1:0] apb_write_data,
					input [ADDR_WIDTH-1:0] apb_read_paddr,
					
					//Signals comming from the APB Slave
					input [DATA_WIDTH-1:0] prdata,
					input pready,
					input pslverr,
					
					//outputs of APB Master
					output psel1,
					output psel2,
					output reg penable,
					output reg pwrite,
					output reg [ADDR_WIDTH-1:0] paddr,
					output reg [DATA_WIDTH-1:0] pwdata,
					output reg [DATA_WIDTH-1:0] apb_read_data_out);

					//DECLARATION OF STATES
					reg [2:0] present_state;
					reg [2:0] next_state;

					// PARAMETERS DECLARATION FOR OPERATING STATES IN APB
					localparam IDLE = 3'b001;
					localparam SETUP = 3'b010;
					localparam ACCESS = 3'b100 ;

		//FSM OPERATING STATES LOGIC
		always @(posedge pclock or negedge presetn)
			begin
				if(~presetn)
					begin 
						present_state <= IDLE;
						pwrite = 0;
						penable = 0;
						paddr = 0;
						pwdata = 0;
						apb_read_data_out = 0;
					end
				else
					present_state<= next_state; 
			end
	
		always @(present_state,transfer,pready)
			begin
				if(~presetn)
					next_state = IDLE;
				else
					begin
						pwrite = ~read_write;
							case(present_state)
									
							//IDEAL STATE LOGIC
							IDLE:	
									begin 
										penable =0;
										if(!transfer)
											next_state = IDLE ;
										else
											next_state = SETUP;
									end

							//SETUP STATE LOGIC
							SETUP:  
									begin
										penable=0;
										if(read_write) 
											begin   
												paddr = apb_read_paddr;
											end
										else 
											begin   			       
												paddr = apb_write_paddr;
												pwdata = apb_write_data;
											end
										next_state = ACCESS;
													
									end

							//ACCESS STATE LOGIC
							ACCESS:	
									begin
										if(psel1 || psel2)
											begin
												penable=1;
													if(transfer)
														begin
															if(pready)
																begin
																	if(~read_write)
																		begin			          
																			next_state = SETUP;
																		end
																	else 
																		begin
																			next_state = SETUP; 			          	   
																			apb_read_data_out = prdata; 
																		end
																end
															else
																next_state = ACCESS;
														end
													else if(~transfer && pready)
														begin
															next_state = IDLE;
														end
													else
														begin
															next_state = IDLE;
														end
											end
									end
												
						//Default Case			
						default: next_state = IDLE; 
									
						endcase
				end
		end

//PSEL LOGIC FOR SELECTING SLAVE
				
assign {psel1,psel2} = ((present_state != IDLE) ? (paddr[ADDR_WIDTH-1] ? {1'b0,1'b1} : {1'b1,1'b0}) : {1'b0,1'b0});

endmodule
