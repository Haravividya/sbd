`timescale 1ns/1ps

module zilla_instruction_buffer
#(
parameter DATA_WIDTH        = 0,
parameter INSTRUCTION_WIDTH = 0,
parameter PC_WIDTH          = 0
)


(
     input logic 		z_clk			        ,
     input logic 		z_rst			        ,
     input logic        wdt_reset_i             ,
     input logic 		z_instruction_valid_i	,
     input logic 		flush_valid_i		    ,
     input logic 		trap_valid_i		    ,
     input logic 		stall_valid_i		    ,
     input logic        mret_valid_i            ,
     input logic 		branch_valid_i		    ,
     input logic  [INSTRUCTION_WIDTH-1:0] 	z_instruction_i		        ,
     output logic [INSTRUCTION_WIDTH-1:0] 	z_instruction_o		        ,
     output logic                           decode_instruction_valid    ,
     input logic                            debug_mode_valid_i          ,
     input logic                            dbg_hartreset_i             ,
     input logic                            dbg_ndmrst_i                ,
     input logic                            dbg_haltreq_i
    
    
    
    );
    
    
    localparam NOP = 32'h0000_0013;//addi 0,0,0

      logic [INSTRUCTION_WIDTH-1:0] zib [4:0];
      logic [2:0] write_ptr_r;
      logic [2:0] read_ptr_r;
      logic branch_valid_r;
      logic branch_valid_r1;
      logic [2:0] r_current_state;
      logic [2:0] r_next_state;
      logic z_instruction_valid_r;
      logic z_instruction_valid_r1;
      logic trap_valid_r;
      logic trap_valid_r1;
      logic trap_valid_r2;
      logic debug_mode_valid_r;
      logic clear_zib;
    
    assign clear_zib = dbg_haltreq_i && branch_valid_r;
    
    
    /////WRITE POINTER STATE MACHINE/////////
    localparam IDLE  =3'b000; 
    localparam LOC_0 =3'b001; 
    localparam LOC_1 =3'b010; 
    localparam LOC_2 =3'b011; 
    localparam LOC_3 =3'b100; 
    localparam LOC_4 =3'b101; 
    
      logic [2:0] w_current_state;
      logic [2:0] w_next_state;
      logic stall_valid_r;
      logic stall_valid_r1;
      logic stall_valid_r2;
      logic mret_valid_r;
      logic mret_valid_r1;
      logic mret_valid_r2;
      logic debug_mode_valid_r1;

    always_ff@(posedge z_clk or negedge z_rst)
    begin
    	if(!z_rst )
    	begin
    		w_current_state <= IDLE;
    		stall_valid_r <= 1'b0;
    		branch_valid_r <= 1'b0;
    		branch_valid_r1 <= 1'b0;
    		stall_valid_r1 <= 1'b0;
            stall_valid_r2 <= 1'b0;
            mret_valid_r <= 1'b0 ;
            mret_valid_r1 <= 1'b0 ;
            mret_valid_r2 <= 1'b0;        
            trap_valid_r <= 1'b0 ;
            trap_valid_r1 <= 1'b0 ;
            trap_valid_r2 <= 1'b0;
            debug_mode_valid_r <= 1'b0;
            debug_mode_valid_r1 <= 1'b0;
    
    
    	end
        else if(dbg_hartreset_i | dbg_ndmrst_i | wdt_reset_i)
        begin
    		w_current_state <= IDLE;
    		stall_valid_r <= 1'b0;
    		branch_valid_r <= 1'b0;
    		branch_valid_r1 <= 1'b0;
    		stall_valid_r1 <= 1'b0;
            stall_valid_r2 <= 1'b0;
            mret_valid_r <= 1'b0 ;
            mret_valid_r1 <= 1'b0 ;
            mret_valid_r2 <= 1'b0;        
            trap_valid_r <= 1'b0 ;
            trap_valid_r1 <= 1'b0 ;
            trap_valid_r2 <= 1'b0;
            debug_mode_valid_r1 <= 1'b0;
            
    
    
        end
    	else
    	begin
    
       //if(z_instruction_valid_r)
    	//begin
    		w_current_state <= w_next_state;
    //	end 
    		stall_valid_r <= stall_valid_i;
    		branch_valid_r <= branch_valid_i;
    		branch_valid_r1 <= branch_valid_r;
    		stall_valid_r1 <= stall_valid_r;
            stall_valid_r2 <= stall_valid_r1;
            mret_valid_r <= mret_valid_i;
            mret_valid_r1 <= mret_valid_r;
            mret_valid_r2 <= mret_valid_r1;
            trap_valid_r <= trap_valid_i;
            trap_valid_r1 <=trap_valid_r;
            trap_valid_r2 <=trap_valid_r1;
            debug_mode_valid_r <= debug_mode_valid_i;
            debug_mode_valid_r1 <= debug_mode_valid_r;
    
    	end
    end
    
    always_comb
    begin
    	unique case(w_current_state)
    		IDLE:
    		begin
                if(dbg_hartreset_i | wdt_reset_i)
                begin
                    w_next_state = IDLE;
                end
    		else if((!debug_mode_valid_i) & z_instruction_valid_i)
    		begin
    			w_next_state = LOC_0;
    		end
            else
            begin
                 w_next_state = IDLE;
    
            end
    		end
    		LOC_0:
    		begin
    		if((!debug_mode_valid_i) & z_instruction_valid_i)
    		begin
    			if(stall_valid_i | stall_valid_r)
    			begin
    				w_next_state = LOC_0;
    			end
    			else if(branch_valid_i | branch_valid_r)
    			begin
    				w_next_state = LOC_0;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				w_next_state = LOC_0;
    			end
    
    			else
    			begin
    				w_next_state = LOC_1;
    			end
    		end
    	else
    	begin
    	w_next_state = LOC_0;
    	end
    		end
    		LOC_1:
    		begin
    		if((!debug_mode_valid_i) & z_instruction_valid_i)
    		begin
    			if( stall_valid_i | stall_valid_r )
    			begin
    				w_next_state = LOC_1;
    			end
    			else if(branch_valid_i | branch_valid_r)
    			begin
    				w_next_state = LOC_1;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				w_next_state = LOC_1;
    			end
    
    			else
    			begin
    				w_next_state = LOC_2;
    			end
    			end
    			else
    			begin
    			w_next_state = LOC_1;
    			end
    
    		end
    		LOC_2:
    		begin
    		if((!debug_mode_valid_i) & z_instruction_valid_i)
    		begin
    			if(stall_valid_i | stall_valid_r )
    			begin
    				w_next_state = LOC_2;
    			end
    			else if(branch_valid_i | branch_valid_r)
    			begin
    				w_next_state = LOC_2;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				w_next_state = LOC_2;
    			end
    
    			else
    			begin
    				w_next_state = LOC_3;
    			end
    			end
    			else
    			begin
    			w_next_state = LOC_2;
    			end
    
    
    		end
    		LOC_3:
    		begin
    		if((!debug_mode_valid_i) & z_instruction_valid_i)
    		begin
    			if(stall_valid_i | stall_valid_r )
    			begin
    				w_next_state = LOC_3;
    			end
    			else if(branch_valid_i | branch_valid_r)
    			begin
    				w_next_state = LOC_3;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				w_next_state = LOC_3;
    			end
    
    			else
    			begin
    				w_next_state = LOC_4;
    			end
    			end
    			else
    			begin
    			w_next_state = LOC_3;
    			end
    
    
    		end
    		LOC_4:
    		begin
    		if((!debug_mode_valid_i) & z_instruction_valid_i)
    		begin
    			if(stall_valid_i | stall_valid_r )
    			begin
    				w_next_state = LOC_4;
    			end
    			else if(branch_valid_i | branch_valid_r )
    			begin
    				w_next_state = LOC_4;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				w_next_state = LOC_4;
    			end
    
    			else
    			begin
    				w_next_state = LOC_0;
    			end
    			end
    			else
    			begin
    			w_next_state = LOC_4;
    			end
    		end
    		default:
    		begin
    			w_next_state = IDLE;
    		end
    	endcase
    end
    
    always_comb
    begin
    	unique case(w_current_state)
    		IDLE:write_ptr_r = 3'd0;
    		LOC_0:write_ptr_r = 3'd0;
    		LOC_1:write_ptr_r = 3'd1;
    		LOC_2:write_ptr_r = 3'd2;
    		LOC_3:write_ptr_r = 3'd3;
    		LOC_4:write_ptr_r = 3'd4;
    		default:write_ptr_r = 3'd0;
    	endcase
    end
    ////////////////////////////////////////
    
    
    /////READ POINTER STATE MACHINE/////////
      logic debug_resume_branch;
    assign debug_resume_branch = debug_mode_valid_r1 && branch_valid_i ;
    always_ff @(posedge z_clk or negedge z_rst)
    begin
    	if(!z_rst )
    
    	begin
    		r_current_state <= IDLE;
    		z_instruction_valid_r <= 1'b0;
    		z_instruction_valid_r1 <= 1'b0;
    	end
        else if(dbg_hartreset_i | dbg_ndmrst_i | wdt_reset_i)
        begin
            r_current_state <= IDLE;
    		z_instruction_valid_r <= 1'b0;
    		z_instruction_valid_r1 <= 1'b0;
    
        end
    	else
    	begin
    	z_instruction_valid_r <= z_instruction_valid_i;
    	z_instruction_valid_r1 <= z_instruction_valid_r;
        r_current_state <= r_next_state;
    
    	end
    end
      logic out_instruction_valid;
    
    always_comb
    begin
    	unique case(r_current_state)
    		IDLE:
    		begin
    		if((!debug_mode_valid_i) & z_instruction_valid_r)
    		begin
    			r_next_state = LOC_0;
    		end
    		else
    		begin
    		      r_next_state = IDLE;
    		end
    		end
    		LOC_0:
    		begin
                if((!debug_mode_valid_i) & z_instruction_valid_i)
                begin
    			if(stall_valid_i | stall_valid_r)
    			begin
    				r_next_state = LOC_0;
    			end
    		//	else if(branch_valid_r | branch_valid_r1)
                else if(branch_valid_r | branch_valid_i)
    
    			begin
    				r_next_state = LOC_0;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				r_next_state = LOC_0;
    			end
    			else
    			begin
    				r_next_state = LOC_1;
    			end
                end
                else
                begin
                    r_next_state = LOC_0;
                end
    
    		end
    		LOC_1:
    		begin
                            if((!debug_mode_valid_i) & z_instruction_valid_i)
                begin
    
    			if(stall_valid_i | stall_valid_r)
    			begin
    				r_next_state = LOC_1;
    			end
    		//	else if(branch_valid_r | branch_valid_r1)
                else if(branch_valid_r | branch_valid_i)
    			begin
    				r_next_state = LOC_1;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				r_next_state = LOC_1;
    			end
    
    			else
    			begin
    				r_next_state = LOC_2;
    			end
                            end
                else
                begin
                    r_next_state = LOC_1;
                end
    
    
    		end
    		LOC_2:
    		begin
                            if((!debug_mode_valid_i) & z_instruction_valid_i)
                begin
    
    			if(stall_valid_i | stall_valid_r )
    			begin
    				r_next_state = LOC_2;
    			end
    		//	else if(branch_valid_r | branch_valid_r1)
                else if(branch_valid_r | branch_valid_i)
    			begin
    				r_next_state = LOC_2;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				r_next_state = LOC_2;
    			end
    
    			else
    			begin
    				r_next_state = LOC_3;
    			end
                            end
                else
                begin
                    r_next_state = LOC_2;
                end
    
    
    
    		end
    		LOC_3:
    		begin
                            if((!debug_mode_valid_i) & z_instruction_valid_i)
                begin
    
    			if(stall_valid_i | stall_valid_r)
    			begin
    				r_next_state = LOC_3;
    			end
    		//	else if(branch_valid_r | branch_valid_r1)
                else if(branch_valid_r | branch_valid_i)
    			begin
    				r_next_state = LOC_3;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				r_next_state = LOC_3;
    			end
    
    			else
    			begin
    				r_next_state = LOC_4;
    			end
                            end
                else
                begin
                    r_next_state = LOC_3;
                end
    
    
    
    		end
    		LOC_4:
    		begin
                            if((!debug_mode_valid_i) & z_instruction_valid_i)
                begin
    
    			if(stall_valid_i| stall_valid_r)
    			begin
    				r_next_state = LOC_4;
    			end
    		//	else if(branch_valid_r | branch_valid_r1)
                else if(branch_valid_r | branch_valid_i)
    			begin
    				r_next_state = LOC_4;
    			end
    			else if(flush_valid_i | trap_valid_i)
    			begin
    				r_next_state = LOC_4;
    			end
    
    			else
    			begin
    				r_next_state = LOC_0;
    			end
                            end
                else
                begin
                    r_next_state = LOC_4;
                end
    
    		end
    		default:
    		begin
    			r_next_state = IDLE;
    		end
    	endcase
    end
    
    always_comb
    begin
        unique case(r_current_state)
    		IDLE :read_ptr_r = 3'd0;
    		LOC_0:read_ptr_r = 3'd0;
    		LOC_1:read_ptr_r = 3'd1;
    		LOC_2:read_ptr_r = 3'd2;
    		LOC_3:read_ptr_r = 3'd3;
    		LOC_4:read_ptr_r = 3'd4;
    		default:read_ptr_r = 3'd0;
    	endcase
    end
      logic [2:0] read_ptr_r1;
    always_ff @(posedge z_clk or negedge z_rst)
    begin
    	if(!z_rst )
    
    	begin
    		read_ptr_r1 <= 3'd0;
    	end
        else if(dbg_hartreset_i | dbg_ndmrst_i | wdt_reset_i)
        begin
            		read_ptr_r1 <= 3'd0;
    
        end
    	else
    	begin
    	if(!stall_valid_i)
    	begin
    		read_ptr_r1 <= read_ptr_r;
    		end
    	end
    end
    
    assign out_instruction_valid = (r_current_state != 3'd0);
    ////////////////////////////////////////
    
      logic [2:0] wp;
    assign wp = write_ptr_r;
    always_ff @(posedge z_clk or negedge z_rst)
    begin
        if(!z_rst )
        begin
            zib[0] <= NOP ;
            zib[1] <= NOP ;
            zib[2] <= NOP ;
            zib[3] <= NOP ;
            zib[4] <= NOP ;
            
        end
        else if(dbg_hartreset_i | dbg_ndmrst_i | clear_zib | wdt_reset_i)
        begin
            zib[0] <= NOP ;
            zib[1] <= NOP ;
            zib[2] <= NOP ;
            zib[3] <= NOP ;
            zib[4] <= NOP ;
    
        end
    	else if(z_instruction_valid_r && (!debug_mode_valid_r))
    	begin
    		zib[wp] <= z_instruction_i;
    	end
    end
    /////////////////instruction read//////////////////
    assign z_instruction_o = ((((!(debug_mode_valid_i || debug_mode_valid_r)) & (!flush_valid_i)) &(!trap_valid_r1) &(!trap_valid_r2) & (!mret_valid_r1) & (!mret_valid_r2) & (!(stall_valid_r))   & (!branch_valid_r) & (!branch_valid_r1)  & out_instruction_valid)) ?  zib[read_ptr_r] : NOP ;
    assign decode_instruction_valid = ((((!(debug_mode_valid_i || debug_mode_valid_r)) & (!flush_valid_i)) &(!trap_valid_r1) &(!trap_valid_r2) & (!mret_valid_r1) & (!mret_valid_r2) & (!(stall_valid_r))   & (!branch_valid_r) & (!branch_valid_r1) & out_instruction_valid)) ? 1'b1 : 1'b0;
endmodule
