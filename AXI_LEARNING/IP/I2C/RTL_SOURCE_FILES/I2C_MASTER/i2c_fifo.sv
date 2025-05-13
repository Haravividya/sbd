module i2c_fifo #(parameter         FIFO_WIDTH = 15, // parameter for fifo data width
	                            FIFO_ADDR  = 9 ) // parameter for fifo addr
	(input logic                      i2c_clock_in   , // top module clock signal
   	input logic                       i2c_reset_in   , // active high reset
   	input logic                       wr_en_in       , // write enable signal data write into fifo
  	input logic                       rd_en_in       , // read enable signal data read from fifo
	input logic      [FIFO_WIDTH-1:0] data_in        , // input logic addr+data 
	output logic     [FIFO_WIDTH-1:0] data_out       , // output logic addr+data
   	output logic                      fifo_full      , // full detection signal
   	output logic                      fifo_empty       // fifo empty detection signal
	                                          );
    timeunit 1ns;
    timeprecision 1ps;	

	// signal declaration fifo depth
	localparam FIFO_DEPTH = 1 << FIFO_ADDR;
	
	logic [FIFO_ADDR:0   ] fifo_count               ; // counts no of data entries into fifo
	logic [FIFO_ADDR-1:0 ] rd_ptr                   ; // points to addr where fifo read data
	logic [FIFO_ADDR-1:0 ] wr_ptr                   ; // points to addr where fifo write data
	logic [FIFO_WIDTH-1:0] fifo_mem[0:FIFO_DEPTH-1] ; // fifo memory declaration
	
	logic valid_rd_en; // read signal when data will read from fifo
	logic valid_wr_en; // write signal when data will write to fifo
	
	assign valid_rd_en = rd_en_in && !fifo_empty ; // condition for data read from fifo
	assign valid_wr_en = wr_en_in && !fifo_full  ; // condition for data write to fifo
	assign fifo_full   = fifo_count == FIFO_DEPTH; // fifo full condition
	assign fifo_empty  = fifo_count == 10'd0     ; // fifo empty condition
	
	// Specifies No of data entries into FIFO
	always_ff @(posedge i2c_clock_in)
		begin
			if(i2c_reset_in)         // active high reset
				fifo_count <= 9'd0;
			else if(valid_wr_en) // fifo_count increases
				fifo_count <= fifo_count + 1'b1;
			else if(valid_rd_en) // fifo_count decreases
				fifo_count <= fifo_count - 1'b1;
			else
				fifo_count <= fifo_count;
		end
	
	// Designing rd_ptr and wr_ptr
	always_ff @(posedge i2c_clock_in)
		begin
			if(i2c_reset_in)
				begin
					rd_ptr <= 0;
					wr_ptr <= 0;
				end
			else 
				begin
					// wr_ptr signal points to addr where fifo writes data
					if(valid_wr_en)
						wr_ptr <= wr_ptr + 1'b1;
					else
						wr_ptr <= wr_ptr;
						
					// rd_ptr signal points to addr where fifo reads data
					if(valid_rd_en)
						rd_ptr <= rd_ptr + 1'b1;
					else
						rd_ptr <= rd_ptr;
				end
		end
		
	// Writing data into FIFO at posedge of clock_in
	always_ff @(posedge i2c_clock_in)
		begin
			if(valid_wr_en)    // data write into fifo
				fifo_mem[wr_ptr] <= data_in;
			else
				fifo_mem[wr_ptr] <= fifo_mem[wr_ptr];
		end
		
	// Reading data from FIFO at posedge clock_in
	always_ff @(posedge i2c_clock_in)
		begin
			if(i2c_reset_in)
				data_out <= 15'd0;
			else
				if(valid_rd_en) // data read from fifo
					data_out <= fifo_mem[rd_ptr];
				else
					data_out <= data_out;
		end

endmodule
