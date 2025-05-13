`timescale 1ns/1ps
module jtag_data_register 
  #(parameter           DWIDTH  = 32        , // DATA WIDTH for DMI Register
                        AWIDTH  = 32        , // ADDRESS WIDTH for DMI Register
	
	parameter [3:0]     VERSION = 4'h0      , // IDCODE Register VERSION
	parameter [15:0]	PART_NO = 16'h0     , // IDCODE Register PART Number
	parameter [10:0]	MANF_ID = 11'h0       // IDCODE Register Manufacture ID
									       )(
	 input logic               TRST                , // active low asynchronous reset
	 input logic               Reset               , // state is in TEST_LOGIC_RESET State
	 input logic               TDI                 , // Test Data Input
	
	 input logic               Capture_clk         , // shifts the TDI to TDO at posedge TCK clock
	 input logic               Capture_DR          , // Capture the data
	 input logic               Shift_DR            , // controls the Shift Operation of Bypass Register
	
	 input logic               Update_clk          , // Updates the USER DATA at negedge of TCK
	 input logic               Update_DR           , // Updates the USER DATA
	
	 input logic               bypass_sel          , // Selects the Bypass Register
	 output logic              bypass_shift_out    , // Bypass Register Output
	
	 input logic               idcode_sel          , // Selects the IDCODE Register
	 output logic              idcode_shift_out    , // IDCODE Register Output
	
	 input logic               dtm_csr_sel         , // Selects DTM Control & Status Register
	 output logic              dtm_csr_shift_out   , // DTM_CSR Register Output
	
	 input logic               dmi_access_sel      , // Selects DMI Access Register
	 output logic              dmi_access_shift_out, // DMI Access Register Output
	
	 input logic  [DWIDTH-1:0] dmi_data_in         , // Data Read from APB Master
	 output logic [DWIDTH-1:0] dmi_data_out        , // DMI Register Data Out
	 output logic [AWIDTH-1:0] dmi_address_out     , // DMI Register Address Out
	 output logic [1:0]        dmi_op_out          , // DMI operation Output: 0=NOP, 1=READ, 2=WRITE, 3=RESERVED
	 output logic             dmi_transfer         // transfer signal operates APB Master FSM
	
//	 input logic               command_sel         , // Selects Abstract Command
//	 output logic              command_shift_out   , // Command Shift Output
//	 output logic [7:0]        cmd_type            , // this type determines the overall functionality of abstract command
//	 output logic [23:0]       control_out           // this field described for each abstract command	
	                                       );



	localparam [1:0] DMINoError = 2'b00;
	localparam [1:0] Reserved   = 2'b01;
	localparam [1:0] OpFailed   = 2'b10;
	localparam [1:0] DMIBusy    = 2'b11;
								 
	// Local Parameter declaration for different registers
	  logic [31:0] jtag_idcode;
	  logic [31:0] jtag_dtmcsr;
//	  logic [31:0] jtag_command;
	  logic [40:0] jtag_dmiaccess;
	
	// DTM CSR
	  logic 	  dtm_csr_dmi_hard_reset;
	  logic 	  dtm_csr_dmi_reset;
	  logic [2:0] dtm_csr_idle;
	  logic [1:0] dtm_csr_dmi_stat;
	  logic [5:0] dtm_csr_abits;
	  logic [3:0] dtm_csr_version;
	
	// DMI ACCESS
	  logic [6:0]  dmi_address_o;
	  logic  [6:0]  dmi_address;
	  logic  [31:0] dmi_data;
	  logic  [1:0]  dmi_op;
	  logic  [1:0]  op_field;
	
	// internal register declaration for data registers
	  logic        bypass_reg_out    ; // internal register for Bypass Register
	  logic [31:0] idcode_reg_out    ; // internal register for IDCODE Register
	
	  logic [31:0] dtm_csr_reg_out   ; // internal register for DTM_CSR
	//  logic [31:0] dtm_csr_rdata     ; // DTM_CSR Register Output
	  logic        dmi_hard_reset    ; // DTMCS Register 17th pin
	  logic        dmi_reset         ; // DTMCS Register 16th pin
	
	  logic [40:0] dmi_access_reg_out; // internal register for DMI Access
	  logic [40:0] dmi_access_rdata  ; // DMI Access Register Output	
	
//	  logic [31:0] abs_cmd_reg_out   ; // Internal Register for Abstract Command
//	  logic [31:0] abs_cmd_rdata     ; // Abstract Command Output
	
	assign jtag_idcode = {VERSION, // IDCODE Register VERSION
	                      PART_NO, // IDCODE Register PART Number
						  MANF_ID, // IDCODE Register Manufacture ID
						  1'b1     // IDCODE Standard
							    };
										   
	assign jtag_dtmcsr = {14'd0                 , // zero_31_to_18
	                      dtm_csr_dmi_hard_reset, // dmi_hard_reset
						  dtm_csr_dmi_reset     , // dmi_reset
						  1'b0                  , // zero_15
						  dtm_csr_idle          , // DTMCS IDLE
						  //dtm_csr_dmi_stat      , // dmi_stat
                          2'd0,
						  dtm_csr_abits         , // abits
						  dtm_csr_version         // version
							                   };
	
	assign jtag_dmiaccess = {dmi_address, // Address
							 dmi_data   , // Data
							 2'd0         // Op 
									   };
												  
//	assign jtag_command = {8'd0 , // cmd_type
//						   24'd0  // control 
//							   };
	
	// DATA Registers	
	// Captures & Shifts the DR 
	  always_ff @(posedge Capture_clk or negedge TRST)
		begin
			if(!TRST)
				begin
					bypass_reg_out     <= 1'b0 ;
					dmi_access_reg_out <= 41'd0;
					idcode_reg_out     <= 32'd0;
					dtm_csr_reg_out    <= 32'd0;
				//	abs_cmd_reg_out    <= 32'd0;
				end	
				
			else if(Reset)
				begin
					bypass_reg_out     <= 1'b0 ;
					dmi_access_reg_out <= 41'd0;
					idcode_reg_out     <= 32'd0;
					dtm_csr_reg_out    <= 32'd0;
				//	abs_cmd_reg_out    <= 32'd0;
				end	
							
			else if(Capture_DR) // Captures the DATA
				begin
					if(bypass_sel)     // Bypass Register Captures the DATA
						begin
							bypass_reg_out <= 1'b0;
						end					
					if(idcode_sel)     // IDCODE Register Captures the DATA
						begin
							idcode_reg_out <= jtag_idcode;
						end					
					if(dtm_csr_sel)    // DTM_CSR Captures the DATA
						begin
							dtm_csr_reg_out <= jtag_dtmcsr;
						end						
					if(dmi_access_sel) // DMI Access Register Captures the DATA
						begin
							dmi_access_reg_out <= jtag_dmiaccess;
						end
			//		if(command_sel)    // Abstract Command Captures the DATA
			//			begin
			//				abs_cmd_reg_out <= jtag_command;
			//			end
				end
				
			else if(Shift_DR) // Shifts the DATA
				begin
					if(bypass_sel)     // Bypass Register Shifts the DATA
						begin
							bypass_reg_out     <= TDI;
						end
					if(idcode_sel)     // IDCODE Register Shifts the DATA
						begin
							idcode_reg_out     <= {TDI, idcode_reg_out[31:1]} ;
						end
					if(dtm_csr_sel)    // DTM_CSR Shifts the DATA
						begin
							dtm_csr_reg_out    <= {TDI, dtm_csr_reg_out[31:1]};
						end	
					if(dmi_access_sel) // DMI Access Register Shifts the DATA
						begin
							dmi_access_reg_out <= {TDI, dmi_access_reg_out[40:1]};
						end
				//	if(command_sel)    // Abstract Command Shifts the DATA
				//		begin
				//			abs_cmd_reg_out    <= {TDI, abs_cmd_reg_out[31:1]};
				//		end
				end
		end
	
    assign bypass_shift_out     = bypass_reg_out       ; // Bypass Shift Out bit
	assign idcode_shift_out     = idcode_reg_out[0]    ; // IDCODE Shift Out bit
	assign dtm_csr_shift_out    = dtm_csr_reg_out[0]   ; // DTM CSR Shift Out bit
	assign dmi_access_shift_out = dmi_access_reg_out[0]; // DMI Access Shift Out bit
//	assign command_shift_out    = abs_cmd_reg_out[0]   ;
	
	// Updates the DTM CSR, DMI Access, & Abstract Commands DATA
	  always_ff @(posedge Update_clk or negedge TRST)
		begin
			if(!TRST)
				begin
					dmi_access_rdata <= 41'd0;
				//	abs_cmd_rdata    <= 32'd0;
				end				
			else if(Update_DR)
				begin
					if(dmi_access_sel)
						begin
							dmi_access_rdata <= dmi_access_reg_out;
						end						
				//	if(command_sel)
				//		begin
				//			abs_cmd_rdata <= abs_cmd_reg_out;
				//		end
				end
		end

      always_ff @(posedge Update_clk)
    begin
        if(Update_DR && dtm_csr_sel) begin
            dmi_hard_reset <= dtm_csr_reg_out[17];
	        dmi_reset      <= dtm_csr_reg_out[16];
        end else begin
            dmi_hard_reset <= 1'b0;
        end
    end
	
	assign dmi_address_o   = dmi_access_rdata[40:34];
	assign dmi_address_out = {25'd0, dmi_address_o}; 
	assign dmi_data_out    = dmi_access_rdata[33:2];           
	assign dmi_op_out      = dmi_access_rdata[1:0] ;
	
//	assign cmd_type        = abs_cmd_rdata[31:24];
//	assign control_out     = abs_cmd_rdata[23:0] ;
	
	// logic for dmi transfer
	  always_ff @(posedge Update_clk)
		begin
			if(Update_DR && dmi_access_sel && !dmi_hard_reset)
				dmi_transfer <= 1'b1;
			else
				dmi_transfer <= 1'b0;
		end
	
	// DMI OP Field
	
	  always_ff @(posedge Capture_clk or negedge TRST)
	begin
	if(!TRST)
		begin
			// DTM_CSR
			dtm_csr_idle 	 <= 3'd0;
			dtm_csr_dmi_stat <= 2'd0;
			dtm_csr_abits	 <= 6'd7;
			dtm_csr_version  <= 4'd1;
			
			// DMI ACCESS
			dmi_address <= 7'd0;
			dmi_data    <= 32'd0;
			dmi_op      <= 2'd0;
		end
	else 
		begin
		if(dmi_hard_reset)
			begin
				// DTM CSR
				dtm_csr_idle 	  <= 3'd0;
				dtm_csr_dmi_stat  <= 2'd0;
				dtm_csr_abits	  <= 6'd7;
				dtm_csr_version   <= 4'd1;
			  	
				// DMI ACCESS
				dmi_address <= 7'd0;
				dmi_data    <= 32'd0;
				dmi_op      <= 2'd0;
			end
		else
			begin
				// DTM CSR
                dtm_csr_dmi_stat  <= op_field;
				
				// DMI ACCESS
				dmi_data    <= dmi_data_in;
				dmi_op      <= op_field;
			end
		end
	end

      always_ff @(posedge Capture_clk)
    begin
        if(dmi_hard_reset)
        begin
            dtm_csr_dmi_hard_reset <= 1'b0;
            dtm_csr_dmi_reset      <= 1'b0;
        end
    end
		
endmodule

