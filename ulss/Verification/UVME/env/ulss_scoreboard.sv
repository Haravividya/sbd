
class ulss_scoreboard extends uvm_scoreboard;
  // Factory registration
  `uvm_component_utils(ulss_scoreboard)
  
  // Analysis ports for DUT monitor
  uvm_analysis_imp#(ulss_tx, ulss_scoreboard) dut_analysis_imp;
  
  // Queues to store packets from DUT
  ulss_tx dut_tx_queue[$];
  
  // Queue for expected outputs from reference model
  // Only store expected outputs that haven't been seen yet
  bit [63:0] exp_out_data[4][$];
  bit exp_out_sop[4][$];
  bit exp_out_eop[4][$];
  
  // Counters for tracking comparison results
  int match_count;
  int mismatch_count;
  
  // Flags to track if a specific packet has been processed in the current cycle
  bit output_processed[4];
  
  // Tracking variables for debug/summary information
  static string active_inputs;
  static string active_grants;
  static string active_outputs;
  static int active_input_count;
  static int active_grant_count;
  static int active_output_count;
  static string summary;
  
  // Constructor
  function new(string name = "ulss_scoreboard", uvm_component parent = null);
    super.new(name, parent);
    match_count = 0;
    mismatch_count = 0;
    active_inputs = "";
    active_grants = "";
    active_outputs = "";
    active_input_count = 0;
    active_grant_count = 0;
    active_output_count = 0;
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Create analysis ports
    dut_analysis_imp = new("dut_analysis_imp", this);
    
    `uvm_info(get_type_name(), "Scoreboard build phase completed", UVM_MEDIUM)
  endfunction
  
  // Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(), "Scoreboard connect phase completed", UVM_MEDIUM)
  endfunction
  
  // Write function for DUT monitor transactions
  virtual function void write(ulss_tx tx);
    // Store the transaction for later processing
    dut_tx_queue.push_back(tx);
    
    // Reset output processed flags
    foreach (output_processed[i]) output_processed[i] = 0;
    
    // Process the input transaction through reference model to generate expected outputs
    reference_model(tx);
    
    // Compare DUT outputs with expected outputs
    check_outputs(tx);
    
    // Update summary information
    summary = $sformatf("[MON] Summary @ %0t: ", $time);
    
    `uvm_info(get_type_name(), $sformatf("Received transaction from DUT monitor at time %0t", $time), UVM_HIGH)
  endfunction
  
  // Reference model implementation
  virtual function void reference_model(ulss_tx tx);
    bit [15:0] grant_signals;
    bit valid_data;
    bit sop, eop;
    bit [63:0] data;
    int out_port;
    bit is_duplicate;
    int j;
    
    // Extract grant signals from transaction
    grant_signals[0] = tx.pck_rd_en_grnt_0;
    grant_signals[1] = tx.pck_rd_en_grnt_1;
    grant_signals[2] = tx.pck_rd_en_grnt_2;
    grant_signals[3] = tx.pck_rd_en_grnt_3;
    grant_signals[4] = tx.pck_rd_en_grnt_4;
    grant_signals[5] = tx.pck_rd_en_grnt_5;
    grant_signals[6] = tx.pck_rd_en_grnt_6;
    grant_signals[7] = tx.pck_rd_en_grnt_7;
    grant_signals[8] = tx.pck_rd_en_grnt_8;
    grant_signals[9] = tx.pck_rd_en_grnt_9;
    grant_signals[10] = tx.pck_rd_en_grnt_10;
    grant_signals[11] = tx.pck_rd_en_grnt_11;
    grant_signals[12] = tx.pck_rd_en_grnt_12;
    grant_signals[13] = tx.pck_rd_en_grnt_13;
    grant_signals[14] = tx.pck_rd_en_grnt_14;
    grant_signals[15] = tx.pck_rd_en_grnt_15;
    
    // Determine which input streams are active and granted
    for (int i = 0; i < 16; i++) begin
      if (grant_signals[i]) begin
        valid_data = 0;
        sop = 0;
        eop = 0;
        data = 64'h0;
        
        // Get the appropriate signals based on stream index
        case (i)
          0: begin sop = tx.in_sop_0; data = tx.in_stream_0; eop = tx.in_eop_0; valid_data = tx.in_sop_0 || tx.in_eop_0 || (tx.in_stream_0 != 0); end
          1: begin sop = tx.in_sop_1; data = tx.in_stream_1; eop = tx.in_eop_1; valid_data = tx.in_sop_1 || tx.in_eop_1 || (tx.in_stream_1 != 0); end
          2: begin sop = tx.in_sop_2; data = tx.in_stream_2; eop = tx.in_eop_2; valid_data = tx.in_sop_2 || tx.in_eop_2 || (tx.in_stream_2 != 0); end
          3: begin sop = tx.in_sop_3; data = tx.in_stream_3; eop = tx.in_eop_3; valid_data = tx.in_sop_3 || tx.in_eop_3 || (tx.in_stream_3 != 0); end
          4: begin sop = tx.in_sop_4; data = tx.in_stream_4; eop = tx.in_eop_4; valid_data = tx.in_sop_4 || tx.in_eop_4 || (tx.in_stream_4 != 0); end
          5: begin sop = tx.in_sop_5; data = tx.in_stream_5; eop = tx.in_eop_5; valid_data = tx.in_sop_5 || tx.in_eop_5 || (tx.in_stream_5 != 0); end
          6: begin sop = tx.in_sop_6; data = tx.in_stream_6; eop = tx.in_eop_6; valid_data = tx.in_sop_6 || tx.in_eop_6 || (tx.in_stream_6 != 0); end
          7: begin sop = tx.in_sop_7; data = tx.in_stream_7; eop = tx.in_eop_7; valid_data = tx.in_sop_7 || tx.in_eop_7 || (tx.in_stream_7 != 0); end
          8: begin sop = tx.in_sop_8; data = tx.in_stream_8; eop = tx.in_eop_8; valid_data = tx.in_sop_8 || tx.in_eop_8 || (tx.in_stream_8 != 0); end
          9: begin sop = tx.in_sop_9; data = tx.in_stream_9; eop = tx.in_eop_9; valid_data = tx.in_sop_9 || tx.in_eop_9 || (tx.in_stream_9 != 0); end
          10: begin sop = tx.in_sop_10; data = tx.in_stream_10; eop = tx.in_eop_10; valid_data = tx.in_sop_10 || tx.in_eop_10 || (tx.in_stream_10 != 0); end
          11: begin sop = tx.in_sop_11; data = tx.in_stream_11; eop = tx.in_eop_11; valid_data = tx.in_sop_11 || tx.in_eop_11 || (tx.in_stream_11 != 0); end
          12: begin sop = tx.in_sop_12; data = tx.in_stream_12; eop = tx.in_eop_12; valid_data = tx.in_sop_12 || tx.in_eop_12 || (tx.in_stream_12 != 0); end
          13: begin sop = tx.in_sop_13; data = tx.in_stream_13; eop = tx.in_eop_13; valid_data = tx.in_sop_13 || tx.in_eop_13 || (tx.in_stream_13 != 0); end
          14: begin sop = tx.in_sop_14; data = tx.in_stream_14; eop = tx.in_eop_14; valid_data = tx.in_sop_14 || tx.in_eop_14 || (tx.in_stream_14 != 0); end
          15: begin sop = tx.in_sop_15; data = tx.in_stream_15; eop = tx.in_eop_15; valid_data = tx.in_sop_15 || tx.in_eop_15 || (tx.in_stream_15 != 0); end
        endcase
        
        if (valid_data) begin
          // Update active inputs tracking
          active_inputs = {active_inputs, $sformatf(" %0d", i)};
          active_input_count++;
          
          // Update active grants tracking
          active_grants = {active_grants, $sformatf(" %0d", i)};
          active_grant_count++;
          
          // Determine which output port this input will be routed to
          // In this simple model, we'll route to output port (i % 4)
          out_port = i % 4;
          
          // Check for duplicate expected outputs before adding to queue
          is_duplicate = 0;
          
          for (j = 0; j < exp_out_data[out_port].size(); j++) begin
            if (exp_out_data[out_port][j] == data && 
                exp_out_sop[out_port][j] == sop && 
                exp_out_eop[out_port][j] == eop) begin
              is_duplicate = 1;
              break;
            end
          end
          
          if (!is_duplicate) begin
            // Add expected data to the correct output queue
            exp_out_data[out_port].push_back(data);
            exp_out_sop[out_port].push_back(sop);
            exp_out_eop[out_port].push_back(eop);
            
            `uvm_info(get_type_name(), $sformatf("Reference model: Input stream %0d with data 0x%0h routed to output port %0d", 
                     i, data, out_port), UVM_HIGH)
          end
        end
      end
    end
  endfunction
  
  // Check function to compare DUT outputs with expected outputs
  virtual function void check_outputs(ulss_tx tx);
    bit actual_sop, actual_eop;
    bit [63:0] actual_data;
    bit data_valid;
    int match_idx;
    bit is_duplicate;
    bit prev_sop, prev_eop;
    bit [63:0] prev_data;
    
    // Check each output port
    for (int i = 0; i < 4; i++) begin
      actual_sop = 0;
      actual_eop = 0;
      actual_data = 0;
      data_valid = 0;
      
      // Get actual output data based on port index
      case (i)
        0: begin 
          actual_sop = tx.out_sop_0; 
          actual_data = tx.out_stream_0; 
          actual_eop = tx.out_eop_0;
          data_valid = actual_sop || actual_eop || (actual_data != 0);
        end
        1: begin 
          actual_sop = tx.out_sop_1; 
          actual_data = tx.out_stream_1; 
          actual_eop = tx.out_eop_1;
          data_valid = actual_sop || actual_eop || (actual_data != 0);
        end
        2: begin 
          actual_sop = tx.out_sop_2; 
          actual_data = tx.out_stream_2; 
          actual_eop = tx.out_eop_2;
          data_valid = actual_sop || actual_eop || (actual_data != 0);
        end
        3: begin 
          actual_sop = tx.out_sop_3; 
          actual_data = tx.out_stream_3; 
          actual_eop = tx.out_eop_3;
          data_valid = actual_sop || actual_eop || (actual_data != 0);
        end
      endcase
      
      // Only process if this output has valid data and hasn't been processed yet
      if (data_valid && !output_processed[i]) begin
        output_processed[i] = 1;
        
        // Update active outputs tracking
        active_outputs = {active_outputs, $sformatf(" %0d", i)};
        active_output_count++;
        
        // Find a match in expected outputs
        match_idx = -1;
        
        for (int j = 0; j < exp_out_data[i].size(); j++) begin
          if (actual_data === exp_out_data[i][j] && 
              actual_sop === exp_out_sop[i][j] && 
              actual_eop === exp_out_eop[i][j]) begin
            match_idx = j;
            break;
          end
        end
        
        if (match_idx >= 0) begin
          // Found a match in expected outputs
          `uvm_info(get_type_name(), 
                   $sformatf("Output %0d MATCH - Expected: SOP=%0d, DATA=0x%0h, EOP=%0d, Actual: SOP=%0d, DATA=0x%0h, EOP=%0d", 
                   i, exp_out_sop[i][match_idx], exp_out_data[i][match_idx], exp_out_eop[i][match_idx], 
                   actual_sop, actual_data, actual_eop), UVM_MEDIUM)
          match_count++;
          
          // Remove the matched item from the expected queue
          exp_out_data[i].delete(match_idx);
          exp_out_sop[i].delete(match_idx);
          exp_out_eop[i].delete(match_idx);
        end else begin
          // No match found - check if this is a repeated packet
          is_duplicate = 0;
          
          foreach (dut_tx_queue[j]) begin
            // Skip the current transaction
            if (j == dut_tx_queue.size() - 1) continue;
            
            case (i)
              0: begin
                prev_sop = dut_tx_queue[j].out_sop_0;
                prev_data = dut_tx_queue[j].out_stream_0;
                prev_eop = dut_tx_queue[j].out_eop_0;
              end
              1: begin
                prev_sop = dut_tx_queue[j].out_sop_1;
                prev_data = dut_tx_queue[j].out_stream_1;
                prev_eop = dut_tx_queue[j].out_eop_1;
              end
              2: begin
                prev_sop = dut_tx_queue[j].out_sop_2;
                prev_data = dut_tx_queue[j].out_stream_2;
                prev_eop = dut_tx_queue[j].out_eop_2;
              end
              3: begin
                prev_sop = dut_tx_queue[j].out_sop_3;
                prev_data = dut_tx_queue[j].out_stream_3;
                prev_eop = dut_tx_queue[j].out_eop_3;
              end
            endcase
            
            // Check if this is a duplicate of a previously seen output
            if (prev_data === actual_data && prev_sop === actual_sop && prev_eop === actual_eop) begin
              is_duplicate = 1;
              break;
            end
          end
          
          if (!is_duplicate) begin
            `uvm_error(get_type_name(), 
                      $sformatf("Unexpected output on port %0d - SOP=%0d, DATA=0x%0h, EOP=%0d", 
                      i, actual_sop, actual_data, actual_eop))
            mismatch_count++;
          end
        end
      end
    end
  endfunction
  
  // Report phase
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    
    `uvm_info(get_type_name(), $sformatf("Scoreboard report - Match count: %0d, Mismatch count: %0d", 
             match_count, mismatch_count), UVM_LOW)
             
    // Check for any remaining expected outputs
    for (int i = 0; i < 4; i++) begin
      if (exp_out_data[i].size() > 0) begin
        `uvm_error(get_type_name(), 
                  $sformatf("End of test - %0d remaining expected outputs on port %0d not received", 
                  exp_out_data[i].size(), i))
      end
    end
    
    if (mismatch_count == 0 && match_count > 0) begin
      `uvm_info(get_type_name(), "TEST PASSED - All DUT outputs matched expected results", UVM_LOW)
    end else if (mismatch_count > 0) begin
      `uvm_error(get_type_name(), "TEST FAILED - DUT outputs did not match expected results")
    end else if (match_count == 0) begin
      `uvm_warning(get_type_name(), "No transactions were checked during the test")
    end
  endfunction
  
endclass
