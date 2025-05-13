
`timescale 1ns/1ps

module csa_48bit(
    input logic  [47:0] ain,
    input logic  [47:0] bin,
    input logic  [47:0] cin,
    output logic [47:0] sum,
    output logic [47:0] co
                    );

/* timeunit 1ns;
 timeprecision 1ps;*/

    logic [47:0] c, s;

    genvar i;
    generate
    for(i=0; i<48; i=i+1)
    begin : csa_loop
        full_adder FA(.ain(ain[i]), 
                      .bin(bin[i]),
                      .cin(cin[i]),
                      .sum(s[i]  ),
                      .cout(c[i] )
                                 );
    end
    endgenerate

    assign co  = {c[46:0], 1'b0};
    assign sum = s; 

endmodule

