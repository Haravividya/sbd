module i2c_ram(
	input logic        clock_in, // i2c_serial clock signal 
	input logic        reset_in, // global reset signal
	input logic        wr_en_in, // if asserted then master writes 8bit data to ram
	input logic        rd_en_in, // if asserted then master reads 8bit data from ram
	input logic  [6:0] addr_in , // address coming from i2c slave module
	input logic  [7:0] data_in , // input logic data coming from i2c slave module
	output logic [7:0] data_out  // output logic data going to i2c slave module
							  );

 timeunit 1ns;
 timeprecision 1ps;
 
	// reg_file declaration
	logic [7:0] reg_file[0:127];
	integer i                ;

	// write data to reg_file at negedge of clk_in with no reset
	always_ff @(posedge reset_in or posedge clock_in)
		begin
			if(reset_in) // if reset initialise all the locations of ram to 0
				begin
					for(i=0; i<128; i=i+1)
						reg_file[i] <= 8'd0;
				end
			else 
				begin
				   // write operation
					if(wr_en_in)
						reg_file[addr_in] <= data_in          ; // data written into ram based on addr_in
					else
						reg_file[addr_in] <= reg_file[addr_in]; // data will not written into ram
				end
		end
	
	// read data from reg_file with no reset	
	assign data_out = (reset_in) ? 8'd0 : (rd_en_in  ? reg_file[addr_in] : data_out);
	
endmodule

