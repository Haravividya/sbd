`timescale 1ns / 1ps
module zic_irg
(
   input logic 		     zic_clk				        ,
   input logic 		     zic_rst				        ,
   input logic           wdt_reset_i                    ,
   input logic [7:0]     highest_pending_lvl_pr_i	    ,//from zic_pr block
   input logic 		     highest_pending_lvl_pr_valid   ,
   input logic [7:0]     highest_pending_int_id_i       ,
   input logic [7:0]     active_lvl_pr_i 	    	    ,   //from CSR
   output logic 		 interrupt_request_o	    	,//to core
   output logic [7:0]    interrupt_id_o		    	    ,//to zic_ack_mmr
   output logic	   	     interrupt_id_valid_o	        ,//to zic_ack_mmr
   input logic		     zic_eoi_valid			        , //end of interrupt signal from core
   input logic           debug_mode_valid_i             ,
   input logic           debug_mode_reset_i             ,
   input logic           debug_ndm_reset_i             
);

    logic pending_irq_valid;
    logic [7:0] highest_pending_lvl_pr_r;

    always_ff@(posedge zic_clk or negedge zic_rst)
    begin
    	if(!zic_rst)
    	begin
    		highest_pending_lvl_pr_r <= 8'd0;
    	end
        else if(wdt_reset_i)
        begin
            highest_pending_lvl_pr_r <= 8'd0;
        end
    	else
    	begin
    		highest_pending_lvl_pr_r <= highest_pending_lvl_pr_i;
    	end
    end
    
    assign pending_irq_valid = highest_pending_lvl_pr_i ^ highest_pending_lvl_pr_r ;
    
    logic sufficient_level_valid;
    
    always_comb
    begin
    	if(highest_pending_lvl_pr_i[7:5] > active_lvl_pr_i[7:5])
    	begin
    		sufficient_level_valid = 1'b1 ;
    	end
    	else
    	begin
    		sufficient_level_valid = 1'b0 ;
    	end
    end
    
    logic interrupt_pending_w;

    assign interrupt_pending_w = (highest_pending_lvl_pr_i != 0) 				  ? 1'b1 	   : 1'b0;
    assign interrupt_request_o = (sufficient_level_valid && (!debug_mode_valid_i) )? 1'b1 	   : 1'b0;
    assign interrupt_id_o	   = (sufficient_level_valid )? highest_pending_int_id_i: 8'd0;
    assign interrupt_id_valid_o= (sufficient_level_valid )? 1'b1 	   : 1'b0;

endmodule


