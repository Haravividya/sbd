
`timescale 1ns/1ps

module csa_96bit(
    input logic  [95:0] ain,
    input logic  [95:0] bin,
    input logic  [95:0] cin,
    output logic [95:0] sum,
    output logic [95:0] co
                    );

/* timeunit 1ns;
 timeprecision 1ps;*/

    logic [95:0] s, c;

    genvar i;
    generate
    for(i=0; i<96; i=i+1)
    begin : csa_loop
        full_adder FA(.ain(ain[i]),
                      .bin(bin[i]),
                      .cin(cin[i]),
                      .sum(s[i]  ),
                      .cout(c[i] ) 
                                 );
    end
    endgenerate

    assign sum = s;
    assign co  = {c[94:0], 1'b0};

endmodule

