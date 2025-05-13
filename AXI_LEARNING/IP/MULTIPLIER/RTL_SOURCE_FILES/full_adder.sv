
`timescale 1ns/1ps

module full_adder(ain, bin, cin, sum, cout);

 /*timeunit 1ns;
 timeprecision 1ps;*/

	input logic  ain, bin, cin;
	output logic sum, cout;

	assign sum  = ain ^ bin ^ cin;
	assign cout = (ain & bin) | (bin & cin) | (cin & ain);
	
endmodule

