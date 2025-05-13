//`timescale 1ns/1ps
module csr_read_mux
#(
    parameter CSR_ADDR_WIDTH    = 0,
    parameter DATA_WIDTH        = 0,
    parameter INSTRUCTION_WIDTH = 0,
    parameter PC_WIDTH          = 0
)

(
     input logic                        clk_i		        ,
     input logic 	                    rst_i		        ,
     input logic  [CSR_ADDR_WIDTH-1:0]  csr_read_addr	    ,
     output logic  [DATA_WIDTH-1:0]     csr_reg_read_data   ,
     input logic 	                    csr_read_en	        , 
     input logic  [DATA_WIDTH-1:0] mcounter_inhibit_i,
     input logic  [DATA_WIDTH-1:0] mvendorid_i	    ,	//Vendor ID.	
     input logic  [DATA_WIDTH-1:0] marchid_i		, 	//Architecture ID.       
     input logic  [DATA_WIDTH-1:0] mimpid_i		    , 	//Implementation ID.       
     input logic  [DATA_WIDTH-1:0] mhartid_i		, 	//Hardware thread ID.       
     input logic  [DATA_WIDTH-1:0] mstatus_i		,	//Machine status register.	
     input logic  [DATA_WIDTH-1:0] misa_i		    ,	//ISA and extensions	
     input logic  [DATA_WIDTH-1:0] medeleg_i		,	//Machine exception delegation register.	
     input logic  [DATA_WIDTH-1:0] mideleg_i		,	//Machine interrupt delegation register.	
     input logic  [DATA_WIDTH-1:0] mie_i 		    ,	//Machinterrupt-enable register.ine		
     input logic  [DATA_WIDTH-1:0] mtvec_i		    ,	//Machine trap-handler base address.	
     input logic  [DATA_WIDTH-1:0] mcounter_i	    ,	//Machine counter enable.	
     input logic  [DATA_WIDTH-1:0] mscratch_i 	    ,	//Scratch register for machine trap handlers.
     input logic  [DATA_WIDTH-1:0] mepc_i 		    ,	//Machine exception program counter.
     input logic  [DATA_WIDTH-1:0] mcause_i 		,	//Machine trap cause.
     input logic  [DATA_WIDTH-1:0] mtval_i 		    ,	//Machine bad address or instruction.
     input logic  [DATA_WIDTH-1:0] mip_i 		    ,	//Machine interrupt pending.
     input logic  [DATA_WIDTH-1:0] mcycle		    ,	//machine cycle count
     input logic  [DATA_WIDTH-1:0] minstret 		,	//Machine instructions-retired counter.
     input logic  [DATA_WIDTH-1:0] mhpm_counter3	,	
     input logic  [DATA_WIDTH-1:0] mhpm_counter4	,	
     input logic  [DATA_WIDTH-1:0] mhpm_counter5	,	
     input logic  [DATA_WIDTH-1:0] mhpm_counter6	,	
     input logic  [DATA_WIDTH-1:0] mhpm_counter7	,	
     input logic  [DATA_WIDTH-1:0] mhpm_counter8	,	
     input logic  [DATA_WIDTH-1:0] mhpm_counter9	,	
     input logic  [DATA_WIDTH-1:0] mhpm_counter10	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter11	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter12	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter13	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter14	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter15	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter16	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter17	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter18	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter19	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter20	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter21	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter22	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter23	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter24	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter25	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter26	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter27	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter28	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter29	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter30	,
     input logic  [DATA_WIDTH-1:0] mhpm_counter31	,
     input logic [DATA_WIDTH-1:0] mhpm_event3_i ,     
     input logic [DATA_WIDTH-1:0] mhpm_event4_i ,
     input logic [DATA_WIDTH-1:0] mhpm_event5_i ,
     input logic [DATA_WIDTH-1:0] mhpm_event6_i ,
     input logic [DATA_WIDTH-1:0] mhpm_event7_i ,
     input logic [DATA_WIDTH-1:0] mhpm_event8_i ,
     input logic [DATA_WIDTH-1:0] mhpm_event9_i ,
     input logic [DATA_WIDTH-1:0] mhpm_event10_i,
     input logic [DATA_WIDTH-1:0] mhpm_event11_i,
     input logic [DATA_WIDTH-1:0] mhpm_event12_i,
     input logic [DATA_WIDTH-1:0] mhpm_event13_i,
     input logic [DATA_WIDTH-1:0] mhpm_event14_i,
     input logic [DATA_WIDTH-1:0] mhpm_event15_i,
     input logic [DATA_WIDTH-1:0] mhpm_event16_i,
     input logic [DATA_WIDTH-1:0] mhpm_event17_i,
     input logic [DATA_WIDTH-1:0] mhpm_event18_i,
     input logic [DATA_WIDTH-1:0] mhpm_event19_i,
     input logic [DATA_WIDTH-1:0] mhpm_event20_i,
     input logic [DATA_WIDTH-1:0] mhpm_event21_i,
     input logic [DATA_WIDTH-1:0] mhpm_event22_i,
     input logic [DATA_WIDTH-1:0] mhpm_event23_i,
     input logic [DATA_WIDTH-1:0] mhpm_event24_i,
     input logic [DATA_WIDTH-1:0] mhpm_event25_i,
     input logic [DATA_WIDTH-1:0] mhpm_event26_i,
     input logic [DATA_WIDTH-1:0] mhpm_event27_i,
     input logic [DATA_WIDTH-1:0] mhpm_event28_i,
     input logic [DATA_WIDTH-1:0] mhpm_event29_i,
     input logic [DATA_WIDTH-1:0] mhpm_event30_i,
     input logic [DATA_WIDTH-1:0] mhpm_event31_i,
     input logic [DATA_WIDTH-1:0] interrupt_active_level_priority_i,
     input logic [DATA_WIDTH-1:0] zic_base_addr_i,
     input logic [DATA_WIDTH-1:0] data_mem_max_addr_i,
     input logic [DATA_WIDTH-1:0] dcsr_i                                   ,
     input logic [PC_WIDTH-1:0]   dpc_i                                    ,
     input logic                        dbg_mode_valid_i                   ,
     input logic [CSR_ADDR_WIDTH-1:0]   dbg_mode_csr_addr_i                ,
     input logic                        dbg_mode_read_en_i                 ,
     output logic [DATA_WIDTH-1:0]      dbg_mode_read_data_o               ,
     output logic                       csr_dbg_read_valid_o               ,
     input logic [DATA_WIDTH-1:0]       uart_reset_csr_i
    
    
    );
     
      logic [DATA_WIDTH-1:0] dbg_mode_read_data_r;
      logic [DATA_WIDTH-1:0] csr_reg_read_data_r;
      logic        csr_dbg_read_valid_r;

    always_comb
    begin
    if(dbg_mode_valid_i && dbg_mode_read_en_i)
    begin
            csr_dbg_read_valid_r = 1'b1;
            csr_reg_read_data_r = {DATA_WIDTH{1'b0}};
        	unique case(dbg_mode_csr_addr_i)
    		12'hF11 :  dbg_mode_read_data_r = mvendorid_i 	; 
    		12'hF12 :  dbg_mode_read_data_r = marchid_i		;
    		12'hF13 :  dbg_mode_read_data_r = mimpid_i		;
    		12'hF14 :  dbg_mode_read_data_r = mhartid_i		;
    		12'h300 :  dbg_mode_read_data_r = mstatus_i		;
    		12'h301 :  dbg_mode_read_data_r = misa_i		;
    		12'h302 :  dbg_mode_read_data_r = medeleg_i		;
    		12'h303 :  dbg_mode_read_data_r = mideleg_i		;
    		12'h304 :  dbg_mode_read_data_r = mie_i 		;
    		12'h305 :  dbg_mode_read_data_r = mtvec_i		;
    		12'h306 :  dbg_mode_read_data_r = mcounter_i	;
    		12'h320 :  dbg_mode_read_data_r = mcounter_inhibit_i;
    		12'h340 :  dbg_mode_read_data_r = mscratch_i  	;
    		12'h341 :  dbg_mode_read_data_r = mepc_i 		;
    		12'h342 :  dbg_mode_read_data_r = mcause_i 		;
    		12'h343 :  dbg_mode_read_data_r = mtval_i 		;
    		12'h344 :  dbg_mode_read_data_r = mip_i 		;
    		12'hb00 :  dbg_mode_read_data_r = mcycle		;
    		12'hb02 :  dbg_mode_read_data_r = minstret		;
    		12'hb03 :  dbg_mode_read_data_r = mhpm_counter3 	;		
    		12'hb04 :  dbg_mode_read_data_r = mhpm_counter4 	;
    		12'hb05	:  dbg_mode_read_data_r = mhpm_counter5 	;
    		12'hb06	:  dbg_mode_read_data_r = mhpm_counter6 	;
    		12'hb07	:  dbg_mode_read_data_r = mhpm_counter7 	;
    		12'hb08	:  dbg_mode_read_data_r = mhpm_counter8 	;
    		12'hb09	:  dbg_mode_read_data_r = mhpm_counter9 	;
    		12'hb0a	:  dbg_mode_read_data_r = mhpm_counter10	;
    		12'hb0b	:  dbg_mode_read_data_r = mhpm_counter11	;
    		12'hb0c	:  dbg_mode_read_data_r = mhpm_counter12	;
    		12'hb0d	:  dbg_mode_read_data_r = mhpm_counter13	;
    		12'hb0e	:  dbg_mode_read_data_r = mhpm_counter14	;
    		12'hb0f	:  dbg_mode_read_data_r = mhpm_counter15	;
    		12'hb10	:  dbg_mode_read_data_r = mhpm_counter16	;
    		12'hb11	:  dbg_mode_read_data_r = mhpm_counter17	;
    		12'hb12	:  dbg_mode_read_data_r = mhpm_counter18	;
    		12'hb13	:  dbg_mode_read_data_r = mhpm_counter19	;
    		12'hb14	:  dbg_mode_read_data_r = mhpm_counter20	;
    		12'hb15	:  dbg_mode_read_data_r = mhpm_counter21	;
    		12'hb16	:  dbg_mode_read_data_r = mhpm_counter22	;
    		12'hb17	:  dbg_mode_read_data_r = mhpm_counter23	;
    		12'hb18	:  dbg_mode_read_data_r = mhpm_counter24	;
    		12'hb19	:  dbg_mode_read_data_r = mhpm_counter25	;
    		12'hb1a	:  dbg_mode_read_data_r = mhpm_counter26	;
    		12'hb1b	:  dbg_mode_read_data_r = mhpm_counter27	;
    		12'hb1c	:  dbg_mode_read_data_r = mhpm_counter28	;
    		12'hb1d	:  dbg_mode_read_data_r = mhpm_counter29	;
    		12'hb1e	:  dbg_mode_read_data_r = mhpm_counter30	;
    		12'hb1f	:  dbg_mode_read_data_r = mhpm_counter31	;
            12'h323 :  dbg_mode_read_data_r =   mhpm_event3_i ;   
            12'h324 :  dbg_mode_read_data_r =   mhpm_event4_i ;
            12'h325 :  dbg_mode_read_data_r =   mhpm_event5_i ;
            12'h326 :  dbg_mode_read_data_r =   mhpm_event6_i ;
            12'h327 :  dbg_mode_read_data_r =   mhpm_event7_i ;
            12'h328 :  dbg_mode_read_data_r =   mhpm_event8_i ;
            12'h329 :  dbg_mode_read_data_r =   mhpm_event9_i ;
            12'h32A :  dbg_mode_read_data_r =   mhpm_event10_i;
            12'h32B :  dbg_mode_read_data_r =   mhpm_event11_i;
            12'h32C :  dbg_mode_read_data_r =   mhpm_event12_i;
            12'h32D :  dbg_mode_read_data_r =   mhpm_event13_i;
            12'h32E :  dbg_mode_read_data_r =   mhpm_event14_i;
            12'h32F :  dbg_mode_read_data_r =   mhpm_event15_i;
            12'h330 :  dbg_mode_read_data_r =   mhpm_event16_i;
            12'h331 :  dbg_mode_read_data_r =   mhpm_event17_i;
            12'h332 :  dbg_mode_read_data_r =   mhpm_event18_i;
            12'h333 :  dbg_mode_read_data_r =   mhpm_event19_i;
            12'h334 :  dbg_mode_read_data_r =   mhpm_event20_i;
            12'h335 :  dbg_mode_read_data_r =   mhpm_event21_i;
            12'h336 :  dbg_mode_read_data_r =   mhpm_event22_i;
            12'h337 :  dbg_mode_read_data_r =   mhpm_event23_i;
            12'h338 :  dbg_mode_read_data_r =   mhpm_event24_i;
            12'h339 :  dbg_mode_read_data_r =   mhpm_event25_i;
            12'h33A :  dbg_mode_read_data_r =   mhpm_event26_i;
            12'h33B :  dbg_mode_read_data_r =   mhpm_event27_i;
            12'h33C :  dbg_mode_read_data_r =   mhpm_event28_i;
            12'h33D :  dbg_mode_read_data_r =   mhpm_event29_i;
            12'h33E :  dbg_mode_read_data_r =   mhpm_event30_i;
            12'h33F :  dbg_mode_read_data_r =   mhpm_event31_i;      
    	    12'hfc0 :  dbg_mode_read_data_r =   interrupt_active_level_priority_i;//mintstatus
            12'hbc0 :  dbg_mode_read_data_r =   zic_base_addr_i  ;//zic base addr registers
    	    12'hfc1 :  dbg_mode_read_data_r =   data_mem_max_addr_i;	
            12'h7b0 :  dbg_mode_read_data_r =   dcsr_i;
            12'h7b1 :  dbg_mode_read_data_r =   {{DATA_WIDTH-PC_WIDTH{1'b0}},dpc_i};
            12'h7C0 : dbg_mode_read_data_r  =  uart_reset_csr_i;
    
    	    default :  dbg_mode_read_data_r =   {DATA_WIDTH{1'b0}}		;
    
    	endcase
    
    end

    else if(csr_read_en)
    begin
           csr_dbg_read_valid_r = 1'b0;
           dbg_mode_read_data_r = {DATA_WIDTH{1'b0}};
            unique case(csr_read_addr)
    		12'hF11 :csr_reg_read_data_r  = mvendorid_i 	; 
    		12'hF12 :csr_reg_read_data_r  = marchid_i		;
    		12'hF13 :csr_reg_read_data_r  = mimpid_i		;
    		12'hF14 :csr_reg_read_data_r  = mhartid_i		;
    		12'h300 :csr_reg_read_data_r  = mstatus_i		;
    		12'h301 :csr_reg_read_data_r  = misa_i		;
    		12'h302 :csr_reg_read_data_r  = medeleg_i		;
    		12'h303 :csr_reg_read_data_r  = mideleg_i		;
    		12'h304 :csr_reg_read_data_r  = mie_i 		;
    		12'h305 :csr_reg_read_data_r  = mtvec_i		;
    		12'h306 :csr_reg_read_data_r  = mcounter_i	;
    		12'h320 :csr_reg_read_data_r  = mcounter_inhibit_i;
    		12'h340 :csr_reg_read_data_r  = mscratch_i  	;
    		12'h341 :csr_reg_read_data_r  = mepc_i 		;
    		12'h342 :csr_reg_read_data_r  = mcause_i 		;
    		12'h343 :csr_reg_read_data_r  = mtval_i 		;
    		12'h344 :csr_reg_read_data_r  = mip_i 		;
    		12'hb00 :csr_reg_read_data_r  = mcycle		;
    		12'hb02 :csr_reg_read_data_r  = minstret		;
    		12'hb03 :csr_reg_read_data_r  = mhpm_counter3 	;		
    		12'hb04 :csr_reg_read_data_r  = mhpm_counter4 	;
    		12'hb05	:csr_reg_read_data_r = mhpm_counter5 	;
    		12'hb06	:csr_reg_read_data_r = mhpm_counter6 	;
    		12'hb07	:csr_reg_read_data_r = mhpm_counter7 	;
    		12'hb08	:csr_reg_read_data_r = mhpm_counter8 	;
    		12'hb09	:csr_reg_read_data_r = mhpm_counter9 	;
    		12'hb0a	:csr_reg_read_data_r = mhpm_counter10	;
    		12'hb0b	:csr_reg_read_data_r = mhpm_counter11	;
    		12'hb0c	:csr_reg_read_data_r = mhpm_counter12	;
    		12'hb0d	:csr_reg_read_data_r = mhpm_counter13	;
    		12'hb0e	:csr_reg_read_data_r = mhpm_counter14	;
    		12'hb0f	:csr_reg_read_data_r = mhpm_counter15	;
    		12'hb10	:csr_reg_read_data_r = mhpm_counter16	;
    		12'hb11	:csr_reg_read_data_r = mhpm_counter17	;
    		12'hb12	:csr_reg_read_data_r = mhpm_counter18	;
    		12'hb13	:csr_reg_read_data_r = mhpm_counter19	;
    		12'hb14	:csr_reg_read_data_r = mhpm_counter20	;
    		12'hb15	:csr_reg_read_data_r = mhpm_counter21	;
    		12'hb16	:csr_reg_read_data_r = mhpm_counter22	;
    		12'hb17	:csr_reg_read_data_r = mhpm_counter23	;
    		12'hb18	:csr_reg_read_data_r = mhpm_counter24	;
    		12'hb19	:csr_reg_read_data_r = mhpm_counter25	;
    		12'hb1a	:csr_reg_read_data_r = mhpm_counter26	;
    		12'hb1b	:csr_reg_read_data_r = mhpm_counter27	;
    		12'hb1c	:csr_reg_read_data_r = mhpm_counter28	;
    		12'hb1d	:csr_reg_read_data_r = mhpm_counter29	;
    		12'hb1e	:csr_reg_read_data_r = mhpm_counter30	;
    		12'hb1f	:csr_reg_read_data_r = mhpm_counter31	;
            12'h323 :  csr_reg_read_data_r =   mhpm_event3_i ;   
            12'h324 :  csr_reg_read_data_r =   mhpm_event4_i ;
            12'h325 :  csr_reg_read_data_r =   mhpm_event5_i ;
            12'h326 :  csr_reg_read_data_r =   mhpm_event6_i ;
            12'h327 :  csr_reg_read_data_r =   mhpm_event7_i ;
            12'h328 :  csr_reg_read_data_r =   mhpm_event8_i ;
            12'h329 :  csr_reg_read_data_r =   mhpm_event9_i ;
            12'h32A :  csr_reg_read_data_r =   mhpm_event10_i;
            12'h32B :  csr_reg_read_data_r =   mhpm_event11_i;
            12'h32C :  csr_reg_read_data_r =   mhpm_event12_i;
            12'h32D :  csr_reg_read_data_r =   mhpm_event13_i;
            12'h32E :  csr_reg_read_data_r =   mhpm_event14_i;
            12'h32F :  csr_reg_read_data_r =   mhpm_event15_i;
            12'h330 :  csr_reg_read_data_r =   mhpm_event16_i;
            12'h331 :  csr_reg_read_data_r =   mhpm_event17_i;
            12'h332 :  csr_reg_read_data_r =   mhpm_event18_i;
            12'h333 :  csr_reg_read_data_r =   mhpm_event19_i;
            12'h334 :  csr_reg_read_data_r =   mhpm_event20_i;
            12'h335 :  csr_reg_read_data_r =   mhpm_event21_i;
            12'h336 :  csr_reg_read_data_r =   mhpm_event22_i;
            12'h337 :  csr_reg_read_data_r =   mhpm_event23_i;
            12'h338 :  csr_reg_read_data_r =   mhpm_event24_i;
            12'h339 :  csr_reg_read_data_r =   mhpm_event25_i;
            12'h33A :  csr_reg_read_data_r =   mhpm_event26_i;
            12'h33B :  csr_reg_read_data_r =   mhpm_event27_i;
            12'h33C :  csr_reg_read_data_r =   mhpm_event28_i;
            12'h33D :  csr_reg_read_data_r =   mhpm_event29_i;
            12'h33E :  csr_reg_read_data_r =   mhpm_event30_i;
            12'h33F :  csr_reg_read_data_r =   mhpm_event31_i;      
    	    12'hfc0 :  csr_reg_read_data_r =   interrupt_active_level_priority_i;//mintstatus
            12'hbc0 :  csr_reg_read_data_r =   zic_base_addr_i  ;//zic base addr registers
    	    12'hfc1 :  csr_reg_read_data_r =   data_mem_max_addr_i;	
            12'h7b0 :  csr_reg_read_data_r =   dcsr_i;
            12'h7b1 :  csr_reg_read_data_r =   {{DATA_WIDTH-PC_WIDTH{1'b0}},dpc_i};
            12'h7C0 : dbg_mode_read_data_r =  uart_reset_csr_i;
    
    	    default :  csr_reg_read_data_r =   {DATA_WIDTH{1'b0}}		;
    
    	endcase
    end

    else
    begin
        csr_reg_read_data_r = {DATA_WIDTH{1'b0}};
        csr_dbg_read_valid_r = 1'b0;
        dbg_mode_read_data_r = {DATA_WIDTH{1'b0}};
    end

    end
    
    
    assign csr_reg_read_data    =  csr_reg_read_data_r;
    assign dbg_mode_read_data_o = dbg_mode_read_data_r ;
    assign csr_dbg_read_valid_o = csr_dbg_read_valid_r;

endmodule


