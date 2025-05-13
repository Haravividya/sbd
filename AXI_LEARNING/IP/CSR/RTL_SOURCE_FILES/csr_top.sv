
module csr_top
#(
    parameter CSR_ADDR_WIDTH    = 12,
    parameter DATA_WIDTH        = 32,
    parameter INSTRUCTION_WIDTH = 32,
    parameter PC_WIDTH          = 20
)
(
    input logic 			                csr_clk					            ,
    input logic 			                csr_rst					            ,
    input logic                             wdt_reset_i                         ,
    input logic   		                    csr_write_en_in				        ,		
    input logic   [CSR_ADDR_WIDTH-1:0] 		csr_addr_in				            ,
    input logic                             csr_read_en_in      			    ,
    output logic  [DATA_WIDTH-1:0]          csr_read_data_o     			    ,	
    input logic   [DATA_WIDTH-1:0] 		    csr_write_data_in			        ,//from source register	
    input logic   		                    csr_set_bit_in				        ,//decoder	
    input logic   		                    csr_clear_bit_in			        ,//decoder	
    input logic   		                    interrupt_valid_in			        ,//interrupt valid signal 	
    input logic   [DATA_WIDTH-1:0] 		    interrupt_code_in			        ,//interrupt_code	
    input logic   		                    exception_valid_in			        ,//exception valid signal 	
    input logic   [DATA_WIDTH-1:0] 		    exception_code_in			        ,//exception code
    input logic 			                ld_sd_misalign_valid_in			    ,
    input logic   [DATA_WIDTH-1:0]		    ld_sd_misalign_addr_in			    ,
    input logic			                    instr_misalign_valid_in			    ,
    input logic   [DATA_WIDTH-1:0]		    instr_misalign_addr_in			    ,
    input logic   		                    invalid_instr_valid_in			    ,//invalid instruction valid 	
    input logic   [INSTRUCTION_WIDTH-1:0] 	invalid_instruction_in			    ,//invalid instruction 	
    input logic       		                mie_set               			    ,//start of an interrupt
    input logic       		                mie_clear              			    ,//end of an interrupt
    input logic   [PC_WIDTH-1:0]		    pc_in					            ,//pc value of invalid instruction
    input logic   [PC_WIDTH-1:0]		    csr_mepc_in				            ,
    input logic 			                csr_mepc_write_valid			    ,
    input logic 			                trap_valid_i				        ,
    input logic                             stall_valid_i				        ,
    input logic 			                branch_valid_i				        ,
    input logic   [7:0] 		            interrupt_lvl_pr_i			        ,
    input logic 			                exception_id_write_valid_i		    ,
    input logic 			                interrupt_id_write_valid_i		    ,
    input logic                             mret_valid_i        			    ,
    output logic  [7:0] 		            interrupt_active_level_priority_o	,
    output logic  [PC_WIDTH-1:0]		    csr_mepc_o				            ,
    output logic 			                mstatus_mie_o				        ,
    output logic  [DATA_WIDTH-1:0] 		    csr_mtvec_o				            ,
    output logic  [7:0] 		            csr_mcause_o				        ,
    output logic  [DATA_WIDTH-1:0] 		    data_mem_max_addr_o                 ,
    input logic                             ebreak_valid_i                      ,
    input logic                             trigger_valid_i                     ,
    input logic                             haltreq_valid_i                     ,
    input logic                             single_step_valid_i                 ,
    input logic                             reset_haltreq_valid_i               ,
    output logic  [PC_WIDTH-1:0]            dpc_o                               ,
    input logic                             dbg_mode_valid_i                    ,      
    input logic                             dbg_mode_write_en_i                 , 
    input logic   [DATA_WIDTH-1:0]          dbg_mode_write_data_i               ,
    input logic   [15:0]                    dbg_mode_csr_addr_i                 ,
    input logic                             dbg_mode_read_en_i                  ,
    output logic  [DATA_WIDTH-1:0]          dbg_mode_read_data_o                ,
    output logic                            dbg_csr_read_valid_o                ,
    input logic                             dbg_ndm_reset_i                     ,
    input logic                             dbg_hart_reset_i                    ,
    input logic   [PC_WIDTH-1:0]            branch_pc_i                         ,
    output logic 				            reset_uart_o	
    );
    
     logic reset_uart_w;
     logic reset_uart_r;
    
     logic [DATA_WIDTH-1:0] uart_reset_csr_o;
    
     logic dbg_mode_csr_read_en_w;

     assign dbg_mode_csr_read_en_w = dbg_mode_csr_addr_i[12] ? 1'b0 : dbg_mode_read_en_i ;

     logic [DATA_WIDTH-1:0] mcounter_inhibit;
     logic [DATA_WIDTH-1:0] mvendorid		;	
     logic [DATA_WIDTH-1:0] marchid  		;     
     logic [DATA_WIDTH-1:0] mimpid   		;     
     logic [DATA_WIDTH-1:0] mhartid  		;     
     logic [DATA_WIDTH-1:0] mstatus 		;     
     logic [DATA_WIDTH-1:0] misa		    ;     
     logic [DATA_WIDTH-1:0] medeleg  		;     
     logic [DATA_WIDTH-1:0] mideleg  		;     
     logic [DATA_WIDTH-1:0] mie 		    ;     
     logic [DATA_WIDTH-1:0] mcounter 		;     
     logic [DATA_WIDTH-1:0] mscratch 		;	
     logic [DATA_WIDTH-1:0] mepc 		    ;
     logic [DATA_WIDTH-1:0] mcause   		;	
     logic [DATA_WIDTH-1:0] mtval    		;	
     logic [DATA_WIDTH-1:0] mip 		    ;
     logic [DATA_WIDTH-1:0] mcycle		    ;		
     logic [DATA_WIDTH-1:0] minstret 		;
     logic [DATA_WIDTH-1:0] mhpm_counter3	;
     logic [DATA_WIDTH-1:0] mhpm_counter4	;
     logic [DATA_WIDTH-1:0] mhpm_counter5	;
     logic [DATA_WIDTH-1:0] mhpm_counter6	;
     logic [DATA_WIDTH-1:0] mhpm_counter7	;
     logic [DATA_WIDTH-1:0] mhpm_counter8	;
     logic [DATA_WIDTH-1:0] mhpm_counter9	;
     logic [DATA_WIDTH-1:0] mhpm_counter10	;
     logic [DATA_WIDTH-1:0] mhpm_counter11	;
     logic [DATA_WIDTH-1:0] mhpm_counter12	;
     logic [DATA_WIDTH-1:0] mhpm_counter13	;
     logic [DATA_WIDTH-1:0] mhpm_counter14	;
     logic [DATA_WIDTH-1:0] mhpm_counter15	;
     logic [DATA_WIDTH-1:0] mhpm_counter16	;
     logic [DATA_WIDTH-1:0] mhpm_counter17	;
     logic [DATA_WIDTH-1:0] mhpm_counter18	;
     logic [DATA_WIDTH-1:0] mhpm_counter19	;
     logic [DATA_WIDTH-1:0] mhpm_counter20	;
     logic [DATA_WIDTH-1:0] mhpm_counter21	;
     logic [DATA_WIDTH-1:0] mhpm_counter22	;
     logic [DATA_WIDTH-1:0] mhpm_counter23	;
     logic [DATA_WIDTH-1:0] mhpm_counter24	;
     logic [DATA_WIDTH-1:0] mhpm_counter25	;
     logic [DATA_WIDTH-1:0] mhpm_counter26	;
     logic [DATA_WIDTH-1:0] mhpm_counter27	;
     logic [DATA_WIDTH-1:0] mhpm_counter28	;
     logic [DATA_WIDTH-1:0] mhpm_counter29	;
     logic [DATA_WIDTH-1:0] mhpm_counter30	;
     logic [DATA_WIDTH-1:0] mhpm_counter31	;
     logic [DATA_WIDTH-1:0] mhpm_event3;     
     logic [DATA_WIDTH-1:0] mhpm_event4;
     logic [DATA_WIDTH-1:0] mhpm_event5;
     logic [DATA_WIDTH-1:0] mhpm_event6;
     logic [DATA_WIDTH-1:0] mhpm_event7;
     logic [DATA_WIDTH-1:0] mhpm_event8;
     logic [DATA_WIDTH-1:0] mhpm_event9;
     logic [DATA_WIDTH-1:0] mhpm_event10;
     logic [DATA_WIDTH-1:0] mhpm_event11;
     logic [DATA_WIDTH-1:0] mhpm_event12;
     logic [DATA_WIDTH-1:0] mhpm_event13;
     logic [DATA_WIDTH-1:0] mhpm_event14;
     logic [DATA_WIDTH-1:0] mhpm_event15;
     logic [DATA_WIDTH-1:0] mhpm_event16;
     logic [DATA_WIDTH-1:0] mhpm_event17;
     logic [DATA_WIDTH-1:0] mhpm_event18;
     logic [DATA_WIDTH-1:0] mhpm_event19;
     logic [DATA_WIDTH-1:0] mhpm_event20;
     logic [DATA_WIDTH-1:0] mhpm_event21;
     logic [DATA_WIDTH-1:0] mhpm_event22;
     logic [DATA_WIDTH-1:0] mhpm_event23;
     logic [DATA_WIDTH-1:0] mhpm_event24;
     logic [DATA_WIDTH-1:0] mhpm_event25;
     logic [DATA_WIDTH-1:0] mhpm_event26;
     logic [DATA_WIDTH-1:0] mhpm_event27;
     logic [DATA_WIDTH-1:0] mhpm_event28;
     logic [DATA_WIDTH-1:0] mhpm_event29;
     logic [DATA_WIDTH-1:0] mhpm_event30;
     logic [DATA_WIDTH-1:0] mhpm_event31;
     logic [DATA_WIDTH-1:0] zic_base_addr_w;
     logic [DATA_WIDTH-1:0] interrupt_active_level_priority_w;

    assign interrupt_active_level_priority_o = interrupt_active_level_priority_w[7:0] ;
    assign csr_mcause_o = mcause[7:0];
    
     logic [DATA_WIDTH-1:0] dcsr_w  ;

    assign reset_uart_w = uart_reset_csr_o[0];
    
    
    always_ff @(posedge csr_clk or negedge csr_rst)
    begin
    	if(!csr_rst)
    	begin
    		reset_uart_r <= 1'b0;
    	end
    	else
    	begin
    		reset_uart_r <= reset_uart_w;
    	end
    end
    
    assign reset_uart_o = (reset_uart_w && (!reset_uart_r));
    
    
    ////csr read mux
    csr_read_mux 
    #(
    .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
    .DATA_WIDTH        (DATA_WIDTH        ),
    .INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
    .PC_WIDTH          (PC_WIDTH          )
    )
    
    csr_read_mux_inst
    (
    .*,
    .clk_i			(csr_clk		),
    .rst_i			(csr_rst		),
    .csr_read_en		(csr_read_en_in		),
    .csr_read_addr		(csr_addr_in		),
    .csr_reg_read_data 	(csr_read_data_o	),//to register file
    .mcounter_inhibit_i	(mcounter_inhibit	),
    .mvendorid_i		(mvendorid		),	//Vendor ID.	
    .marchid_i		(marchid  		), 	//Architecture ID.       
    .mimpid_i		(mimpid   		), 	//Implementation ID.       
    .mhartid_i		(mhartid  		), 	//Hardware thread ID.       
    .mstatus_i		(mstatus 		),	//Machine status register.	
    .misa_i			(misa			),	//ISA and extensions	
    .medeleg_i		(medeleg  		),	//Machine exception delegation register.	
    .mideleg_i		(mideleg  		),	//Machine interrupt delegation register.	
    .mie_i 			(mie 			),	//Machinterrupt-enable register.ine		
    .mtvec_i		(csr_mtvec_o		),	//Machine trap-handler base address.	
    .mcounter_i		(mcounter 		),	//Machine counter enable.	
    .mscratch_i 		(mscratch 		),	//Scratch register for machine trap handlers.
    .mepc_i 		(mepc 			),	//Machine exception program counter.
    .mcause_i 		(mcause   		),	//Machine trap cause.
    .mtval_i 		(mtval    		),	//Machine bad address or instruction.
    .mip_i 			(mip 			),
    .mcycle			(mcycle			),		
    .minstret 		(minstret 		),	
    .zic_base_addr_i	(zic_base_addr_w	),
    /*
    .mhpm_counter3		(mhpm_counter3		),		
    .mhpm_counter4		(mhpm_counter4		),		
    .mhpm_counter5		(mhpm_counter5		),		
    .mhpm_counter6		(mhpm_counter6		),		
    .mhpm_counter7		(mhpm_counter7		),		
    .mhpm_counter8		(mhpm_counter8		),
    .mhpm_counter9		(mhpm_counter9		),
    .mhpm_counter10		(mhpm_counter10		),
    .mhpm_counter11		(mhpm_counter11		),
    .mhpm_counter12		(mhpm_counter12		),
    .mhpm_counter13		(mhpm_counter13		),
    .mhpm_counter14		(mhpm_counter14		),
    .mhpm_counter15		(mhpm_counter15		),
    .mhpm_counter16		(mhpm_counter16		),
    .mhpm_counter17		(mhpm_counter17		),
    .mhpm_counter18		(mhpm_counter18		),
    .mhpm_counter19		(mhpm_counter19		),
    .mhpm_counter20		(mhpm_counter20		),
    .mhpm_counter21		(mhpm_counter21		),
    .mhpm_counter22		(mhpm_counter22		),
    .mhpm_counter23		(mhpm_counter23		),
    .mhpm_counter24		(mhpm_counter24		),
    .mhpm_counter25		(mhpm_counter25		),
    .mhpm_counter26		(mhpm_counter26		),
    .mhpm_counter27		(mhpm_counter27		),
    .mhpm_counter28		(mhpm_counter28		),
    .mhpm_counter29		(mhpm_counter29		),
    .mhpm_counter30		(mhpm_counter30		),
    .mhpm_counter31		(mhpm_counter31		),
    */
    .mhpm_event3_i (mhpm_event3 ),     
    .mhpm_event4_i (mhpm_event4 ),
    .mhpm_event5_i (mhpm_event5 ),
    .mhpm_event6_i (mhpm_event6 ),
    .mhpm_event7_i (mhpm_event7 ),
    .mhpm_event8_i (mhpm_event8 ),
    .mhpm_event9_i (mhpm_event9 ),
    .mhpm_event10_i(mhpm_event10),
    .mhpm_event11_i(mhpm_event11),
    .mhpm_event12_i(mhpm_event12),
    .mhpm_event13_i(mhpm_event13),
    .mhpm_event14_i(mhpm_event14),
    .mhpm_event15_i(mhpm_event15),
    .mhpm_event16_i(mhpm_event16),
    .mhpm_event17_i(mhpm_event17),
    .mhpm_event18_i(mhpm_event18),
    .mhpm_event19_i(mhpm_event19),
    .mhpm_event20_i(mhpm_event20),
    .mhpm_event21_i(mhpm_event21),
    .mhpm_event22_i(mhpm_event22),
    .mhpm_event23_i(mhpm_event23),
    .mhpm_event24_i(mhpm_event24),
    .mhpm_event25_i(mhpm_event25),
    .mhpm_event26_i(mhpm_event26),
    .mhpm_event27_i(mhpm_event27),
    .mhpm_event28_i(mhpm_event28),
    .mhpm_event29_i(mhpm_event29),
    .mhpm_event30_i(mhpm_event30),
    .mhpm_event31_i(mhpm_event31),
    .interrupt_active_level_priority_i(interrupt_active_level_priority_w),
    .data_mem_max_addr_i(data_mem_max_addr_o),
    .dcsr_i         (dcsr_w),
    .dpc_i          (dpc_o ),
    /*
    .dbg_mode_valid_i                   (dbg_mode_valid_i),
    .dbg_mode_csr_addr_i                (dbg_mode_csr_addr_i),
    .dbg_mode_read_data_o               (dbg_mode_read_data_o),
    */
    .dbg_mode_read_en_i                 (dbg_mode_csr_read_en_w),
    .csr_dbg_read_valid_o               (dbg_csr_read_valid_o),
    .uart_reset_csr_i			(uart_reset_csr_o)
    
    );
    
    
    
    //csr register file
    
    
    csr_register_file 
    #(
    .CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
    .DATA_WIDTH        (DATA_WIDTH        ),
    .INSTRUCTION_WIDTH (INSTRUCTION_WIDTH ),
    .PC_WIDTH          (PC_WIDTH          )
    )
    
    csr_register_file_inst
    (
    .*,
    /*
    .csr_clk		(csr_clk		),
    .csr_rst		(csr_rst		),
    .wdt_reset_i    (wdt_reset_i    ),
    .mret_valid_i   (mret_valid_i),
    */
    .csr_write_en		(csr_write_en_in	),
    .csr_addr		(csr_addr_in		),
    .csr_write_data		(csr_write_data_in	),
    .csr_set_bit		(csr_set_bit_in		),
    .csr_clear_bit		(csr_clear_bit_in	),
    .interrupt_valid 	(interrupt_valid_in 	),
    .interrupt_code		(interrupt_code_in	),
    .exception_valid 	(exception_valid_in 	),
    .exception_code		(exception_code_in	),
     //.csr_mepc_write_valid	(csr_mepc_write_valid	),	
     //.csr_mepc_in		(csr_mepc_in		),	
    //  .csr_mepc_o		(csr_mepc_o		),	
    .ld_sd_misalign_valid	(ld_sd_misalign_valid_in),
    .ld_sd_misalign_addr	(ld_sd_misalign_addr_in ),
    .instr_misalign_valid	(instr_misalign_valid_in),
    .instr_misalign_addr	(instr_misalign_addr_in ),
    .invalid_instr_valid	(invalid_instr_valid_in	),
    .invalid_instruction	(invalid_instruction_in	),
    //.interrupt_lvl_pr_i	(interrupt_lvl_pr_i)	,//from zic
    .interrupt_active_level_priority_o(interrupt_active_level_priority_w),
    //.exception_id_write_valid_i(exception_id_write_valid_i),
    //.interrupt_id_write_valid_i(interrupt_id_write_valid_i),
    .pc			(pc_in			),
    /*
    .mie_set  		(mie_set		),
    .mie_clear		(mie_clear		),
    */
    .mvendorid_o		(mvendorid		),	
    .marchid_o  		(marchid  		),     
    .mimpid_o   		(mimpid   		),     
    .mhartid_o  		(mhartid  		),     
    .mstatus_o  		(mstatus 		),    
    .mstatus_mie_o		(mstatus_mie_o		),
    .misa_o	   		(misa			),     
    .medeleg_o  		(medeleg  		),     
    .mideleg_o  		(mideleg  		),     
    .mie_o 	   		(mie 			),     
    .mtvec_o	   	(csr_mtvec_o		),	
    .mcounter_o 		(mcounter 		),     
    .mscratch_o 		(mscratch 		),	
    .mepc_o 	   	(mepc 			),
    .mcause_o   		(mcause   		),	
    .mtval_o    		(mtval    		),	
    .mip_o 			(mip 			),
    .mcounter_inhibit_o 	(mcounter_inhibit	),
    .zic_base_addr_o	(zic_base_addr_w),
    .mcycle_o		(mcycle	       		),
    .minstret_o		(minstret      		),
    .mhpm_counter3_o 	(mhpm_counter3 		),
    .mhpm_counter4_o 	(mhpm_counter4 		),
    .mhpm_counter5_o 	(mhpm_counter5 		),
    .mhpm_counter6_o 	(mhpm_counter6 		),
    .mhpm_counter7_o 	(mhpm_counter7 		),
    .mhpm_counter8_o 	(mhpm_counter8 		),
    .mhpm_counter9_o 	(mhpm_counter9 		),
    .mhpm_counter10_o	(mhpm_counter10		),
    .mhpm_counter11_o	(mhpm_counter11		),
    .mhpm_counter12_o	(mhpm_counter12		),
    .mhpm_counter13_o	(mhpm_counter13		),
    .mhpm_counter14_o	(mhpm_counter14		),
    .mhpm_counter15_o	(mhpm_counter15		),
    .mhpm_counter16_o	(mhpm_counter16		),
    .mhpm_counter17_o	(mhpm_counter17		),
    .mhpm_counter18_o	(mhpm_counter18		),
    .mhpm_counter19_o	(mhpm_counter19		),
    .mhpm_counter20_o	(mhpm_counter20		),
    .mhpm_counter21_o	(mhpm_counter21		),
    .mhpm_counter22_o	(mhpm_counter22		),
    .mhpm_counter23_o	(mhpm_counter23		),
    .mhpm_counter24_o	(mhpm_counter24		),
    .mhpm_counter25_o	(mhpm_counter25		),
    .mhpm_counter26_o	(mhpm_counter26		),
    .mhpm_counter27_o	(mhpm_counter27		),
    .mhpm_counter28_o	(mhpm_counter28		),
    .mhpm_counter29_o	(mhpm_counter29		),
    .mhpm_counter30_o	(mhpm_counter30		),
    .mhpm_counter31_o	(mhpm_counter31		),
    .mhpm_event3_o (mhpm_event3 ),     
    .mhpm_event4_o (mhpm_event4 ),
    .mhpm_event5_o (mhpm_event5 ),
    .mhpm_event6_o (mhpm_event6 ),
    .mhpm_event7_o (mhpm_event7 ),
    .mhpm_event8_o (mhpm_event8 ),
    .mhpm_event9_o (mhpm_event9 ),
    .mhpm_event10_o(mhpm_event10),
    .mhpm_event11_o(mhpm_event11),
    .mhpm_event12_o(mhpm_event12),
    .mhpm_event13_o(mhpm_event13),
    .mhpm_event14_o(mhpm_event14),
    .mhpm_event15_o(mhpm_event15),
    .mhpm_event16_o(mhpm_event16),
    .mhpm_event17_o(mhpm_event17),
    .mhpm_event18_o(mhpm_event18),
    .mhpm_event19_o(mhpm_event19),
    .mhpm_event20_o(mhpm_event20),
    .mhpm_event21_o(mhpm_event21),
    .mhpm_event22_o(mhpm_event22),
    .mhpm_event23_o(mhpm_event23),
    .mhpm_event24_o(mhpm_event24),
    .mhpm_event25_o(mhpm_event25),
    .mhpm_event26_o(mhpm_event26),
    .mhpm_event27_o(mhpm_event27),
    .mhpm_event28_o(mhpm_event28),
    .mhpm_event29_o(mhpm_event29),
    .mhpm_event30_o(mhpm_event30),
    .mhpm_event31_o(mhpm_event31),
    /*
    .data_mem_max_addr_o(data_mem_max_addr_o),
    .trap_valid_i	(trap_valid_i  ),
    .stall_valid_i	(stall_valid_i ),
    .branch_valid_i	(branch_valid_i),
    .ebreak_valid_i          (ebreak_valid_i        ),
    .trigger_valid_i         (trigger_valid_i       ),
    .haltreq_valid_i         (haltreq_valid_i       ),
    .single_step_valid_i     (single_step_valid_i   ),
    .reset_haltreq_valid_i   (reset_haltreq_valid_i ),
    */
    .dcsr_o                  (dcsr_w                ),
    .dpc_o                   (dpc_o                 ),
    .dbg_csr_write_en_i      (dbg_mode_write_en_i    ),
    .dbg_csr_addr_i          (dbg_mode_csr_addr_i        ),
    .dbg_csr_write_data_i    (dbg_mode_write_data_i  ),
    .debug_mode_valid_i      (dbg_mode_valid_i    )
    /*
    .dbg_ndm_reset_i         (dbg_ndm_reset_i       ),
    .dbg_hart_reset_i        (dbg_hart_reset_i      ),
    .branch_pc_i            (branch_pc_i),
    .uart_reset_csr_o   (uart_reset_csr_o)
    */
    );
endmodule
