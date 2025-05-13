`timescale 1ns / 1ps
//Full adder module
module adder (   
	input  a    ,
	input  b    ,
	input  cin  ,
    output sum  ,           
    output carry            
    );

assign sum = a ^ b ^ cin;
assign carry = (a & b) | (cin & b) | (a & cin);
endmodule

//Half adder module
module ha (
    input   a   ,
    input   b   ,
    output  co  ,
    output  s    
);
assign s = a ^ b;
assign co = a & b;
endmodule

module CarrySaveAdd #(parameter BS = 34)
(
	input  [BS-1:0] input_a,
	input  [BS-1:0] input_b,
	output [BS-1:0] output_y
);
    wire [BS+1:0] result      ; 
	wire [BS:0]     sum         ;
    wire [BS-1:0]   c           ;
    wire            cout        ;
    wire [BS:0]     int_carry   ;
    wire [BS:0]     sum1        ;

	genvar i;
	generate
		for(i=0; i<BS; i=i+1)
		 begin:carr_save_adder
			 ha HA_inst (
				 .a     (input_a[i] ),
				 .b     (input_b[i] ),
				 .s     (sum[i]     ),  
				 .co    (c[i]       ) 
			 );
		 end
	endgenerate

    genvar j;
	generate
		for(j=1;j<BS+1;j=j+1)
		 begin:carr_save_adder_a
			 adder FAL (
				 .a     (sum[j]         ),
				 .b     (c[j-1]         ),
				 .cin   (int_carry[j-1] ),
				 .sum   (sum1[j]        ),  
				 .carry (int_carry[j]   ) 
			 );
		 end
	endgenerate
    assign int_carry[0] = 1'b0;
    assign sum[BS] = 1'b0;
    assign cout = int_carry[BS];
	assign result  =({cout,sum1[BS:1],sum[0]}) ;

    assign output_y = result[BS-1:0];
endmodule
