`timescale 1ns/1ps
module  ahb_slave #(   parameter add_width=32,
						    parameter data_width=32,
                            parameter depth =32)
							(
							input logic hclk,
							input logic hresetn,
							input logic hsel,
							input logic [add_width-1:0] haddr,
							input logic hwrite,
						//	input logic [2:0] hsize,
						//	input logic [3:0] hprot,
						//	input logic [1:0] htrans,
							input logic hready,
							input logic [data_width-1:0] hwdata,
							input logic [2:0]hburst,
							output logic  hreadyout,
							output logic  hresp,
							output logic  [data_width-1:0] hrdata
							);

							logic [data_width-1:0] mem [depth-1:0];
							logic [add_width-1:0] waddr;
							logic [add_width-1:0] raddr;							
							logic single_flag;
							logic incr_flag;
							logic wrap4_flag;
							logic incr4_flag;
							logic wrap8_flag;
							logic incr8_flag;
							logic wrap16_flag;
							logic incr16_flag;
                            logic [1:0] state;
                            logic [1:0] next_state;
                            localparam idle = 2'b00,s1 = 2'b01,s2 = 2'b10,s3 = 2'b11;

/* timeunit 1ns;
 timeprecision 1ps;*/

always_ff @(posedge hclk or negedge hresetn)
begin	
	if(!hresetn)
		begin	
		state <= idle;
		end
	else
		begin
		state <= next_state;
		end
end		


always_comb
begin
if (state == s1)
begin
    if((hwrite == 1'b1) && (hready == 1'b1))  //write condition
		begin
			next_state = s2;
		end
	else if((hwrite == 1'b0) && (hready == 1'b1)) //read condition
		begin
			next_state = s3;
		end
	else 
		begin
			next_state = s1;
		end 
    end

else if (state == s2)
begin
    if((hwrite == 1'b0) && (hready == 1'b1)) 
            begin
            next_state = s1;
            end
    else if((hwrite == 1'b0) && (hready == 1'b0)) 
            begin
		    next_state = s1;
            end
    else if (hready == 1'b0) 
		    begin
		    next_state = s1;
            end
    else
    begin
		unique case(hburst)
        // single transfer burst
        3'b000: 
		begin          
            next_state = s2;
        end 
        // incrementing burst of undefined length
        3'b001: 
		begin  
            next_state = s2;
        end
        // 4-beat wrapping burst
        3'b010: 
		begin  
            next_state = s2;
        end
        // 4-beat incrementing burst
        3'b011: 
		begin  
            next_state = s2;
        end
        // 8-beat wrapping burst
        3'b100:
		begin  
            next_state = s2;
        end
        // 8-beat incrementing burst
        3'b101: 
		begin  
            next_state = s2;
        end
        // 16-beat wrapping burst
        3'b110:
		begin  
            next_state = s2;
        end
        // 16-beat incrementing burst
        3'b111:
		begin  
            next_state = s2;
        end
        // default
        default: 
		begin  
            next_state = s2;
        end
      endcase
  end
end


else if (state == s3)
begin

	    if((hwrite == 1'b1) && (hready == 1'b1))  		
        begin
			next_state = s1;
		end
        else if((hwrite == 1'b1) && (hready == 1'b0)) 	
       begin
			next_state = s1;
		end
        else if (hready == 1'b0) 	
        begin
			next_state = s1;
		end
        else            
        begin
	    unique case(hburst)
        // single transfer burst
        3'b000: 
		begin            
            next_state = s3;
        end
        
        // incrementing burst of undefined length
        3'b001:
		begin  
            next_state = s3;
        end
        // 4-beat wrapping burst
        3'b010: 
		begin  
            next_state = s3;
        end
        // 4-beat incrementing burst
        3'b011:
		begin  
            next_state = s3;
        end
        // 8-beat wrapping burst
        3'b100:
		begin  
            next_state = s3;
        end
        // 8-beat incrementing burst
        3'b101:
		begin  
            next_state = s3;
        end
        // 16-beat wrapping burst
        3'b110: 
		begin  
            next_state = s3;
        end
        // 16-beat incrementing burst
        3'b111: 
		begin  
            next_state = s3;
        end
        // default
        default:
		begin  
            next_state = s3;
        end
	    endcase
     end

    end

else
begin
	 if(hsel)
    	begin
		next_state = s1;
		end
		else
		begin
		next_state = idle;
		end			

end
end

//////////write- Read Memory and address calculation ///////////////
always_ff @(posedge hclk or negedge hresetn)
begin
  if(!hresetn) begin
    hreadyout <= 1'b0;
    hresp <= 1'b1;
    hrdata <= 32'h0000_0000;
    waddr <=  32'h0000_0000;
    raddr <= 32'h0000_0000;
    single_flag <= 1'b0;
	incr_flag <= 1'b0;
	wrap4_flag <= 1'b0;
	incr4_flag <= 1'b0;
	wrap8_flag <= 1'b0;
	incr8_flag <= 1'b0;
	wrap16_flag <= 1'b0;
	incr16_flag <= 1'b0;
  end

  else 
  begin
    unique case(state)
////////////////idle state///////////////////////////////////
      idle: 
      begin
        hreadyout <= 1'b0;  
        hresp <= 1'b1;
        hrdata <= 32'd0;
        waddr <= 32'd0;
        raddr <= 32'd0;
   	    single_flag <= 1'b0;
		incr_flag <= 1'b0;
		wrap4_flag <= 1'b0;
		incr4_flag <= 1'b0;
		wrap8_flag <= 1'b0;
		incr8_flag <= 1'b0;
		wrap16_flag <= 1'b0;
		incr16_flag <= 1'b0;
      end

////////////////burst state///////////////////////////////
      s1: 
      begin
        hreadyout <= 1'b0;
        hresp <= 1'b1;
        hrdata <= hrdata;       
        waddr <= haddr;
        raddr <= haddr;

            unique case(hburst)
			//single transfer burst
			3'b000: 
				begin  
					single_flag <= 1'b1;
					incr_flag <= 1'b0;
					wrap4_flag <= 1'b0;
					incr4_flag <= 1'b0;
					wrap8_flag <= 1'b0;
					incr8_flag <= 1'b0;
					wrap16_flag <= 1'b0;
					incr16_flag <= 1'b0;
				end
			// incrementing burst of undefined length
			3'b001: 
				begin  
					single_flag <= 1'b0;
					incr_flag <= 1'b1;
					wrap4_flag <= 1'b0;
					incr4_flag <= 1'b0;
					wrap8_flag <= 1'b0;
					incr8_flag <= 1'b0;
					wrap16_flag <= 1'b0;
					incr16_flag <= 1'b0;
				end
			// 4-beat wrapping burst
			3'b010: 
				begin  
					single_flag <= 1'b0;
			    	incr_flag <= 1'b0;
					wrap4_flag <= 1'b1;
					incr4_flag <= 1'b0;
					wrap8_flag <= 1'b0;
					incr8_flag <= 1'b0;
					wrap16_flag <= 1'b0;
					incr16_flag <= 1'b0;
				end
			 // 4-beat incrementing burst
			3'b011: 
				begin  
					single_flag <= 1'b0;
					incr_flag <= 1'b0;
					wrap4_flag <= 1'b0;
					incr4_flag <= 1'b1;
					wrap8_flag <= 1'b0;
					incr8_flag <= 1'b0;
					wrap16_flag <= 1'b0;
					incr16_flag <= 1'b0;
				end
			// 8-beat wrapping burst
			3'b100: 
				begin  
					single_flag <= 1'b0;
					incr_flag <= 1'b0;
					wrap4_flag <= 1'b0;
					incr4_flag <= 1'b0;
					wrap8_flag <= 1'b1;
					incr8_flag <= 1'b0;
					wrap16_flag <= 1'b0;
					incr16_flag <= 1'b0;
				end
				// 8-beat incrementing burst
			3'b101: 
				begin  
					single_flag <= 1'b0;
					incr_flag <= 1'b0;
					wrap4_flag <= 1'b0;
					incr4_flag <= 1'b0;
					wrap8_flag <= 1'b0;
					incr8_flag <= 1'b1;
					wrap16_flag <= 1'b0;
					incr16_flag <= 1'b0;
				end
             // 16-beat wrapping burst
            3'b110: 
				begin  
					single_flag <= 1'b0;
					incr_flag <= 1'b0;
					wrap4_flag <= 1'b0;
					incr4_flag <= 1'b0;
					wrap8_flag <= 1'b0;
					incr8_flag <= 1'b0; 
					wrap16_flag <= 1'b1;
					incr16_flag <= 1'b0;
				end
             // 16-beat incrementing burst
             3'b111: 
				begin  
					single_flag <= 1'b0;
					incr_flag <= 1'b0;
					wrap4_flag <= 1'b0;
					incr4_flag <= 1'b0;
					wrap8_flag <= 1'b0;
					incr8_flag <= 1'b0;
					wrap16_flag <= 1'b0; 
					incr16_flag <= 1'b1;
				end
             // default
              default: 
				begin  
					single_flag <= 1'b0;
					incr_flag <= 1'b0;
					wrap4_flag <= 1'b0;
					incr4_flag <= 1'b0;
					wrap8_flag <= 1'b0;
					incr8_flag <= 1'b0;
					wrap16_flag <= 1'b0;
					incr16_flag <= 1'b0;
				end
      endcase     
      end

 //////////////////////// write state///////////////////////////////////////////////

      s2: 
      begin
         unique case({single_flag,incr_flag,wrap4_flag,incr4_flag,wrap8_flag,incr8_flag,wrap16_flag,incr16_flag})
          // single transfer
          8'b1000_0000: 
          begin          
                hreadyout <= 1'b1;
                hresp <= 1'b0;
                mem[waddr] <= hwdata;
          end
          // incre undefined length
          8'b0100_0000: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
			if(waddr < (haddr + 32'd15)) 
                begin
                mem[waddr] <= hwdata;
                waddr <= waddr + 32'd1;
                end
            else 
                begin
                mem[waddr] <= hwdata;
                waddr <= haddr;
                end
          end

          // wrap 4
          8'b0010_0000: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;            
            if(waddr < (haddr + 32'd2)) 
                begin
                mem[waddr] <= hwdata;
                waddr <= waddr + 32'd1;
                end
            else 
                begin
                mem[waddr] <= hwdata;
                waddr <= haddr-32'd1;
                end
          end

          // incre 4
          8'b0001_0000: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(waddr < (haddr + 32'd3)) 
                begin
                mem[waddr] <= hwdata;
                waddr <= waddr + 32'd1;
                end
            else 
                begin
                mem[waddr] <= hwdata;
                waddr <= haddr;
                end
          end

          // wrap 8
          8'b0000_1000: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(waddr <= (haddr + 32'd5)) 
                begin               
                mem[waddr] <= hwdata;
                waddr <= waddr + 32'd1;
                end
            else
                begin
                mem[waddr] <= hwdata;
                waddr <= haddr-32'd1;
                end
          end
      
          // incre 8
          8'b0000_0100: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(waddr < (haddr + 32'd7)) 
                begin
                mem[waddr] <= hwdata;
                waddr <= waddr + 32'd1;
                end
            else 
                begin
                mem[waddr] <= hwdata;
                waddr <= haddr;
                end
          end

          // wrap 16
          8'b0000_0010: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(waddr < (haddr + 32'd14)) 
                begin
                mem[waddr] <= hwdata;
                waddr <= waddr + 32'd1;
                end
            else 
                begin
                mem[waddr] <= hwdata;
                waddr <= haddr-32'd1;
                end
          end

          // incre 16
          8'b0000_0001: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
             if(waddr < (haddr + 32'd15)) 
                begin
                mem[waddr] <= hwdata;
                waddr <= waddr + 32'd1;
                end
            else 
                begin
                 mem[waddr] <= hwdata;
                waddr <= haddr;
                end
          end

          // default
          default: 
            begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            end
        endcase
      end

 //////////////////////// read state///////////////////////////////////////////////
      s3:
      begin
        unique case({single_flag,incr_flag,wrap4_flag,incr4_flag,wrap8_flag,incr8_flag,wrap16_flag,incr16_flag})

          // single transfer
          8'b1000_0000: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
                hrdata <= mem[raddr];
          end

          // undefined incre
          8'b0100_0000: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(raddr < (haddr + 32'd15)) 
                begin
                hrdata <= mem[raddr];
                raddr <= raddr + 32'd1;
                end
            else 
                begin
                hrdata <= mem[raddr];
                raddr <= haddr;
                end
          end

          // wrap 4
          8'b0010_0000:
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(raddr < (haddr + 32'd2)) 
                begin
                hrdata <= mem[raddr];
                raddr <= raddr + 32'd1;
                end
            else 
                begin
                hrdata <= mem[raddr];
                raddr <= haddr-32'd1;
                end
          end

          // incre 4
          8'b0001_0000: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
             if(raddr < (haddr + 32'd3)) 
                begin
                hrdata <= mem[raddr];
                raddr <= raddr + 32'd1;
                end
            else 
                begin
                hrdata <= mem[raddr];
                raddr <= haddr;
                end
          end

          // wrap 8
          8'b0000_1000: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(raddr < (haddr + 32'd6)) 
                begin
                hrdata <= mem[raddr];
                raddr <= raddr + 32'd1;
                end
            else 
                begin
                hrdata <= mem[raddr];
                raddr <= haddr-32'd1;
                end
          end

          // incre 8
          8'b0000_0100: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(raddr < (haddr + 32'd7)) 
                begin
                hrdata <= mem[raddr];
                raddr <= raddr + 32'd1;
                end
            else 
                begin
                hrdata <= mem[raddr];
                raddr <= haddr;
                end
          end

          // wrap 16
          8'b0000_0010: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(raddr < (haddr + 32'd14)) 
                begin
                hrdata <= mem[raddr];
                raddr <= raddr + 32'd1;
                end
            else 
                begin
                hrdata <= mem[raddr];
                raddr <= haddr-32'd1;
                end
          end

          // incre 16
          8'b0000_0001: 
          begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
            if(raddr < (haddr + 32'd15)) 
                begin
                hrdata <= mem[raddr];
                raddr <= raddr + 32'd1;
                end
            else 
                begin
                hrdata <= mem[raddr];
                raddr <= haddr;
                end
          end

          // default
          default: 
                begin
                hreadyout <= 1'b1;
                hresp <= 1'b0;
                end
            endcase
        end

      default:
        begin
            hreadyout <= 1'b0;
            hresp <= 1'b1;
            hrdata <= hrdata;
            waddr <= waddr;
            raddr <= raddr;
        end
     endcase
    end
end

endmodule



