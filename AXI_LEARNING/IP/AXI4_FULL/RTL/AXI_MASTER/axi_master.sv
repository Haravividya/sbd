module axi_master #(parameter DATA_WIDTH = 32, parameter ADDRESS_WIDTH = 32, parameter WAIT_TIMER = 200, parameter SLAVE_ID = 4'b0011)
			 			(
					///////GLOBAL SIGNALS/////////////// 
			input logic 								axi_aclk, 
			input logic 								axi_areset_n, 

					//////WRITE ADDRESS CHANNEL///////// 
			output logic 				[ADDRESS_WIDTH-1:0] 		axi_awaddr,
			output logic 								axi_awvalid,
			input logic 								axi_awready,
			output logic 				[3:0] 				axi_awid,
			output logic 				[7:0] 				axi_awlen,
			output logic 				[1:0] 				axi_awburst,			

					//////WRITE DATA CHANNEL////////////
			output logic 				[DATA_WIDTH-1:0] 		axi_wdata,
			output logic 								axi_wvalid, 
			input logic 								axi_wready, 
			output logic 				[3:0] 				axi_wid,
			output logic 								axi_wlast,
			output logic 				[(DATA_WIDTH>>3)-1:0] 		axi_wstrb,

					//////WRITE RESPONSE CHANNEL////////
			input logic 				[1:0] 				axi_bresp,
			input logic 								axi_bvalid,
			output logic 								axi_bready,
			input logic 				[3:0] 				axi_bid,

					//////READ ADDRESS CHANNEL//////////
			output logic 				[ADDRESS_WIDTH-1:0]		axi_araddr,
			output logic 								axi_arvalid,
			input logic 								axi_arready,
			output logic 				[3:0] 				axi_arid,
			output logic 				[7:0] 				axi_arlen,
			output logic 				[1:0] 				axi_arburst,

					//////READ DATA CHANNEL////////////
			input logic 				[DATA_WIDTH-1:0] 		axi_rdata,
			input logic 								axi_rvalid,
			output logic 								axi_rready,
			input logic 				[3:0] 				axi_rid, 	
			input logic 								axi_rlast,
			input logic 				[1:0] 				axi_rresp,

					//////PROCESSOR TO MASTER INTERPHACE SIGNALS/////
			input logic 								master_wren,
			input logic 				[31:0]				master_waddr,
			input logic				[3:0]				master_wid,
			input logic				[7:0]				master_wlen,
			input logic				[1:0]				master_wburst,
			input logic 				[31:0]				master_wdata,
			input logic				[3:0]				master_wstrb,

			input logic 								master_rden,
			input logic 				[31:0]				master_raddr,
			input logic 				[7:0]				master_rlen,
			input logic 				[1:0]				master_rburst,
			input logic 				[3:0]				master_rid,
			output logic 				[31:0]				master_rdata
						);

 timeunit 1ns;
 timeprecision 1ps;

//----------------write fsm states------------------//
localparam WIDL = 3'b000;
localparam WADR = 3'b001;
localparam WDTA = 3'b010;
localparam WWAIT = 3'b011;
localparam WDLY = 3'b100;	
localparam BRSP = 3'b101;

//----------------read fsm states-------------------//
localparam RIDL = 3'b000;
localparam RADR = 3'b001;
localparam RDLY = 3'b010;
localparam RDTA = 3'b011;
/*localparam RWAIT = 3'b011;	*/
localparam RRSP = 3'b100;

///////////////////////////
logic [2:0] wstate;
logic [2:0] wnextstate;
logic [2:0] rstate;
logic [2:0] rnextstate;

//----------------internal regs--------------------------//
logic [ADDRESS_WIDTH-1:0] awaddr_reg;
logic [7:0] awlen_reg;
logic [1:0] awburst_reg;
logic [DATA_WIDTH-1:0] wdata_reg;
logic [3:0] wstrb_reg; 
logic [3:0] wid_reg;
logic [3:0] awid_reg;
//logic axi_bready_reg;
logic [7:0] aw_len;

logic [3:0] arid_reg;
logic [ADDRESS_WIDTH-1:0] araddr_reg;
logic [DATA_WIDTH-1:0] rdata_reg;
logic [7:0] arlen_reg;
logic [1:0] arburst_reg;


/*integer*/ logic [7:0]  w_beat_cnt;//hardware overload if integer is used
/*integer*/logic [7:0] w_wait_timer;
logic w_timeout;
logic w_burst_actv;
//--------------------------------------WRITE FSM--------------------------------------------//
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
		wstate <= WIDL;
	else
		wstate <= wnextstate;
end

always_comb
begin
	unique case(wstate)
/*0*/		WIDL : begin
				if(master_wren)  
					wnextstate = WADR;
				else
					wnextstate = WIDL;
			end
/*1*/		WADR : begin
				if(axi_awready) 
					wnextstate = WDTA;
				else
					wnextstate = WADR;
			end
/*2*/		WDTA : begin
				if(axi_wlast && axi_wready) 
					wnextstate = WDLY;
				else if(!axi_wready && w_beat_cnt != 0 && w_burst_actv)
					wnextstate = WWAIT;
				else 	
					wnextstate = WDTA;
			end
/*3*/		WWAIT : begin
				if(axi_wready && w_burst_actv)
					wnextstate = WDTA;
				else if(w_timeout)
					wnextstate = WIDL;
				else
					wnextstate = WWAIT;
			end
/*4*/		WDLY: begin
				if(axi_bvalid && axi_bid == SLAVE_ID)
					wnextstate = BRSP;
				
				else
					wnextstate = WDLY;
			end		
/*5*/		BRSP : begin
				if(axi_bready)
					wnextstate = WIDL;
				else
					wnextstate = BRSP;
			end
	     default : begin
				wnextstate = WIDL;
		       end
		endcase
end
/////////////////////////////////////////////////////////Output signals
assign axi_awvalid = (wstate == WADR);
//assign axi_wvalid = (wstate == WDTA);
assign axi_bready = ((wstate == BRSP) && axi_bvalid);

always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
		axi_wvalid <= 1'b0;
	else
		axi_wvalid <= (wstate == WDTA);
end


//--------------
assign w_burst_actv = ((wstate != WIDL) && (w_beat_cnt <= (awlen_reg/*-1'd1*/)));

////////////////////////////////awid and wid registering//////////////////////////
always_comb 
	begin
		if(wstate == WADR)
			begin	
				awid_reg = master_wid;////////////////
			end

		else
			begin
				awid_reg = 4'b0;
			end
	end
assign axi_awid = awid_reg;

always_comb 
	begin
		if(wstate == WDTA)
			begin
				wid_reg = master_wid;/////////////////
			end

		else
			begin
				wid_reg = 4'b0;
			end	
	end

assign axi_wid = wid_reg;

//////////////////////////////////////////////////////// AW channel registering sigals//////////
always_comb 
begin 	
	if(wstate != WIDL)	
		begin
			awaddr_reg = master_waddr;////////////
			awlen_reg = master_wlen;/////////////
			awburst_reg = master_wburst;////////////
		end
	else 
		begin
			awaddr_reg = 32'b0;
			awlen_reg = 8'b0;				
			awburst_reg = 2'b0;
		end
end
assign axi_awaddr = awaddr_reg;
assign axi_awlen = awlen_reg;
assign axi_awburst = awburst_reg;


/////////////////////////////////////////////////////// W channel registering signals////////////

always_comb 
begin
	if(wstate == WDTA)
	begin
		wdata_reg = master_wdata;
		wstrb_reg = master_wstrb;
	end
	else 
	begin
		wdata_reg = 32'b0;
		wstrb_reg = 4'b0;
	end
end
//assign axi_wdata = wdata_reg;
assign axi_wstrb = wstrb_reg;

always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
		axi_wdata <= 32'b0;
	else
		axi_wdata <= wdata_reg;
end

/////////////////w_timeout logic/////////////////////////////
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
	begin
		w_wait_timer <= 8'b0;
	end
	else
	begin
		if(wstate == WWAIT)
		begin
			w_wait_timer <= w_wait_timer + 8'd1;
		end
		else
		begin
			w_wait_timer <= 8'b0;
		end
	end
end
assign w_timeout = (w_wait_timer == WAIT_TIMER);	

////////////aw_len logic//////////

always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
		begin
			aw_len <= 8'b0;
		end
	else
		begin
			if(wstate == WADR) 
			begin
				 aw_len <= awlen_reg;
			end
		end
end


///////////////////////////////////////////////////// w_beat_cnt and wlast generation/////////////
always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
	begin
		w_beat_cnt <= 8'b0;
	end
	else
	begin
		if((wstate == WDTA) && (axi_wready))
		begin
			 w_beat_cnt <= w_beat_cnt + 8'd1;
		end
        else if(wstate == WWAIT)
        begin
            w_beat_cnt <= w_beat_cnt;
        end
        else
        begin
            w_beat_cnt <= 8'b0;
        end
	end
end
assign axi_wlast = (wstate == WDTA) && (w_beat_cnt == aw_len);


//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//

//------------------------------------------------READ FSM-------------------------------------------------------------------//

always_ff @(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
		rstate <= RIDL;
	else
		rstate <= rnextstate;
end

always_comb 
begin
	unique case(rstate)
/*0*/		RIDL : begin
				if(master_rden)
					rnextstate = RADR;
				else
					rnextstate = RIDL;
			end
/*1*/		RADR : begin
				if(axi_arready)
					rnextstate = RDLY;
				else
					rnextstate = RADR;
			end
/*2*/		RDLY : begin
				if(axi_rvalid && axi_rid == SLAVE_ID)
					rnextstate = RDTA;
				else 
					rnextstate = RDLY;
			end
/*3*/		RDTA : begin
				if(axi_rlast)
					rnextstate = RRSP;
				else 
					rnextstate = RDTA;
			end
/*4*/		RRSP : begin
					rnextstate = RIDL;
			end
	     default : begin
				rnextstate = RIDL;
		       end
		endcase
end
//////////////Output logic/////////
assign axi_arvalid = (rstate == RADR) ;
assign axi_rready = (rstate == RDTA) && axi_rvalid;

//--------------------------------arid and rid logic
always_comb
	begin
		if(rstate == RADR)
			begin
				arid_reg = master_rid;////////////////
			end
		else
			begin
				arid_reg = 4'b0;
			end
	end
assign axi_arid = arid_reg;

///////////////////////////////////////////////// AR channel registering sigals//////////
always_comb 
	begin 	
		if(rstate == RADR)
			begin
				araddr_reg = master_raddr;////////////////
				arlen_reg = master_rlen;///////////////
				arburst_reg = master_rburst;////////////
			end
		else
			begin
				araddr_reg = 32'b0;
				arlen_reg = 8'b0;
				arburst_reg = 2'b0;
			end		
	end

assign axi_araddr = araddr_reg;
assign axi_arlen = arlen_reg;
assign axi_arburst = arburst_reg;

//------------------------------------
always_ff@(posedge axi_aclk or negedge axi_areset_n)
begin
	if(!axi_areset_n)
		rdata_reg <= 0;
	else if(axi_rvalid && axi_rready)
		rdata_reg <= axi_rdata;
end
assign master_rdata = rdata_reg;
endmodule
