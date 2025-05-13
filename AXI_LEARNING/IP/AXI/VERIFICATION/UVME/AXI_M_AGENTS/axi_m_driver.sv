class axi_m_driver extends uvm_driver#(axi_m_seq_item);

   `uvm_component_utils(axi_m_driver)

    virtual intf vif;
    axi_m_seq_item seq_item;
    int ready_wait1;
    int ready_wait2;
    int ready_wait3;
    int ready_wait4;
    int ready_wait5;
    logic [1:0] w_resp_temp;                    // Temproary variable for storing write response
    logic [1:0] r_resp_temp;                    // Temproary variable for storing read response

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(virtual intf) :: get(this,"","pif",vif))
      `uvm_error("driver","no resource found");
  endfunction  

  task run_phase(uvm_phase phase);
  
    forever 
    begin
      @(posedge vif.axi4_lite_clk);
      seq_item_port.get_next_item(seq_item);
      `uvm_info(get_type_name(), "Out of Reset Mode", UVM_LOW)

    if(seq_item.axi4_lite_rstn == 0)                  // reset case
    begin
      vif.axi4_lite_rstn = 0;
      vif.wr_en_in       = 0;
      vif.rd_en_in       = 0;
      vif.byte_en        = 0;
      vif.wr_addr_in     = 0;
      vif.rd_addr_in     = 0;
      vif.m_data_in      = 0;
      vif.M_AW_READY_IN  = 0;
      vif.M_W_READY_IN   = 0;
      vif.M_B_VALID_IN   = 0;
      vif.M_B_RESP_IN    = 0;
      vif.M_AR_READY_IN  = 0;
      vif.M_R_DATA_IN    = 0;
      vif.M_R_RESP_IN    = 0;
      vif.M_R_VALID_IN   = 0;
      repeat(2) @(posedge vif.axi4_lite_clk);
      vif.axi4_lite_rstn = 1;
    end

    else if(seq_item.axi4_lite_rstn == 1)                         // Out of reset case
    begin
      if(seq_item.wr_en_in == 1)                                  // Entering Write phase 
      begin                                                       // Write phase begin

        begin                                                     // Write address begin
          `uvm_info("Driver",$sformatf("Writing Address"),UVM_LOW)
          vif.wr_en_in        = seq_item.wr_en_in;
          vif.rd_en_in        = seq_item.rd_en_in;
          vif.byte_en         = seq_item.byte_en;
          vif.wr_addr_in      = seq_item.wr_addr_in;
          vif.M_AW_READY_IN = 0;
          ready_wait1       = 1;
          while(ready_wait1)
          begin
            @(posedge vif.axi4_lite_clk);
            if(vif.M_AW_VALID_OUT == 1)
            begin 
              ready_wait1 = 0;
              vif.M_AW_READY_IN = 1;
            end
          end
          @(posedge vif.axi4_lite_clk);
          vif.wr_addr_in    = 0;
          vif.M_AW_READY_IN = 0;
          vif.byte_en       = 0;

        end                                                           // Write address end  

        vif.wr_en_in = 0;

        begin                                                         // Write data begin                  
          `uvm_info("Driver",$sformatf("Writing Data"),UVM_LOW)
          vif.m_data_in    = seq_item.m_data_in;
          vif.M_W_READY_IN = 0;
          ready_wait2 = 1;
          while(ready_wait2)
          begin
            @(posedge vif.axi4_lite_clk);
            if(vif.M_W_VALID_OUT == 1)
              begin
                ready_wait2 = 0;
                vif.M_W_READY_IN = 1;
              end
          end
          @(posedge vif.axi4_lite_clk);
          vif.m_data_in    = 0;
          vif.M_W_READY_IN = 0;

        end                                                           // Write data end
        
        //vif.wr_en_in = 0;
 
        begin                                                        // Write response begin
          `uvm_info("Driver",$sformatf("Write Response"),UVM_LOW)
          vif.M_B_VALID_IN = 0;
          ready_wait3    = 1;
          while(ready_wait3)
          begin
            @(posedge vif.axi4_lite_clk);
            if(vif.M_B_READY_OUT == 1)
            begin
              ready_wait3 = 0;
              vif.M_B_VALID_IN = 1; 
              vif.M_B_RESP_IN  = seq_item.M_B_RESP_IN;
              w_resp_temp = vif.M_B_RESP_IN;
            end
          end
          @(posedge vif.axi4_lite_clk);
          vif.M_B_VALID_IN = 0;
          vif.M_B_RESP_IN  = 2'b00;
        end                                                        // Write response end

        begin                                                      // False part of Write response  
          @(posedge vif.axi4_lite_clk);
          if(w_resp_temp != 2'b00 && vif.M_W_VALID_OUT == 1'b1)
          begin
            vif.M_W_READY_IN = 1;
            vif.m_data_in    = seq_item.m_data_in;
            @(posedge vif.axi4_lite_clk);            
            w_resp_temp = 2'b00;
            vif.M_W_READY_IN = 0;
            vif.m_data_in = 0;
            @(posedge vif.axi4_lite_clk);             
            vif.M_B_VALID_IN = 1;
            @(posedge vif.axi4_lite_clk);
            vif.M_B_VALID_IN = 0;
          end
        end                                                           
        
      end                                                           // Write part end
       
      else if(seq_item.rd_en_in == 1)                               // Read Phase 
      begin
        @(posedge vif.axi4_lite_clk);        
        begin                                                      // Read address begin
          `uvm_info("Driver",$sformatf("Reading Address"),UVM_LOW)
          vif.wr_en_in      = seq_item.wr_en_in;
          vif.rd_en_in      = seq_item.rd_en_in;
          vif.rd_addr_in    = seq_item.rd_addr_in;
          vif.M_AR_READY_IN = 0;
          ready_wait4 = 1;
          while(ready_wait4)
          begin
            @(posedge vif.axi4_lite_clk);
            if(vif.M_AR_VALID_OUT == 1)
            begin 
              ready_wait4 = 0; 
              vif.M_AR_READY_IN = 1;
            end
          end
          @(posedge vif.axi4_lite_clk);
          vif.M_AR_READY_IN  = 0;
          vif.rd_addr_in = 0;
        end                                                        // Read address end

        vif.rd_en_in = 0;

        begin                                                      // Read data begin                   
          `uvm_info("Driver",$sformatf("Reading Data"),UVM_LOW)
          vif.M_R_VALID_IN = 0; 
          ready_wait5    = 1;

          while(ready_wait5)
          begin
            @(posedge vif.axi4_lite_clk);
            if(vif.M_R_READY_OUT == 1)
            begin
              ready_wait5 = 0;
              vif.M_R_DATA_IN  = seq_item.M_R_DATA_IN;
              vif.M_R_VALID_IN = 1;
              vif.M_R_RESP_IN  = seq_item.M_R_RESP_IN;
              r_resp_temp = vif.M_R_RESP_IN;
            end
          end

          @(posedge vif.axi4_lite_clk);
          vif.M_R_VALID_IN = 0;
          vif.M_R_DATA_IN  = 0;
          vif.M_R_RESP_IN  = 2'b00;

        end                                                        // Reading Data end

        begin
          @(posedge vif.axi4_lite_clk);
          if(r_resp_temp != 2'b00 && vif.M_R_READY_OUT == 1'b1)
          begin
            vif.M_R_VALID_IN = 1;
            vif.M_R_DATA_IN  = seq_item.M_R_DATA_IN;
            @(posedge vif.axi4_lite_clk);            
            r_resp_temp = 2'b00;
            vif.M_R_VALID_IN = 0;
            vif.M_R_DATA_IN = 0;
          end
        end

      //vif.rd_en_in = 0;
      end                                                         // Read phase end
    
    end                                                          // Reset phase end

      seq_item_port.item_done();

    end                                                         // Forever loop end

  endtask

endclass

    

      

      
      
     

   
        

  


 
    

