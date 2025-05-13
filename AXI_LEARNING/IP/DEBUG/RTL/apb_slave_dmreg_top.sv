`timescale 1ns/1ps
module apb_slave_dmreg_top 
														   #(
		parameter 	ADDR_WIDTH = 32							,	// 32 bit address bit
		parameter 	DATA_WIDTH = 32	   						,	//  32 bit data bit

        parameter   CORE_DATA_WIDTH = 32
															)
															(
		// Inputs of APB Slave
		
		 input logic 		pclock 									,	// System Clock signal
		 input logic 		presetn									,	// Active low reset signal
		 input logic 		psel									,	// Select signal coming from APB Master
		 input logic 		penable									,	// Enable signal coming from APB Master
		 input logic 		pwrite 									,	// Write signal coming from APB Master
		 input logic 		[ADDR_WIDTH-1:0] paddr					,	// Address coming from APB Master
		 input logic 		[DATA_WIDTH-1:0] pwdata					,	// Data signal coming from APB Master
		
		//Inputs coming from Debug Module FSM
		
		 input logic 		running									,
		 input logic 		halted									,
         input logic       h_reset                                 ,
         input logic       done                                    ,
		 input logic 		busy									,
		
		// inputs coming from TOP
		 input logic 		exception								,
		 input logic 		[CORE_DATA_WIDTH-1:0]debug_reg_read_data				,
		 input logic 		debug_reg_read_valid					,
         input logic       [CORE_DATA_WIDTH-1:0] debug_mem_read_data              ,
         input logic       debug_mem_read_valid                    ,
		
		//outputs of APB Slave
		
		 output logic 		[DATA_WIDTH-1:0] prdata					,	//  output logic data signal going to APB Master
		 output logic   	pready									,	// Ready signal going to APB Master
		 output logic  	    pslverr								    ,	// Error signal indicates failure of transfer
		 output logic 		dmactive								,
		 output logic 		ndmreset								,
		 output logic 		clrresethaltreq							,
		 output logic 		setresethaltreq							,
		 output logic 		hartreset								,
		 output logic 		resumereq								,
		 output logic 		haltreq									,
		 output logic  	    transfer_reg 							,
		 output logic 		postexec 								,
		 output logic 		[2:0] cmderr							,
		 output logic 		[31:0] command_reg						,
		 output logic 		debug_reg_write_enable 					,
		 output logic 		[7:0] cmdtype							,
		 output logic 		debug_reg_read_enable					,
		 output logic 		[15:0]debug_reg_address					,
		 output logic 		[CORE_DATA_WIDTH-1:0]debug_reg_write_data,

         output logic      debug_mem_read_enable                   ,
         output logic      debug_mem_write_enable                  ,
         output logic      [CORE_DATA_WIDTH-1:0]debug_mem_read_addr,
         output logic      [CORE_DATA_WIDTH-1:0]debug_mem_write_addr,
         output logic      [CORE_DATA_WIDTH-1:0]debug_mem_write_data ,
         output logic      [(CORE_DATA_WIDTH>>3)-1:0] debug_mem_strobe                  
                                                            );
                                                   
		
		// declaration of wires
		
		  logic 		[DATA_WIDTH-1:0] dmstatus_reg			;
		  logic 		[DATA_WIDTH-1:0] hartinfo_reg			;
		  logic		[DATA_WIDTH-1:0] abstractcs_reg			;
		  logic  		[DATA_WIDTH-1:0] dmcontrol_reg			;
		  logic 		[DATA_WIDTH-1:0] data0_reg				;
		  logic  		[DATA_WIDTH-1:0] data1_reg				;
		  logic 		[DATA_WIDTH-1:0] data2_reg				;
		  logic		[DATA_WIDTH-1:0] data3_reg				;
        `ifdef PROGRAM_BUFFER_VALID
		  logic 		[DATA_WIDTH-1:0] data4_reg				;
		  logic 		[DATA_WIDTH-1:0] data5_reg				;
		  logic 		[DATA_WIDTH-1:0] data6_reg				;
		  logic  		[DATA_WIDTH-1:0] data7_reg				;
		  logic 		[DATA_WIDTH-1:0] data8_reg				;
		  logic  		[DATA_WIDTH-1:0] data9_reg				;
		  logic  		[DATA_WIDTH-1:0] data10_reg				;
		  logic  		[DATA_WIDTH-1:0] data11_reg				;
		  logic  		[DATA_WIDTH-1:0] progbuf0_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf1_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf2_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf3_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf4_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf5_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf6_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf7_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf8_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf9_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf10_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf11_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf12_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf13_reg			;
		  logic  		[DATA_WIDTH-1:0] progbuf14_reg			;
		  logic   		[DATA_WIDTH-1:0] progbuf15_reg	   		;
    `endif
		
		
		// dm register instantiation
		
		dm_register_file #(
					.ADDR_WIDTH(ADDR_WIDTH      			), // 32 bit address bit
					.DATA_WIDTH(DATA_WIDTH      			),  // 32 bit data bit
                    .CORE_DATA_WIDTH(CORE_DATA_WIDTH)
															) 
		dm_register_file_instnc 		
															(
					.pclock(pclock)							,
					.presetn(presetn)						,
					.psel(psel)								,
					.penable(penable)						,
					.pwrite(pwrite)							,
					.paddr(paddr)							,
					.pwdata(pwdata)							,
					.running(running)						,
					.halted(halted)							,
                    .h_reset(h_reset)                       ,
                    .done(done)                             ,
					.busy(busy)								,
					.exception(exception)					,
					.dmstatus_reg(dmstatus_reg)				,
					.hartinfo_reg(hartinfo_reg)				,
					.command_reg(command_reg)				,
					.abstractcs_reg(abstractcs_reg)			,
					.dmcontrol_reg(dmcontrol_reg)			,
					.data0_reg(data0_reg)					,
					.data1_reg(data1_reg)					,
					.data2_reg(data2_reg)					,
					.data3_reg(data3_reg)					,
                    `ifdef PROGRAM_BUFFER_VALID
					.data4_reg(data4_reg)					,
					.data5_reg(data5_reg)					,
					.data6_reg(data6_reg)					,
					.data7_reg(data7_reg)					,
					.data8_reg(data8_reg)					,
					.data9_reg(data9_reg)					,
					.data10_reg(data10_reg)					,
					.data11_reg(data11_reg)					,
					.progbuf0_reg(progbuf0_reg)				,
					.progbuf1_reg(progbuf1_reg)				,
					.progbuf2_reg(progbuf2_reg)				,
					.progbuf3_reg(progbuf3_reg)				,
					.progbuf4_reg(progbuf4_reg)				,
					.progbuf5_reg(progbuf5_reg)				,
					.progbuf6_reg(progbuf6_reg)				,
					.progbuf7_reg(progbuf7_reg)				,
					.progbuf8_reg(progbuf8_reg)				,
					.progbuf9_reg(progbuf9_reg)				,
					.progbuf10_reg(progbuf10_reg)			,
					.progbuf11_reg(progbuf11_reg)			,
					.progbuf12_reg(progbuf12_reg)			,
					.progbuf13_reg(progbuf13_reg)			,
					.progbuf14_reg(progbuf14_reg)			,
					.progbuf15_reg(progbuf15_reg)		  	,
                `endif
					.dmactive(dmactive)						,
					.ndmreset(ndmreset)						,
					.clrresethaltreq(clrresethaltreq)		,
					.setresethaltreq(setresethaltreq)		,
					.hartreset(hartreset)					,
					.resumereq_o(resumereq)					,
					.haltreq(haltreq)						,
					.transfer_reg(transfer_reg)				,
					.postexec(postexec)						,
					.cmderr(cmderr)							,
					.cmdtype(cmdtype)						,
					.debug_reg_write_data(debug_reg_write_data),
					.debug_reg_read_data(debug_reg_read_data),
					.debug_reg_read_enable(debug_reg_read_enable),
					.debug_reg_write_enable(debug_reg_write_enable)	,
					.debug_reg_read_valid(debug_reg_read_valid),
					.debug_reg_address(debug_reg_address)   ,
                    .debug_mem_read_data(debug_mem_read_data),
                    .debug_mem_read_valid(debug_mem_read_valid),
                    .debug_mem_write_enable(debug_mem_write_enable),
                    .debug_mem_read_enable(debug_mem_read_enable),
                    .debug_mem_read_addr(debug_mem_read_addr),
                    .debug_mem_write_addr(debug_mem_write_addr),
                    .debug_mem_write_data(debug_mem_write_data),
                    .debug_mem_strobe(debug_mem_strobe)     
														   );
					
		// dm register mux instantiation
		
		dm_register_mux #(
					.ADDR_WIDTH(ADDR_WIDTH)					, // 32 bit address bit
					.DATA_WIDTH(DATA_WIDTH)  				  // 32 bit data bit		
															) 
					dm_register_mux_instnc 		
															(
					.clock(pclock)							,
					.resetn(presetn)						,
					.sel(psel)								,
					.enable(penable)						,
					.write(pwrite)			 				,
					.addr(paddr)							,
					.dmstatus_reg(dmstatus_reg)				,
					.hartinfo_reg(hartinfo_reg) 			,
					.command_reg(command_reg)				,
					.abstractcs_reg(abstractcs_reg)			,
					.dmcontrol_reg(dmcontrol_reg)			,
					.data0_reg(data0_reg)					,
					.data1_reg(data1_reg)					,
					.data2_reg(data2_reg)					,
					.data3_reg(data3_reg)					,
                    `ifdef PROGRAM_BUFFER_VALID
					.data4_reg(data4_reg)					,
					.data5_reg(data5_reg)					,
					.data6_reg(data6_reg)					,
					.data7_reg(data7_reg)					,
					.data8_reg(data8_reg)					,
					.data9_reg(data9_reg)					,
					.data10_reg(data10_reg)					,
					.data11_reg(data11_reg)					,
					.progbuf0_reg(progbuf0_reg)				,
					.progbuf1_reg(progbuf1_reg)				,
					.progbuf2_reg(progbuf2_reg)				,
					.progbuf3_reg(progbuf3_reg)				,
					.progbuf4_reg(progbuf4_reg)				,
					.progbuf5_reg(progbuf5_reg)				,
					.progbuf6_reg(progbuf6_reg)				,
					.progbuf7_reg(progbuf7_reg)				,
					.progbuf8_reg(progbuf8_reg)				,
					.progbuf9_reg(progbuf9_reg)				,
					.progbuf10_reg(progbuf10_reg)			,
					.progbuf11_reg(progbuf11_reg)			,
					.progbuf12_reg(progbuf12_reg)			,
					.progbuf13_reg(progbuf13_reg)			,
					.progbuf14_reg(progbuf14_reg)			,
					.progbuf15_reg(progbuf15_reg)	  		,
                `endif
					.reg_data_out(prdata)	  	 	       );
					
		// Pready logic
		
		always_ff @(negedge pclock or negedge presetn)
			begin
				if(!presetn)
					begin
						pready <= 1'b0;
					end
				else  
					begin
						if(psel && penable && !pwrite)			
							begin
								pready <= 1'b1; 
							end
						else if(psel && penable && pwrite)
							begin  
								pready <= 1'b1;
							end
						else 
							begin
								pready <= 1'b0;
							end
					end
			end
		
		
		// Pslverr logic
		
		always_comb
			begin
				if(!presetn)
					begin
						pslverr = 1'b0;
					end
				else 
					begin
						if(psel && penable)
							begin
								if((paddr <  32'h00000004) ||
								   (paddr >  32'h0000002F) ||
								   (paddr == 32'h00000013) || 
								   (paddr == 32'h00000014) ||
								   (paddr == 32'h00000015) || 
								   (paddr == 32'h00000018) || 
								   (paddr == 32'h00000019))
								   
									begin
										pslverr = 1'b1;	
									end
								else 
									begin
										pslverr = 1'b0;
									end
							end
						else
							begin
								pslverr = 1'b0;
							end
					end
			end
								
									
endmodule
