module axi_slave #(parameter DATA_WIDTH = 32, parameter ADDRESS_WIDTH = 32, parameter WAIT_TIMER = 200, parameter SLAVE_ID = 4'b0011)
			 			(
					///////GLOBAL SIGNALS/////////////// 
			input logic 								axi_aclk, 
			input logic 								axi_areset_n, 

					//////WRITE ADDRESS CHANNEL///////// 
			input logic 				[ADDRESS_WIDTH-1:0] 		axi_awaddr,
			input logic 								axi_awvalid,
			output logic 								axi_awready,
			input logic 				[3:0] 				axi_awid,
			input logic 				[7:0] 				axi_awlen,
			input logic 				[1:0] 				axi_awburst,			

					//////WRITE DATA CHANNEL////////////
			input logic 				[DATA_WIDTH-1:0] 		axi_wdata,
			input logic 								axi_wvalid, 
			output logic 								axi_wready, 
			input logic 				[3:0] 				axi_wid,
			input logic 								axi_wlast,
			input logic 				[(DATA_WIDTH>>3)-1:0] 		axi_wstrb,

					//////WRITE RESPONSE CHANNEL////////
			output logic 				[1:0] 				axi_bresp,
			output logic 								axi_bvalid,
			input logic 								axi_bready,
			output logic 				[3:0] 				axi_bid,

					//////READ ADDRESS CHANNEL//////////
			input logic 				[ADDRESS_WIDTH-1:0]		axi_araddr,
			input logic 								axi_arvalid,
			output logic 								axi_arready,
			input logic 				[3:0] 				axi_arid,
			input logic 				[7:0] 				axi_arlen,
			input logic 				[1:0] 				axi_arburst,

					//////READ DATA CHANNEL////////////
			output logic 				[DATA_WIDTH-1:0] 		axi_rdata,
			output logic 								axi_rvalid,
			input logic 								axi_rready,
			output logic 				[3:0] 				axi_rid, 	
			output logic 								axi_rlast,
			output logic 				[1:0] 				axi_rresp,

					////// SLAVE TO MEMORY OUTPUTS//
			output logic 								slave_wren,
			output logic 				[31:0]				slave_waddr,
			output logic 				[31:0]				slave_wdata,

			output logic 								slave_rden,
			output logic 				[31:0]				slave_raddr,
			input logic 				[31:0]				slave_rdata 
						);

 timeunit 1ns;
 timeprecision 1ps;
 
	////////STATE PARAMETERS/////////////
	//WRITE OPERATION////
	localparam WIDL = 3'b000;
	localparam WADR = 3'b001; 
	//localparam awzr = 3'b010;
	localparam WDTA = 3'b010;
	localparam WWAIT = 3'b011;
	localparam BRSP = 3'b100;

	//READ OPERATION////
	localparam RIDL = 3'b000;
	localparam RADR = 3'b001;
	localparam RWAIT = 3'b010;
	localparam RDTA = 3'b011;
	localparam RRSP = 3'b100;
	//localparam rzro = 3'b10;
	//localparam rwai = 3'b100;


	/////////RESPONSE STATES/////
	logic [2:0]wstate;	   // 
	logic [2:0]wnextstate;       // 
	/////////READ STATES/////////
	logic [2:0] rstate;	   //
	logic [2:0] rnextstate;	   //
	/////////////////////////////





///////////////////////// SLAVE REGISTERS////////////////////////////
//-- HANDSHAKING OUTPUT REGISTERS-------
//logic [1:0] bresp_reg;
logic rvalid_reg;

//----ADDRESS REGISTERS------------
logic [ADDRESS_WIDTH-1:0] strt_araddr_reg; //reqd for wrap burst
logic [ADDRESS_WIDTH-1:0] strt_awaddr_reg;//reqd for wrap burst

logic [ADDRESS_WIDTH-1:0] i_araddr_reg; 					
logic [ADDRESS_WIDTH-1:0] i_awaddr_reg; 

logic [ADDRESS_WIDTH-1:0] awaddr_reg; 					
logic [ADDRESS_WIDTH-1:0] araddr_reg;						
//--- CONTROL SIGNAL REGISTERS---------
logic [7:0] awlen_reg;
logic [1:0] awburst_reg;
logic [7:0] s_awlen;

logic [7:0] arlen_reg;
logic [1:0] arburst_reg;

//---- DATA REGISTERS------------
logic [DATA_WIDTH-1:0] WR_reg;						
//logic [DATA_WIDTH-1:0] RD_reg;							


//----- OUTPUT REGISTERS ----------------
logic [DATA_WIDTH-1:0] rdata_reg_out;
logic  [1:0] bresp_reg_out;
logic [3:0] bid_reg_out;
logic [3:0] rid_reg_out;

//--------- INTERNAL CONTROL SIGNALS-------------
//integer byte_addr;	//not used						
integer w_beat_cnt;							
logic w_burst_actv;							
integer w_wait_timer;
						
logic w_timeout; 							

integer r_beat_cnt;


//integer rvalid_cnt ;	

logic [DATA_WIDTH-1:0] WR_wire; 					

//-- RVALID EDGE DETECTION SIGNAL-----------------------------
//logic rvalid_edge_dly;			
//logic rvalid_edge_op;			

//----- WREADY DELAY SIGNAL FOR ENABLE ----------------
logic wready_delay;

logic axi_wlast_delay;
/////////////////////////////////////////////////////////////////////////////////////// WRITE HANDSHAKING FSM ////////////////////////////////////////////////////////////////////

//WRITE PRESENT STATE LOGIC (SEQUENTIAL)
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n) 
	wstate <= WIDL;
	else 
	wstate <= wnextstate;
end

// WRITE NEXT STATE LOGIC (combinational)
always_comb 
begin
	
	unique case(wstate)
/*0*/	WIDL:	begin
				if ((axi_awvalid) && (axi_awid == SLAVE_ID))
				wnextstate = WADR;									
				else 
				wnextstate = WIDL;									
				end
/*1*/	WADR:	begin											
				if ((axi_wvalid /*axi_awvalid_reg*/) && (axi_wid == SLAVE_ID))	
				wnextstate = WDTA;
				else 											
				wnextstate = WADR;
				end
/*2*/	WDTA:	begin												
				if (/*axi_wlast*/ axi_wlast_delay)										
				wnextstate = BRSP;
				else if (w_burst_actv && !axi_wvalid)
				wnextstate = WWAIT;
				else
				wnextstate = WDTA;
				end
/*3*/	WWAIT:	begin 
				if (axi_wvalid && w_burst_actv)
				wnextstate = WDTA;
				else if (w_timeout)
				wnextstate = WIDL;
				else 
				wnextstate = WWAIT;
				end
		
/*4*/	BRSP:	begin											
				if (axi_bready /*axi_bready_delay*/)									
				wnextstate = WIDL;								
				else 
				wnextstate = BRSP;								
				end
	
	
	default :	begin
				wnextstate = WIDL;
				end
	endcase
end
// WRITE OUTPUT LOGIC (COMBINATIONAL LOGIC)
assign axi_awready = ((wstate == WADR) /* && (wstate != WDTA)*/ && axi_awvalid /*axi_awvalid_reg*/);
assign axi_wready = ((wstate == WDTA) /* && (wstate != BRSP)*/ && axi_wvalid);
assign axi_bvalid = ((wstate == BRSP)); 

////

//----------- WRITE BURST PROGRESS SIGNAL-----------------------------
assign w_burst_actv = ((wstate != WIDL) && (w_beat_cnt <= (s_awlen-1'd1)));


//////////////////////////////////////////////////////////////////////////////////

always_ff@(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
	axi_wlast_delay <= 1'b0;
	else 
	axi_wlast_delay <= axi_wlast;
end
///////////////////////////// WRITE CHANNEL LATCHING //////////////
//------WRITE START ADDRESS LATCHING----------------------WRITE CONTROL SIGNAL REGISTERING---------
always_ff @(posedge axi_aclk or negedge axi_areset_n)
	begin 
		if (!axi_areset_n)
		begin
			//strt_awaddr_reg <= {ADDRESS_WIDTH{1'b0}};
			awlen_reg <= 8'd0;
			awburst_reg <= 2'd0;
			i_awaddr_reg <= {ADDRESS_WIDTH{1'b0}};
			
		end 
		else 
		begin 
		  // if (axi_awvalid && axi_awready)
		   if(wstate == WADR)
		      begin
			//strt_awaddr_reg <= axi_awaddr;
	 		awlen_reg <= axi_awlen;
			awburst_reg <= axi_awburst;
			i_awaddr_reg <= axi_awaddr;
			
		      end 
		end
	end

//-------s_awlen---------------//

always_ff @(posedge axi_aclk or negedge axi_areset_n)
	begin
		if (!axi_areset_n)
			begin
				s_awlen <= 8'b0;
			end
		else 
			begin
				s_awlen <= awlen_reg;
			end
	end


//---------- WRITE ADDRESS CALCULATION W.R.T BURST --------------

always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
 	if (!axi_areset_n)
	begin
		awaddr_reg <= {ADDRESS_WIDTH{1'b0}};
		w_beat_cnt <= 32'd0;
	end


	else
	begin
		if(wstate == WDTA)
		begin
			unique case(awburst_reg)
			2'b00:      begin
					awaddr_reg <= i_awaddr_reg;
				    end
			2'b01:      begin
					        if ( axi_wready)
                            begin
						        w_beat_cnt <= w_beat_cnt + 32'd1;
                                if(w_beat_cnt <= 32'd1)
						            awaddr_reg <= i_awaddr_reg + 32'd1;
                                else if(w_beat_cnt <=(s_awlen ))
						            awaddr_reg <= awaddr_reg + 32'd1;
					        end
				        end
			2'b10:	    begin
					if((w_beat_cnt <= (s_awlen )) && axi_wready)
					begin
						w_beat_cnt <= w_beat_cnt + 32'd1;
						if((w_beat_cnt) == s_awlen)
							awaddr_reg <= strt_awaddr_reg;
						else
							awaddr_reg <= awaddr_reg + 32'd1;
					end
				    end
			default:    begin
					awaddr_reg <= {ADDRESS_WIDTH{1'b0}};						
					w_beat_cnt <= 32'd0;
				    end
			endcase
		end
	end
end

/////////////////////strt_awaddr_reg registering for wrap burst only//////
always_ff@(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
		strt_awaddr_reg <= 32'd0;
	else
		strt_awaddr_reg <= axi_awaddr;
end


//------ WRITE DATA REGISTERING W.R.T BYTE STROBE ---------
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if (!axi_areset_n)
	begin
		WR_reg <= 32'd0;
		//byte_addr = 32'd0;
	end
	else
	begin
		if (wstate == WADR)
		WR_reg <= 32'd0;
		else if (wstate == WDTA)
			begin 
                        WR_reg <= WR_wire; 
			end
	end 
end
assign WR_wire = {axi_wdata[31:24] & {8{axi_wstrb[3]}}, axi_wdata[23:16] & {8{axi_wstrb[2]}}, axi_wdata[15:8] & {8{axi_wstrb[1]}}, axi_wdata[7:0] & {8{axi_wstrb[0]}}};


//---------- WRITE WAIT STATE TIMER-------------
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin 
	if (!axi_areset_n)
		w_wait_timer <= 32'd0;
	else
	begin
		if ((wstate == WWAIT) && !(wstate == WDTA))
			w_wait_timer <= w_wait_timer + 32'd1; 
		else 
			w_wait_timer <= 32'd0;
	end 
end
assign w_timeout = (w_wait_timer == WAIT_TIMER);

//---------- BRESPONCE GENERATION-------------				

always_ff @(/*posedge axi_aclk or negedge axi_areset_n*/ * ) 		
begin 
			if (/*axi_bvalid*/wstate == BRSP)
			begin
		     
				bresp_reg_out = 2'b00;
				bid_reg_out = SLAVE_ID;
				
			end 
			else  begin
				bresp_reg_out = 2'b00;
				bid_reg_out = 4'b0;
			end
	     //end
end	
assign axi_bid = bid_reg_out;
assign axi_bresp = bresp_reg_out;

///////////////////////////////////////////////////////////////////////////////////// READ HANDSHAKING FSM /////////////////////////////////////////////////////////////////////////////////

// PRESENT STATE LOGIC
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
	rstate <= RIDL;
	else 
	rstate <= rnextstate;
end

// NEXT STATE LOGIC
always_comb
begin
	
	unique case(rstate)
/*0*/	RIDL:	begin
					if ((axi_arvalid) && (axi_arid == SLAVE_ID))
					rnextstate = RADR;
					else 
					rnextstate = RIDL;
				end
/*1*/	RADR:	begin
					
					rnextstate = RWAIT;
				end
/*2*/	RWAIT:	begin							
					rnextstate = RDTA;
				end 
/*3*/	RDTA:	begin		
					if (axi_rlast && axi_rready)
					rnextstate =RRSP;
					else 
					rnextstate = RDTA;		
				end	
/*4*/	RRSP:	begin											
					rnextstate = RIDL;
				end
	default :	begin
					rnextstate = RIDL;
				end 
	endcase
end

//OUTPUT LOGIC
assign axi_arready = ((rstate == RADR) /*&& (rstate != RDTA)*/  && axi_arvalid); 
assign axi_rresp = (rstate == RRSP) ? 2'b00 : 2'b00;						



//-------- READ ADDRESS LATCHING---------
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin 
	if (!axi_areset_n)
		begin
			//strt_araddr_reg <= {ADDRESS_WIDTH{1'b0}};
			arlen_reg <= 8'd0;
			arburst_reg <= 2'd0;
			i_araddr_reg <= {ADDRESS_WIDTH{1'b0}};
		end
	else 
	begin
		if (/*axi_arvalid && axi_arready*/ rstate == RADR)
		begin
			//strt_araddr_reg <= axi_araddr; 
			arlen_reg <= axi_arlen;
			arburst_reg <= axi_arburst;
			i_araddr_reg <= axi_araddr;
		end 
	end
end

//----- RVALID GENERATION W.R.T BURST
always_ff @(/*posedge axi_aclk or negedge axi_areset_n*/ *)
begin
		if ((rstate == RDTA) /*&& !(axi_rready)*/)  //rvalid is independent of rready
		begin
			if (r_beat_cnt <= arlen_reg/* + 2'd2*/)
				rvalid_reg = 1'd1;
			else
				rvalid_reg = 1'd0;
		end
		else 
			rvalid_reg = 1'd0;
	//end
end  
assign axi_rvalid = rvalid_reg;

//////////////////RLAST////////////////
assign axi_rlast = ((r_beat_cnt == arlen_reg) && (rstate == RDTA)) ;//? 1'd1 : 1'd0;


//---- READ ADDRESS CALCULATION W.R.T BURST-------
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
 	if (!axi_areset_n)
	begin
		araddr_reg <= {ADDRESS_WIDTH{1'b0}};
		r_beat_cnt <= 32'd0;
	end
  /*	else if (axi_arvalid && axi_arready)
	begin
		araddr_reg <= strt_araddr_reg;
		r_beat_cnt <= 32'd0;
	end   */
	
	else
	begin
		if (axi_rvalid && axi_rready)
			begin
				unique case (arburst_reg)
				2'b00: 	 begin
						araddr_reg <= i_araddr_reg;
				       	 end
				2'b01: 	 begin
						    if ( axi_rready)
						    begin
							    r_beat_cnt <= r_beat_cnt+1'd1;
                                if(r_beat_cnt == 32'd1)
                                    araddr_reg <= i_araddr_reg;
                                else if(r_beat_cnt <= arlen_reg)
							        araddr_reg <= araddr_reg +32'd1; 
						    end
				       	 end
				2'b10:	    begin
						if((r_beat_cnt <= (arlen_reg-1'd1)) && axi_rready)
						begin
							r_beat_cnt <= r_beat_cnt + 1'd1;
							if(r_beat_cnt == arlen_reg-1'd1)
								araddr_reg <= strt_araddr_reg - 32'd1;
							else
								araddr_reg <= araddr_reg + 32'd1;
						end
				    	end
				default: begin
						araddr_reg <= {ADDRESS_WIDTH{1'b0}};
						r_beat_cnt <= 32'd0;
					 end
				endcase
			end
	end
end

//-----------str_araddr_reg registering---------------//
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
		strt_araddr_reg <= 0;
	else 
		strt_araddr_reg <= axi_araddr;
end


////////// READ DATA ASSIGNMENT///////////

always_ff @(/*posedge axi_aclk or negedge axi_areset_n*/ *)
begin
		if (axi_rvalid)
		begin
			rdata_reg_out <= slave_rdata;
			rid_reg_out <= SLAVE_ID; 
		end
		else 
		begin
			rdata_reg_out <= 0;
			rid_reg_out <= 4'b0; 
		end
end


//------ RDATA ASSIGNMENT-----------------
assign axi_rdata = (axi_rready) ? rdata_reg_out : 32'd0; 		 
assign axi_rid = rid_reg_out;

//------------- OUTPUT GENERATION FOR MEMORY----------

// axi_wready ONE CLOCK CYCLE DELAY TO GENERATE ENBALE FOR MEMORY---------  
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if (!axi_areset_n)
		wready_delay <= 1'b0;
	else
		wready_delay <= axi_wready;
end

assign slave_wren = (wready_delay);
assign slave_waddr = awaddr_reg; 
assign slave_wdata = WR_reg;
assign slave_rden = (rstate == RWAIT);
assign slave_raddr = araddr_reg;


endmodule
