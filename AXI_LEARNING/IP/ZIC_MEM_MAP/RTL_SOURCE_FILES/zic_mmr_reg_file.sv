`timescale 1ns/1ps
module zic_mmr_reg_file
(
      input logic 				    zic_clk				        ,
      input logic 				    zic_rst				        ,
      input logic 				    zic_mmr_write_en_i		    ,//store write enable
      input logic  [15:0]			zic_mmr_write_addr_i		,//store write address
      input logic  [31:0]			zic_mmr_write_data_i		,//store write data
      input logic  				    zic_int_pending_valid_i 	,	
      input logic  [47:0] 	    	zic_int_pending_bit_i		,//zic interrupt pending bits
      input logic  [47:0]	    	global_int_enable_bit_i		,//zic interrupt enable signal
      input logic 				    global_int_enable_valid_i	,
      input logic 				    zic_ack_valid_i			,//from zic 
      input logic  [7:0] 			zic_ack_int_id_i		,
      input logic 				    zic_nxtp_valid_i		,	
      input logic  [7 :0]			zic_nxtp_id_i			,
      input logic 				    zic_eoi_valid_i			,
      input logic  [7 :0]			zic_eoi_id_i			,
      output logic [7 :0] 			zic_ack_int_id_o		,
      output logic [7 :0]   		zic_eoi_o			    ,
      output logic [7 :0]   		zic_cfg_o			    ,
      output logic [31:0] 			zic_info_o			    ,
      output logic [7 :0]			zic_nxtp_o			    ,
      output logic [31:0]			irq0_ctrl_o 			,		
      output logic [31:0]			irq1_ctrl_o 			,
      output logic [31:0]			irq2_ctrl_o 			,
      output logic [31:0]			irq3_ctrl_o 			,
      output logic [31:0]			irq4_ctrl_o 			,
      output logic [31:0]			irq5_ctrl_o 			,
      output logic [31:0]			irq6_ctrl_o 			,
      output logic [31:0]			irq7_ctrl_o 			,
      output logic [31:0]			irq8_ctrl_o 			,
      output logic [31:0]			irq9_ctrl_o 			,
      output logic [31:0]			irq10_ctrl_o			,
      output logic [31:0]			irq11_ctrl_o			,
      output logic [31:0]			irq12_ctrl_o			,
      output logic [31:0]			irq13_ctrl_o			,
      output logic [31:0]			irq14_ctrl_o			,
      output logic [31:0]			irq15_ctrl_o			,
      output logic [31:0]			irq16_ctrl_o			,
      output logic [31:0]			irq17_ctrl_o			,
      output logic [31:0]			irq18_ctrl_o			,
      output logic [31:0]			irq19_ctrl_o			,
      output logic [31:0]			irq20_ctrl_o			,
      output logic [31:0]			irq21_ctrl_o			,
      output logic [31:0]			irq22_ctrl_o			,
      output logic [31:0]			irq23_ctrl_o			,
      output logic [31:0]			irq24_ctrl_o			,
      output logic [31:0]			irq25_ctrl_o			,
      output logic [31:0]			irq26_ctrl_o			,
      output logic [31:0]			irq27_ctrl_o			,
      output logic [31:0]			irq28_ctrl_o			,
      output logic [31:0]			irq29_ctrl_o			,
      output logic [31:0]			irq30_ctrl_o			,
      output logic [31:0]			irq31_ctrl_o			,
      output logic [31:0]			irq32_ctrl_o			,
      output logic [31:0]			irq33_ctrl_o			,
      output logic [31:0]			irq34_ctrl_o			,
      output logic [31:0]			irq35_ctrl_o			,
      output logic [31:0]			irq36_ctrl_o			,
      output logic [31:0]			irq37_ctrl_o			,
      output logic [31:0]			irq38_ctrl_o			,
      output logic [31:0]			irq39_ctrl_o			,
      output logic [31:0]			irq40_ctrl_o			,
      output logic [31:0]			irq41_ctrl_o			,
      output logic [31:0]			irq42_ctrl_o			,
      output logic [31:0]			irq43_ctrl_o			,
      output logic [31:0]			irq44_ctrl_o			,
      output logic [31:0]			irq45_ctrl_o			,
      output logic [31:0]			irq46_ctrl_o			,
      output logic [31:0]			irq47_ctrl_o			,
      output logic [47:0] 			zic_int_en_o			,//to zic 
      output logic [31:0] 			wdt_counter_o			,		
      output logic [31:0] 			wdt_ctrl_o			    ,
      output logic 			        wdt_irq_o			    ,
      output logic [31:0] 			wdt_timeout_reg_o       ,
      input logic                   debug_mode_valid_i      ,
      input logic                   debug_mode_reset_i      ,
      input logic                   debug_ndm_reset_i       ,
      output logic                  wdt_reset_o  
    
    
    );

    zic_mmr_ack  
    zic_mmr_ack_inst
    (
    .*,
    /*
    .zic_clk			(zic_clk		),
    .zic_rst			(zic_rst		),
    */
    .wdt_reset_i        (wdt_reset_o),
    .zic_mmr_write_addr		(zic_mmr_write_addr_i	),
    .zic_mmr_write_data		(zic_mmr_write_data_i	),
    .zic_mmr_write_en		(zic_mmr_write_en_i	),
    .zic_ack_valid			(zic_ack_valid_i	),//from zic 
    .zic_ack_int_id_i		(zic_ack_int_id_i	),
    .zic_ack_int_id_o		(zic_ack_int_id_o	)
    /*
    .debug_mode_valid_i             (debug_mode_valid_i         ),
    .debug_mode_reset_i             (debug_mode_reset_i        ),
    .debug_ndm_reset_i              (debug_ndm_reset_i               )
    */
    );
    
    	
    wdt_mmr_csr wdt_mmr_csr_inst
    (
        .*,
    	.wdt_clk_i		(zic_clk		),
    	.wdt_rst_i		(zic_rst		),
    	.wdt_write_addr_i 	(zic_mmr_write_addr_i	),
    	.wdt_write_data_i 	(zic_mmr_write_data_i	),
    	.wdt_write_en_i		(zic_mmr_write_en_i	),
        /*
    	.wdt_counter_o		(wdt_counter_o		),
    	.wdt_timeout_reg_o	(wdt_timeout_reg_o	),
    	.wdt_ctrl_o		(wdt_ctrl_o		),
        */
    	.wdt_interrupt_o  	(wdt_irq_o		), // WDT interrupt request signal   output logic
    	.wdt_reset_o		(wdt_reset_o), // WDT reset   output logic, active low //unconnected
    	.stop_mode_i		(1'b0), // System STOP Mode
    	.wait_mode_i		(1'b0), // System WAIT Mode
    	.debug_mode_i		(debug_mode_valid_i)	  // System DEBUG Mode
        /*
        .debug_mode_valid_i             (debug_mode_valid_i         ),
    .debug_mode_reset_i             (debug_mode_reset_i        ),
    .debug_ndm_reset_i              (debug_ndm_reset_i               )
    */
    );
    
    
    zic_mmr_cfg #(.CFG_MMR_ADDR(16'h0000)) 
    zic_mmr_cfg_inst
    (
    .*,
    /*
    .zic_clk			        (zic_clk		),
    .zic_rst			        (zic_rst		),
    */
    .wdt_reset_i        (wdt_reset_o),
    .zic_mmr_write_addr		    (zic_mmr_write_addr_i	),
    .zic_mmr_write_data		    (zic_mmr_write_data_i	),
    .zic_mmr_write_en		    (zic_mmr_write_en_i	)
    /*
    .zic_cfg_o			        (zic_cfg_o		),
    .debug_mode_valid_i             (debug_mode_valid_i         ),
    .debug_mode_reset_i             (debug_mode_reset_i        ),
    .debug_ndm_reset_i              (debug_ndm_reset_i               )
    */
    );
    
    
    zic_mmr_info #(.INFO_MMR_ADDR(16'h0004)) 
    zic_mmr_info_inst(
    .*,
    /*
    .zic_clk			(zic_clk		),
    .zic_rst			(zic_rst		),
    */
    .wdt_reset_i        (wdt_reset_o),
    .zic_mmr_write_addr		(zic_mmr_write_addr_i	),
    .zic_mmr_write_data		(zic_mmr_write_data_i	),
    .zic_mmr_write_en		(zic_mmr_write_en_i	)
    //.zic_info_o			(zic_info_o		)
    );
    
    
    zic_mmr_eoi 
    zic_eoi_cfg_inst(
    .*,
    /*
    .zic_clk			(zic_clk		),
    .zic_rst			(zic_rst		),
    */
    .wdt_reset_i        (wdt_reset_o),
    .zic_eoi_valid		(zic_eoi_valid_i	),
    .zic_eoi_id			(zic_eoi_id_i		)
    /*
    .zic_eoi_o			(zic_eoi_o		),
    .debug_mode_valid_i             (debug_mode_valid_i         ),
    .debug_mode_reset_i             (debug_mode_reset_i        ),
    .debug_ndm_reset_i              (debug_ndm_reset_i               )
    */
    );
    
    zic_mmr_nxtp 
    zic_mmr_nxtp_inst
    (
    .*,
    /*
    .zic_clk			(zic_clk		),
    .zic_rst			(zic_rst		),
    */
    .wdt_reset_i        (wdt_reset_o),
    .zic_nxtp_valid		(zic_nxtp_valid_i	),
    .zic_nxtp_id		(zic_nxtp_id_i		)
    /*
    .zic_nxtp_o			(zic_nxtp_o		),
    .debug_mode_valid_i             (debug_mode_valid_i         ),
    .debug_mode_reset_i             (debug_mode_reset_i        ),
    .debug_ndm_reset_i              (debug_ndm_reset_i               )
    */
    );
    
    zic_mmr_ctrl zic_mmr_ctrl_inst
    (
    .*,
    /*
    .zic_clk			(zic_clk			),
    .zic_rst			(zic_rst			),
    */
    .wdt_reset_i        (wdt_reset_o),
    .zic_mmr_write_addr		(zic_mmr_write_addr_i		),
    .zic_mmr_write_data		(zic_mmr_write_data_i		),
    .zic_mmr_write_en		(zic_mmr_write_en_i		),
    .zic_int_pending_bit		(zic_int_pending_bit_i		),
    .zic_int_pending_valid		(zic_int_pending_valid_i	),
    .global_int_enable_bit		(global_int_enable_bit_i	),
    .global_int_enable_valid 	(global_int_enable_valid_i	)
    /*
    .irq0_ctrl_o			(irq0_ctrl_o 			),
    .irq1_ctrl_o			(irq1_ctrl_o 			),
    .irq2_ctrl_o			(irq2_ctrl_o 			),
    .irq3_ctrl_o			(irq3_ctrl_o 			),
    .irq4_ctrl_o			(irq4_ctrl_o 			),
    .irq5_ctrl_o			(irq5_ctrl_o 			),
    .irq6_ctrl_o			(irq6_ctrl_o 			),
    .irq7_ctrl_o			(irq7_ctrl_o 			),
    .irq8_ctrl_o			(irq8_ctrl_o 			),
    .irq9_ctrl_o			(irq9_ctrl_o 			),
    .irq10_ctrl_o			(irq10_ctrl_o			),
    .irq11_ctrl_o			(irq11_ctrl_o			),
    .irq12_ctrl_o			(irq12_ctrl_o			),
    .irq13_ctrl_o			(irq13_ctrl_o			),
    .irq14_ctrl_o			(irq14_ctrl_o			),
    .irq15_ctrl_o			(irq15_ctrl_o			),
    .irq16_ctrl_o			(irq16_ctrl_o			),
    .irq17_ctrl_o			(irq17_ctrl_o			),
    .irq18_ctrl_o			(irq18_ctrl_o			),
    .irq19_ctrl_o			(irq19_ctrl_o			),
    .irq20_ctrl_o			(irq20_ctrl_o			),
    .irq21_ctrl_o			(irq21_ctrl_o			),
    .irq22_ctrl_o			(irq22_ctrl_o			),
    .irq23_ctrl_o			(irq23_ctrl_o			),
    .irq24_ctrl_o			(irq24_ctrl_o			),
    .irq25_ctrl_o			(irq25_ctrl_o			),
    .irq26_ctrl_o			(irq26_ctrl_o			),
    .irq27_ctrl_o			(irq27_ctrl_o			),
    .irq28_ctrl_o			(irq28_ctrl_o			),
    .irq29_ctrl_o			(irq29_ctrl_o			),
    .irq30_ctrl_o			(irq30_ctrl_o			),
    .irq31_ctrl_o			(irq31_ctrl_o			),
    .irq32_ctrl_o			(irq32_ctrl_o			),
    .irq33_ctrl_o			(irq33_ctrl_o			),
    .irq34_ctrl_o			(irq34_ctrl_o			),
    .irq35_ctrl_o			(irq35_ctrl_o			),
    .irq36_ctrl_o			(irq36_ctrl_o			),
    .irq37_ctrl_o			(irq37_ctrl_o			),
    .irq38_ctrl_o			(irq38_ctrl_o			),
    .irq39_ctrl_o			(irq39_ctrl_o			),
    .irq40_ctrl_o			(irq40_ctrl_o			),
    .irq41_ctrl_o			(irq41_ctrl_o			),
    .irq42_ctrl_o			(irq42_ctrl_o			),
    .irq43_ctrl_o			(irq43_ctrl_o			),
    .irq44_ctrl_o			(irq44_ctrl_o			),
    .irq45_ctrl_o			(irq45_ctrl_o			),
    .irq46_ctrl_o			(irq46_ctrl_o			),
    .irq47_ctrl_o			(irq47_ctrl_o			),
    .zic_int_en_o			(zic_int_en_o			)
    */
    /*.debug_mode_valid_i             (debug_mode_valid_i         ),
    .debug_mode_reset_i             (debug_mode_reset_i        ),
    .debug_ndm_reset_i              (debug_ndm_reset_i               )*/
    
    );
    endmodule
    
    ////////////////////////////////////////////////////
    //acknowledge mmr
    //stores the interrupt id value of requested interrupt
    ////////////////////////////////////////////////////
    module zic_mmr_ack #(parameter CFG_MMR_ACK = 16'h0804) 
    (
      input logic 		zic_clk			,
      input logic 		zic_rst			,
      input logic       wdt_reset_i     ,
      input logic [15:0] 	zic_mmr_write_addr	,
      input logic [31:0] 	zic_mmr_write_data	,
      input logic 	     	zic_mmr_write_en	,
      input logic 		zic_ack_valid		,//from zic 
      input logic [7:0]	zic_ack_int_id_i	,
      output logic [7:0]	zic_ack_int_id_o,
      input logic debug_mode_valid_i             ,
      input logic debug_mode_reset_i             ,
      input logic debug_ndm_reset_i              
    
    
    );
    
       logic [7:0] zic_ack_int_id_r;
    
    always_ff @(posedge zic_clk or negedge zic_rst )
    begin
    	if((!zic_rst) )
    	begin
    		zic_ack_int_id_r <= 8'd0;
    	end
        else if(debug_mode_reset_i |debug_ndm_reset_i| wdt_reset_i )
        begin
            		zic_ack_int_id_r <= 8'd0;
    
        end
    	else
    	begin
    		if(zic_ack_valid)
    			begin
    				zic_ack_int_id_r <= zic_ack_int_id_i;
    			end
    	end
    end
    
    assign zic_ack_int_id_o = zic_ack_int_id_r;
    endmodule
    
    ////////////////////////////////////////////////////////////////////
    //zic memory mapped configuration register
    //defines how many previlege modes are supported
    //defines how level and priority bits are devided
    
    module zic_mmr_cfg #(parameter CFG_MMR_ADDR = 16'h0000) 
    (
      input logic 		zic_clk			,
      input logic 		zic_rst			,
      input logic       wdt_reset_i     ,
      input logic [15:0] 	zic_mmr_write_addr	,
      input logic [31:0] 	zic_mmr_write_data	,
      input logic 	     	zic_mmr_write_en	,
      output logic 	[7:0]   zic_cfg_o		,
      input logic debug_mode_valid_i             ,
      input logic debug_mode_reset_i             ,
      input logic debug_ndm_reset_i              
    
    
    );
    
    //   logic [7:0] zic_cfg_r;
    
    localparam NMBITS = 2'b00;
    localparam NLBITS = 4'b0011;
    localparam NVBITS = 1'b1;
    
    assign zic_cfg_o = {1'b0,NMBITS,NLBITS,NVBITS};
    endmodule
    /////////////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////////////////
    //zic memory mapped information register
    //has required information about zic
    
    module zic_mmr_info #(parameter INFO_MMR_ADDR = 16'd0004) 
    (
      input logic 		zic_clk			,
      input logic 		zic_rst			,
      input logic       wdt_reset_i     ,
      input logic [15:0] 	zic_mmr_write_addr	,
      input logic [31:0] 	zic_mmr_write_data	,
      input logic 	     	zic_mmr_write_en	,
      output logic 	[31:0]   zic_info_o		
    );
    
    //   logic [31:0] zic_info_r;
    localparam NUM_TRIG	= 6'd0	;
    localparam ZIC_INT_CTL	= 4'd6	;
    localparam ARCH_VER	= 4'd0	;
    localparam IMPL_VER	= 4'd0	;
    localparam NUM_IRQ 	= 13'd48;
    
    
    assign zic_info_o = {1'b0,NUM_TRIG,ZIC_INT_CTL,ARCH_VER,IMPL_VER,NUM_IRQ};
    endmodule
    
    //////////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////////////////////
    //zic memory mapped end of interrupt id register
    //stores the id of a interrup whose service is completed by the processor
    ///////////////////////////////////////////////////////////////////////////////////
    
    module zic_mmr_eoi 
    (
      input logic 		zic_clk			,
      input logic 		zic_rst			,
      input logic       wdt_reset_i     ,
      input logic 		zic_eoi_valid		,
      input logic 	[7:0]	zic_eoi_id		,
      output logic 	[7:0]   zic_eoi_o		,
      input logic debug_mode_valid_i             ,
      input logic debug_mode_reset_i             ,
      input logic debug_ndm_reset_i              
    
    
    );
    
       logic [7:0] zic_eoi_r;
    
    always_ff@(posedge zic_clk or negedge zic_rst )
    begin
    	if((!zic_rst) )
    	begin
    		zic_eoi_r <= 8'd0;
    	end
        else if(debug_mode_reset_i |debug_ndm_reset_i| wdt_reset_i )
        begin
            		zic_eoi_r <= 8'd0;
        end
    	else
    	begin
    		if(zic_eoi_valid)
    			begin
    				zic_eoi_r <= zic_eoi_id;
    			end
    	end
    end
    
    assign zic_eoi_o = zic_eoi_r;
    endmodule
    
    ////////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////////////
    //stores the level and priority of highest pending interrupt
    //for software read purpose
    /////////////////////////////////////////////////////////////////////////////////
    
    module zic_mmr_nxtp 
    (
      input logic 		zic_clk			,
      input logic 		zic_rst			,
      input logic       wdt_reset_i     ,
      input logic 		zic_nxtp_valid		,
      input logic 	[7:0]	zic_nxtp_id		,
      output logic 	[7:0]   zic_nxtp_o		,
      input logic debug_mode_valid_i             ,
      input logic debug_mode_reset_i             ,
      input logic debug_ndm_reset_i              
    
    
    );
    
       logic [7:0] zic_nxtp_r;
    
    always_ff @(posedge zic_clk or negedge zic_rst )
    begin
    	if((!zic_rst) )
    	begin
    
    		zic_nxtp_r <= 8'd0;
    	end
        else if(debug_mode_reset_i |debug_ndm_reset_i | wdt_reset_i )
        begin
            		zic_nxtp_r <= 8'd0;
    
        end
    	else
    	begin
    		if(zic_nxtp_valid)
    			begin
    				zic_nxtp_r <= zic_nxtp_id;
    			end
    	end
    end
    
    assign zic_nxtp_o = zic_nxtp_r;
    endmodule
    
    module wdt_mmr_csr
    (
      input logic  		       wdt_clk_i		 ,
      input logic  		       wdt_rst_i		 ,
      input logic   [15 :0]    wdt_write_addr_i	    ,
      input logic   [31:0] 	   wdt_write_data_i	    ,
      input logic   	       wdt_write_en_i	,
      output logic  [31:0]     wdt_counter_o	,
      output logic  [31:0]     wdt_timeout_reg_o	,
      output logic  [31:0] 	   wdt_ctrl_o		,
      output logic  	       wdt_interrupt_o	, // WDT interrupt request signal   output logic
      output logic  	    wdt_reset_o		, // WDT reset   output logic, active low
      input logic   	    stop_mode_i		, // System STOP Mode
      input logic  	 	    wait_mode_i		, // System WAIT Mode
      input logic   	    debug_mode_i	,	  // System DEBUG Mode
      input logic debug_mode_valid_i             ,
      input logic debug_mode_reset_i             ,
      input logic debug_ndm_reset_i              
    
    
    );
    
    
    //   logic    [31:0]	timeout_value	;		
       logic    [1:0] 	wdt_interrupt	;	
       logic 		debug_enable 	;
       logic 		stop_enable	;
       logic 		wait_enable	;
       logic 		reload_event	;
       logic		wdt_event	;
       logic		clear_event	;
    
    
    WDT_COUNTER wdt_counter_inst
    (
    .*,
    .wdt_clk		(wdt_clk_i	), 				
    .wdt_rst		(wdt_rst_i	),	
    .wdt_counter		(wdt_counter_o	),	
    /*
    .wdt_reset_o		(wdt_reset_o	),	
    .wdt_interrupt_o	(wdt_interrupt_o),	
    .clear_event		(clear_event	),
    */
    .reload_count		(reload_count	),
    /*
    .wdt_event		(wdt_event	),	
    .debug_mode_i		(debug_mode_i	),
    .debug_enable		(debug_enable	),
    .wait_enable		(wait_enable	),	
    .wait_mode_i		(wait_mode_i	),	
    .stop_enable		(stop_enable	),	
    .stop_mode_i		(stop_mode_i	),
    */
    .wdt_enable		(wdt_enable	),
    
    .wdt_interrupt_sel	(wdt_interrupt	),  
    .timeout_value		(wdt_timeout_reg_o	)
    /*.debug_mode_valid_i             (debug_mode_valid_i         ),
    .debug_mode_reset_i             (debug_mode_reset_i        ),
    .debug_ndm_reset_i              (debug_ndm_reset_i               )*/
    
    );
    
    
    WDT_REG_FILE wdt_reg_file_inst
    (
    .*,
    .wdt_clk	 (wdt_clk_i		),      				
    .wdt_rst	 (wdt_rst_i		),       
    .wdt_reg_addr    (wdt_write_addr_i		),//from top   input logic	
    .wdt_reg_data	 (wdt_write_data_i		),//from top   input logic
    /*
    .wdt_enable	 (wdt_enable		),//to wdt counter       
    .debug_enable	 (debug_enable		),
    .wait_enable	 (wait_enable		),       
    .stop_enable	 (stop_enable		),       
    .wdt_event	 (wdt_event		),       
    .wdt_interrupt	 (wdt_interrupt		),
    */
    .timeout_limit	 (wdt_timeout_reg_o		)//to wdt counter
    /*
    .reload_count	 (reload_count		),//to wdt counter
    .clear_event     (clear_event		), //to wdt counter
    .wdt_ctrl_o      (wdt_ctrl_o		),
    .wdt_write_en_i	 (wdt_write_en_i	)
    */
    /*.debug_mode_valid_i             (debug_mode_valid_i         ),
    .debug_mode_reset_i             (debug_mode_reset_i        ),
    .debug_ndm_reset_i              (debug_ndm_reset_i               )*/
    
    
    );
    
    endmodule
    
    //register file for watch dog timer 
    //control register
    //timeout register
    
    module WDT_REG_FILE
    (
      input logic 		    wdt_clk		,
      input logic 		    wdt_rst		,//global asyc reset
      input logic 		    wdt_write_en_i	,
      input logic [15:0] 	    wdt_reg_addr	,
      input logic [31:0] 	    wdt_reg_data	,
      output logic 		    wdt_enable		,//to enable the WDT counter to decrement its value bit 2
      output logic 		    debug_enable	,//stop the counter decrement in debug mode	    bit 5
      output logic 		    wait_enable		,//halt the counter decrement			    bit 3
      output logic 		    stop_enable		,//to stop the counter decrement		    bit 4
      output logic [31:0]       wdt_ctrl_o		,
      input logic  		    clear_event		,//status of the WDT				    bit 8//clear event
      output logic     [1:0]    wdt_interrupt	,//to decide when the interrupt has to be generated bit 7:6
      output logic     [31:0]   timeout_limit	,//reset value of the watch dog counter
      output logic 		    reload_count	,//when two words are written to count: two service words 
      output logic 		    wdt_event      	 //8th bit in data bus when control register address is selected
    
    
    );
    localparam SERVICE_WORD_0 = 16'h5555 ;
    localparam SERVICE_WORD_1 = 16'haaaa ;
    localparam WDT_CTRL = 16'h0810;
    localparam WDT_SERVICE_WORD = 16'h818;
    localparam WDT_TIMEOUT_REG = 16'h814;
       logic wdt_protect;
       logic wdt_lock;
       logic service_wdt;
    
    
       logic wdt_event_r;
    
    assign wdt_event = clear_event ? 1'b0 : wdt_event_r;
    
    always_ff @(posedge wdt_clk or negedge wdt_rst)
    begin
    	if(!wdt_rst)
    	begin
    		wdt_enable	<= 1'b0;		 
    		debug_enable	<= 1'b0; 
    		wait_enable 	<= 1'b0;   
    		stop_enable 	<= 1'b0; 
    		wdt_interrupt	<= 2'b00;
    		timeout_limit	<= 32'h0000ffff;
    		reload_count	<= 1'b0; 
    		wdt_event_r 	<= 1'b0; 
    		wdt_protect         	<= 1'b0;
                 	wdt_lock        	<= 1'b0;
    		service_wdt 	<= 1'b0;
    
    	end
    	else
    	begin
    	       if(wdt_write_en_i && (wdt_reg_addr == WDT_CTRL))
    	       begin
    				wdt_event_r 	<= wdt_reg_data[8]	;
                 			wdt_interrupt   <= wdt_reg_data[7:6]	;
                 			debug_enable    <= (!wdt_enable || !wdt_reg_data[2]) ? wdt_reg_data[5]  : debug_enable	;
                 			stop_enable     <= (!wdt_enable || !wdt_reg_data[2]) ? wdt_reg_data[4]  : stop_enable	;
                 			wait_enable     <= (!wdt_enable || !wdt_reg_data[2]) ? wdt_reg_data[3]  : wait_enable	;
                 			wdt_enable      <= wdt_protect  ?  wdt_enable 	     : wdt_reg_data[2]	;
                 			wdt_protect     <= wdt_lock 	?  wdt_protect 	     : wdt_reg_data[1]	;
                 			wdt_lock        <= wdt_lock 	|| wdt_reg_data[0]			;
    
    	       end
    	       else if(wdt_write_en_i && (wdt_reg_addr == WDT_TIMEOUT_REG))
    	       begin
    				timeout_limit  <= wdt_reg_data;
    
    	       end
    	       else if(wdt_write_en_i && (wdt_reg_addr == WDT_SERVICE_WORD))
    	       begin
    	     			service_wdt  <= (wdt_reg_data == SERVICE_WORD_0);
    	     			reload_count <= service_wdt && (wdt_reg_data == SERVICE_WORD_1);
    
    	       end
    	end
    end
    
    assign wdt_ctrl_o = {16'd0,7'd0,wdt_event_r,wdt_interrupt,debug_enable,stop_enable,wait_enable,wdt_enable,wdt_protect,wdt_lock};
    endmodule
    
    //watch dog counter module
    
    module WDT_COUNTER
    //#(parameter 16 = 16)
    (
      input logic 			            wdt_clk		,
      input logic 			            wdt_rst		,
      output logic     [31:0] 	        wdt_counter		, // Modulo Counter value
      output logic                      wdt_reset_o		, // WDT Reset
      output logic                      wdt_interrupt_o	, // WDT Interrupt Request
      output logic                      clear_event		, // WDT status bit
      input logic                       reload_count	, // Correct control words written
      input logic                       wdt_event		, // Reset the WDT event register
      input logic                       debug_mode_i	, // System DEBUG Mode
      input logic                       debug_enable	, // Enable WDT in system debug mode
      input logic                       wait_enable		, // Enable WDT in system wait mode
      input logic                       wait_mode_i		, // System WAIT Mode
      input logic                       stop_enable		, // Enable WDT in system stop mode
      input logic                       stop_mode_i		, // System STOP Mode
      input logic                       wdt_enable		, // Enable WDT Timout Counter
      input logic      [1:0]            wdt_interrupt_sel   , // WDT IRQ Enable/Value
      input logic      [31:0] 	        timeout_value	  // WDT Counter initial value
    );
    
       logic 			    stop_counter	; // Enable WDT because of external inputs
       logic 			    event_reset		; // Clear WDT event status bit
       logic  			    wdt_irq_dec		; // WDT Interrupt Request Decode
       logic  			    wdt_irq		; // WDT Interrupt Request
       logic  			    reload_1		; // Resync register for commands crossing from bus_clk domain to cop_clk domain
       logic  			    reload_2		; //
    
      
    assign event_reset  = reload_count || wdt_event;//to reset the count
    assign stop_counter = (debug_mode_i && debug_enable) || (wait_mode_i && wait_enable) || (stop_mode_i && stop_enable) || (!wdt_enable) ; // to stop the counter
    
    //  Watchdog Timout Counter
    always_ff @(posedge wdt_clk or negedge wdt_rst)
    begin
        if (!wdt_rst)
        begin
          wdt_counter  	<= {16'd0,{16{1'b1}}}		;
        end
        else if(reload_1)
        begin
          wdt_counter  	<= timeout_value	;
        end
        else if (!stop_counter)
        begin
          wdt_counter  	<= wdt_counter - 1'b1	;
        end
    end
    
      //  wdt reset Output Register
    always_ff @(posedge wdt_clk or negedge wdt_rst)
    begin
      if ( !wdt_rst )
      begin
        wdt_reset_o 	<= 1'b0			;
      end
      else if ( reload_1 )
      begin
        wdt_reset_o 	<= 1'b0			;
      end
      else
      begin
        wdt_reset_o 	<= (wdt_counter == 0)	;
      end
    end
    
      // Stage one of pulse strecher and resync
      always_ff @(posedge wdt_clk or negedge wdt_rst)
      begin
        if ( !wdt_rst )
        begin
          reload_1 		<= 1'b0			;
        end
        else
        begin
          reload_1 		<= ( reload_count || !wdt_enable) || (reload_1 && !reload_2);
        end
      end
    
      // Stage two pulse strecher and resync
      always_ff @(posedge wdt_clk or negedge wdt_rst)
      begin
        if ( !wdt_rst )
        begin
          reload_2 		<= 1'b1			;
        end
        else
        begin
          reload_2 		<= reload_1		;
        end
      end
    
    
    
      // Decode WDT Interrupt Request
      always_comb
        unique case (wdt_interrupt_sel) // synopsys parallel_case
           2'b01  : wdt_irq_dec 	= (wdt_counter <= 16'd16);
           2'b10  : wdt_irq_dec 	= (wdt_counter <= 16'd32);
           2'b11  : wdt_irq_dec 	= (wdt_counter <= 16'd64);
           default: wdt_irq_dec 	= 1'b0			 ;
        endcase
    
      //  Watchdog Interrupt and resync
      always_ff @(posedge wdt_clk or negedge wdt_rst)
      begin
        if ( !wdt_rst )
          begin
            wdt_irq   	    <= 1'b0		;
            wdt_interrupt_o <= 1'b0		;
          end
        else
          begin
            wdt_irq   	    <= wdt_irq_dec  ;
            wdt_interrupt_o <= wdt_irq	;
          end
    end
    
      //  Watchdog Status Bit
      always_ff @(posedge wdt_clk or negedge wdt_rst)
        if ( !wdt_rst )
          clear_event 	<= 1'b0;
        else
          clear_event 	<= wdt_reset_o || (clear_event && !event_reset);



endmodule


