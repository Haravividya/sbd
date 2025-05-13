
`timescale 1ns/1ps

module carry_skip_4bit(
    input logic  [3:0] ain ,
    input logic  [3:0] bin ,
    input logic        cin ,
    output logic [3:0] sum ,
    output logic       cout
                    );

 /*timeunit 1ns;
 timeprecision 1ps;*/

    logic [3:0] cp;
    logic      sel;
    logic      co ;

    assign cp  = ain ^ bin;
    assign sel = &cp;

    cla_adder_4bit cla_adder_4bit_inst(
    .*,
    /*
    .ain(ain),
    .bin(bin),
    .cin(cin),
    .sum(sum),
    */
    .cout(co)
            );

    assign cout = sel ? cin : co;            

endmodule

