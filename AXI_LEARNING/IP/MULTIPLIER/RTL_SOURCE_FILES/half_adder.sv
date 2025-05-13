
`timescale 1ns/1ps

module half_adder(ain, bin, sum, cout);

/* timeunit 1ns;
 timeprecision 1ps;*/

	input logic ain, bin ;
	output logic sum, cout;

	assign sum  = ain ^ bin;
	assign cout = ain & bin;

endmodule
