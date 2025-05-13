`timescale 1ns/1ps
module zilla_srt_top
#(
parameter DATA_WIDTH = 0,
parameter INSTRUCTION_WIDTH = 0
)
(
input                   clk_i           ,
input                   rst_i           ,
input                   en              ,
input [DATA_WIDTH-1:0]  dividend        ,
input [DATA_WIDTH-1:0]  divisor         ,
input [31:0]            opcode_i  ,
output [DATA_WIDTH-1:0] quotient        ,
output                  quotient_valid ,
output                  div_busy_o

);
reg [DATA_WIDTH-1:0] dividend_r;
reg [DATA_WIDTH-1:0] divisor_r;
reg en_r;
wire en_r1;

always@(posedge clk_i or negedge rst_i)
begin
    if(!rst_i)
    begin
        en_r <= 1'b0;
    end
    else
    begin
        en_r <= en;
    end
end


assign en_r1 = (en && (!en_r));

always@(posedge clk_i or negedge rst_i)
begin
    if(!rst_i)
    begin
        dividend_r <= 0;
        divisor_r <= 0;
    end
    else
    begin
        if(en_r1)
        begin
        dividend_r <= dividend;
        divisor_r <= divisor;
    end
    end
end


`ifdef ZILLA_64_BIT
zilla_srt_64_bit 
zilla_srt_64_inst(

 .clk_i           (clk_i            ),
 .rst_i           (rst_i            ),
 .valid_i         (en               ),
 .opcode_i        (opcode_i         ),
 .operand_dividend(dividend_r         ),
 .operand_divisor (divisor_r          ),
 .valid_o         (quotient_valid_o         ),
 .div_rem_value_o (quotient   ),
 .div_busy_o       (div_busy_o)
				 );
 
 `elsif ZILLA_32_BIT                

 zilla_srt_32_bit
 zilla_srt_32_bit_inst
 (
.clk_i           (clk_i          ),
.rst_i           (rst_i          ),
.valid_i         (en             ),
.opcode_i        (opcode_i       ),
.operand_dividend(dividend_r       ),
.operand_divisor (divisor_r        ),
.valid_o         (quotient_valid_o       ),
.div_rem_value_o (quotient ),
.div_busy_o      (div_busy_o    )
				 );

`endif

assign quotient_valid = quotient_valid_o;

endmodule

