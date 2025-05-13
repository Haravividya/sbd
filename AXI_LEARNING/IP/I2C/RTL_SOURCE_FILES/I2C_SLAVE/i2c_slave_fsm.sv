module i2c_slave_fsm(
	input logic            rst_in          , // global reset signal
   	input logic            i2c_scl         , // serial clock line
    	inout logic            i2c_sda         , // serial data line 
	input logic      [7:0] data_in_from_ram, // data input logic from RAM 
	output logic        wr_en_to_ram    , // write enable signal to enable writing data to ram
	output logic        rd_en_to_ram    , // read enable signal to enable reading data from ram
	output logic  [7:0] data_out_to_ram , // output logic data to ram
	output logic  [7:0] addr_out_to_ram   // address to ram
	                                );

timeunit 1ns;
timeprecision 1ps;

	localparam  STATE_IDLE   = 3'h0 ; // idle
    	localparam  STATE_ADDR   = 3'h1 ; // the slave addr match
	localparam  SEND_AACK    = 3'h2 ; // send ack to master
    	localparam  STATE_READ   = 3'h3 ; // the op=read 
	localparam  READ_RACK    = 3'h4 ; // READ ACK bit from master
    	localparam  STATE_WRITE  = 3'h5 ; // write the data in the logic
	localparam  SEND_WACK    = 3'h6 ; // WRITE ACK bit to slave
	localparam  STATE_STOP   = 3'h7 ; // STOP State

	logic [2:0] counter ; // counter counts no of clock pulses
	logic [2:0] state   ; // used to define no of states in fsm
	logic       enable  ; // enable or disable the i2c_sda line 
	logic       sda_out ; // internal register for i2c_sda line 
	logic       start   ; // detection of start signal
	logic       stop    ; // detection of stop signal	
	logic      rw_bit  ; // used to detect read or write operation 

	// detect the start signal
	// start detects when sda goes high to low when scl is high
	always_ff @(posedge rst_in or negedge i2c_sda)
		begin
			if(rst_in)
				start <= 1'b0;
			else 
				begin
					if((state == STATE_IDLE) && (i2c_scl == 1'b1))
						start <= 1'b1;
					else
						start <= 1'b0;
				end
		end
		
	// detection of stop signal
	// stop detects when sda goes low to high when scl is high
	always_ff @(posedge rst_in or posedge i2c_sda)
		begin
			if(rst_in)
				stop <= 1'b0;
			else 
				begin
					if((state == STATE_IDLE) && (i2c_scl == 1'b1))
						stop <= 1'b1;
					else
						stop <= 1'b0;
				end
		end
	
	assign i2c_sda = (enable == 1'b1) ? sda_out : 1'bz; // tristate logic enabled for master read and ack state
	assign rw_bit  = (addr_out_to_ram[0])             ; // rw_bit =1 for read and =0 for write
	
	//============STATE-MACHINE=============
	
	always_ff @(posedge rst_in or negedge i2c_scl)
		begin
			if(rst_in) // if asserted state goes to idle state
				begin
					state           <= STATE_IDLE;
					counter         <= 3'd0      ;
					wr_en_to_ram    <= 1'b0      ;
					rd_en_to_ram    <= 1'b0      ;
					data_out_to_ram <= 8'd0      ;
					addr_out_to_ram <= 8'd0      ;
				end
			else 
				begin
					unique case(state)
						STATE_IDLE  : begin  // idle state
								wr_en_to_ram <= 1'b0;
								rd_en_to_ram <= 1'b0;
								if(start) // if start detects goes to ADDR_STATE else IDLE_STATE
									begin
										state   <= STATE_ADDR;
										counter <= 3'd7      ;
									end
								else if(stop) 
									state <= STATE_IDLE;
								else 
									state <= STATE_IDLE;
							      end   // end idle state
										  
						STATE_ADDR  : begin // addr state	
								addr_out_to_ram[counter] <= i2c_sda; // read addr by slave
											
								if(counter == 3'd0)
									state <= SEND_AACK;											
								else
									begin
										counter <= counter - 3'd1;
										state   <= STATE_ADDR    ;
									end
							      end   // end addr state
										  
						SEND_AACK   : begin // send ack to master 
								if(rw_bit == 1'b1) 
									begin
										counter      <= 3'd7      ;
										state        <= STATE_READ;
										rd_en_to_ram <= 1'b1      ;
									end
								else if(rw_bit == 1'b0)
									begin
										counter <= 3'd7       ;
										state   <= STATE_WRITE;
									end
								else
									state <= STATE_IDLE;
							      end   // end send ack state
										  
						STATE_READ  : begin // master read data from slave
								rd_en_to_ram <= 1'b0;
								if(counter == 3'd0)
									state <= READ_RACK;
								else
									begin
										state   <= STATE_READ    ;
										counter <= counter - 3'd1;  
								end
							      end   // end read state
									  
						READ_RACK   : begin // READ ACK State
								if(i2c_sda == 1'b0)
									state <= STATE_IDLE;
								else	
									state <= STATE_STOP;
							      end   // end READ ACK state
										  
						STATE_WRITE : begin // master write data into slave 
								data_out_to_ram[counter] <= i2c_sda ; // master write data to ram
											
								if(counter == 3'd0)
									begin
										state        <= SEND_WACK;
										wr_en_to_ram <= 1'b1     ;
									end
								else
									begin
										state   <= STATE_WRITE   ;
										counter <= counter - 3'd1;
									end
							      end   // end write state
									  
						SEND_WACK   : begin // WRITE ACK State
								state        <= STATE_IDLE ;
								wr_en_to_ram <= 1'b0       ;
							      end   // end WRITE ACK State
						
						STATE_STOP  : begin // STOP State
								state <= STATE_IDLE;
						              end   // End STOP State
					endcase
				end
		end
		
	// state machine to write data & addr from ram at posedge of i2c_scl with no reset
	// read data from ram assigned to i2c_sda at posedge of i2c_scl with no reset
	always_ff @(posedge rst_in or posedge i2c_scl)
		begin
			if(rst_in)
				begin
					enable   <= 1'b1;
					sda_out  <= 1'b1;
				end
			else
				begin
					unique case(state)
						STATE_IDLE  : begin // idle state
								enable <= 1'b0;
							      end   // end idle
										  
						STATE_ADDR  : begin // addr state
							    	enable <= 1'b0;
							      end   // end addr state
										  
						SEND_AACK   : begin // ack state slave send ack bit to master
								enable  <= 1'b1;
								sda_out <= 1'b0;
				        		      end   // end ack state
										  
						STATE_READ  : begin // read state
								enable  <= 1'b1                     ;
								sda_out <= data_in_from_ram[counter]; // master read data from ram 
							      end   // end read state
									  
						READ_RACK   : begin
								enable <= 1'b0;
							      end
										  
						STATE_WRITE : begin // write state
								enable <= 1'b0;
							      end   // end write state
									  
						SEND_WACK   : begin // WRITE ACK State
								enable  <= 1'b1;
								sda_out <= 1'b0;
							      end   // end WRITE ACK State
						
						STATE_STOP  : begin // STOP State
								enable <= 1'b0;
							      end   // End STOP State
					endcase
				end
		end
	
endmodule
