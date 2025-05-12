class ulss_monitor extends uvm_monitor;

    // Factory registration
    `uvm_component_utils(ulss_monitor)
     virtual ulss_interface vif;
     ulss_tx tx;
    // Analysis port to send transactions to the scoreboard
     uvm_analysis_port #(ulss_tx) analysis_port;

    // Constructor
    function new(string name = "ulss_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual ulss_interface)::get(this, "*", "ulss_interface", vif)) begin
            `uvm_fatal(get_full_name(), "Error while getting read interface from top monitor")
        end
        analysis_port = new("analysis_port", this); 
    endfunction
  
    // Run phase
    task run_phase(uvm_phase phase);
       forever begin
          tx = ulss_tx::type_id::create("tx");
          @(posedge vif.rate_limiter_16to4_clk);
      
             collect_inputs();
             collect_outputs();
             analysis_port.write(tx);
      
      `uvm_info(get_type_name(), $sformatf("Monitor captured transaction"), UVM_HIGH)
      end
    endtask
  
    task collect_inputs();
        // Reset and control signals
        tx.rate_limiter_16to4_rstn = vif.rate_limiter_16to4_rstn;
        tx.rate_limiter_16to4_sw_rst = vif.rate_limiter_16to4_sw_rst;
        tx.sch_reg_wr_en = vif.sch_reg_wr_en;
        tx.sch_reg_wr_addr = vif.sch_reg_wr_addr;
        tx.sch_reg_wr_data = vif.sch_reg_wr_data;
        if (vif.sch_reg_wr_en) begin
       `uvm_info(get_type_name(), $sformatf("[MON] Register write: ENABLE=%b ADDR=0x%0h DATA=0x%0h",tx.sch_reg_wr_en,
                tx.sch_reg_wr_addr, tx.sch_reg_wr_data), UVM_LOW)
    end
    
       // `uvm_info(get_type_name(), $sformatf("[MON] Register write: ADDR=0x%0h DATA=0x%0h ENABLE=%b",tx.sch_reg_wr_en, 
       //         tx.sch_reg_wr_addr, tx.sch_reg_wr_data), UVM_LOW)
        
        // Empty signals
        tx.pck_str_empty_0 = vif.pck_str_empty_0;
        tx.pck_str_empty_1 = vif.pck_str_empty_1;
        tx.pck_str_empty_2 = vif.pck_str_empty_2;
        tx.pck_str_empty_3 = vif.pck_str_empty_3;
        tx.pck_str_empty_4 = vif.pck_str_empty_4;
        tx.pck_str_empty_5 = vif.pck_str_empty_5;
        tx.pck_str_empty_6 = vif.pck_str_empty_6;
        tx.pck_str_empty_7 = vif.pck_str_empty_7;
        tx.pck_str_empty_8 = vif.pck_str_empty_8;
        tx.pck_str_empty_9 = vif.pck_str_empty_9;
        tx.pck_str_empty_10 = vif.pck_str_empty_10;
        tx.pck_str_empty_11 = vif.pck_str_empty_11;
        tx.pck_str_empty_12 = vif.pck_str_empty_12;
        tx.pck_str_empty_13 = vif.pck_str_empty_13;
        tx.pck_str_empty_14 = vif.pck_str_empty_14;
        tx.pck_str_empty_15 = vif.pck_str_empty_15;
        
        // Input stream data
        tx.in_sop_0 = vif.in_sop_0;
        tx.in_stream_0 = vif.in_stream_0;
        tx.in_eop_0 = vif.in_eop_0;
        
        tx.in_sop_1 = vif.in_sop_1;
        tx.in_stream_1 = vif.in_stream_1;
        tx.in_eop_1 = vif.in_eop_1;
        
        tx.in_sop_2 = vif.in_sop_2;
        tx.in_stream_2 = vif.in_stream_2;
        tx.in_eop_2 = vif.in_eop_2;
        
        tx.in_sop_3 = vif.in_sop_3;
        tx.in_stream_3 = vif.in_stream_3;
        tx.in_eop_3 = vif.in_eop_3;
        
        tx.in_sop_4 = vif.in_sop_4;
        tx.in_stream_4 = vif.in_stream_4;
        tx.in_eop_4 = vif.in_eop_4;
        
        tx.in_sop_5 = vif.in_sop_5;
        tx.in_stream_5 = vif.in_stream_5;
        tx.in_eop_5 = vif.in_eop_5;
        
        tx.in_sop_6 = vif.in_sop_6;
        tx.in_stream_6 = vif.in_stream_6;
        tx.in_eop_6 = vif.in_eop_6;
        
        tx.in_sop_7 = vif.in_sop_7;
        tx.in_stream_7 = vif.in_stream_7;
        tx.in_eop_7 = vif.in_eop_7;
        
        tx.in_sop_8 = vif.in_sop_8;
        tx.in_stream_8 = vif.in_stream_8;
        tx.in_eop_8 = vif.in_eop_8;
        
        tx.in_sop_9 = vif.in_sop_9;
        tx.in_stream_9 = vif.in_stream_9;
        tx.in_eop_9 = vif.in_eop_9;
        
        tx.in_sop_10 = vif.in_sop_10;
        tx.in_stream_10 = vif.in_stream_10;
        tx.in_eop_10 = vif.in_eop_10;
        
        tx.in_sop_11 = vif.in_sop_11;
        tx.in_stream_11 = vif.in_stream_11;
        tx.in_eop_11 = vif.in_eop_11;
        
        tx.in_sop_12 = vif.in_sop_12;
        tx.in_stream_12 = vif.in_stream_12;
        tx.in_eop_12 = vif.in_eop_12;
        
        tx.in_sop_13 = vif.in_sop_13;
        tx.in_stream_13 = vif.in_stream_13;
        tx.in_eop_13 = vif.in_eop_13;
        
        tx.in_sop_14 = vif.in_sop_14;
        tx.in_stream_14 = vif.in_stream_14;
        tx.in_eop_14 = vif.in_eop_14;
        
        tx.in_sop_15 = vif.in_sop_15;
        tx.in_stream_15 = vif.in_stream_15;
        tx.in_eop_15 = vif.in_eop_15;
   endtask
  
   task collect_outputs();
    // Grant signals
        tx.pck_rd_en_grnt_0 = vif.pck_rd_en_grnt_0;
        tx.pck_rd_en_grnt_1 = vif.pck_rd_en_grnt_1;
        tx.pck_rd_en_grnt_2 = vif.pck_rd_en_grnt_2;
        tx.pck_rd_en_grnt_3 = vif.pck_rd_en_grnt_3;
        tx.pck_rd_en_grnt_4 = vif.pck_rd_en_grnt_4;
        tx.pck_rd_en_grnt_5 = vif.pck_rd_en_grnt_5;
        tx.pck_rd_en_grnt_6 = vif.pck_rd_en_grnt_6;
        tx.pck_rd_en_grnt_7 = vif.pck_rd_en_grnt_7;
        tx.pck_rd_en_grnt_8 = vif.pck_rd_en_grnt_8;
        tx.pck_rd_en_grnt_9 = vif.pck_rd_en_grnt_9;
        tx.pck_rd_en_grnt_10 = vif.pck_rd_en_grnt_10;
        tx.pck_rd_en_grnt_11 = vif.pck_rd_en_grnt_11;
        tx.pck_rd_en_grnt_12 = vif.pck_rd_en_grnt_12;
        tx.pck_rd_en_grnt_13 = vif.pck_rd_en_grnt_13;
        tx.pck_rd_en_grnt_14 = vif.pck_rd_en_grnt_14;
        tx.pck_rd_en_grnt_15 = vif.pck_rd_en_grnt_15;
    
        tx.out_sop_0 = vif.out_sop_0;
        tx.out_stream_0 = vif.out_stream_0;
        tx.out_eop_0 = vif.out_eop_0;
    
        tx.out_sop_1 = vif.out_sop_1;
        tx.out_stream_1 = vif.out_stream_1;
        tx.out_eop_1 = vif.out_eop_1;
    
        tx.out_sop_2 = vif.out_sop_2;
        tx.out_stream_2 = vif.out_stream_2;
        tx.out_eop_2 = vif.out_eop_2;
    
        tx.out_sop_3 = vif.out_sop_3;
        tx.out_stream_3 = vif.out_stream_3;
        tx.out_eop_3 = vif.out_eop_3;
  endtask
endclass  










/*class ulss_monitor extends uvm_monitor;
  `uvm_component_utils(ulss_monitor)
  
  virtual ulss_interface vif;
  
  uvm_analysis_port #(ulss_tx) mon_ap;
  
  ulss_tx tx;
  
  // Constructor
  function new(string name = "ulss_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual ulss_interface)::get(this, "", "ulss_interface", vif))
      `uvm_fatal(get_type_name(), "Failed to get virtual interface")
      
      mon_ap = new("mon_ap", this); 
  endfunction
  
  // Run phase
  task run_phase(uvm_phase phase);
    
    forever begin
      tx = ulss_tx::type_id::create("tx");  
      @(posedge vif.rate_limiter_16to4_clk);
      
      collect_inputs();      
      collect_outputs();      
      mon_ap.write(tx);
          
      // Print key transaction information
     // display_transaction_summary();
    end
  endtask
  
  task collect_inputs();
    // Reset and control signals
    tx.rate_limiter_16to4_rstn = vif.rate_limiter_16to4_rstn;
    tx.rate_limiter_16to4_sw_rst = vif.rate_limiter_16to4_sw_rst;
    tx.sch_reg_wr_en = vif.sch_reg_wr_en;
    tx.sch_reg_wr_addr = vif.sch_reg_wr_addr;
    tx.sch_reg_wr_data = vif.sch_reg_wr_data;
    
    if (vif.sch_reg_wr_en) begin
      `uvm_info(get_type_name(), $sformatf("[MON] Register write: ENABLE =%b ADDR=0x%0h DATA=0x%0h",vif.sch_reg_wr_en, 
                vif.sch_reg_wr_addr, vif.sch_reg_wr_data), UVM_LOW)
    end
    
    // Empty signals
    tx.pck_str_empty_0 = vif.pck_str_empty_0;
    tx.pck_str_empty_1 = vif.pck_str_empty_1;
    tx.pck_str_empty_2 = vif.pck_str_empty_2;
    tx.pck_str_empty_3 = vif.pck_str_empty_3;
    tx.pck_str_empty_4 = vif.pck_str_empty_4;
    tx.pck_str_empty_5 = vif.pck_str_empty_5;
    tx.pck_str_empty_6 = vif.pck_str_empty_6;
    tx.pck_str_empty_7 = vif.pck_str_empty_7;
    tx.pck_str_empty_8 = vif.pck_str_empty_8;
    tx.pck_str_empty_9 = vif.pck_str_empty_9;
    tx.pck_str_empty_10 = vif.pck_str_empty_10;
    tx.pck_str_empty_11 = vif.pck_str_empty_11;
    tx.pck_str_empty_12 = vif.pck_str_empty_12;
    tx.pck_str_empty_13 = vif.pck_str_empty_13;
    tx.pck_str_empty_14 = vif.pck_str_empty_14;
    tx.pck_str_empty_15 = vif.pck_str_empty_15;
    
    // Input stream data
    tx.in_sop_0 = vif.in_sop_0;
    tx.in_stream_0 = vif.in_stream_0;
    tx.in_eop_0 = vif.in_eop_0;
    
    tx.in_sop_1 = vif.in_sop_1;
    tx.in_stream_1 = vif.in_stream_1;
    tx.in_eop_1 = vif.in_eop_1;
    
    tx.in_sop_2 = vif.in_sop_2;
    tx.in_stream_2 = vif.in_stream_2;
    tx.in_eop_2 = vif.in_eop_2;
    
    tx.in_sop_3 = vif.in_sop_3;
    tx.in_stream_3 = vif.in_stream_3;
    tx.in_eop_3 = vif.in_eop_3;
    
    tx.in_sop_4 = vif.in_sop_4;
    tx.in_stream_4 = vif.in_stream_4;
    tx.in_eop_4 = vif.in_eop_4;
    
    tx.in_sop_5 = vif.in_sop_5;
    tx.in_stream_5 = vif.in_stream_5;
    tx.in_eop_5 = vif.in_eop_5;
    
    tx.in_sop_6 = vif.in_sop_6;
    tx.in_stream_6 = vif.in_stream_6;
    tx.in_eop_6 = vif.in_eop_6;
    
    tx.in_sop_7 = vif.in_sop_7;
    tx.in_stream_7 = vif.in_stream_7;
    tx.in_eop_7 = vif.in_eop_7;
    
    tx.in_sop_8 = vif.in_sop_8;
    tx.in_stream_8 = vif.in_stream_8;
    tx.in_eop_8 = vif.in_eop_8;
    
    tx.in_sop_9 = vif.in_sop_9;
    tx.in_stream_9 = vif.in_stream_9;
    tx.in_eop_9 = vif.in_eop_9;
    
    tx.in_sop_10 = vif.in_sop_10;
    tx.in_stream_10 = vif.in_stream_10;
    tx.in_eop_10 = vif.in_eop_10;
    
    tx.in_sop_11 = vif.in_sop_11;
    tx.in_stream_11 = vif.in_stream_11;
    tx.in_eop_11 = vif.in_eop_11;
    
    tx.in_sop_12 = vif.in_sop_12;
    tx.in_stream_12 = vif.in_stream_12;
    tx.in_eop_12 = vif.in_eop_12;
    
    tx.in_sop_13 = vif.in_sop_13;
    tx.in_stream_13 = vif.in_stream_13;
    tx.in_eop_13 = vif.in_eop_13;
    
    tx.in_sop_14 = vif.in_sop_14;
    tx.in_stream_14 = vif.in_stream_14;
    tx.in_eop_14 = vif.in_eop_14;
    
    tx.in_sop_15 = vif.in_sop_15;
    tx.in_stream_15 = vif.in_stream_15;
    tx.in_eop_15 = vif.in_eop_15;
    
    // Log active input streams
    for (int i = 0; i < 16; i++) begin
      bit sop, eop;
      logic [63:0] stream_data;
      
      case (i)
        0: begin sop = vif.in_sop_0; eop = vif.in_eop_0; stream_data = vif.in_stream_0; end
        1: begin sop = vif.in_sop_1; eop = vif.in_eop_1; stream_data = vif.in_stream_1; end
        2: begin sop = vif.in_sop_2; eop = vif.in_eop_2; stream_data = vif.in_stream_2; end
        3: begin sop = vif.in_sop_3; eop = vif.in_eop_3; stream_data = vif.in_stream_3; end
        4: begin sop = vif.in_sop_4; eop = vif.in_eop_4; stream_data = vif.in_stream_4; end
        5: begin sop = vif.in_sop_5; eop = vif.in_eop_5; stream_data = vif.in_stream_5; end
        6: begin sop = vif.in_sop_6; eop = vif.in_eop_6; stream_data = vif.in_stream_6; end
        7: begin sop = vif.in_sop_7; eop = vif.in_eop_7; stream_data = vif.in_stream_7; end
        8: begin sop = vif.in_sop_8; eop = vif.in_eop_8; stream_data = vif.in_stream_8; end
        9: begin sop = vif.in_sop_9; eop = vif.in_eop_9; stream_data = vif.in_stream_9; end
        10: begin sop = vif.in_sop_10; eop = vif.in_eop_10; stream_data = vif.in_stream_10; end
        11: begin sop = vif.in_sop_11; eop = vif.in_eop_11; stream_data = vif.in_stream_11; end
        12: begin sop = vif.in_sop_12; eop = vif.in_eop_12; stream_data = vif.in_stream_12; end
        13: begin sop = vif.in_sop_13; eop = vif.in_eop_13; stream_data = vif.in_stream_13; end
        14: begin sop = vif.in_sop_14; eop = vif.in_eop_14; stream_data = vif.in_stream_14; end
        15: begin sop = vif.in_sop_15; eop = vif.in_eop_15; stream_data = vif.in_stream_15; end
      endcase
      
      // Report active streams (either SOP or EOP is active, or data is non-zero)
      if (sop || eop || stream_data != 0) begin
        `uvm_info(get_type_name(), $sformatf("[MON] Active input stream %0d: SOP=%0d, DATA=0x%0h, EOP=%0d", 
                 i, sop, stream_data, eop), UVM_MEDIUM)
      end
    end
  endtask
  
  // Task to collect output signals
  task collect_outputs();
    bit has_output_signals; 
    
    // Grant signals
    tx.pck_rd_en_grnt_0 = vif.pck_rd_en_grnt_0;
    tx.pck_rd_en_grnt_1 = vif.pck_rd_en_grnt_1;
    tx.pck_rd_en_grnt_2 = vif.pck_rd_en_grnt_2;
    tx.pck_rd_en_grnt_3 = vif.pck_rd_en_grnt_3;
    tx.pck_rd_en_grnt_4 = vif.pck_rd_en_grnt_4;
    tx.pck_rd_en_grnt_5 = vif.pck_rd_en_grnt_5;
    tx.pck_rd_en_grnt_6 = vif.pck_rd_en_grnt_6;
    tx.pck_rd_en_grnt_7 = vif.pck_rd_en_grnt_7;
    tx.pck_rd_en_grnt_8 = vif.pck_rd_en_grnt_8;
    tx.pck_rd_en_grnt_9 = vif.pck_rd_en_grnt_9;
    tx.pck_rd_en_grnt_10 = vif.pck_rd_en_grnt_10;
    tx.pck_rd_en_grnt_11 = vif.pck_rd_en_grnt_11;
    tx.pck_rd_en_grnt_12 = vif.pck_rd_en_grnt_12;
    tx.pck_rd_en_grnt_13 = vif.pck_rd_en_grnt_13;
    tx.pck_rd_en_grnt_14 = vif.pck_rd_en_grnt_14;
    tx.pck_rd_en_grnt_15 = vif.pck_rd_en_grnt_15;
    
    // Log active grant signals
    for (int i = 0; i < 16; i++) begin
      bit grant;
      
      case (i)
        0: grant = vif.pck_rd_en_grnt_0;
        1: grant = vif.pck_rd_en_grnt_1;
        2: grant = vif.pck_rd_en_grnt_2;
        3: grant = vif.pck_rd_en_grnt_3;
        4: grant = vif.pck_rd_en_grnt_4;
        5: grant = vif.pck_rd_en_grnt_5;
        6: grant = vif.pck_rd_en_grnt_6;
        7: grant = vif.pck_rd_en_grnt_7;
        8: grant = vif.pck_rd_en_grnt_8;
        9: grant = vif.pck_rd_en_grnt_9;
        10: grant = vif.pck_rd_en_grnt_10;
        11: grant = vif.pck_rd_en_grnt_11;
        12: grant = vif.pck_rd_en_grnt_12;
        13: grant = vif.pck_rd_en_grnt_13;
        14: grant = vif.pck_rd_en_grnt_14;
        15: grant = vif.pck_rd_en_grnt_15;
      endcase
      
      if (grant) begin
        `uvm_info(get_type_name(), $sformatf("[MON] Active grant for stream %0d", i), UVM_MEDIUM)
      end
    end
    
    // Output stream signals (assuming these exist in your interface)
    // If these don't exist in your interface, you'll need to remove or modify this section
    has_output_signals = 1'b0; // Initialize the variable
    
    if (vif.out_sop_0 !== 1'bx) begin 
      tx.out_sop_0 = vif.out_sop_0;
      has_output_signals = 1'b1;
    end
    if (vif.out_stream_0 !== 'x) begin
      tx.out_stream_0 = vif.out_stream_0;
      has_output_signals = 1'b1;
    end
    if (vif.out_eop_0 !== 1'bx) begin
      tx.out_eop_0 = vif.out_eop_0;
      has_output_signals = 1'b1;
    end
    
    if (vif.out_sop_1 !== 1'bx) begin
      tx.out_sop_1 = vif.out_sop_1;
      has_output_signals = 1'b1;
    end
    if (vif.out_stream_1 !== 'x) begin
      tx.out_stream_1 = vif.out_stream_1;
      has_output_signals = 1'b1;
    end
    if (vif.out_eop_1 !== 1'bx) begin
      tx.out_eop_1 = vif.out_eop_1;
      has_output_signals = 1'b1;
    end
    
    if (vif.out_sop_2 !== 1'bx) begin
      tx.out_sop_2 = vif.out_sop_2;
      has_output_signals = 1'b1;
    end
    if (vif.out_stream_2 !== 'x) begin
      tx.out_stream_2 = vif.out_stream_2;
      has_output_signals = 1'b1;
    end
    if (vif.out_eop_2 !== 1'bx) begin
      tx.out_eop_2 = vif.out_eop_2;
      has_output_signals = 1'b1;
    end
    
    if (vif.out_sop_3 !== 1'bx) begin
      tx.out_sop_3 = vif.out_sop_3;
      has_output_signals = 1'b1;
    end
    if (vif.out_stream_3 !== 'x) begin
      tx.out_stream_3 = vif.out_stream_3;
      has_output_signals = 1'b1;
    end
    if (vif.out_eop_3 !== 1'bx) begin
      tx.out_eop_3 = vif.out_eop_3;
      has_output_signals = 1'b1;
    end
    
    // Log output streams if they are valid
    if (has_output_signals) begin
      for (int i = 0; i < 4; i++) begin
        bit sop, eop;
        logic [63:0] stream_data;
        
        case (i)
          0: begin 
            sop = vif.out_sop_0; 
            eop = vif.out_eop_0; 
            stream_data = vif.out_stream_0; 
          end
          1: begin 
            sop = vif.out_sop_1; 
            eop = vif.out_eop_1; 
            stream_data = vif.out_stream_1; 
          end
          2: begin 
            sop = vif.out_sop_2; 
            eop = vif.out_eop_2; 
            stream_data = vif.out_stream_2; 
          end
          3: begin 
            sop = vif.out_sop_3; 
            eop = vif.out_eop_3; 
            stream_data = vif.out_stream_3; 
          end
        endcase
        
        // Report active output streams
        if (sop || eop || stream_data != 0) begin
          `uvm_info(get_type_name(), $sformatf("[MON] Active output stream %0d: SOP=%0d, DATA=0x%0h, EOP=%0d", 
                   i, sop, stream_data, eop), UVM_LOW)
        end
      end
    end
  endtask
  
 endclass*/






