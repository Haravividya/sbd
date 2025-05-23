module apb_master
													   #(
		parameter 	ADDR_WIDTH = 32						, // 32 bit address bit
		parameter 	DATA_WIDTH = 32						  // 32 bit data bit
														)
														(
		//system control ports
		
		input logic 		pclock								, // APB clock source  
		input logic 		presetn								, // Active low reset signal
					
		//Signals comming from JTAG
		
		input logic 		transfer							, // Indicates start of transaction coming from APB_Master_Slave_Top
		input logic 		read								, // Indicates read operation coming from APB_Master_Slave_Top
		input logic 		write								, // Indicates write operation coming from APB_Master_Slave_Top
		input logic 		[ADDR_WIDTH-1:0] apb_paddr			, // Address signal coming from APB_Master_Slave_Top
		input logic 		[DATA_WIDTH-1:0] apb_write_data		, // Write data coming from APB_Master_Slave_Top
					
		//Signals comming from the APB Slave
		
		input logic 		[DATA_WIDTH-1:0] prdata				, // Read data coming from Slave
		input logic 		pready								, // Ready signal which represents Slave is ready to write or read
		input logic 		pslverr								, // Pslverr signal indicates failure of transfer

		//outputs of APB Master
		
		output logic 		psel								, // Signal to select APB Slave 
		output logic 		pwrite								, // Indicates write or read operation to be performed to Slave
		output logic 	    penable								, // Enable signal indicates its ACCESS state
		output logic  	[ADDR_WIDTH-1:0] paddr				, // Address signal going to Slave
		output logic  	[DATA_WIDTH-1:0] pwdata				, // Write data going to APB Slave
		output logic  	[DATA_WIDTH-1:0] apb_read_data_out	, // Data read from Slave in read operation  
		output logic  	apb_read_data_valid					 // Data valid signal
        //output logic [1:0]                 state
													   );

						   
		//DECLARATION OF STATES
		
		reg [1:0] present_state							; // Present state Indication
		reg [1:0] next_state							; // Next state Indication

        //assign state = present_state;

		// LCOAL PARAMETERS DECLARATION FOR OPERATING STATES IN APB
		
		localparam IDLE = 2'b00						; // IDLE state declaration
		localparam SETUP = 2'b01						; // SETUP state declaration
		localparam ACCESS = 2'b10						; // ACCESS state declaration
					

		//FSM PRESENT STATE LOGIC

		always_ff @(posedge pclock or negedge presetn)
			begin
				if(~presetn)						    	// Under reset FSM moves to IDLE
					begin
						present_state <= IDLE;
					end
				else										// else moves to next state
					begin
						present_state <= next_state;
					end
			end

		//FSM NEXT STATE LOGIC 	
		
		always_comb
			begin
				unique case(present_state)
				
					IDLE: 	begin
								if(transfer)					// If transfer moves to SETUP state
									begin
										next_state = SETUP;
									end
								else    					    // else stays in the IDLE state
									begin
										next_state = IDLE;
									end
							end
						
					SETUP: 	begin
								next_state = ACCESS;			// Directly goes to ACCESS state on No condition
							end

					ACCESS:	begin						
								if(pready)
									begin
										if(transfer)         	// If pready and transfer are high FSM moves to SETUP for Continous Transactions
											begin
												next_state = SETUP;
											end
										else 					// If pready high and No transfer FSM moves to IDLE
											begin
												next_state = IDLE;
											end
									end
								else   							// If pready is low FSM stays in the ACCESS state
									begin
										next_state = ACCESS;
									end
							end
								
					default : next_state = IDLE; 				// Default state is IDLE state
				endcase
			end

		//FSM OUTPUT LOGIC
		
		always_comb
			begin
				unique case(present_state)
				
					IDLE: 	begin             
								penable             = 1'b0;
								paddr               ={ADDR_WIDTH{1'b0}};
								pwdata              ={DATA_WIDTH{1'b0}};
								apb_read_data_out   ={DATA_WIDTH{1'b0}};
								apb_read_data_valid =1'b0;
							end
							
					SETUP: 	begin
								penable             = 1'b0;
								apb_read_data_out   = {DATA_WIDTH{1'b0}};
								apb_read_data_valid = 1'b0;
								if(write)
									begin
										paddr = apb_paddr;
										pwdata = apb_write_data;
									end
								else if(read)
									begin
										paddr   = apb_paddr;
										pwdata  = {DATA_WIDTH{1'b0}};
									end
								else
									begin
										paddr   = {ADDR_WIDTH{1'b0}};
										pwdata  = {DATA_WIDTH{1'b0}};
									end	
							end
							
					ACCESS: begin
								        penable = 1'b1;
	                                    paddr   = apb_paddr;
										pwdata  = apb_write_data;
                                
								if(read && !write)
									begin
										if(pready)
											begin
												apb_read_data_out   = prdata;
												apb_read_data_valid = 1'b1;
											end
										else
											begin
												apb_read_data_out   =   {DATA_WIDTH{1'b0}};
												apb_read_data_valid =   1'b0;
											end
									end
								else
									begin
										apb_read_data_out   = {DATA_WIDTH{1'b0}};
										apb_read_data_valid = 1'b0;
									end
							end
                            default: 
                            begin
                                penable             =   1'b0;
								paddr               =   {ADDR_WIDTH{1'b0}};
								pwdata              =   {DATA_WIDTH{1'b0}};
								apb_read_data_out   =   {DATA_WIDTH{1'b0}};
								apb_read_data_valid =   1'b0;

                            end
				endcase
			end

		
		// Pselx Logic
		assign psel = ((present_state == SETUP) || (present_state == ACCESS)) ? 1'b1 : 1'b0;

		// Pwrite Logic	
		assign pwrite = ((present_state == SETUP) || (present_state == ACCESS)) ? (write ? 1'b1 : 1'b0) : 1'b0;

endmodule
