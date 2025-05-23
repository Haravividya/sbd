`define ZILLA_32_BIT
`define INSTRUCTION_32_BIT
`timescale 1ns/1ps
module zilla_reminder
#(
    parameter DATA_WIDTH = 32,
    parameter INSTRUCTION_WIDTH = 32
)
(
    input logic                   clk_i           ,
    input logic                   rst_i           ,
    input logic                   en              ,
    input logic [DATA_WIDTH-1:0]  dividend        ,
    input logic [DATA_WIDTH-1:0]  divisor         ,
    input logic [31:0]            opcode_i        ,
    output logic [DATA_WIDTH-1:0] reminder        ,
    output logic                  reminder_valid  ,
    output logic                  rem_busy_o      

);


    logic [DATA_WIDTH-1:0] dividend_r;
    logic [DATA_WIDTH-1:0] divisor_r;
    logic en_r;
    logic en_r1;
    
    always_ff@(posedge clk_i or negedge rst_i)
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
    
    always_ff@(posedge clk_i or negedge rst_i)
    begin
        if(!rst_i)
            begin
            dividend_r <= {DATA_WIDTH{1'b0}};
            divisor_r  <= {DATA_WIDTH{1'b0}};
            end
        else
        begin
            if(en_r1)
            begin
            dividend_r <= dividend;
            divisor_r  <= divisor;
            end
        end
    end
    
    
    
    `ifdef ZILLA_64_BIT
    riscv_divider_64bit 
    riscv_divider_64bit_inst(
    
     .*,
     /*
     .clk_i           (clk_i            ),
     .rst_i           (rst_i            ),
     */
     .valid_i         (en               ),
     //.opcode_i        (opcode_i         ),
     .operand_dividend(dividend_r         ),
     .operand_divisor (divisor_r          ),
     .valid_o         (reminder_valid         ),
     .div_rem_value_o (reminder   ),
     .div_busy_o      (rem_busy_o      )
    				 );
     
     `elsif ZILLA_32_BIT                
    
     riscv_divider_32bit
     riscv_divider_32bit_inst
     (
    .*,
    /*
    .clk_i           (clk_i          ),
    .rst_i           (rst_i          ),
    */
    .valid_i         (en             ),
    //.opcode_i        (opcode_i       ),
    .operand_dividend(dividend_r       ),
    .operand_divisor (divisor_r        ),
    .valid_o         (reminder_valid       ),
    .div_rem_value_o (reminder ),
    .div_busy_o     (rem_busy_o)
    				 );
    
        `endif

endmodule


