
// Vedic Multiplier 2x2 using UT Sutras

`timescale 1ns/1ps

module vedic_2x2(
    input logic  [1:0] a_in  ,
    input logic  [1:0] b_in  ,
    output logic [3:0] result
                      );

/* timeunit 1ns;
 timeprecision 1ps;*/

    logic [3:0] temp  ;
    logic sum1 , sum2 ;
    logic cout1, cout2;
    
    assign temp[0] = a_in[0] & b_in[0];
    assign temp[1] = a_in[0] & b_in[1];
    assign temp[2] = a_in[1] & b_in[0];
    assign temp[3] = a_in[1] & b_in[1];

    half_adder HA0(.ain (temp[1]),
                   .bin (temp[2]),
                   .sum (sum1   ),
                   .cout(cout1  )
                                );
 
    half_adder HA1(.ain (temp[3]),
                   .bin (cout1  ),
                   .sum (sum2   ),
                   .cout(cout2  )
                                );
                             
    assign result[0] = temp[0]; 
    assign result[1] = sum1   ;
    assign result[2] = sum2   ;
    assign result[3] = cout2  ;

endmodule

