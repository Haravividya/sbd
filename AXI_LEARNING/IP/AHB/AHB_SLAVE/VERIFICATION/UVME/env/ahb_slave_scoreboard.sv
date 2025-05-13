/**************************************************************************
Project name:ahb_slave 
Description: This is the module which has a reference signals and check whether it
is matching with obtained signals which is coming from monitor
this module acts as reference module.
File name:ahb_slave_scoreboard.sv
**************************************************************************/

//user defined class derived from base class 
class ahb_slave_scoreboard_tb extends uvm_scoreboard;

  //factory registration
  `uvm_component_utils(ahb_slave_scoreboard_tb)
 
  //declare handle for port 
  uvm_analysis_imp #(ahb_slave_seq_item_tb,ahb_slave_scoreboard_tb) item_collected_export; 

  //declare handle for seq item
  ahb_slave_seq_item_tb pkt_qu[$];  
  ahb_slave_seq_item_tb sb; 
  ahb_slave_seq_item_tb seq_item_inst;


  logic  [31:0] mem [31:0];
  logic  [31:0] waddr;
  logic  [31:0] raddr;
  bit  single_flag;
  bit  incr_flag;
  bit  wrap4_flag;
  bit  incr4_flag;
  bit  wrap8_flag;
  bit  incr8_flag;
  bit  wrap16_flag;
  bit  incr16_flag;
  bit  [1:0] state;
  bit  [1:0] next_state;
  localparam idle = 2'b00,s1 = 2'b01,s2 = 2'b10,s3 = 2'b11;
 

  virtual ahb_slave_interface_tb i_inst;// optional if we need to connect scoreboard and interface. 
  
  //constructor 
  function new (string name = "ahb_slave_scoreboard_tb", uvm_component parent = null);
    super.new (name, parent);
  endfunction

  //build phase - creates the obj of port and seq item	
  function void build_phase (uvm_phase phase);
    item_collected_export = new("item_collected_export", this);
    sb   = ahb_slave_seq_item_tb::type_id::create("sb");
    //connecting monitor to interface (virtual) using uvm_congifg_db get() method
    //optional if we need to connect scoreboard and interface.
    if(!uvm_config_db#(virtual ahb_slave_interface_tb)::get(this,"","INTERFACE_INST_DB",i_inst))
      `uvm_fatal(get_name(),$sformatf("monitor: uvm_config_db get failed: INTERFACE_INST_DB\n"));
 
  endfunction
    
  
  //write method is called here it will get inputs and output from monitor    
  virtual function void write(input ahb_slave_seq_item_tb pkt);
    //push_back method to push pkt(coming from monitor) to end of the queue 
    pkt_qu.push_back(pkt); 
  endfunction

  //run phase - have scoreboard logic and comparision 
  task run_phase (uvm_phase phase);
    forever
    begin
      wait(pkt_qu.size() > 0);
      //pop_front method to pop pkt(coming from monitor) which is pushed to front of the queue 
      seq_item_inst = pkt_qu.pop_front();      
 
      //scoreboard logic  
      //---------------Combinational Logic for FSM----------------------//
	  if( !seq_item_inst.hreset_n )
        begin
          sb.hrdata = 32'h0000_0000;
          waddr =  32'h0000_0000;
          raddr = 32'h0000_0000;
          sb.hreadyout = 1'b0;
          sb.hresp = 1'b1;
          single_flag = 1'b0;
	      incr_flag = 1'b0;
	      wrap4_flag = 1'b0;
	      incr4_flag = 1'b0;
	      wrap8_flag = 1'b0;
	      incr8_flag = 1'b0;
	      wrap16_flag = 1'b0;
	      incr16_flag = 1'b0;
	      state <= idle;
        end
     //when reset deasserted in combinational logic of fsm
     else  
        begin
          state <= next_state;
          if (state == s1)
	      begin
         	if((seq_item_inst.hwrite == 1'b1) && (seq_item_inst.hready == 1'b1))  //write condition
		    begin
			    next_state = s2;
		    end
	        else if((seq_item_inst.hwrite == 1'b0) && (seq_item_inst.hready == 1'b1)) //read condition
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
  		    if((seq_item_inst.hwrite == 1'b0) && (seq_item_inst.hready == 1'b1)) 
		    begin
		        next_state = s1;
            end
        	else if((seq_item_inst.hwrite == 1'b0) && (seq_item_inst.hready == 1'b0)) 
        	begin
		        next_state = s1;
            end
        	else if((seq_item_inst.hwrite == 1'b1) && (seq_item_inst.hready == 1'b0)) 
		    begin
		    next_state = s1;
            end
            else
            begin           
	        case(seq_item_inst.hburst)
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
	        if((seq_item_inst.hwrite == 1'b1) && (seq_item_inst.hready == 1'b1))  		
            begin
			    next_state = s1;
		    end
            else if((seq_item_inst.hwrite == 1'b1) && (seq_item_inst.hready == 1'b0)) 	
            begin
			    next_state = s1;
		    end
            else if((seq_item_inst.hwrite == 1'b0) && (seq_item_inst.hready == 1'b0)) 	
            begin
			    next_state = s1;
		    end
            else
            begin
	        case(seq_item_inst.hburst)
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
			if(seq_item_inst.hsel)
			begin
			    next_state = s1;
			end
			else
			begin
				next_state = idle;
			end			
		  end
      end

///////////////////////////////////////////////////////////////////////////////////

    //when Reset asserted in combinational logic of fsm 
	
    begin
	  if( !seq_item_inst.hreset_n )
      begin
        sb.hrdata = 32'h0000_0000;
        waddr =  32'h0000_0000;
        raddr = 32'h0000_0000;
        sb.hreadyout = 1'b0;
        sb.hresp = 1'b1;
        single_flag = 1'b0;
	    incr_flag = 1'b0;
	    wrap4_flag = 1'b0;
	    incr4_flag = 1'b0;
	    wrap8_flag = 1'b0;
	    incr8_flag = 1'b0;
	    wrap16_flag = 1'b0;
	    incr16_flag = 1'b0;
	    state <= idle;
      end      
    
      else 
      begin
      state<=next_state;
      case(state)
        idle: 
        begin
          sb.hreadyout <= 1'b0;  
          sb.hresp <= 1'b1;
          sb.hrdata <= 32'd0;
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

       s1: 
       begin
         sb.hreadyout <= 1'b0;
         sb.hresp <= 1'b1;
         sb.hrdata <= sb.hrdata;       
         waddr <= seq_item_inst.haddr;
         raddr <= seq_item_inst.haddr;

         case(seq_item_inst.hburst)
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
		   incr_flag  <= 1'b0;
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
		   incr_flag  <= 1'b0;
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
		   incr_flag  <= 1'b0;
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
		   incr_flag  <= 1'b0;
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
		   incr_flag  <= 1'b0;
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
		   incr_flag  <= 1'b0;
		   wrap4_flag <= 1'b0;
		   incr4_flag <= 1'b0;
		   wrap8_flag <= 1'b0;
		   incr8_flag <= 1'b0;
		   wrap16_flag <= 1'b0;
		   incr16_flag <= 1'b0;
		 end
         endcase     
       end
     
     s2: 
       begin
         case({single_flag,incr_flag,wrap4_flag,incr4_flag,wrap8_flag,incr8_flag,wrap16_flag,incr16_flag})
         // single transfer
         8'b1000_0000: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
           mem[waddr] <= seq_item_inst.hwdata;
         end

         // incre undefined length
         8'b0100_0000: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
		   if(waddr < (seq_item_inst.haddr + 32'd15)) 
             begin
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= waddr + 32'd1;
             end
           else 
             begin
               mem[waddr] <= seq_item_inst.hwdata;
               waddr <= seq_item_inst.haddr;
             end
         end

         // wrap 4
         8'b0010_0000: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
           if(waddr < (seq_item_inst.haddr + 32'd2)) 
             begin
               mem[waddr] <= seq_item_inst.hwdata;
               waddr <= waddr + 32'd1;
             end
           else 
             begin
               mem[waddr] <= seq_item_inst.hwdata;
               waddr <= seq_item_inst.haddr-32'd1;
             end
         end

         //incre 4
         8'b0001_0000: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
           if(waddr < (seq_item_inst.haddr + 32'd3)) 
           begin
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= waddr + 32'd1;
           end
           else 
           begin
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= seq_item_inst.haddr;
           end
         end

         // wrap 8
         8'b0000_1000: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
           if(waddr <= (seq_item_inst.haddr + 32'd5)) 
           begin               
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= waddr + 32'd1;
           end
           else
           begin
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= seq_item_inst.haddr-32'd1;
           end
         end
      
         // incre 8
         8'b0000_0100: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
           if(waddr < (seq_item_inst.haddr + 32'd7)) 
             begin
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= waddr + 32'd1;
             end
           else 
             begin
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= seq_item_inst.haddr;
             end
         end

         // wrap 16
         8'b0000_0010: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
           if(waddr < (seq_item_inst.haddr + 32'd14)) 
           begin
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= waddr + 32'd1;
           end
           else 
           begin
             mem[waddr] <= seq_item_inst.hwdata;
             waddr <= seq_item_inst.haddr-32'd1;
           end
         end

         // incre 16
         8'b0000_0001: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
           if(waddr < (seq_item_inst.haddr + 32'd15)) 
             begin
               mem[waddr] <= seq_item_inst.hwdata;
               waddr <= waddr + 32'd1;
             end
           else 
             begin
               mem[waddr] <= seq_item_inst.hwdata;
               waddr <= seq_item_inst.haddr;
             end
         end

         // default
         default: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
         end
       endcase
     end

     s3: 
     begin
       case({single_flag,incr_flag,wrap4_flag,incr4_flag,wrap8_flag,incr8_flag,wrap16_flag,incr16_flag})
       // single transfer
       8'b1000_0000: 
       begin
         sb.hreadyout <= 1'b1;
         sb.hresp <= 1'b0;
         sb.hrdata <= mem[raddr];
       end

       // undefined incre
       8'b0100_0000: 
       begin
         sb.hreadyout <= 1'b1;
         sb.hresp <= 1'b0;
         if(raddr < (seq_item_inst.haddr + 32'd15)) 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= raddr + 32'd1;
         end
         else 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= seq_item_inst.haddr;
         end
       end

       // wrap 4
       8'b0010_0000:
       begin
         sb.hreadyout <= 1'b1;
         sb.hresp <= 1'b0;
         if(raddr < (seq_item_inst.haddr + 32'd2)) 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= raddr + 32'd1;
         end
         else 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= seq_item_inst.haddr-32'd1;
         end
       end

       // incre 4
       8'b0001_0000: 
       begin
         sb.hreadyout <= 1'b1;
         sb.hresp <= 1'b0;
         if(raddr < (seq_item_inst.haddr + 32'd3)) 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= raddr + 32'd1;
         end
         else 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= seq_item_inst.haddr;
         end
       end

       // wrap 8
       8'b0000_1000: 
       begin
         sb.hreadyout <= 1'b1;
         sb.hresp <= 1'b0;
         if(raddr < (seq_item_inst.haddr + 32'd6)) 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= raddr + 32'd1;
         end
         else 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= seq_item_inst.haddr-32'd1;
         end
       end

       // incre 8
       8'b0000_0100: 
       begin
         sb.hreadyout <= 1'b1;
         sb.hresp <= 1'b0;
         if(raddr < (seq_item_inst.haddr + 32'd7)) 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= raddr + 32'd1;
         end
         else 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= seq_item_inst.haddr;
         end
       end

       // wrap 16
       8'b0000_0010: 
       begin
         sb.hreadyout <= 1'b1;
         sb.hresp <= 1'b0;
         if(raddr < (seq_item_inst.haddr + 32'd14)) 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= raddr + 32'd1;
         end
         else 
           begin
             sb.hrdata <= mem[raddr];
             raddr <= seq_item_inst.haddr-32'd1;
           end
       end

       // incre 16
       8'b0000_0001: 
       begin
         sb.hreadyout <= 1'b1;
         sb.hresp <= 1'b0;
         if(raddr < (seq_item_inst.haddr + 32'd15)) 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= raddr + 32'd1;
         end
         else 
         begin
           sb.hrdata <= mem[raddr];
           raddr <= seq_item_inst.haddr;
         end
       end

       // default
       default: 
         begin
           sb.hreadyout <= 1'b1;
           sb.hresp <= 1'b0;
         end
       endcase
     end

     default:
     begin
       sb.hreadyout <= 1'b0;
       sb.hresp <= 1'b1;
       sb.hrdata <= sb.hrdata;
       waddr <= waddr;
       raddr <= raddr;
     end
    endcase
  end
end

      


      //comparision of DUT value with scorebboard calculated data out 	             
      if((sb.hrdata === seq_item_inst.hrdata)  && (sb.hreadyout === seq_item_inst.hreadyout)&& (sb.hresp === seq_item_inst.hresp))

	   `uvm_info(get_type_name(),$sformatf("Test passed, \nsb.hrdata=%h,RTL_hrdata=%h,\tsb.hreadyout=%h,RTL_hreadyout=%h,\tsb.hresp=%h,RTL_hresp=%h",sb.hrdata,seq_item_inst.hrdata,sb.hreadyout,seq_item_inst.hreadyout,sb.hresp,seq_item_inst.hresp),UVM_MEDIUM)           
      else                                                                   
       `uvm_error(get_type_name(),$sformatf("Test failed, \nsb.hrdata=%h,RTL_hrdata=%h,\tsb.hreadyout=%h,RTL_hreadyout=%h,\tsb.hresp=%h,RTL_hresp=%h",sb.hrdata,seq_item_inst.hrdata,sb.hreadyout,seq_item_inst.hreadyout,sb.hresp,seq_item_inst.hresp))
  
  end
    
 endtask

endclass


