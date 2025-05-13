`timescale 1ns/1ps

module z_exception_detect
#(
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)

(
    input logic 				            z_clk			              ,
    input logic 				            z_rst			              ,
    input logic                             wdt_reset_i                   ,
    input logic 				            invalid_instr_valid_i	      ,
    input logic 				            breakpoint_valid_i	          ,
    input logic 				            ecall_valid_i		          ,
    input logic [PC_WIDTH-1:0] 			    branch_pc_i		              ,
    input logic [DATA_WIDTH-1:0] 			ld_sd_addr_i		          ,
    input logic 				            ld_valid_i		              ,
    input logic 				            sd_valid_i		              ,
    input logic [DATA_WIDTH-1:0] 			csr_mtvec_i		              ,
    input logic 				            branch_valid_i		          ,
    input logic [DATA_WIDTH-1:0]			data_mem_max_addr_i	          ,
    input logic [1:0] 			            byte_sel_i		              ,//indicates whether the load/store instruction is byte/halfword/word/doubleword
    output logic [DATA_WIDTH-1:0] 			exception_handler_addr_o      ,
    output logic 			                exception_valid_o	          ,
    output logic [7:0] 		                exception_id_o		          ,
    output logic 				            ld_sd_misalign_valid_o        ,
    output logic [DATA_WIDTH-1:0] 			ld_sd_misalign_addr_o	      ,
    output logic 				            instr_misalign_valid_o        ,
    output logic [PC_WIDTH-1:0] 			instr_misalign_addr_o	      ,
    output logic 				            invalid_instr_valid_o         ,
    input logic                             debug_mode_valid_i            ,
    input logic                             stall_valid_i	              ,
    input logic                             debug_mem_read_enable         , 
    input logic                             debug_mem_write_enable        , 
    input logic [DATA_WIDTH-1:0]            debug_mem_read_addr           , 
    input logic [DATA_WIDTH-1:0]            debug_mem_write_addr          ,
    input logic [(DATA_WIDTH>>3)-1:0]       debug_mem_strobe              ,
    output logic                            debug_exception_valid_o       ,
    input logic                             mem_addr_invalid_i            ,
    input logic [PC_WIDTH-1:0]              instr_read_addr_i       
    );
    
    
    localparam INSTR_MIS_ALGN   = 8'd0  ;
    localparam ILLEGAL_INSTR    = 8'd2	;
    localparam BREAKPOINT	    = 8'd3	;
    localparam ECALL	        = 8'd11	;
    localparam LD_ADDR_MIS_ALGN = 8'd4	;
    localparam SD_ADDR_MIS_ALGN = 8'd6	;
    localparam MEM_OUT_OF_BOUND = 8'd24	;
    localparam INST_MEM_OUT_OF_BOUND = 8'd1 ;
    
    
     logic [DATA_WIDTH-1:0] debug_mem_addr_w;
     assign debug_mem_addr_w = debug_mem_write_enable ? debug_mem_write_addr: debug_mem_read_addr ;

     logic   w_instr_misalign_ex;
     assign w_instr_misalign_ex = ((branch_pc_i[1:0] != 2'b0) & branch_valid_i) ? 1'b1 : 1'b0;

     logic   w_invalid_instr_ex;
     assign w_invalid_instr_ex = invalid_instr_valid_i ;
    
     logic   w_breakpoint_ex;
     assign w_breakpoint_ex = breakpoint_valid_i;
    
     logic   w_ecall_ex;
     assign w_ecall_ex = ecall_valid_i;
    
    
     logic w_ld_misalign_addr_ex;
     logic w_sd_misalign_addr_ex;
     logic w_ld_sd_misalign_addr_ex;
     logic data_mem_addr_max_ex_w;
     logic data_mem_addr_max_ex;
     logic debug_mem_addr_max_ex;
     logic debug_mem_misaligned_exception_w;
//------------------------------instruction memory out of bound exception----------------------------------------------------------------------------------------    
     logic  [PC_WIDTH-1:0]instr_read_addr_w;
     logic  instr_mem_addr_max_ex;
     assign instr_read_addr_w = instr_read_addr_i;
     assign instr_mem_addr_max_ex = ( instr_read_addr_w < 'h8100 || instr_read_addr_w > 'h47FFC) ? 1'b1 :1'b0;    

//-------------------------------------------------------------------------------------------
    assign debug_mem_addr_max_ex = (debug_mode_valid_i && (debug_mem_addr_w > data_mem_max_addr_i)) ? 1'b1 : 1'b0 ;
    assign data_mem_addr_max_ex_w = ((ld_sd_addr_i > data_mem_max_addr_i) || mem_addr_invalid_i) ? 1'b1 : 1'b0;
    assign data_mem_addr_max_ex = ((ld_valid_i && (!stall_valid_i)) & (!w_ld_misalign_addr_ex) & (!w_sd_misalign_addr_ex))  ? data_mem_addr_max_ex_w : 1'b0;
    assign w_ld_misalign_addr_ex = (ld_valid_i && (!stall_valid_i)) ? w_ld_sd_misalign_addr_ex : 1'b0 ;
    assign w_sd_misalign_addr_ex = sd_valid_i ? w_ld_sd_misalign_addr_ex : 1'b0 ;
    
    //{w_instr_misalign_ex,w_invalid_instr_ex,w_breakpoint_ex,w_ecall_ex,w_ld_misalign_addr_ex,w_sd_misalign_addr_ex}
    
     logic debug_mem_misaligned_exception_r ;
     logic debug_mem_misaligned_exception_r1;
     logic debug_mem_misaligned_exception_w1;

    always_ff @(posedge z_clk or negedge z_rst)
        begin
            if(!z_rst)
            begin
                debug_mem_misaligned_exception_r  <= 1'b0;
                debug_mem_misaligned_exception_r1 <= 1'b0;
            end
            else
            begin
                debug_mem_misaligned_exception_r  <= debug_mem_misaligned_exception_w;
                debug_mem_misaligned_exception_r1 <= debug_mem_misaligned_exception_r;
    
            end
        end
     
     assign debug_mem_misaligned_exception_w1 = debug_mem_misaligned_exception_w ^ debug_mem_misaligned_exception_r ;

    always_comb
    begin
    	unique case(byte_sel_i)
    		2'b00://ld sd byte
    		begin
    			w_ld_sd_misalign_addr_ex = 1'b0;
    		end
    		2'b01://ld sd halfword
    		begin
    			if(ld_sd_addr_i[0] != 1'b0)
    			begin
    				w_ld_sd_misalign_addr_ex = 1'b1;
    			end
    			else
    			begin
    				w_ld_sd_misalign_addr_ex = 1'b0;
    			end
    		end
    		2'b10://ld sd word
    		begin
    			if(ld_sd_addr_i[1:0] != 2'b0)
    			begin
    				w_ld_sd_misalign_addr_ex = 1'b1;
    			end
    			else
    			begin
    				w_ld_sd_misalign_addr_ex = 1'b0;
    			end
    
    		end
    		2'b11://ld sd double word
    		begin
    			if(ld_sd_addr_i[2:0] != 3'b0)
    			begin
    				w_ld_sd_misalign_addr_ex = 1'b1;
    			end
    			else
    			begin
    				w_ld_sd_misalign_addr_ex = 1'b0;
    			end
    
    		end
    		default: 
    		begin
    				w_ld_sd_misalign_addr_ex = 1'b0;
    		end
    		endcase
    end
    
    
    always_comb
    begin
        if(!debug_mode_valid_i)
        begin
    	unique case({w_instr_misalign_ex,w_invalid_instr_ex,w_breakpoint_ex,w_ecall_ex,w_ld_misalign_addr_ex,w_sd_misalign_addr_ex,data_mem_addr_max_ex,instr_mem_addr_max_ex})
    		8'b00000000://no exception
    		begin
    			exception_valid_o = 1'b0;
    			exception_id_o	  = 8'd0   ;
    		end
    		8'b10000000://instruction misalign
    		begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = INSTR_MIS_ALGN  ;
    		end
    
    		8'b01000000://invalid instruction
    		begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = ILLEGAL_INSTR  ;
    		end
    
    		8'b00100000://break point
    		begin
    			exception_valid_o = 1'b0;
    			exception_id_o	  = BREAKPOINT  ;
    		end
    
    		8'b00010000://ecall
    		begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = ECALL  ;
    		end
    
    		8'b00001000://load addr misalign
    		begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = LD_ADDR_MIS_ALGN  ;
    		end
    
    		8'b00000100://store addr misalign
    		begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = SD_ADDR_MIS_ALGN  ;
    		end
    		8'b00000010://data_memory out of bound
    		begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = MEM_OUT_OF_BOUND  ;
    		end
    		8'b00000001://inst_memory out of bound
    		begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = INST_MEM_OUT_OF_BOUND  ;
    		end
                   
    		default:
    		begin
    			exception_valid_o = 1'b0;
    			exception_id_o	  = 8'd0   ;
    		end
    
    	endcase
    end
    else
    begin
        if(debug_mem_misaligned_exception_w & debug_mem_read_enable)
        begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = LD_ADDR_MIS_ALGN  ;
    
        end
        else if(debug_mem_misaligned_exception_w & debug_mem_write_enable)
        begin
            	exception_valid_o = 1'b1;
    			exception_id_o	  = SD_ADDR_MIS_ALGN  ;
    
        end
        else if(debug_mem_addr_max_ex && (debug_mem_read_enable || debug_mem_write_enable))
        begin
    			exception_valid_o = 1'b1;
    			exception_id_o	  = MEM_OUT_OF_BOUND  ;
         
        end
        else
        begin
            			exception_valid_o = 1'b0;
    			exception_id_o	  = 8'd0 ;
         
    
        end
    end
    end
    
    always_comb
    begin
        if(debug_mode_valid_i && (debug_mem_read_enable || debug_mem_write_enable))
        begin
            unique case(debug_mem_strobe)
                8'b0000_0001:
                begin
                    debug_mem_misaligned_exception_w = 1'b0;
                end
                8'b0000_0011:
                begin
                    if(debug_mem_addr_w[0]  != 1'b0 )
                    begin
                        debug_mem_misaligned_exception_w = 1'b1 ;
                    end
                    else
                    begin
                        debug_mem_misaligned_exception_w = 1'b0 ;
                    end
                end
                8'b0000_1111:
                begin
                    if(debug_mem_addr_w[1:0]  != 2'b00 )
                    begin
                        debug_mem_misaligned_exception_w = 1'b1 ;
    
                    end
                    else
                    begin
                        debug_mem_misaligned_exception_w = 1'b0 ;
                    end
    
                end
                8'b1111_1111:
                begin
                    if(debug_mem_addr_w[2:0]  != 3'b000 )
                    begin
                        debug_mem_misaligned_exception_w = 1'b1 ;
    
                    end
                    else
                    begin
                        debug_mem_misaligned_exception_w = 1'b0 ;
                    end
    
                end
                default:
                   begin
                    debug_mem_misaligned_exception_w = 1'b0 ;
    
                   end
    
            endcase
        end
        else
        begin
            debug_mem_misaligned_exception_w = 1'b0 ;
        end
    end
    
    assign exception_handler_addr_o = {csr_mtvec_i[DATA_WIDTH-1:2],2'b00}				;
    assign ld_sd_misalign_valid_o   = (w_ld_misalign_addr_ex | w_sd_misalign_addr_ex)	;
    assign ld_sd_misalign_addr_o    = ld_sd_addr_i						;
    assign instr_misalign_valid_o   = w_instr_misalign_ex					;
    assign instr_misalign_addr_o    = branch_pc_i						;
    assign invalid_instr_valid_o    = w_invalid_instr_ex					;
    //output logic [31:0] 			assign invalid_instruction_in	
    assign debug_exception_valid_o =  debug_mem_misaligned_exception_r |  debug_mem_misaligned_exception_w;
endmodule
