`define ZILLA_32_BIT
`timescale 1ns/1ps
module dtm_to_dm
		#(
		// parameters for JTAG
		parameter   	DWIDTH  = 32   				, // DATA WIDTH for DMI Register
        parameter       AWIDTH  = 32   				, // ADDRESS WIDTH for DMI Register
		parameter		IR_BITS = 5    				, // parameter declaration for Instruction length
						
		parameter 		[3:0]  VERSION = 4'h0 		, // IDCODE Register VERSION
		parameter 		[15:0] PART_NO = 16'h10		, // IDCODE Register PART Number
		parameter 		[10:0] MANF_ID = 11'h20		, // IDCODE Register Manufacture ID
	
		// parameters for APB 
		parameter 	    ADDR_WIDTH = 32				, // 32 bit address bit
		parameter 	   	DATA_WIDTH = 32  			,  // 32 bit data bit

        `ifdef ZILLA_64_BIT
            parameter CORE_DATA_WIDTH = 64
          `elsif ZILLA_32_BIT
            parameter CORE_DATA_WIDTH = 32
           `endif
												   )(

		// ============== JTAG Ports =============
		input logic           TCK            				, // Test Clock Input: JTAG
		input logic           TRST           				, // Test Reset Input: asynch active low reset
		input logic           TMS          			 	, // Test Mode Select Input
		input logic           TDI            				, // Test Data Input
		output logic          TDO            				, // Test Data Output
		output logic          tdo_en         				, // TDO output logic enable: this flag is high when state is in Shift_IR | Shift_DR
	
		//output logic          dmi_reset      				, // DTMCS Register 16th pin	
	//	output logic [7:0]    cmd_type       				, // this type determines the overall functionality of abstract command
	///	output logic [23:0]   control_out    				, // this field described for each abstract command
	
		// =========== APB Master Ports ============
		input logic           pclock  					, // APB Clock signal
		input logic           presetn   					,  // Asynchronous active low reset for APB
		
		// =========== Debug Module FSM Ports ============
		
		input logic 			step						,
		input logic 			ebreak 						,
		input logic 			exception 					,
		input logic 			[CORE_DATA_WIDTH-1:0] debug_reg_read_data	,
		input logic 			debug_reg_read_valid		,
        input logic           [CORE_DATA_WIDTH-1:0] debug_mem_read_data  ,
        input logic           debug_mem_read_valid        ,
		
		output logic 			[7:0] cmdtype				,
		output logic 			ndmreset					,
		//output logic  		hartreset					,
        output logic          h_reset                     ,
		output logic 			haltreq						,
		output logic 			resumereq				,
		output logic 			setresethaltreq				,
		output logic			clrresethaltreq				,
        output logic          resethaltreq                ,
		output logic 			debug_reg_write_enable		,
		output logic 			[CORE_DATA_WIDTH-1:0] debug_reg_write_data	,
		output logic 			debug_reg_read_enable		,
		output logic 			[15:0]debug_reg_address		,
        output logic          debug_mem_read_enable       ,
        output logic          debug_mem_write_enable      ,
        output logic          [CORE_DATA_WIDTH-1:0]debug_mem_read_addr   ,
        output logic          [CORE_DATA_WIDTH-1:0]debug_mem_write_addr  ,
        output logic          [CORE_DATA_WIDTH-1:0]debug_mem_write_data  ,
        output logic          [(CORE_DATA_WIDTH>>3)-1:0] debug_mem_strobe         

				
												   );	

		// Declaration of wires
	
		 logic 			[DATA_WIDTH-1:0] prdata		;
		 logic 			pready						;
		 logic 			pslverr						;
		 logic 			psel 						;
		 logic 			penable 					;
		 logic 			pwrite 						;
		 logic 			[DATA_WIDTH-1:0] pwdata		;
		 logic 		    [ADDR_WIDTH-1 :0] paddr 	;
		 logic 			transfer_reg 				;
		 logic 			postexec					;
		 logic 			[DATA_WIDTH-1:0] command_reg;
		 logic 			[2:0] cmderr 				;
		 logic 			dmactive					;
		 logic 			busy 						;
		 logic 			halted 						;
		 logic 			running						;
         logic            done                        ;
         logic            reset                       ;
         logic            hartreset                   ;
    //   logic            h_reset                     ;
       
      

        assign reset = (hartreset || ndmreset ) ? 1'b1 : 1'b0 ;
	
        /*
		=============== Instatiation of JTAG TOP =============== 
	                                                          */
		jtag_apb_master_interface
		#(.DWIDTH        (DWIDTH          ), // DATA WIDTH for DMI Register
		.AWIDTH          (AWIDTH          ), // ADDRESS WIDTH for DMI Register
		.IR_BITS         (IR_BITS         ), // parameter declaration for Instruction length						
		.VERSION         (VERSION         ), // IDCODE Register VERSION
		.PART_NO         (PART_NO         ), // IDCODE Register PART Number
		.MANF_ID         (MANF_ID         )  // IDCODE Register Manufacture ID 
										  ) jtag_apb_master_interface_instance 
		(
        .*
        /*
		.TCK             (TCK             ), // Test Clock Input
		.TRST            (TRST            ), // Test Reset Input: asynch active low reset
		.TMS             (TMS             ), // Test Mode Select Input
		.TDI             (TDI             ), // Test Data Input
		.TDO             (TDO             ), // Test Data Output
		.tdo_en          (tdo_en          ), // TDO output logic enable: this flag is high when state is in Shift_IR | Shift_DR
	  //.dmi_reset       (dmi_reset       ), // DTMCS Register 16th pin
	  //.cmd_type        (cmd_type        ), // this type determines the overall functionality of abstract command
	  //.control_out     (control_out     ), // this field described for each abstract command
		.pclock		  	 (pclock    	  ), // System clock
		.presetn		 (presetn		  ), // Active low reset signal
		.prdata			 (prdata		  ), // read data from DM registers by slave
		.pready 	 	 (pready		  ), // Ready signal coming from APB Slave 
		.pslverr 		 (pslverr		  ), // Error Signal coming from APB Slave
		.psel 			 (psel   		  ), // Selecct signal
		.pwrite			 (pwrite		  ), // Write signal 1 indicates write 0 indicates read
		.penable		 (penable		  ), // Enable signal
		.paddr 			 (paddr		  	  ), // Address signal going to slave
		.pwdata 		 (pwdata		  ) 
        */
	                                     );
		/* 
		=============== End of JTAG TOP =============== 
	                                                 */								   
	
									 
		/* 
		================== Instatiation of APB Slave DM reg top ================= 
																	 */
		apb_slave_dmreg_top 
		#(
		.ADDR_WIDTH    (ADDR_WIDTH        ), // 32 bit address bit
		.DATA_WIDTH    (DATA_WIDTH        )  // 32 bit data bit

										  )
		apb_slave_dmreg_top_instnc     	  (
        .*
        /*
		.pclock		     (pclock		  ), // System clock
		.presetn	     (presetn		  ), // Active low reset signal
		.psel		     (psel			  ), // Select signal
		.penable		 (penable		  ), // Enable signal coming from Master
		.pwrite			 (pwrite		  ), // write signal coming from Master 1 for write , 0 for rread
		.paddr			 (paddr		  	  ), // Address signal coming from Master
		.pwdata			 (pwdata		  ), // write data coming from Master
		.prdata			 (prdata		  ), // Data read from DM registers going to Master
		.pready			 (pready		  ), // Ready signal going tto Master
		.pslverr 		 (pslverr		  ), // Error signal indicates failure of transaction going to Master
		.running(running)							,
		.halted(halted)								,
        .h_reset(h_reset)                           ,
        .done(done)                                 ,
		.busy(busy)									,
		.exception(exception)						,
		.dmactive(dmactive)							,
		.ndmreset(ndmreset)							,
		.clrresethaltreq(clrresethaltreq)			,
		.setresethaltreq(setresethaltreq)			,
		.hartreset(hartreset)						,
		.resumereq(resumereq)						,
		.haltreq(haltreq)							,
		.transfer_reg(transfer_reg)					,
		.postexec(postexec)							,
		.command_reg(command_reg)					,
		.cmderr(cmderr)								,
		.cmdtype(cmdtype)							,
		.debug_reg_write_enable(debug_reg_write_enable),
		.debug_reg_write_data(debug_reg_write_data)	,
		.debug_reg_read_data(debug_reg_read_data)	,
		.debug_reg_read_valid(debug_reg_read_valid)	,
		.debug_reg_read_enable(debug_reg_read_enable),
		.debug_reg_address(debug_reg_address)        ,
        .debug_mem_read_data(debug_mem_read_data),
        .debug_mem_read_valid(debug_mem_read_valid),
        .debug_mem_write_enable(debug_mem_write_enable),
        .debug_mem_read_enable(debug_mem_read_enable),
        .debug_mem_read_addr(debug_mem_read_addr),
        .debug_mem_write_addr(debug_mem_write_addr),
        .debug_mem_write_data(debug_mem_write_data),
        .debug_mem_strobe(debug_mem_strobe)
        */

		
	
													);						
	/* 
	  ====================== End of APB Slave DM Reg Top ===================== 
																	*/
																	
	/* 
	  ====================== Start of Debug Module FSM ===================== 
		
															*/
		debug_module_fsm  debug_module_fsm_instnc			
											(
                                            .*,
         /*                                   
		.pclock(pclock) 					,
		.presetn(presetn)					,
		.dmactive(dmactive)					,
		.setresethaltreq(setresethaltreq)	,
		.clrresethaltreq(clrresethaltreq)	,
        .resethaltreq(resethaltreq)         ,
        */
		.hartreset(reset)				,
        //.h_reset(h_reset)                   ,
        /*
		.resumereq(resumereq)				,
		.haltreq(haltreq)					,
		.step(step)					 		,
		.ebreak(ebreak)						,
        */
		.command(command_reg)				
        /*
		.cmderr(cmderr)						,
        .exception(exception)               ,
		.transfer_reg(transfer_reg)			,
		.postexec(postexec)					,	
		.busy(busy)		  				   	,
		.halted(halted)						,
        .h_reset(h_reset)                   ,
        .done(done)                         ,
		.running(running)				
        */
        );

		
	/* 
	  ====================== End of Debug Module FSM ===================== 
		
															*/

endmodule
