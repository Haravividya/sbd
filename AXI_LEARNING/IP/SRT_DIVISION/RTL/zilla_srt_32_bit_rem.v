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

module zilla_srt_32_bit_rem(
    // Inputs
    input          clk_i          ,
    input          rst_i          ,
    input          valid_i        ,
    input  [31:0] opcode_i        ,
    input  [31:0] operand_dividend,
    input  [31:0] operand_divisor ,
    output          div_busy_o      , 

    // Outputs
    output         valid_o        ,
    output [31:0] div_rem_value_o
				 );

	// signals for valid and quotient or reminder output
	reg        valid_reg   ;
	reg [31:0] div_rem_reg ;
	reg [31:0] div_result_r;

	// signals for computation
	reg [31:0] dividend_reg;
	reg [62:0] divisor_reg ;
	reg [31:0] quotient_reg;

    reg [31:0] remainder_reg;

	reg [31:0] mask_reg    ;
	reg        div_opr_sel ;
	reg        div_busy_sel;
	reg        invert_sel  ;

	// signals to select and detect divison operation
	wire signed_operation;
	wire div_rem_valid   ;
	wire div_operation   ;
	wire div_start   ;
	wire div_complete;

     reg valid_r;
   reg div_start_r; 
    always @(posedge clk_i)
    begin
        valid_r <= valid_i;
    end
  

    //assign div_busy_o = div_busy_sel;
	assign div_rem_valid = ((opcode_i & `INST_DIV_MASK ) == `INST_DIV ) || 
                           ((opcode_i & `INST_DIVU_MASK) == `INST_DIVU) ||
                           ((opcode_i & `INST_REM_MASK ) == `INST_REM ) ||
                           ((opcode_i & `INST_REMU_MASK) == `INST_REMU);

	assign signed_operation = ((opcode_i & `INST_DIV_MASK) == `INST_DIV) || 
							  ((opcode_i & `INST_REM_MASK) == `INST_REM);
							  
	assign div_operation    = ((opcode_i & `INST_DIV_MASK ) == `INST_DIV ) || 
	                          ((opcode_i & `INST_DIVU_MASK) == `INST_DIVU);

	assign div_start    = (valid_r && div_rem_valid);
	//assign div_complete = (!(|mask_reg) && div_busy_sel); // WHY THESE 3 SIGNALS ARE NOT USED. div_busy_sel,mask_reg (AS SRT DIVDER IS PERFORMING DIVISION THATS WHY WE DONT NEED THIS??) 
 
	// division operation logic
	always @(posedge clk_i or negedge rst_i)
	begin
	    if (!rst_i)
	    begin
		    div_busy_sel <= 1'b0  ;
		    dividend_reg <= 32'd0 ;
		    divisor_reg  <= 32'd0 ;
		    invert_sel   <= 1'b0  ;
		    div_opr_sel  <= 1'b0  ;
            div_start_r <= 1'b0;
	    end
	    // divison operation starts
	    else if(div_start)
	    begin
            div_start_r <= div_start;
		    div_busy_sel <= 1'b1;
		    div_opr_sel  <= div_operation;

	    	// 2's complement values for dividend if dividend is -ve // DOUBT SRT DIVIDER SIGNED AND UNSIGNED DIVISION ADE CALCULATE MAADI DIVISION MADODILVAA, NAAVE 2'S COMPLEMENT MAADI KALSBEKA DIVIDEN AND DIVSIOR NA
		    if (signed_operation && operand_dividend[31])
			    dividend_reg <= ~operand_dividend + 'd1;
		    else
			    dividend_reg <= operand_dividend;

		    // 2's complement values for divisor if divisor is -ve
		    if (signed_operation && operand_divisor[31])
			    divisor_reg <= {~operand_divisor + 'd1};
		    else
			    divisor_reg <= {operand_divisor};

		    // quotient and reminder negative select DOUBT IDU ELSE STATEMENT GE SERILLA, IDU INDEPENDENT AAGI EXECUTE AGUTHE ALVA??
		    invert_sel <= (((opcode_i & `INST_DIV_MASK) == `INST_DIV   ) && 
		               (operand_dividend[31] != operand_divisor[31]) && |operand_divisor) || 
                      (((opcode_i & `INST_REM_MASK) == `INST_REM   ) && operand_dividend[31]);

		    //quotient_reg <= 32'd0;
		    //mask_reg     <= 32'h8000_0000; 
	    end
    end



////////////////////////////////////////////////////////////////    
srt_division#(               
                                .DW( 'd32),          
                                .NO_ITR_WIDTH ('d6)
                                             )
srt_div_inst(
.clk         (clk_i         ),
.rst_n       (rst_i         ),
.div_start   (div_start_r   ),//Start Division signal
.dividend    (dividend_reg  ),
.divisor     (divisor_reg   ),
.quotient    (  ), 
.remainder   (remainder_reg), // INITIAL dividend_reg KOODA O/P GE BARUTHE ALWAA
.div_busy_o  (div_busy_o    ),
.div_done    (valid_o       ),//Division done signal
.div_error   ( ) //Error for divide by zero
);
 
///////////////////////////////////////////////////////////////////////////////////




	// divison and reminder result output logic
	always @(*)
	begin
		div_result_r = 32'd0;
		// quotient output
		if (div_opr_sel)
			if(invert_sel)
				div_result_r = ~quotient_reg + 1'b1; 
			else
				div_result_r = quotient_reg;
		// reminder output
		else
			if(invert_sel)

				//div_result_r = ~dividend_reg + 1'b1; 
				div_result_r = ~remainder_reg + 1'b1; 

			else
                
				//div_result_r = dividend_reg;
				div_result_r = remainder_reg;
            
	end

	// sending valid signal when divison is completed
	/*always @(posedge clk_i or negedge rst_i)
	begin
		if (!rst_i)
			valid_reg <= 1'b0;
		else
			valid_reg <= div_complete;
	end

	// registering quotient and reminder output 
	always @(posedge clk_i or negedge rst_i)
	begin
		if (!rst_i)
			div_rem_reg <= 32'd0;
		else if (div_complete)
			div_rem_reg <= div_result_r;
		else
			div_rem_reg <= 32'd0;
	end
*/
	//assign valid_o         = valid_reg  ; // ?? WHY WE NEED TO COMMENT THIS IS CONNECTED IN MODULE INSTANTIATION
	//assign div_rem_value_o = div_rem_reg;
    assign div_rem_value_o = div_result_r;

endmodule
