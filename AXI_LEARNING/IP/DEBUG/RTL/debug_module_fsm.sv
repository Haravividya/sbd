`define ZILLA_32_BIT
`timescale 1ns/1ps
module debug_module_fsm						
(
	input  logic 		pclock 						,
	input  logic 		presetn 					,
	
	input  logic 		dmactive 					,
	input  logic 		setresethaltreq				,
	input  logic 		clrresethaltreq				,
	input  logic		hartreset					,
	input  logic 		resumereq					,
	input  logic 		haltreq						,
	input  logic 		step			 			,
	input  logic		ebreak						,
	input  logic 		[31:0]command				,
	input  logic 		[2:0]cmderr					,
	input  logic 		transfer_reg	 			,
	input  logic		postexec					,
	input  logic       exception                   ,
    output   logic  resethaltreq                ,
	output   logic 	busy			  		    ,
	output   logic 	halted 						,
	output   logic 	h_reset						,
	output   logic 	done						,
	output   logic 	running   				   
);

	// parameter declaration for states
	localparam 	NORMAL_EXECUTION = 4'b0000	;
	localparam 	HART_RESET       = 4'b0001		;
	localparam 	HALTED           = 4'b0010			;
	localparam	START            = 4'b0011				;
	localparam	TRANSFER         = 4'b0100			;
	localparam 	PROGRAM_BUFFER   = 4'b0101	;
	localparam	DONE             = 4'b0110				;
	localparam  ERROR_WAIT       = 4'b0111		;
	//localparam  ERROR_BUSY     = 4'b1000		;
	
	// Declaration of states
	  logic			[3:0] present_state			;
	  logic 		[3:0] next_state			;
	
	// Declaration of register
	//  logic 		resethaltreq				;
	
	// Resethaltreq Logic
	always_comb
		begin
            if(!dmactive)
                begin
                    resethaltreq = 1'b0;
                end
		    else if(clrresethaltreq)
				begin
					resethaltreq = 1'b0;
				end
			else if(setresethaltreq)
				begin
					resethaltreq = 1'b1;
				end
			else 
				begin
					resethaltreq = resethaltreq;
				end
		end
		
	// FSM Present State Logic
	always_ff @(posedge pclock or negedge presetn or negedge dmactive)
		begin
			if(!presetn || !dmactive)
				begin
					present_state <= NORMAL_EXECUTION ;
				end
			else
				begin
					present_state <= next_state ;
				end
		end
	
	// FSM Next State Logic
	always_comb
		begin
			unique case(present_state)
				
				NORMAL_EXECUTION :	begin	
										if(hartreset)
											begin
												next_state = HART_RESET ;
											end
										else if(ebreak || haltreq || step)
											begin
												next_state = HALTED ;
											end
										else
											begin
												next_state = NORMAL_EXECUTION ;
											end
									end
				
				HART_RESET		 :	begin
										if((resethaltreq == 1'b1 || haltreq==1'b1) && hartreset==1'b0 )
											begin
												next_state = HALTED ;
											end
										else if(resethaltreq == 1'b0 && hartreset==1'b0)
											begin
												next_state = NORMAL_EXECUTION ;
											end
										else
											begin
												next_state = HART_RESET ;
											end
									end
									
				HALTED			 : 	begin		
										if(hartreset)
											begin
												next_state = HART_RESET ;
											end
										else if(resumereq && !haltreq)
											begin
												next_state = NORMAL_EXECUTION ;
											end
										else if(command)
											begin
												next_state = START ;
											end
										else
											begin
												next_state = HALTED ;
											end
									end
									
				START 			 : 	begin									
										if(cmderr == 3'b010 || cmderr == 3'b011)
											begin
												next_state = ERROR_WAIT ;
											end
										/*else if(cmderr == 3'b001)
											begin
												next_state = ERROR_BUSY ;
											end */
										else if(cmderr == 3'b000)
											begin
												if(transfer_reg)
													begin
														next_state = TRANSFER ;
													end
												else
													begin
                                                        `ifdef PROGRAM_BUFFER_VALID
														if(postexec)
															begin
																next_state = PROGRAM_BUFFER ;
															end
														else
															begin
																next_state = DONE ;
															end
                                                        `else
                                                          next_state = DONE;
                                                      `endif
													end
											end
										else 
											begin
												next_state = START ;
											end
									end
									
				TRANSFER		 : 	begin
                                    `ifdef PROGRAM_BUFFER_VALID
										if(postexec)
											begin
												next_state = PROGRAM_BUFFER ;
											end
										else 
											begin
												next_state = DONE ;
											end
                                        `else
                                      next_state = DONE ;
                                  `endif
									end
 				
		`ifdef PROGRAM_BUFFER_VALID
            PROGRAM_BUFFER	 : 	begin
										if(ebreak)
											begin
												next_state = DONE ;
											end
										else
											begin
												next_state = PROGRAM_BUFFER ;
											end
									end
                        `endif
				
				ERROR_WAIT		 :	begin
										if(cmderr == 3'b000)
											begin
												next_state = HALTED ;
											end
										else 
											begin
												next_state = ERROR_WAIT ;
											end
									end
				
			
				DONE			 : 	begin
										if(cmderr == 3'b000 && !exception)
											begin
												next_state = HALTED ;
											end
										else 
											begin
												next_state = ERROR_WAIT ;
											end
									end
				
				default 		 : 	begin
										next_state = NORMAL_EXECUTION ;
									end
									
			endcase
		end

	// FSM Output Logic
	always_comb
		begin
			if(present_state == START || present_state == TRANSFER /*|| present_state == ERROR_BUSY*/ )
				begin
					busy = 1'b1 ;
				end
			else
				begin
					busy = 1'b0 ;
				end
			if(present_state == HALTED)
				begin
					halted = 1'b1;
				end
			else if(present_state == NORMAL_EXECUTION || present_state == HART_RESET)
				begin
					halted = 1'b0;
				end
			else 
				begin
					halted = halted ;
				end
			if(present_state == NORMAL_EXECUTION)
				begin
					running =1'b1;
				end
			else 
				begin
					running =1'b0;
				end
			if(present_state == HART_RESET)
				begin
					h_reset = 1'b1;
				end
			else
				begin
					h_reset = 1'b0;
				end
			if(present_state == DONE || present_state == ERROR_WAIT)
				begin
					done = 1'b1;
				end
			else
				begin
					done =1'b0;
				end
		end
		
endmodule
	
