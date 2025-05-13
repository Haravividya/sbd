`timescale 1ns/1ps
module zilla_program_control_fsm
#(
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
    input logic 			zpc_clk				,
    input logic 			zpc_rst				,
    input logic             wdt_reset_i         ,
    input logic 			csr_mstatus_mie_i		,//from CSR
    input logic 			zic_int_req_i			,//from zic
    input logic 			stall_valid_i			,//from load hazard control block
    input logic 			mret_valid_i			,//from decoder
    input logic  [7:0]    	zic_mmr_ack_id_i		,//from zic_mmr	
    input logic 			exception_valid_i		,//from exception detect block
    input logic  [7:0] 	    mcause_id_i			        ,//from CSR: new change
    output logic			interrupt_valid_o		    ,//to pc update 
    output logic  		    csr_mstatus_mie_set_o		,//to CSR
    output logic  		    csr_mstatus_mie_clear_o		,//to CSR
    output logic 			csr_mepc_write_valid_o		,//to CSR
    output logic			zic_mmr_ack_read_valid_o	,//to zic mmr
    output logic 			zic_mmr_eoi_write_valid_o	,//to zic mmr
    output logic [7:0]      zic_mmr_eoi_id_o		    ,//to zic mmr
    output logic [2:0]      zpc_pc_ctrl_o			    ,
    output logic			trap_valid_o			    ,
    output logic 			flush_valid_o		        ,
    input logic             dbg_hartreset_i	            ,     
    input logic             dbg_haltreq_i	            ,
    input logic             dbg_resumereq_i	            ,
    input logic             dbg_ndmrst_i                ,
    input logic             dbg_setresethaltreq_i       ,
    input logic             ebreak_valid_i              ,
    output logic            hart_halt_valid_o           ,
    output logic            hart_resume_valid_o         ,
    input logic             resethaltreq_i
    );
    
    logic [2:0] present_state_r;
    logic [2:0] next_state_r;

    localparam RST 		    = 3'b000;
    localparam PC_INC	    = 3'b001;
    localparam TRAP_ENTRY   = 3'b010;
    localparam TRAP_EXIT	= 3'b011;
    localparam DEBUG_ENTRY  = 3'b100;
    localparam DEBUG_EXIT   = 3'b101;

    logic [7:0] eoi_id_w;
    logic  csr_mstatus_mie_set_w;
    
    logic trap_valid_r ;
    assign trap_valid_o = trap_valid_r;
    
    assign interrupt_valid_o = (zic_int_req_i & csr_mstatus_mie_i) ? 1'b1 : 1'b0;
    assign trap_valid_r	= interrupt_valid_o | exception_valid_i;
    
    
    ////////present state logic///////////////////////////
    always_ff @(posedge zpc_clk or negedge zpc_rst)
    begin
    	if(!zpc_rst )
    	begin
    		present_state_r <= RST		;
    		csr_mstatus_mie_set_o <= 1'b0	;
    
    
    	end
    
       else if(dbg_hartreset_i | dbg_ndmrst_i | wdt_reset_i)
       begin
           		present_state_r <= RST		;
    		csr_mstatus_mie_set_o <= 1'b0	;
    
       end
    	else
    	begin
    		present_state_r <= next_state_r ;
    		csr_mstatus_mie_set_o	<= csr_mstatus_mie_set_w;
    	end
    end
    ///////////////////////////////////////////////////////
    
    
    ///////next state logic////////////////////////////////
    always_comb
    begin
    	unique case(present_state_r)
    		RST:
    		begin
                //hart_halt_valid_o = 1'b0;
    			if(zpc_rst &&(!dbg_hartreset_i) && (!dbg_ndmrst_i) && resethaltreq_i)
    			begin
    				next_state_r = DEBUG_ENTRY	;
    			end
    			else if((zpc_rst &&(!dbg_hartreset_i) && (!dbg_ndmrst_i) && (!resethaltreq_i)))
    			begin
    				next_state_r = 	PC_INC;
    			end
                else
                begin
                    next_state_r = RST;
                end
    		end
            DEBUG_ENTRY:
            begin
                //hart_halt_valid_o = 1'b1;
                if(dbg_resumereq_i)
                begin
                    next_state_r = DEBUG_EXIT;
                end
                else
                begin
                    next_state_r = DEBUG_ENTRY;
                end
            end
            DEBUG_EXIT:
            begin
               //hart_halt_valid_o =1'b0;
                next_state_r = PC_INC;
            end
    		PC_INC:
    		begin
                //hart_halt_valid_o = 1'b0;
                if(dbg_haltreq_i | ebreak_valid_i)
                begin
                    next_state_r = DEBUG_ENTRY;
                end
    
    			else if(trap_valid_r)
    			begin
    				next_state_r = TRAP_ENTRY; 
    			end
    			else if(mret_valid_i)
    			begin
    				next_state_r = TRAP_EXIT;
    			end
    
    			else
    			begin
                   //hart_halt_valid_o = 1'b0;
    				next_state_r = PC_INC;
    			end
    		end
    		TRAP_ENTRY:
    		begin
                 //hart_halt_valid_o = 1'b0;
    			if(!trap_valid_r)
    			begin
    				next_state_r = PC_INC;
    			end
    			else
    			begin
    				next_state_r = TRAP_ENTRY;
    			end
    		
    		end
    		TRAP_EXIT:
    		begin
                 //hart_halt_valid_o = 1'b0;
    			if(!mret_valid_i)
    			begin
    				next_state_r = PC_INC;
    			end
    			else
    			begin
    				next_state_r = TRAP_EXIT;
    			end
    		
    		end
    
    		default:
    		begin
    			next_state_r = PC_INC;
    		end
    	endcase
    end
    
    always_comb
    begin
                 if (dbg_hartreset_i | dbg_ndmrst_i | wdt_reset_i)
                begin
                    hart_halt_valid_o = 1'b0;
                end
                else if(present_state_r == DEBUG_ENTRY)
                begin
                    hart_halt_valid_o = 1'b1;
                end
                else
                begin
                    hart_halt_valid_o = 1'b0 ; 
                end
    
    
    end
    
    assign hart_resume_valid_o = (present_state_r == DEBUG_EXIT ) ? 1'b1 : 1'b0;
    assign zpc_pc_ctrl_o = present_state_r;
    assign csr_mstatus_mie_set_w    = (present_state_r == TRAP_EXIT )  ? 1'b1 : 1'b0;
    assign csr_mstatus_mie_clear_o  = (present_state_r == TRAP_ENTRY)  ? 1'b1 : 1'b0;
    assign csr_mepc_write_valid_o   = (present_state_r == TRAP_ENTRY)  ? 1'b1 : 1'b0;
    assign zic_mmr_ack_read_valid_o = (present_state_r == TRAP_ENTRY)  ? 1'b1 : 1'b0;
    assign flush_valid_o 		= (((present_state_r == RST) | present_state_r == TRAP_ENTRY)| (present_state_r == TRAP_EXIT)) ? 1'b1 :1'b0 ;
    
    assign zic_mmr_eoi_id_o = mret_valid_i ? mcause_id_i : 8'd0 ;
    assign zic_mmr_eoi_write_valid_o= mret_valid_i  ? 1'b1 : 1'b0;

endmodule


