`timescale 1ns/1ps

module apb_slave1(pclock, presetn, psel1, penable, pwrite, paddr, pwdata, prdata1, pready1, pslverr1);

//APB SLAVE1 INPUT SIGNALS
input pclock, presetn; // GLOBAL INPUTS
input psel1, penable, pwrite; 
input [31:0] paddr;
input [31:0] pwdata;

//APB SLAVE1 OUTPUT SIGNALS
output reg [31:0] prdata1;
output reg pready1;
output reg pslverr1;

reg [31:0] reg_addr;
reg [31:0] mem [0:256];

always@(posedge pclock) // Write operation
	begin
		if(presetn)
			begin
				if(psel1 && penable && pwrite)
					begin
						reg_addr =paddr;
						mem[reg_addr] = pwdata;
					end
			end
	end

always@(posedge pclock) // Read operation
	begin
		if(~presetn)
			prdata1 = 32'd0;
		else if(psel1 && penable && !pwrite)
			begin
				reg_addr = paddr;
				prdata1 = mem[reg_addr];
			end
	end

//PREADY1 LOGIC
always @(posedge pclock)
    begin
		if(~presetn)
			begin
				pready1 = 0;
			end
        else
			if( psel1 && !penable && !pwrite)
				begin 
					pready1 = 0;
				end
	         
			else if(psel1 && penable && !pwrite)
				begin
					pready1 = 1; 
				end
			else if(psel1 && !penable && pwrite)
				begin  
					pready1 = 0; 
				end
			else if(psel1 && penable && pwrite)
				begin  
					pready1 = 1;
				end
			else pready1 = 0;
    end
	   
//PSLVERR1 LOGIC
always@(posedge pclock)
	begin
		if(~presetn)
			begin
				pslverr1=0;
			end
		else if(paddr[30:0]>32'b100000000)
			begin
				pslverr1=1;
			end
		else if(pwdata === 32'dx)
			begin
				pslverr1=1;
			end
		else if(prdata1 === 32'dx)
			begin
				pslverr1=1;
			end
		else 
			begin
				pslverr1=0;
			end	
	end 

			
endmodule
