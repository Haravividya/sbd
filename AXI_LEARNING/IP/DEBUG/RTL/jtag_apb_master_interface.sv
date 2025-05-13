`timescale 1ns/1ps
module jtag_apb_master_interface
	#(
	// parameters for JTAG
    parameter        DWIDTH  = 32   	, // DATA WIDTH for DMI Register
                     AWIDTH  = 32   	, // ADDRESS WIDTH for DMI Register
					 IR_BITS = 5    	, // parameter declaration for Instruction length
						
	parameter [3:0]  VERSION = 4'h0 	, // IDCODE Register VERSION
	parameter [15:0] PART_NO = 16'h10	, // IDCODE Register PART Number
	parameter [10:0] MANF_ID = 11'h20	, // IDCODE Register Manufacture ID
	
	// parameters for APB Master
	
	parameter 	 ADDR_WIDTH = 32		, // 32 bit address bit
	parameter 	 DATA_WIDTH = 32  		  // 32 bit data bit
	 )(

	// ============== JTAG Ports =============
	 input logic            TCK            	, // Test Clock Input: JTAG
	 input logic            TRST           	, // Test Reset Input: asynch active low reset
	 input logic            TMS            	, // Test Mode Select Input
	 input logic            TDI            	, // Test Data Input
	 output logic           TDO            	, // Test Data Output
	 output logic           tdo_en         	, // TDO  output logic enable: this flag is high when state is in Shift_IR | Shift_DR
	
	// output logic           dmi_reset       	, // DTMCS Register 16th pin
	
//	 output logic [7:0]     cmd_type        	, // this type determines the overall functionality of abstract command
//	 output logic [23:0]    control_out     	, // this field described for each abstract command
	
	// =========== APB Master Ports ============
	 input logic                   pclock   	, 
	 input logic                   presetn 	,
	
	// Signals comming from the APB Slave
	 input logic  [DATA_WIDTH-1:0] prdata  	, // Read data coming from Slave
	 input logic 		            pready		, // Ready signal which represents Slave is ready to 
	 input logic 		            pslverr		, // Pslverr signal indicates failure of transfer
					
	// outputs of APB Master
	 output logic		            psel		, // Signal to select APB Slave 
	 output logic 		            pwrite		, // Indicates write or read operation to be performed to Slave
	 output logic 	                penable 	, // Enable signal indicates its ACCESS state
	 output logic [ADDR_WIDTH-1:0] paddr		, // Address signal
	 output logic [DATA_WIDTH-1:0] pwdata		
										);	


 
	//   logic declarations for interconnnected blocks
	
	  logic                  transfer        ; 
	  logic                  read            ;
	  logic                  write           ;
	  logic [1:0]            dmi_op_out      ;
	  logic [AWIDTH-1:0]     jtag_to_apb_addr;
	  logic [DWIDTH-1:0]     jtag_to_apb_data;
	  logic [DATA_WIDTH-1:0] apb_to_jtag_data;
	  logic data_valid;
	  logic [31:0] dmi_data_reg;
      logic dr_scan;
      logic [31:0] dmi_data_in;

	
	assign read  = (dmi_op_out == 2'b01);
	assign write = (dmi_op_out == 2'b10);
	
	always_ff @(posedge pclock or negedge presetn)
		begin
			if(!presetn)
				dmi_data_reg <= 32'd0;
			else if(data_valid)
				dmi_data_reg <= apb_to_jtag_data;
		end
    assign dmi_data_in = (dr_scan && read) ? dmi_data_reg : 32'd0;

    // JTAG to APB sync                                                 
      logic  transfer_reg1, transfer_reg2;
      logic transfer_ready;
	
	always_ff @(posedge pclock)
		begin
			transfer_reg1 <= transfer     ;
			transfer_reg2 <= transfer_reg1;
		end
		
	assign transfer_ready = (transfer_reg1 && ~transfer_reg2);


	
	/* 
	  =============== Instatiation of JTAG TOP =============== 
	                                                          */
	jtag_top 
   #(.DWIDTH          (DWIDTH          ), // DATA WIDTH for DMI Register
     .AWIDTH          (AWIDTH          ), // ADDRESS WIDTH for DMI Register
	 .IR_BITS         (IR_BITS         ), // parameter declaration for Instruction length						
	 .VERSION         (VERSION         ), // IDCODE Register VERSION
	 .PART_NO         (PART_NO         ), // IDCODE Register PART Number
	 .MANF_ID         (MANF_ID         )    // IDCODE Register Manufacture ID

    )     jtag_top_inst(
     .*,
     /*
     .TCK             (TCK             ), // Test Clock Input
	 .TRST            (TRST            ), // Test Reset Input: asynch active low reset
	 .TMS             (TMS             ), // Test Mode Select Input
	 .TDI             (TDI             ), // Test Data Input
	 .TDO             (TDO             ), // Test Data Output
	 .tdo_en          (tdo_en          ), // TDO  output logic enable: this flag is high when state is in Shift_IR | Shift_DR	
	 .dmi_data_in     (dmi_data_in     ), // Data Read from APB Master
	 .dr_scan         (dr_scan         ), // DTMCS Register 16th pin
     */
	 .dmi_data_out    (jtag_to_apb_data), // DMI Register Data Out going to APB Master
	 .dmi_address_out (jtag_to_apb_addr), // DMI Register Address Out going to APB Master
	 //.dmi_op_out      (dmi_op_out      ), // DMI operation Output: 0=NOP, 1=READ, 2=WRITE, 3=RESERVED: controls READ & WRITE Opr of APB Master
	 .dmi_transfer    (transfer        ) // transfer signal operates APB Master FSM	
//	 .cmd_type        (cmd_type        ), // this type determines the overall functionality of abstract command
//	 .control_out     (control_out     ) // this field described for each abstract command

     //.state           (state_to_jtag   )
     //.slave_err_i     (slave_err_i     )
	                                   );
	/* 
	  =============== End of JTAG TOP =============== 
                                                     */	
 
   	/* 
	  ================== Instatiation of APB Master ================= 
																	 */
	apb_master
		#(
			.ADDR_WIDTH    (ADDR_WIDTH      ), // 32 bit address bit
			.DATA_WIDTH    (DATA_WIDTH      )  // 32 bit data bit	
											)
		
		apb_master_inst
		
		(//system control ports	
        .*,
        /*
		.pclock			   (pclock          ), // APB clock source  
		.presetn		   (presetn         ), // Active low reset signal
		*/			
		//Signals comming from JTAG		
		.transfer		   (transfer_ready  ), // Indicates start of transaction
		//.read			   (read            ), // Indicates read operation
		//.write			   (write           ), // Indicates write operation
		.apb_paddr		   (jtag_to_apb_addr), // Address signal coming from JTAG DMI Address out
		.apb_write_data	   (jtag_to_apb_data), // Write data coming from JTAG DMI Data-out  
					
		//Signals comming from the APB Slave
        /*
		.prdata			   (prdata          ), // Read data coming from Slave
		.pready			   (pready          ), // Ready signal which represents Slave is ready to write or read
		.pslverr		   (pslverr         ), // Pslverr signal indicates failure of transfer

		//outputs of APB Master	
		.psel			   (psel            ), // Signal to select APB Slave 1
		.pwrite			   (pwrite          ), // Indicates write or read operation to be performed to Slave
		.penable		   (penable         ), // Enable signal indicates its ACCESS state
		.paddr			   (paddr           ), // Address signal going to Slave
		.pwdata			   (pwdata          ), // Write data going to APB Slave
        */
		.apb_read_data_out (apb_to_jtag_data), // Data read from Slave in read operation
		.apb_read_data_valid(data_valid		) // Valid signal

        //.state              (state_bin      )
										    );											
	/* 
	  ====================== End of APB Master ===================== 
																	*/
endmodule
