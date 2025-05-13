`timescale 1ns/1ps
module jtag_instruction_register #(parameter IR_BITS = 5)(
	  input logic                    TRST          , // JTAG asynch active low Reset signal
	  input logic                    TDI           , // JTAG Test Data Input signal
	  input logic                    Reset         , // State is in TEST_LOGIC_RESET
	
	// Capture and Shift stage signals
	  input logic                    Capture_clk   , // posedge(TCK) clock signal for capture and shift operation
	  input logic                    Capture_IR    , // controls capture operation of IR: capture the instruction bits
	  input logic                    Shift_IR      , // controls shift operation of IR  : shifts the instruction bits
	
	// Update stage signals
	  input logic                    Update_clk    , // negedge(TCK) clock signal for update operation
	  input logic                    Update_IR     , // controls update operation of IR : update the instruction bits
	
	// IR   logic signals
	  output logic  [IR_BITS-1:0] instr_reg_out , // Instruction Register updates its value at Update Stage
	  output logic                   ir_shift_out  , // IR Shift Output signal latched on negedge TCK after   logic MUX
	
	// Instruction Decoder signals
	  output logic                bypass_sel    , // Selects Bypass Register
	  output logic                idcode_sel    , // Selects IDCODE Register
	  output logic                dtm_csr_sel   , // Selects DTM(Debug Transport Module) Control & Status Register
	  output logic                dmi_access_sel // Selects Debug Module Interface Access
//	  logic   logic               command_sel     // Selects Abstarct Command
	                                      );

 /*timeunit 1ns;
 timeprecision 1ps;*/

	// Parameters for instructions
	localparam IDCODE     = 5'h01; // IDCODE Instruction
	localparam BYPASS     = 5'h1F; // BYPASS Instruction
	localparam DTM_CSR    = 5'h10; // DTM Control & Status Instruction
	localparam DMI_ACCESS = 5'h11; // DMI_ACCESS Instruction
//	localparam COMMAND    = 5'h17; // COMMAND Instruction
	
	// internal shift register declaration
	  logic [IR_BITS-1:0] instr_shift_reg; // shifts the instruction bits 

	// logic for shift operation
	  always_ff @(posedge Capture_clk or negedge TRST)
		begin
			if(!TRST)           // Reset State
				instr_shift_reg <= {IR_BITS{1'b0}};
				
			else if(Reset)      // State is in TEST_LOGIC_RESET
				instr_shift_reg <= {IR_BITS{1'b0}};
				
			else if(Capture_IR) // Capture State
				instr_shift_reg <= {{(IR_BITS-1){1'b0}}, 1'b1};
				
			else if(Shift_IR)   // Shift State
				instr_shift_reg <= {TDI, instr_shift_reg[IR_BITS-1:1]};
		end
	
	assign ir_shift_out = instr_shift_reg[0];
	
	// logic for Update operation
	  always_ff @(posedge Update_clk or negedge TRST)
		begin
			if(!TRST)          // Reset Stage
				instr_reg_out <= IDCODE;
				
			else if(Reset)     // State is in TEST_LOGIC_RESET
				instr_reg_out <= IDCODE;
				
			else if(Update_IR) // Update Stage
				instr_reg_out <= instr_shift_reg;
		end
		
	// Instruction decoder logic
	// Based on 8bit instructions different registers gets selected	
	always_comb
		begin
			idcode_sel     = 1'b0;
			bypass_sel     = 1'b0;
			dtm_csr_sel    = 1'b0;
			dmi_access_sel = 1'b0;
	//		command_sel    = 1'b0;
			
			unique case(instr_reg_out)
				IDCODE     : idcode_sel     = 1'b1;
				BYPASS     : bypass_sel     = 1'b1;
				DTM_CSR    : dtm_csr_sel    = 1'b1;
				DMI_ACCESS : dmi_access_sel = 1'b1;
		//		COMMAND    : command_sel    = 1'b1;
				default    : bypass_sel     = 1'b1;
			endcase
		end

endmodule
