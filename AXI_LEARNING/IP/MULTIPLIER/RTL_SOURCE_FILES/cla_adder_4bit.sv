
`timescale 1ns/1ps

module cla_adder_4bit(
    input logic  [3:0] ain ,
    input logic  [3:0] bin ,
    input logic        cin ,
    output logic [3:0] sum ,
    output logic       cout
                    );
/* timeunit 1ns;
 timeprecision 1ps;*/

    logic [3:0] cp; // carry propagate
    logic [3:0] cg; // carry generate
    logic [3:0] co; // carry output logic

    assign cp = ain ^ bin;
    assign cg = ain & bin;

    assign co[0] = cin;
    assign co[1] = (cg[0] | (co[0] & cp[0]));
    assign co[2] = (cg[1] | (co[1] & cp[1]));
    assign co[3] = (cg[2] | (co[2] & cp[2]));

    assign cout  = (cg[3] | (co[3] & cp[3]));
    assign sum   = cp ^ co;

endmodule

