module spi_slave(mosi,ss,s_clk,rst,rx_e,data_in,load,miso,data_out,tx_done,rx_done);
  input logic mosi,ss,s_clk,rst,rx_e,load;
  output logic miso;
  output logic  [7:0]data_out;
  input logic [7:0]data_in;
  output logic  rx_done,tx_done;
  logic miso_q;
  logic mosi_d;
  logic load_delay;
  logic load_edge;
  logic empty;
  logic [7:0]sr;
  logic [2:0]rx_count;
  logic [2:0]tx_count;
  timeunit 1ns;
 timeprecision 1ps;

  
  assign miso=miso_q;
  assign mosi_d=mosi;

  always_ff@(posedge s_clk,negedge rst) 
  begin
    if(!rst) 
    begin
      	sr<=8'd0;
        rx_count<=3'd0;
        empty<=1'b1;
    end
    else 
    begin 
           if(!ss)
           begin
               if(load_edge)
               begin
                sr<=data_in;
                rx_count<=3'd0;
                empty<=1'b0;
              end
              else
              begin
                 if(!empty)
                 begin
        	        sr<={sr[6:0],mosi_d};
                    rx_count<=rx_count+3'd1;
                    if(rx_count==3'd7)
                        empty<=1'd1;
                    else
                        empty<=empty;
                 end
                 else
                 begin
                    rx_count<=3'd0;
                 end
      	      end
          end
          else
          begin
               rx_count<=3'd0;
               empty<=1'd1;
          end
    end
  end

  always_ff@(negedge s_clk,negedge rst) 
  begin
    if(!rst) 
    begin
    	miso_q<=1'b0;
        tx_count<=3'd0;
    end
    else 
    begin 
         if(!ss && !empty) 
         begin
        	miso_q<=sr[7];
            tx_count<=tx_count+3'd1;
      	 end
      	else 
        begin
          	miso_q<=1'b0;
            tx_count<=3'd0;
      	end
    end
  end

  
  
always_ff@(posedge s_clk,negedge rst)
begin
    	if(!rst) 
        begin
    		rx_done<=1'b0;
    	end
      	else 
        begin
        	if(!ss) 
            begin
                    if(rx_count==3'd7) 
                    begin
                  	    rx_done<=1'b1;
                    end
                    else
                    begin
                         rx_done<=1'b0;
                    end
             end
     		 else 
             begin
                    rx_done<=1'b0;
     	     end
       	end
end    

always_ff@(posedge s_clk,negedge rst)
begin
    if(!rst)
    begin
        data_out<=8'd0;
    end
    else
    begin
        if(rx_done && !rx_e)
        begin
            data_out<=sr;
        end
        else
        begin
            data_out<=data_out;
        end
    end
end


  always_ff@(negedge s_clk,negedge rst)
  begin
    if(!rst) 
    begin
        tx_done<=1'b0;
    end
   else 
   begin
    if(ss) 
    begin
        tx_done<=3'd0;
    end
    else 
    begin
        if(tx_count==3'd7)
            tx_done<=1'b1;
        else
            tx_done<=1'b0;
    end
   end
  end
  
always_ff@(posedge s_clk,negedge rst)
begin
    if(!rst)
    begin
        load_delay<=1'b0;
        load_edge<=1'b0;
    end
    else
    begin
        load_delay<=load;
        load_edge<=load & (~load_delay);
    end
end

//assign load_edge=load & (~load_delay);
endmodule
  
