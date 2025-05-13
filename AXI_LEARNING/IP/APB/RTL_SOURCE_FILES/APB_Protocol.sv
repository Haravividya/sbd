`define ADDR_WIDTH_32 										// MACRO of default 32 bit

module APB_protocol_top 
													   #(	
		`ifdef ADDR_WIDTH_32
		parameter 	ADDR_WIDTH = 32						,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32							// 32 bit data bit
		  
		`else
		parameter 	ADDR_WIDTH = 64						,	// 64 bit address bit
		parameter 	DATA_WIDTH = 64							// 64 bit data bit
		  
		`endif
														)
														(
		// Inputs of APB Top
		
		input logic 		pclock								, 	// System clock
		input logic		presetn								, 	// Active low reset signal
		input logic 		transfer							, 	// Indicates start of transaction
		input logic 		read_write							, 	// read write signal 1 for read, 0 for write
		input logic 		[ADDR_WIDTH-1:0] apb_write_paddr	, 	// write address
		input logic 		[DATA_WIDTH-1:0] apb_write_data		, 	// write data
		input logic 		[ADDR_WIDTH-1:0] apb_read_paddr		, 	// read address
					
		//Outputs of APB Top
		
		output logic 		[DATA_WIDTH-1:0] apb_read_data_out		// data out signal of top
													   );


 
		// Declaration of wires
		
		logic [ADDR_WIDTH-1:0] paddr;
		logic [DATA_WIDTH-1:0] pwdata;
		logic [DATA_WIDTH-1:0] prdata;
		logic [DATA_WIDTH-1:0] prdata1;
		logic [DATA_WIDTH-1:0] prdata2;
		logic penable;
		logic pwrite;
		logic pready;
		logic pready1;
		logic pready2;
		logic pslverr;
		logic pslverr1; 
		logic pslverr2;
		logic psel1;
		logic psel2;

		//APB Master Instantiation
		
		apb_master M1 									(
                .*
                /*
				.pclock(pclock)							, 
				.presetn(presetn)						, 
				.prdata(prdata)							, 
				.pready(pready)							, 
				.pslverr(pslverr)						, 
				.psel1(psel1)							, 
				.psel2(psel2)							, 
				.penable(penable)						, 
				.pwrite(pwrite)							, 
				.paddr(paddr)							,
				.pwdata(pwdata)							, 
				.apb_write_data(apb_write_data)			, 
				.apb_read_data_out(apb_read_data_out)	, 
				.read_write(read_write)					, 
				.transfer(transfer)						, 
				.apb_write_paddr(apb_write_paddr)		, 
				.apb_read_paddr(apb_read_paddr)
                */
													   );

		//APB Slave1 Instantiation
		apb_slave1 S1 									(
                .*
                /*
				.pclock(pclock)							, 
				.presetn(presetn)						,
				.psel1(psel1)							, 
				.penable(penable)						, 
				.pwrite(pwrite)							, 
				.paddr(paddr)							, 
				.pwdata(pwdata)							, 
				.prdata1(prdata1)						, 
				.pready1(pready1)						, 
				.pslverr1(pslverr1)
                */
													   );

		//APB Slave2 Instantiation
		apb_slave2 S2 									(
                .*
                /*
				.pclock(pclock)							,
				.presetn(presetn)						, 
				.psel2(psel2)							, 
				.penable(penable)						, 
				.pwrite(pwrite)							, 
				.paddr(paddr)							,
				.pwdata(pwdata)							, 
				.prdata2(prdata2)						, 
				.pready2(pready2)						, 
				.pslverr2(pslverr2)
                */
													   );

	assign pready = paddr[ADDR_WIDTH-1] ? pready2 : pready1 ;

	assign pslverr = paddr[ADDR_WIDTH-1] ? pslverr2 : pslverr1 ;

	assign prdata = paddr[ADDR_WIDTH-1] ? prdata2 : prdata1 ;

endmodule
