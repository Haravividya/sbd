/*****************************************************************
Project:Spi_slave
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
  bit miso_q;
  bit mosi_d,empty;
  bit load_delay,load_edge;
  bit [7:0]sr;
  bit [2:0]rx_count,tx_count;
  
          
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
      
      sb_seq_item_inst.miso=miso_q;
      mosi_d=seq_item_inst.mosi;

 
      if(!seq_item_inst.reset) 
      begin
        sr=8'd0;
        rx_count=3'd0;
        empty=1'b1;
      end
      else 
      begin 
           if(!seq_item_inst.ss)
           begin
               if(load_edge)
               begin
                sr<=seq_item_inst.data_in;
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


     
  
    if(!seq_item_inst.reset) 
    begin
    	miso_q=1'b0;
        tx_count=3'd0;
    end
    else 
    begin 
      if(!seq_item_inst.ss && !empty) 
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
  
   
   if(!seq_item_inst.reset) 
     begin
       sb_seq_item_inst.rx_done=1'b0;
     end
   else 
     begin
       if(!seq_item_inst.ss) 
         begin
           if(rx_count==3'd7) 
             sb_seq_item_inst.rx_done<=1'b1;
           else
             sb_seq_item_inst.rx_done<=1'b0;
         end
       else 
         begin
           sb_seq_item_inst.rx_done<=1'b0;
     	 end
     end
   

   if(!seq_item_inst.reset)
     begin
       sb_seq_item_inst.data_out=8'd0;
     end
   else
     begin
       if(sb_seq_item_inst.rx_done && !seq_item_inst.rx_e)
         begin
           sb_seq_item_inst.data_out<=sr;
         end
       else
         begin
           sb_seq_item_inst.data_out<=sb_seq_item_inst.data_out;
         end
     end


  
   if(!seq_item_inst.reset) 
     begin
       sb_seq_item_inst.tx_done=1'b0;
     end
   else 
     begin
       if(seq_item_inst.ss) 
       begin
         sb_seq_item_inst.tx_done<=3'd0;
       end
       else 
       begin
         if(tx_count==3'd7)
           sb_seq_item_inst.tx_done<=1'b1;
         else
           sb_seq_item_inst.tx_done<=1'b0;
       end
     end
  
  

   if(!seq_item_inst.reset)
     begin
       load_delay=1'b0;
       load_edge=1'b0;
     end
   else
     begin
       load_delay<=seq_item_inst.load;
       load_edge<=seq_item_inst.load & (~load_delay);
     end

      
   //comparision of SB vs DUT for sb_seq_item_inst.data_out 
	  if(sb_seq_item_inst.data_out !== seq_item_inst.data_out)       
        //SB data out is equal to RTL data out
	    `uvm_error(get_type_name(),$sformatf("SB FAIL,  SB_data_out = %h, RTL_Data_out = %h",sb_seq_item_inst.data_out,seq_item_inst.data_out))
	  else 
        //SB data out is not equal to RTL data out	        
        `uvm_info(get_type_name(),$sformatf("SB PASS, SB_data_out = %h, RTL_data_out = %h",sb_seq_item_inst.data_out,seq_item_inst.data_out),UVM_MEDIUM) 
   
  end
      
    	
  endtask
  
endclass
