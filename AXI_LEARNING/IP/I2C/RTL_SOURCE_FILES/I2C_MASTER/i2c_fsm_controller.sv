module i2c_fsm_controller(
	input logic            i2c_clock_in       , // top module clock signal
	input logic            i2c_reset_in       , // active high reset signal
	input logic            enable             , // enables master_fsm for read & write
	input logic            rw_bit             , // rw_bit is used for read and write operation
	input logic      [6:0] fifo_to_fsm_addr_in, // address in which master is read or write data
	input logic      [7:0] fifo_to_fsm_data_in, // data write into slave
	output logic     [7:0] i2c_master_data_out, // data read from slave
	inout  logic            i2c_sda            , // serial data line
	output logic           i2c_scl            , // serial clock line
	output logic           ready                // master is ready to transfer addr and data
					   );

    timeunit 1ns;
    timeprecision 1ps;	

	// parameter declaration for states
	localparam STATE_IDLE  = 4'd0 ; // idle state
	localparam STATE_START = 4'd1 ; // start state
	localparam STATE_ADDR  = 4'd2 ; // address state
	localparam STATE_RACK1 = 4'd3 ; // read ack state from slave 
	localparam STATE_WRITE = 4'd4 ; // data write into slave state
	localparam STATE_RACK2 = 4'd5 ; // read ack state 2
	localparam STATE_READ  = 4'd6 ; // data read from slave state
	localparam STATE_WACK  = 4'd7 ; // write ack state master_to_slave
	localparam STATE_STOP  = 4'd8 ; // stop state
	
	// signal declaration
	 logic [3:0] state         ; // signal used to declare differnet states
	 logic [2:0] count         ; // used to count no of bits
	 logic [7:0] saved_addr    ; // addr value is assigned at start_state
	 logic [7:0] saved_data_wr ; // data value is assigned at start_state
	 logic       i2c_scl_clk   ; // signal used to define i2c_scl signal
	 logic       sda_out       ; // used for writing to slave through i2c_sda line
	 logic       write_en      ; // enables writing bits to slave through i2c_sda line
	
	assign i2c_sda = (write_en    == 1'b1) ? sda_out : 1'bz          ; // enables write into i2c_sda line
	assign i2c_scl = (i2c_scl_clk == 1'b0) ? 1'b1    : i2c_clock_in  ; // i2c_scl logic
	assign ready   = ((i2c_reset_in == 1'b0) && (state == STATE_IDLE)) ? 1'b1 : 1'b0; // ready to read & write
	
	// i2c_scl_clock logic
	// at reset, idle, start, and stop state i2c_scl_clock is low else high
	always_ff @(negedge i2c_clock_in)
		begin
			if(i2c_reset_in)
				i2c_scl_clk <= 1'b0;
			else if((state == STATE_IDLE) || (state == STATE_START) || (state == STATE_STOP))
				i2c_scl_clk <= 1'b0;
			else
				i2c_scl_clk <= 1'b1;
		end
	
	//============STATE-MACHINE-LOGIC=============
	// read data from slave at posedge of clock_in
	always_ff @(posedge i2c_clock_in or posedge i2c_reset_in)
		begin
			if(i2c_reset_in)
				begin
					state               <= STATE_IDLE;
					i2c_master_data_out <= 8'd0      ;
					count               <= 3'd0      ;
				end
			else
				begin
					unique case(state)
						STATE_IDLE  : begin // at high enable next_state is start else idle
								if(enable) 
									begin
										state <= STATE_START;
									end
								else
									state <= STATE_IDLE;
							      end   // end idle
										  
						STATE_START : begin // start state
								count         <= 3'd7                         ;
								state         <= STATE_ADDR                   ;
								saved_addr    <= {fifo_to_fsm_addr_in, rw_bit};
								saved_data_wr <= fifo_to_fsm_data_in          ;											
							      end   // end start state
										  
						STATE_ADDR  : begin // address state
								if(count == 3'd0)
									state <= STATE_RACK1;
								else 
									begin
										count <= count - 1'b1 ;
										state <= STATE_ADDR   ;
									end
							      end   // end addr state
											
						STATE_RACK1 : begin // read ack from slave 
								if(i2c_sda == 1'b0) // ack is detected
									begin
										count <= 3'd7;													
										// saved_addr[0] is 1 next_state is READ state
										// else WRITE state
										if(saved_addr[0] == 1'b1) 
											state <= STATE_READ ;
										else
											state <= STATE_WRITE;
									end
								else  // ack is not detected
									begin
										state <= STATE_STOP;
									end
							      end   // end read sck state
										  
						STATE_WRITE : begin // write_state data write into slave  
								if(count == 3'd0)
									state <= STATE_RACK2;
								else 
									begin
										count <= count - 1'b1;
										state <= STATE_WRITE ;
									end
						              end   // end write state
										  
						STATE_RACK2 : begin // read ack state from slave after data receive
								if(i2c_sda == 1'b0)
									state <= STATE_IDLE;
								else
									state <= STATE_STOP;												
							      end   // end read ack state
										  
						STATE_READ  : begin // read_state data read from slave
								i2c_master_data_out[count] <= i2c_sda;
								if(count == 3'd0)
									state <= STATE_WACK;
								else
									begin
										count <= count - 1'b1;
										state <= STATE_READ  ;
									end
							      end   // end read state
										  
						STATE_WACK  : begin // ack from master to slave
								state <= STATE_STOP;
							      end   // end write ack state
										  
						STATE_STOP  : begin // stop state
								state <= STATE_IDLE;
							      end   // end stop state
					endcase
				end
		end
		
	// write addr, data and ack bit to slave at negedge of clock_in
	always_ff @(negedge i2c_clock_in or posedge i2c_reset_in)
		begin
			if(i2c_reset_in)
				begin
					write_en <= 1'b1;
					sda_out  <= 1'b1;
				end
			else
				begin
					unique case(state)
						STATE_IDLE  : begin // idle state
								write_en <= 1'b1;
								sda_out  <= 1'b1;
							      end   // end idle
										  
						STATE_START : begin // start state
								write_en <= 1'b1;
								sda_out  <= 1'b0;	
							      end   // end start
										  
						STATE_ADDR  : begin // addr state
								write_en <= 1'b1             ;
								sda_out  <= saved_addr[count];											
							      end   // end addr
										  
						STATE_RACK1 : begin // read ack state
								write_en <= 1'b0;
							      end   // end read ack
										  
						STATE_WRITE : begin // data write state
								write_en <= 1'b1                ;
								sda_out  <= saved_data_wr[count];	 										
							      end   // end data write
										  
						STATE_RACK2 : begin // read ack state
								write_en <= 1'b0;
							      end   // end read ack
										  
						STATE_READ  : begin // read data state
								write_en <= 1'b0;
							      end   // end read data
										  
						STATE_WACK  : begin // write ack state
								write_en <= 1'b1;
								sda_out  <= 1'b0;											
							      end   // end write ack
												
						STATE_STOP  : begin // stop state
								write_en <= 1'b1;
								sda_out  <= 1'b1;											
							      end   // end stop
					endcase
				end
		end

endmodule
