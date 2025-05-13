//RTL file
module spi_master #(parameter [1:0]mode=2'b0)(input logic clk,
                                          input logic rst,
                                          input logic tx_ready,
                                          input logic miso,
                                          input logic [7:0]data_in,
                                          input logic rx_e,
                                          output logic sclk,
                                          output logic mosi,
                                          output logic ss,
                                          output logic  [7:0]data_out,
                                          output logic  tx_done, 
                                          output logic  rx_done);    
timeunit 1ns;
 timeprecision 1ps;

  logic i_clk;
  logic cpol,cpha;
  logic [2:0]tx_count;
  logic [3:0]rx_count;
  logic miso_d;
  logic mosi_q;
  logic [7:0]sr;  
  logic mclk;
  logic txr_del;
  logic tx_del;
  logic empty;
  logic load;
  assign cpol=(mode==2'd2 || mode==2'd3);
  assign cpha=(mode==2'd1 || mode==2'd3);
  assign miso_d=miso;
  assign mosi=mosi_q;
  assign sclk=ss?cpol:mclk;
  assign mclk=(cpha^cpol)?~i_clk:i_clk;
  assign ss=!empty?1'b0:1'b1;
   
  always_ff@(posedge clk,negedge rst)
  begin
    if(!rst)
    begin
      	i_clk<=cpol;
    end
    else 
    begin
    	i_clk<=~i_clk;
    end
  end
  always_ff@(posedge mclk,negedge rst)
  begin
    if(!rst)
      empty<=1'b1;
    else
    begin
      if(load || tx_del)
        empty<=1'b0;
      else
        empty<=1'b1;
    end
  end
  
  always_ff@(posedge mclk,negedge rst) 
  begin
    if(!rst) 
    begin
      	sr<=8'd0;
      	rx_count<=4'd0;
        load<=1'b0;
        rx_done<=1'b0;
    end
    else 
    begin 
        if(tx_del && empty) 
        begin
            sr<=data_in;
            load<=1'b1;
        end
        else 
        begin
            if(!ss) 
            begin
           		sr<={sr[6:0],miso_d};
           		rx_count<=rx_count+4'd1;
                if(rx_count==4'd7)
                begin
                    rx_done<=1'b1;
                    load<=1'b0;
                end
                else
                begin
                    load<=load;
                    rx_done<=1'b0;
                end
            end
            else 
            begin
             	rx_count<=4'd0;
                load<=1'b0;
                rx_done<=1'b0;
            end
        end
    end
  end

  always_ff@(negedge mclk,negedge rst) 
  begin
    if(!rst) 
    begin
    	mosi_q<=1'b0;
        tx_count<=4'd0;
        tx_done<=1'b0;
    end
    else 
    begin 
         if(!ss) 
         begin
        	mosi_q<=sr[7];
           	tx_count<=tx_count+3'd1;
            if(tx_count==3'd7)
                tx_done<=1'b1;
            else
                tx_done<=1'b0;
         end           
         else 
         begin
          	mosi_q<=1'b0;
          	tx_count<=3'd0;
            tx_done<=1'b0;
      	end
    end
  end
  
  always_ff@(posedge mclk,negedge rst)
  begin
    if(!rst)
    begin
      data_out<=8'd0;
    end
    else
    begin    
        if(rx_count==4'd8 && !rx_e)
         	data_out<=sr;
        else
            data_out<=data_out;
    end
  end
  
always_ff@(posedge mclk,negedge rst)
begin  
    if(!rst) 
    begin
      txr_del<=1'b0;
      tx_del<=1'b0;
    end
    else   
    begin
  		txr_del<=tx_ready;
        tx_del <= tx_ready & ~txr_del;
  	end
end
endmodule


