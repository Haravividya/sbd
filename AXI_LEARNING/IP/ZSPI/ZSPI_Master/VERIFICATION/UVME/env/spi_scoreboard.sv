/*****************************************************************
Project:Spi_master
Author: B Bhagavantu
File name:spi_scoreboard.sv
Description:This module checks the functionality of the DUT. 
It receives transactions from the monitor using the analysis port
*****************************************************************/
`uvm_analysis_imp_decl (_con1)

class spi_scoreboard extends uvm_scoreboard;
  
  //factory registration
  `uvm_component_utils(spi_scoreboard) 
  
  //Declare TLM Analysis port : to receive transactions from Monitor
  uvm_analysis_imp_con1 #(spi_seq_item,spi_scoreboard) sb_port_con1; 
   
  spi_seq_item queue_seq_item_inst[$]; //queue handle
  spi_seq_item sb_seq_item_inst;       //sb handle
  spi_seq_item seq_item_inst;          //seq_item handle
  
  //internal variables  
  bit i_clk;
  bit cpol,cpha;
  bit [2:0]tx_count;
  bit [3:0]rx_count;
  bit miso_d;
  bit mosi_q;
  bit [7:0]sr;  
  bit mclk;
  bit txr_del;
  bit tx_del;
  bit empty;
  bit load;
  
  parameter [1:0] mode= 2'b0;	 
          
  //constructor
  function new (string name = "spi_scoreboard", uvm_component parent = null);
    super.new (name, parent);
  endfunction
  
  //build_phase
  function void build_phase (uvm_phase phase);
  super.build_phase(phase);
    sb_port_con1	 = new("sb_port_con1", this);
    sb_seq_item_inst = spi_seq_item::type_id::create("sb_seq_item_inst");
  endfunction

  
  //write function
   virtual function void write_con1 (input spi_seq_item pkt);  
      queue_seq_item_inst.push_back(pkt);
   endfunction


  //run phase  
  task run_phase(uvm_phase phase);

  forever
    begin
      //wait untill queue gets the data
      
      wait(queue_seq_item_inst.size()> 0);


      //collect the data from queue to seq_item_inst
      
      seq_item_inst = queue_seq_item_inst.pop_front();

      /*if(seq_item_inst.reset ==0)
          
        begin
        i_clk = cpol;
        empty = 1'b1;
        sr =8'd0;
		rx_count =4'd0;
		load =1'b0;
        sb_seq_item_inst.rx_done =1'b0;
        mosi_q =1'b0;
	    tx_count =4'd0;
		sb_seq_item_inst.tx_done = 1'b0;
        sb_seq_item_inst.data_out =8'd0;
        txr_del = 1'b0;
		tx_del = 1'b0;
        end*/
        
      //check for the reset condition
      cpol=(mode==2'd2 || mode==2'd3);
      cpha=(mode==2'd1 || mode==2'd3);
      miso_d=seq_item_inst.miso;
      sb_seq_item_inst.mosi=mosi_q;
      sb_seq_item_inst.sclk=sb_seq_item_inst.ss?cpol:mclk;
      mclk=(cpha^cpol)?~i_clk:i_clk;
	  sb_seq_item_inst.ss=!empty?1'b0:1'b1;
		   
	  if( !seq_item_inst.reset)
	    i_clk <= cpol;
	  else 
		i_clk <= ~i_clk;

		   		 
      if(!seq_item_inst.reset)
	    empty <= 1'b1;
	  else
		begin
		  if(load || tx_del)
			empty<=1'b0;
		  else
			empty<=1'b1;
		end
		 		  
	 if(!seq_item_inst.reset) 
	   begin
		 sr<=8'd0;
		 rx_count<=4'd0;
		 load<=1'b0;
	     sb_seq_item_inst.rx_done<=1'b0;
	   end
	 else 
	   begin 
	     if(tx_del && empty) 
		   begin
		     sr<=seq_item_inst.data_in;
			 load<=1'b1;
		   end
		 else 
		   begin
			 if(!sb_seq_item_inst.ss) 
			   begin
			     sr<={sr[6:0],miso_d};
			   	 rx_count<=rx_count+4'd1;
				 if(rx_count==4'd7)
				   begin
				     sb_seq_item_inst.rx_done<=1'b1;
				     load<=1'b0;
				   end
				 else
			       begin
				     load<=load;
				     sb_seq_item_inst.rx_done<=1'b0;
				   end
			   end
			else 
			   begin
			     rx_count<=4'd0;
				 load<=1'b0;
				 sb_seq_item_inst.rx_done<=1'b0;
			   end
	      end
		end
		  
        if(!seq_item_inst.reset) 
		  begin
		    mosi_q<=1'b0;
			tx_count<=4'd0;
			sb_seq_item_inst.tx_done<=1'b0;
		  end
		else 
		  begin 
			if(!sb_seq_item_inst.ss) 
			  begin
			    mosi_q<=sr[7];
			   	tx_count<=tx_count+3'd1;
			    if(tx_count==3'd7)
				  sb_seq_item_inst.tx_done<=1'b1;
			    else
				  sb_seq_item_inst.tx_done<=1'b0;
			  end           
			else 
			  begin
			    mosi_q<=1'b0;
			  	tx_count<=3'd0;
			    sb_seq_item_inst.tx_done<=1'b0;
		      end
		  end
		  
		  
		if(!seq_item_inst.reset)
		  sb_seq_item_inst.data_out=8'd0;
		else
		  begin    
			if(rx_count==4'd8 && !seq_item_inst.rx_e)
			  sb_seq_item_inst.data_out=sr;
			else
			  sb_seq_item_inst.data_out=sb_seq_item_inst.data_out;
		  end
		  
	
		 if(!seq_item_inst.reset) 
		   begin
		     txr_del <= 1'b0;
		     tx_del <= 1'b0;
		   end
		 else   
		   begin
		     txr_del <= seq_item_inst.tx_ready;
			 tx_del <= seq_item_inst.tx_ready & ~txr_del;
		   end



      // comparision of SB vs DUT for sb_seq_item_inst.data_out 
	  if(sb_seq_item_inst.data_out !== seq_item_inst.data_out)         // SB data out is equal to RTL data out
	      `uvm_error(get_type_name(),$sformatf("SB FAIL,  SB_data_out = %h, RTL_Data_out = %h",sb_seq_item_inst.data_out,seq_item_inst.data_out))
	  else 
         // SB data out is not equal to RTL data out	        
          `uvm_info(get_type_name(),$sformatf("SB PASS, SB_data_out = %h, RTL_data_out = %h",sb_seq_item_inst.data_out,seq_item_inst.data_out),UVM_MEDIUM) 

    end
  endtask
endclass
