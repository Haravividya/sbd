class axi_m_scoreboard extends uvm_scoreboard;
 
	`uvm_component_utils(axi_m_scoreboard)
	
	 uvm_analysis_imp#(axi_m_seq_item,axi_m_scoreboard)analysis_imp_scoreboard;
	 
	 axi_m_seq_item seq_item;
     axi_m_seq_item que[$];
     logic [63:0] temp_read_data;
     int flag;
	
	 
  // new - constructor
  function new (string name, uvm_component parent);
	super.new(name, parent);
  endfunction 
	
  //build phase
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	analysis_imp_scoreboard = new("analysis_imp_scoreboard",this);
  endfunction

  function void write(axi_m_seq_item seq_item);                            
    que.push_back(seq_item);
  endfunction


  task run_phase(uvm_phase phase);
    forever
    begin
    axi_m_seq_item trans;
    wait(que.size()>0);
    trans = que.pop_front();
     begin
//////////////////////////////////////////// WRITE PHASE COMPARISION ///////////////////////////////////////

       if(trans.wr_en_in == 1'b1)          //  Write Enable
       begin
         if(trans.M_AW_VALID_OUT == 1'b1 && trans.M_AW_READY_IN == 1'b1)      // Write Address Compare
         begin
           if(trans.wr_addr_in == trans.M_AW_ADDR_OUT)
           begin
             `uvm_info("WRITE ADDRESS",$sformatf("PASS WR_ADDR_IN : %0h WR_ADDR_OUT : %0h",trans.wr_addr_in,trans.M_AW_ADDR_OUT),UVM_LOW)  
           end

           else
           begin
             `uvm_error("WRITE ADDRESS",$sformatf("FAIL WR_ADDR_IN : %0h  WR_ADDR_OUT : %0h",trans.wr_addr_in,trans.M_AW_ADDR_OUT))
           end
         end
       end                                  // Write Enable end

         if(trans.M_W_VALID_OUT == 1'b1 && trans.M_W_READY_IN == 1'b1)        // Write Data Compare
         begin
           if(trans.m_data_in == trans.M_W_DATA_OUT)
           begin 
             `uvm_info("WRITE DATA",$sformatf("PASS WR_DATA_IN : %0h  WR_DATA_OUT : %0h",trans.m_data_in,trans.M_W_DATA_OUT),UVM_LOW)
           end

           else
           begin
             `uvm_error("WRITE DATA",$sformatf("FAIL WR_DATA_IN : %0h   WR_DATA_OUT : %0h",trans.m_data_in,trans.M_W_DATA_OUT))
           end
         end
       

         if(trans.M_B_READY_OUT == 1'b1 && trans.M_B_VALID_IN == 1'b1)        // Write Response Compare
         begin
           if(trans.M_B_RESP_IN == 2'b00)
           begin
             `uvm_info("WRITE RESPONSE",$sformatf("WRITE RESPONSE IS GIVEN"),UVM_LOW)
           end

           else
           begin 
             `uvm_info("WRITE RESPONSE",$sformatf("WRITE RESPONSE IS NOT GIVEN"),UVM_LOW)
           end
        end
/////////////////////////////////////// END OF WRITE PHASE ////////////////////////////////////////////////

////////////////////////////////////// READ PHASE COMPARISION /////////////////////////////////////////////
      
      if(trans.rd_en_in == 1'b1)                // Read Enable                         
      begin
        if(trans.M_AR_VALID_OUT == 1'b1 && trans.M_AR_READY_IN == 1'b1)          // Read Address Compare
        begin
          if(trans.rd_addr_in == trans.M_AR_ADDR_OUT)
          begin
            `uvm_info("READ ADDRESS",$sformatf("PASS RD_ADDR_IN : %0h  RD_ADDR_OUT : %0h ",trans.rd_addr_in,trans.M_AR_ADDR_OUT),UVM_LOW)
          end

          else
          begin
            `uvm_error("READ ADDRESS",$sformatf("FAIL RD_ADDR_IN : %0h RD_ADDR_OUT : %0h",trans.rd_addr_in,trans.M_AR_ADDR_OUT))
          end
        end
      end                                       // Read Enable end
          
        if(trans.M_R_READY_OUT == 1'b1 && trans.M_R_VALID_IN == 1'b1 && trans.M_R_RESP_IN == 2'b00)   // Read Data Compare
        begin
          temp_read_data = trans.M_R_DATA_IN;
          flag = 1;
        end

        else if(flag == 1 && trans.M_R_DATA_IN == 64'h00000000000000000)
        begin 
          if(trans.m_data_out == temp_read_data)
          begin
            `uvm_info("READ DATA",$sformatf("PASS RD_DATA_IN : %0h  RD_DATA_OUT : %0h",temp_read_data,trans.m_data_out),UVM_LOW)
            flag = 0;
          end

          else
          begin
            `uvm_error("READ DATA",$sformatf("FAIL RD_DATA_IN : %0h RD_DATA_OUT : %0h",temp_read_data,trans.m_data_out))
            flag = 0;
          end
        end

 
/////////////////////////////////////////////// READ PHASE END ///////////////////////////////////////////// 

    end

  end
             
  endtask 

	
endclass
