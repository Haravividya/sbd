`timescale 1ns/1ps
module vedic_64x64(
    input logic          clk   ,
    input logic          rstn  ,
    input logic  [63:0]  a_in  ,
    input logic  [63:0]  b_in  ,
    output logic [127:0] result
                        );

    // signals for 2's complement                       
    logic [63:0] op_1, op_2;

    // multiplier instatiation signals
    logic [63:0] q0, q1, q2, q3;
    logic  [31:0] temp;
    logic  [95:0] temp1, temp2, temp3;
    logic [95:0] temp4, temp5;
    logic [95:0] sum ;    
    logic [47:0] cp;
    logic       sel;
    logic co, co_in;

    // 3rd stage pipeline signals
    logic [127:0] sum_out;
    logic  [127:0] sum_reg;
    logic plus, minus    ;
    logic  plus_r, minus_r;

    // vedic 32x32 multiplier instatiation
    vedic_32x32 vedic_32x32_0(
    .a_in(a_in[31:0]),
    .b_in(b_in[31:0]),
    .result(q0)     );

    vedic_32x32 vedic_32x32_1(
    .a_in(a_in[31:0] ),
    .b_in(b_in[63:32]),
    .result(q1)      );

    vedic_32x32 vedic_32x32_2(
    .a_in(a_in[63:32]),
    .b_in(b_in[31:0] ),
    .result(q2)      );

    vedic_32x32 vedic_32x32_3(
    .a_in(a_in[63:32]),
    .b_in(b_in[63:32]),
    .result(q3)      );

    //////////////// 2nd stage of registering ///////////////
    always_ff @(posedge clk or negedge rstn)
    begin
        if(!rstn)
        begin
            plus_r  <= 1'b0 ;
            minus_r <= 1'b0 ;
            temp    <= 32'd0;
            temp1   <= 96'd0;
            temp2   <= 96'd0;
            temp3   <= 96'd0;
        end
        else
        begin
            plus_r  <= plus ;
            minus_r <= minus;
            temp    <= q0[31:0];
            temp1   <= {32'd0, q1};
            temp2   <= {32'd0, q2};
            temp3   <= {q3, q0[63:32]};
       end
    end

    // 96 bit carry save adder instatiation
    csa_96bit csa_inst(
    .ain(temp1),
    .bin(temp2),
    .cin(temp3),
    .sum(temp4),
    .co (temp5)
              );

    assign cp  = temp4[47:0] ^ temp5[47:0];
    assign sel = &cp;

    // 48 bit carry skip adder instatiation
    carry_skip_48bit carry_skip_inst0(
    .ain(temp4[47:0]),
    .bin(temp5[47:0]),
    .cin(1'b0),
    .sum(sum[47:0]),
    .cout(co)     );

    assign co_in = sel ? 1'b0 : co;

    carry_skip_48bit carry_skip_inst1(
    .ain(temp4[95:48]),
    .bin(temp5[95:48]),
    .cin(co_in),
    .sum(sum[95:48]),
    .cout()        );

    assign sum_out = {sum, temp};

    // 2's complement result
    always_comb
    begin
        if(plus_r)
            sum_reg = sum_out;
        else if(minus_r)
            sum_reg = ~sum_out + 1'b1;
        else
            sum_reg = sum_out;
    end

    //assign result = sum_reg;
    assign result = sum_out;
    
endmodule

