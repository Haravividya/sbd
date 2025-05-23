`timescale 1ns / 1ps
module interrupt_recieve
(
 input logic 	       		zic_clk		            ,
 input logic 	       		zic_rst		            ,
 input logic                wdt_reset_i             ,
 input logic                ack_in                  ,
 input logic    [7:0]       ack_id                  ,
 input logic 	[47:0]      interrupt_enable_i      ,//from memory mapped register
 output logic   [47:0]      interrupt_pending_o     ,//to memoey mapped register
 output logic               interrupt_pending_valid_o,
 input logic 	       		ext_int0_in	            ,//external interrupt lines
 input logic 	       		ext_int1_in	            ,
 input logic 	       		ext_int2_in	            ,
 input logic 	       		ext_int3_in	            ,
 input logic 	       		ext_int4_in	            ,
 input logic 	       		ext_int5_in	            ,
 input logic 	       		ext_int6_in	            ,
 input logic 	       		ext_int7_in	            ,
 input logic 	       		ext_int8_in	            ,
 input logic 	       		ext_int9_in	            ,
 input logic 	       		ext_int10_in	        ,
 input logic 	       		ext_int11_in	        ,
 input logic 	       		ext_int12_in	        ,
 input logic 	       		ext_int13_in	        ,
 input logic 	       		ext_int14_in	        ,
 input logic 	       		ext_int15_in	        ,
 input logic 	       		ext_int16_in	        ,
 input logic 	       		ext_int17_in	        ,
 input logic 	       		ext_int18_in	        ,
 input logic 	       		ext_int19_in	        ,
 input logic 	       		ext_int20_in	        ,
 input logic 	       		ext_int21_in	        ,
 input logic 	       		ext_int22_in	        ,
 input logic 	       		ext_int23_in	        ,
 input logic 	       		ext_int24_in	        ,
 input logic 	       		ext_int25_in	        ,
 input logic 	       		ext_int26_in	        ,
 input logic 	       		ext_int27_in	        ,
 input logic 	       		ext_int28_in	        ,
 input logic 	       		ext_int29_in	        ,
 input logic 	       		ext_int30_in	        ,
 input logic 	       		ext_int31_in	        ,
 input logic 	       		ext_int32_in	        ,
 input logic 	       		ext_int33_in	        ,
 input logic 	       		ext_int34_in	        ,
 input logic 	       		ext_int35_in	        ,
 input logic 	       		ext_int36_in	        ,
 input logic 	       		ext_int37_in	        ,
 input logic 	       		ext_int38_in	        ,
 input logic 	       		ext_int39_in	        ,
 input logic 	       		ext_int40_in	        ,
 input logic 	       		ext_int41_in	        ,
 input logic 	       		ext_int42_in	        ,
 input logic 	       		ext_int43_in	        ,
 input logic 	       		ext_int44_in	        ,
 input logic 	       		ext_int45_in	        ,
 input logic 	       		ext_int46_in	        ,
 input logic 	       		ext_int47_in	  
);

    localparam IRQ_ID_0	    =	16;	
    localparam IRQ_ID_1	    =	17;	
    localparam IRQ_ID_2	    =	18;	
    localparam IRQ_ID_3	    =	19;	
    localparam IRQ_ID_4	    =	20;	
    localparam IRQ_ID_5	    =	21;	
    localparam IRQ_ID_6	    =	22;	
    localparam IRQ_ID_7	    =	23;	
    localparam IRQ_ID_8	    =	24;	
    localparam IRQ_ID_9	    =	25;	
    localparam IRQ_ID_10	=	26;	
    localparam IRQ_ID_11	=   27;
    localparam IRQ_ID_12	=   28;
    localparam IRQ_ID_13	=   29;
    localparam IRQ_ID_14	=   30;
    localparam IRQ_ID_15	=   31;
    localparam IRQ_ID_16	=   32;
    localparam IRQ_ID_17	=   33;
    localparam IRQ_ID_18	=   34;
    localparam IRQ_ID_19	=   35;
    localparam IRQ_ID_20	=   36;
    localparam IRQ_ID_21	=   37;
    localparam IRQ_ID_22	=   38;
    localparam IRQ_ID_23	=   39;
    localparam IRQ_ID_24	=   40;
    localparam IRQ_ID_25	=   41;
    localparam IRQ_ID_26	=   42;
    localparam IRQ_ID_27	=   43;
    localparam IRQ_ID_28	=   44;
    localparam IRQ_ID_29	=   45;
    localparam IRQ_ID_30	=   46;
    localparam IRQ_ID_31	=   47;
    localparam IRQ_ID_32	=   48;
    localparam IRQ_ID_33	=   49;
    localparam IRQ_ID_34	=   50;
    localparam IRQ_ID_35	=   51;
    localparam IRQ_ID_36	=   52;
    localparam IRQ_ID_37	=   53;
    localparam IRQ_ID_38	=   54;
    localparam IRQ_ID_39	=   55;
    localparam IRQ_ID_40	=   56;
    localparam IRQ_ID_41	=   57;
    localparam IRQ_ID_42	=   58;
    localparam IRQ_ID_43	=   59;
    localparam IRQ_ID_44	=   60;
    localparam IRQ_ID_45	=   61;
    localparam IRQ_ID_46	=   62;
    localparam IRQ_ID_47	=   63;

  logic int0_p ;    
  logic int1_p ; 
  logic int2_p ;
  logic int3_p ;
  logic int4_p ;
  logic int5_p ;
  logic int6_p ;
  logic int7_p ;
  logic int8_p ;
  logic int9_p ;
  logic int10_p; 
  logic int11_p;
  logic int12_p;
  logic int13_p;
  logic int14_p;
  logic int15_p;
  logic int16_p;
  logic int17_p;
  logic int18_p;
  logic int19_p;
  logic int20_p;
  logic int21_p;
  logic int22_p;
  logic int23_p;
  logic int24_p;
  logic int25_p;
  logic int26_p;
  logic int27_p;
  logic int28_p;
  logic int29_p;
  logic int30_p;
  logic int31_p;
  logic int32_p;
  logic int33_p;
  logic int34_p;
  logic int35_p;
  logic int36_p;
  logic int37_p;
  logic int38_p;
  logic int39_p;
  logic int40_p;
  logic int41_p;
  logic int42_p;
  logic int43_p;
  logic int44_p;
  logic int45_p;
  logic int46_p;
  logic int47_p;

    assign int0_p		=(interrupt_enable_i[0]  & (!(ack_in && (ack_id == IRQ_ID_0 ))))? ext_int0_in	 : 1'b0 ;		 
    assign int1_p		=(interrupt_enable_i[1]  & (!(ack_in && (ack_id == IRQ_ID_1 ))))? ext_int1_in	 : 1'b0 ; 
    assign int2_p		=(interrupt_enable_i[2]  & (!(ack_in && (ack_id == IRQ_ID_2 ))))? ext_int2_in	 : 1'b0 ; 
    assign int3_p		=(interrupt_enable_i[3]  & (!(ack_in && (ack_id == IRQ_ID_3 ))))? ext_int3_in	 : 1'b0 ; 
    assign int4_p		=(interrupt_enable_i[4]  & (!(ack_in && (ack_id == IRQ_ID_4 ))))? ext_int4_in	 : 1'b0 ;  
    assign int5_p		=(interrupt_enable_i[5]  & (!(ack_in && (ack_id == IRQ_ID_5 ))))? ext_int5_in	 : 1'b0 ; 
    assign int6_p		=(interrupt_enable_i[6]  & (!(ack_in && (ack_id == IRQ_ID_6 ))))? ext_int6_in	 : 1'b0 ;   
    assign int7_p		=(interrupt_enable_i[7]  & (!(ack_in && (ack_id == IRQ_ID_7 ))))? ext_int7_in	 : 1'b0 ;  
    assign int8_p		=(interrupt_enable_i[8]  & (!(ack_in && (ack_id == IRQ_ID_8 ))))? ext_int8_in	 : 1'b0 ; 
    assign int9_p		=(interrupt_enable_i[9]  & (!(ack_in && (ack_id == IRQ_ID_9 ))))? ext_int9_in	 : 1'b0 ; 
    assign int10_p		=(interrupt_enable_i[10] & (!(ack_in && (ack_id == IRQ_ID_10))))? ext_int10_in	 : 1'b0 ;  
    assign int11_p		=(interrupt_enable_i[11] & (!(ack_in && (ack_id == IRQ_ID_11))))? ext_int11_in	 : 1'b0 ;
    assign int12_p		=(interrupt_enable_i[12] & (!(ack_in && (ack_id == IRQ_ID_12))))? ext_int12_in	 : 1'b0 ;
    assign int13_p		=(interrupt_enable_i[13] & (!(ack_in && (ack_id == IRQ_ID_13))))? ext_int13_in	 : 1'b0 ;
    assign int14_p		=(interrupt_enable_i[14] & (!(ack_in && (ack_id == IRQ_ID_14))))? ext_int14_in	 : 1'b0 ;
    assign int15_p		=(interrupt_enable_i[15] & (!(ack_in && (ack_id == IRQ_ID_15))))? ext_int15_in	 : 1'b0 ;
    assign int16_p		=(interrupt_enable_i[16] & (!(ack_in && (ack_id == IRQ_ID_16))))? ext_int16_in	 : 1'b0 ;
    assign int17_p		=(interrupt_enable_i[17] & (!(ack_in && (ack_id == IRQ_ID_17))))? ext_int17_in	 : 1'b0 ;
    assign int18_p		=(interrupt_enable_i[18] & (!(ack_in && (ack_id == IRQ_ID_18))))? ext_int18_in	 : 1'b0 ;
    assign int19_p		=(interrupt_enable_i[19] & (!(ack_in && (ack_id == IRQ_ID_19))))? ext_int19_in	 : 1'b0 ;
    assign int20_p		=(interrupt_enable_i[20] & (!(ack_in && (ack_id == IRQ_ID_20))))? ext_int20_in	 : 1'b0 ;
    assign int21_p		=(interrupt_enable_i[21] & (!(ack_in && (ack_id == IRQ_ID_21))))? ext_int21_in	 : 1'b0 ;
    assign int22_p		=(interrupt_enable_i[22] & (!(ack_in && (ack_id == IRQ_ID_22))))? ext_int22_in	 : 1'b0 ;
    assign int23_p		=(interrupt_enable_i[23] & (!(ack_in && (ack_id == IRQ_ID_23))))? ext_int23_in	 : 1'b0 ;
    assign int24_p		=(interrupt_enable_i[24] & (!(ack_in && (ack_id == IRQ_ID_24))))? ext_int24_in	 : 1'b0 ;
    assign int25_p		=(interrupt_enable_i[25] & (!(ack_in && (ack_id == IRQ_ID_25))))? ext_int25_in	 : 1'b0 ;
    assign int26_p		=(interrupt_enable_i[26] & (!(ack_in && (ack_id == IRQ_ID_26))))? ext_int26_in	 : 1'b0 ;
    assign int27_p		=(interrupt_enable_i[27] & (!(ack_in && (ack_id == IRQ_ID_27))))? ext_int27_in	 : 1'b0 ;
    assign int28_p		=(interrupt_enable_i[28] & (!(ack_in && (ack_id == IRQ_ID_28))))? ext_int28_in	 : 1'b0 ;
    assign int29_p		=(interrupt_enable_i[29] & (!(ack_in && (ack_id == IRQ_ID_29))))? ext_int29_in	 : 1'b0 ;
    assign int30_p		=(interrupt_enable_i[30] & (!(ack_in && (ack_id == IRQ_ID_30))))? ext_int30_in	 : 1'b0 ;
    assign int31_p		=(interrupt_enable_i[31] & (!(ack_in && (ack_id == IRQ_ID_31))))? ext_int31_in	 : 1'b0 ;
    assign int32_p		=(interrupt_enable_i[32] & (!(ack_in && (ack_id == IRQ_ID_32))))? ext_int32_in	 : 1'b0 ;
    assign int33_p		=(interrupt_enable_i[33] & (!(ack_in && (ack_id == IRQ_ID_33))))? ext_int33_in	 : 1'b0 ;
    assign int34_p		=(interrupt_enable_i[34] & (!(ack_in && (ack_id == IRQ_ID_34))))? ext_int34_in	 : 1'b0 ;
    assign int35_p		=(interrupt_enable_i[35] & (!(ack_in && (ack_id == IRQ_ID_35))))? ext_int35_in	 : 1'b0 ;
    assign int36_p		=(interrupt_enable_i[36] & (!(ack_in && (ack_id == IRQ_ID_36))))? ext_int36_in	 : 1'b0 ;
    assign int37_p		=(interrupt_enable_i[37] & (!(ack_in && (ack_id == IRQ_ID_37))))? ext_int37_in	 : 1'b0 ;
    assign int38_p		=(interrupt_enable_i[38] & (!(ack_in && (ack_id == IRQ_ID_38))))? ext_int38_in	 : 1'b0 ;
    assign int39_p		=(interrupt_enable_i[39] & (!(ack_in && (ack_id == IRQ_ID_39))))? ext_int39_in	 : 1'b0 ;
    assign int40_p		=(interrupt_enable_i[40] & (!(ack_in && (ack_id == IRQ_ID_40))))? ext_int40_in	 : 1'b0 ;
    assign int41_p		=(interrupt_enable_i[41] & (!(ack_in && (ack_id == IRQ_ID_41))))? ext_int41_in	 : 1'b0 ;
    assign int42_p		=(interrupt_enable_i[42] & (!(ack_in && (ack_id == IRQ_ID_42))))? ext_int42_in	 : 1'b0 ;
    assign int43_p		=(interrupt_enable_i[43] & (!(ack_in && (ack_id == IRQ_ID_43))))? ext_int43_in	 : 1'b0 ;
    assign int44_p		=(interrupt_enable_i[44] & (!(ack_in && (ack_id == IRQ_ID_44))))? ext_int44_in	 : 1'b0 ;
    assign int45_p		=(interrupt_enable_i[45] & (!(ack_in && (ack_id == IRQ_ID_45))))? ext_int45_in	 : 1'b0 ;
    assign int46_p		=(interrupt_enable_i[46] & (!(ack_in && (ack_id == IRQ_ID_46))))? ext_int46_in	 : 1'b0 ;
    assign int47_p		=(interrupt_enable_i[47] & (!(ack_in && (ack_id == IRQ_ID_47))))? ext_int47_in	 : 1'b0 ;
    
    always_ff@(posedge zic_clk or negedge zic_rst)
    begin
    	if(!zic_rst)
    	begin
            interrupt_pending_o       <= 48'd0;
    	    interrupt_pending_valid_o <= 1'b0;   
    	end
    
        else if(wdt_reset_i)
        begin
            interrupt_pending_o       <= 48'd0;
    	    interrupt_pending_valid_o <= 1'b0; 
        end
    
    	else
    	begin
        interrupt_pending_o <= {int47_p,int46_p,int45_p,int44_p,int43_p,int42_p,int41_p,int40_p,int39_p,int38_p,int37_p,int36_p,int35_p,int34_p,int33_p,int32_p,int31_p,int30_p,int29_p,int28_p,int27_p,int26_p,int25_p,int24_p,int23_p,int22_p,int21_p,int20_p,int19_p,int18_p,int17_p,int16_p,int15_p,int14_p,int13_p,int12_p,int11_p,int10_p,int9_p,int8_p,int7_p,int6_p,int5_p,int4_p,int3_p,int2_p,int1_p,int0_p};
        interrupt_pending_valid_o <= 1'b1;
    
    	end
    
    end
    
endmodule

