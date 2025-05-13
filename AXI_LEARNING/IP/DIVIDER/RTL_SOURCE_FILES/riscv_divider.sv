
// div
`define INST_DIV 32'h2004033
`define INST_DIV_MASK 32'hfe00707f

// divu
`define INST_DIVU 32'h2005033
`define INST_DIVU_MASK 32'hfe00707f

// rem
`define INST_REM 32'h2006033
`define INST_REM_MASK 32'hfe00707f

// remu
`define INST_REMU 32'h2007033
`define INST_REMU_MASK 32'hfe00707f 

`timescale 1ns/1ps

module riscv_divider(
                        input logic          clk_i          ,
                        input logic          rst_i          ,
                        input logic          valid_i        ,
                        input logic  [31:0] opcode_i        ,
                        input logic  [63:0] operand_dividend,
                        input logic  [63:0] operand_divisor ,

                        output logic         valid_o        ,
                        output logic [63:0] div_rem_value_o
					);
/*
    timeunit 1ns;
    timeprecision 1ps;*/

	// signals for valid and quotient or reminder output logic
	logic        valid_reg   ;
	logic [63:0] div_rem_reg ;
	logic [63:0] div_result_r;

	// signals for computation
	logic [63:0] dividend_reg;
	logic [126:0] divisor_reg;
	logic [63:0] quotient_reg;
	logic [63:0] mask_reg    ;
	logic        div_opr_sel ;
	logic        div_busy_sel;
	logic        invert_sel  ;

	// signals to select and detect divison operation
	logic signed_operation;
	logic div_rem_valid   ;
	logic div_operation   ;
	logic div_start   ;
	logic div_complete;

	assign div_rem_valid = ((opcode_i & `INST_DIV_MASK ) == `INST_DIV ) || 
                           ((opcode_i & `INST_DIVU_MASK) == `INST_DIVU) ||
                           ((opcode_i & `INST_REM_MASK ) == `INST_REM ) ||
                           ((opcode_i & `INST_REMU_MASK) == `INST_REMU);

	assign signed_operation = ((opcode_i & `INST_DIV_MASK) == `INST_DIV) || 
							  ((opcode_i & `INST_REM_MASK) == `INST_REM);
							  
	assign div_operation    = ((opcode_i & `INST_DIV_MASK ) == `INST_DIV ) || 
	                          ((opcode_i & `INST_DIVU_MASK) == `INST_DIVU);

	assign div_start    = (valid_i && div_rem_valid);
	assign div_complete = (!(|mask_reg) && div_busy_sel);

	// division operation logic
	always_ff @(posedge clk_i or negedge rst_i)
	begin
	if (!rst_i)
	begin
		div_busy_sel <= 1'b0  ;
		dividend_reg <= 64'd0 ;
		divisor_reg  <= 127'd0;
		invert_sel   <= 1'b0  ;
		quotient_reg <= 64'd0 ;
		mask_reg     <= 64'd0 ;
		div_opr_sel  <= 1'b0  ;
	end
	// divison operation starts
	else if(div_start)
	begin
		div_busy_sel <= 1'b1;
		div_opr_sel  <= div_operation;

		// 2's complement values for dividend if dividend is -ve
		if (signed_operation && operand_dividend[63])
			dividend_reg <= ~operand_dividend + 1'b1;
		else
			dividend_reg <= operand_dividend;

		// 2's complement values for divisor if divisor is -ve
		if (signed_operation && operand_divisor[63])
			divisor_reg <= {~operand_divisor + 1'b1, 63'd0};
		else
			divisor_reg <= {operand_divisor, 63'd0};

		// quotient and reminder negative select
		invert_sel <= (((opcode_i & `INST_DIV_MASK) == `INST_DIV   ) && 
		               (operand_dividend[63] != operand_divisor[63]) && |operand_divisor) || 
                      (((opcode_i & `INST_REM_MASK) == `INST_REM   ) && operand_dividend[63]);

		quotient_reg <= 64'd0;
		mask_reg     <= 64'h8000_0000_0000_0000; 
	end
	// divison completes
	else if(div_complete)
	begin
		div_busy_sel <= 1'b0;
	end
	// divison operation continuing
	else if(div_busy_sel)
	begin
		if(divisor_reg <= {63'd0, dividend_reg})
		begin
			dividend_reg <= dividend_reg - divisor_reg[63:0];
			quotient_reg <= quotient_reg | mask_reg;
		end

		divisor_reg <= {1'b0, divisor_reg[126:1]};
		mask_reg    <= {1'b0, mask_reg[63:1]};
	end
	end

	// divison and reminder result output logic logic
	always_comb
	begin
		div_result_r = 64'd0;
		// quotient output logic
		if (div_opr_sel)
			if(invert_sel)
				div_result_r = ~quotient_reg + 1'b1; 
			else
				div_result_r = quotient_reg;
		// reminder output logic
		else
			if(invert_sel)
				div_result_r = ~dividend_reg + 1'b1; 
			else
				div_result_r = dividend_reg;
	end

	// sending valid signal when divison is completed
	always_ff @(posedge clk_i or negedge rst_i)
	begin
		if (!rst_i)
			valid_reg <= 1'b0;
		else
			valid_reg <= div_complete;
	end

	// registering quotient and reminder output logic 
	always_ff @(posedge clk_i or negedge rst_i)
	begin
		if (!rst_i)
			div_rem_reg <= 64'd0;
		else if (div_complete)
			div_rem_reg <= div_result_r;
		else
			div_rem_reg <= 64'd0;
	end

	assign valid_o         = valid_reg  ;
	assign div_rem_value_o = div_rem_reg;

endmodule


