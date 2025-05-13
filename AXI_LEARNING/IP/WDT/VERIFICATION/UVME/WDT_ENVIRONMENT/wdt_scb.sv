class wdt_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(wdt_scoreboard)

  uvm_analysis_imp#(wdt_seq_item,wdt_scoreboard) analysis_imp_scb;

  wdt_seq_item wdt_item;

  logic flag;
  logic [15:0] count_check;
  logic [15:0] control_reg;
  logic [15:0] check_word;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    analysis_imp_scb = new("analysis_imp_scb",this);

  endfunction

  function void write(wdt_seq_item wdt_item);
    
  //  wdt_item.print();

    if(wdt_item.wdt_reg_addr == 0)
    begin
      control_reg = wdt_item.wdt_reg_data;
    end

    else if(wdt_item.wdt_reg_addr == 2)
    begin
      check_word =wdt_item.wdt_reg_data;

    end

	begin

	    case(control_reg)

	      16'b0000000100000000:                                          // WDT disabled 

		  begin
              `uvm_info("Counter",$sformatf("Counter Disbled"),UVM_LOW)
		  end

	      16'b0000000100000001:                                          // WDT disabled 

		  begin
              `uvm_info("Counter",$sformatf("Counter Disbled"),UVM_LOW)
		  end

	      16'b0000000100000010:                                          // WDT disabled 

		  begin
              `uvm_info("Counter",$sformatf("Counter Disbled"),UVM_LOW)
		  end
	  
	      16'b0000000100000111:                                          // WDT enabled decrement count locked state 
		  begin
            `uvm_info("Counter",$sformatf("COunter Value %d ",wdt_item.wdt_counter),UVM_LOW)

		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end

		  end

	      16'b0000000100000100:                                          // WDT enabled decrement count unprotected mode
		  begin
            `uvm_info("Counter",$sformatf("COunter Value %d ",wdt_item.wdt_counter),UVM_LOW)
           
		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end

		  end

	      16'b0000000100000110:                                          // WDT enabled decrement count protected mode
		  begin
           
		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end

		  end  

	      16'b0000000100000101:                                          // WDT enabled decrement count protected mode
		  begin
           
		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end

		  end  
		
		  16'b0000000100000011:                                          // WDT disabled Set counter to default 
		  /*begin
            if(wdt_item.wdt_counter == 16'hffff)*/
            begin
              `uvm_info("Counter",$sformatf("Counter Disbled"),UVM_LOW)
            end
          
           /* else
            begin
              `uvm_error("Counter",$sformatf("Counter disable failed"))
            end
		  end*/
        
          16'b000000010000101:                                          // WDT enabled decrement count 
		  begin
           
		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end

		  end 

          16'b0000000100001101:                                          // WDT enabled WAIT mode Hold count 101 
		  begin
            if(wdt_item.wait_mode_i == 1)
            begin
              `uvm_info("Wait Mode",$sformatf("Wait mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Wait Mode",$sformatf("Counter stopped in wait mode"),UVM_LOW)
            end
            else
              `uvm_info("Wait Mode",$sformatf("Counter decrementing in wait mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100001100:                                          // WDT enabled WAIT mode Hold count 100
		  begin
            if(wdt_item.wait_mode_i == 1)
            begin
              `uvm_info("Wait Mode",$sformatf("Wait mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Wait Mode",$sformatf("Counter stopped in wait mode"),UVM_LOW)
            end
            else
              `uvm_info("Wait Mode",$sformatf("Counter decrementing in wait mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100001000:                                          // WDT enabled WAIT mode Hold count 000
		  begin
            if(wdt_item.wait_mode_i == 1)
            begin
              `uvm_info("Wait Mode",$sformatf("Wait mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Wait Mode",$sformatf("Counter stopped in wait mode"),UVM_LOW)
            end
            else
              `uvm_info("Wait Mode",$sformatf("Counter decrementing in wait mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end


          16'b0000000100001111:                                          // WDT enabled WAIT mode Hold count 111 
		  begin
            if(wdt_item.wait_mode_i == 1)
            begin
              `uvm_info("Wait Mode",$sformatf("Wait mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Wait Mode",$sformatf("Counter stopped in wait mode"),UVM_LOW)
            end
            else
              `uvm_info("Wait Mode",$sformatf("Counter decrementing in wait mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100001110:                                          // WDT enabled WAIT mode Hold count 110
		  begin
            if(wdt_item.wait_mode_i == 1)
            begin
              `uvm_info("Wait Mode",$sformatf("Wait mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Wait Mode",$sformatf("Counter stopped in wait mode"),UVM_LOW)
            end
            else
              `uvm_info("Wait Mode",$sformatf("Counter decrementing in wait mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100010111:                                          // WDT enabled STOP mode Hold count 111
          begin
            if(wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Stop Mode",$sformatf("Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Mode",$sformatf("Counter stopped in stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Mode",$sformatf("Counter decrementing in stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end


          16'b0000000100010110:                                          // WDT enabled STOP mode Hold count 110
          begin
            if(wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Stop Mode",$sformatf("Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Mode",$sformatf("Counter stopped in stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Mode",$sformatf("Counter decrementing in stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end


          16'b0000000100010100:                                          // WDT enabled STOP mode Hold count 100
          begin
            if(wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Stop Mode",$sformatf("Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Mode",$sformatf("Counter stopped in stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Mode",$sformatf("Counter decrementing in stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end


          16'b0000000100010011:                                          // WDT enabled STOP mode Hold count 011
          begin
            if(wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Stop Mode",$sformatf("Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Mode",$sformatf("Counter stopped in stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Mode",$sformatf("Counter decrementing in stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end


          16'b0000000100010010:                                          // WDT enabled STOP mode Hold count 010
          begin
            if(wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Stop Mode",$sformatf("Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Mode",$sformatf("Counter stopped in stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Mode",$sformatf("Counter decrementing in stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end


          16'b0000000100010001:                                          // WDT enabled STOP mode Hold count 001
          begin
            if(wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Stop Mode",$sformatf("Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Mode",$sformatf("Counter stopped in stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Mode",$sformatf("Counter decrementing in stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end


          16'b0000000100010000:                                          // WDT enabled STOP mode Hold count 000
          begin
            if(wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Stop Mode",$sformatf("Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Mode",$sformatf("Counter stopped in stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Mode",$sformatf("Counter decrementing in stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end


          16'b0000000100010101:                                          // WDT enabled STOP mode Hold count 101
          begin
            if(wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Stop Mode",$sformatf("Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Mode",$sformatf("Counter stopped in stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Mode",$sformatf("Counter decrementing in stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100100111:                                          // WDT enabled DEBUG mode Hold count 111
          begin
            if(wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Debug Mode",$sformatf("Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Debug Mode",$sformatf("Counter stopped in debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Debug Mode",$sformatf("Counter decrementing in debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100100110:                                          // WDT enabled DEBUG mode Hold count 110
          begin
            if(wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Debug Mode",$sformatf("Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Debug Mode",$sformatf("Counter stopped in debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Debug Mode",$sformatf("Counter decrementing in debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100100100:                                          // WDT enabled DEBUG mode Hold count 100
          begin
            if(wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Debug Mode",$sformatf("Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Debug Mode",$sformatf("Counter stopped in debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Debug Mode",$sformatf("Counter decrementing in debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100100011:                                          // WDT enabled DEBUG mode Hold count 011
          begin
            if(wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Debug Mode",$sformatf("Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Debug Mode",$sformatf("Counter stopped in debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Debug Mode",$sformatf("Counter decrementing in debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100100010:                                          // WDT enabled DEBUG mode Hold count 010
          begin
            if(wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Debug Mode",$sformatf("Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Debug Mode",$sformatf("Counter stopped in debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Debug Mode",$sformatf("Counter decrementing in debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100100001:                                          // WDT enabled DEBUG mode Hold count 001
          begin
            if(wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Debug Mode",$sformatf("Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Debug Mode",$sformatf("Counter stopped in debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Debug Mode",$sformatf("Counter decrementing in debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100100000:                                          // WDT enabled DEBUG mode Hold count 000
          begin
            if(wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Debug Mode",$sformatf("Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Debug Mode",$sformatf("Counter stopped in debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Debug Mode",$sformatf("Counter decrementing in debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100100101:                                          // WDT enabled DEBUG mode Hold count 101

          begin
            if(wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Debug Mode",$sformatf("Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Debug Mode",$sformatf("Counter stopped in debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Debug Mode",$sformatf("Counter decrementing in debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end	

          16'b0000000100011101:                                          // WDT enabled STOP and WAIT  mode Hold count
          begin
            if(wdt_item.wait_mode_i == 1 || wdt_item.stop_mode_i == 1)
            begin
              `uvm_info("Wait and Stop Mode",$sformatf("Wait and Stop mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Wait and Stop Mode",$sformatf("Counter stopped in wait and stop mode"),UVM_LOW)
            end
            else
              `uvm_info("Wait and Stop Mode",$sformatf("Counter decrementing in wait and stop mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end	

          16'b0000000100101101:                                          // WDT enabled Debug and WAIT  mode Hold count
          begin
            if(wdt_item.wait_mode_i == 1 || wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Wait and Debug Mode",$sformatf("Wait and Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Wait and debug Mode",$sformatf("Counter stopped in wait and debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Wait and debug Mode",$sformatf("Counter decrementing in wait and debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end

          16'b0000000100110101:                                          // WDT enabled Debug and Stop  mode Hold count
          begin
            if(wdt_item.stop_mode_i == 1 || wdt_item.debug_mode_i == 1)
            begin
              `uvm_info("Stop and Debug Mode",$sformatf("Stop and Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop and debug Mode",$sformatf("Counter stopped in stop and debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop and debug Mode",$sformatf("Counter decrementing in stop and debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end	

          16'b0000000100111101:                                          // WDT enabled Wait Debug and Stop  mode Hold count
          begin
            if(wdt_item.stop_mode_i == 1 || wdt_item.debug_mode_i == 1 || wdt_item.wait_mode_i == 1)
            begin
              `uvm_info("Stop Wait and Debug Mode",$sformatf("Stop Wait and Debug mode enabled"),UVM_LOW)
              flag =1;
              count_check = wdt_item.wdt_counter;
            end
            if(flag == 1 && wdt_item.wdt_counter == count_check)
            begin
              `uvm_info("Stop Wait and debug Mode",$sformatf("Counter stopped in stop wait and debug mode"),UVM_LOW)
            end
            else
              `uvm_info("Stop Wait and debug Mode",$sformatf("Counter decrementing in stop wait and debug mode"),UVM_LOW)

              		    if(check_word == 16'h5555)
		    begin
		      flag =1;
               `uvm_info("Service Word",$sformatf("Service word 5555 recieved "),UVM_LOW)
		    end

		 
            if(check_word == 16'haaaa && flag == 1'b1)
			  begin
                `uvm_info("Service Word",$sformatf("Service words recieved "),UVM_LOW)
                `uvm_info("Counter",$sformatf("Counter reseted "),UVM_LOW)
			  end

            if(wdt_item.wdt_reset_o == 1)                                              // counter timeout
	        begin

              `uvm_info("Reset",$sformatf("Time out Resert asserted"),UVM_LOW)

            end
		  end		



          16'b0000000101000101:                                          // WDT enabled Interrupt 16 clocks before reset Decrement count
		  begin
		    if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o == 1)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 16 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end	 

          16'b0000000101001101:                                          // WDT enabled Interrupt 16 clocks before reset Decrement count wait mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 16 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  //error

		    end

		    else if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000101010101:                                          // WDT enabled Interrupt 16 clocks before reset Decrement count stop mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 16 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end

		    else if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000101100101:                                          // WDT enabled Interrupt 16 clocks before reset Decrement count debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o == 1 && wdt_item.debug_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 16 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW)  //error

		    end

		    else if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000101011101:                                          // WDT enabled Interrupt 16 clocks before reset Decrement count wait and stop mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0 && wdt_item.stop_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 16 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end


		    else if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000101101101:                                          // WDT enabled Interrupt 16 clocks before reset Decrement count wait and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0 && wdt_item.debug_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 16 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW)  //error

		    end


		    else if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end


          16'b0000000101110101:                                          // WDT enabled Interrupt 16 clocks before reset Decrement count stop and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0 && wdt_item.debug_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 16 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW)  //error

		    end


		    else if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000101111101:                                          // WDT enabled Interrupt 16 clocks before reset Decrement count wait, stop and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0 && wdt_item.debug_mode_i == 0 && wdt_item.wait_mode_i == 0  )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 16 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  //error

		    end


		    else if(wdt_item.wdt_counter <= 16'h000e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end



	
          16'b0000000110000101:                                          // WDT enabled Interrupt 32 clocks before reset Decrement count
		  begin
		    if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o == 1)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 32 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o != 1)
		    begin

              `uvm_error("Interrupt",$sformatf("Interrupt failed"))

		    end
		  end

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

          16'b0000000110001101:                                          // WDT enabled Interrupt 32 clocks before reset Decrement count wait mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 32 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  //error

		    end

		    else if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000110010101:                                          // WDT enabled Interrupt 32 clocks before reset Decrement count stop mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 32 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end

		    else if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000110100101:                                          // WDT enabled Interrupt 32 clocks before reset Decrement count debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o == 1 && wdt_item.debug_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 32 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW)  //error

		    end

		    else if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000110011101:                                          // WDT enabled Interrupt 32 clocks before reset Decrement count wait and stop mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0 && wdt_item.stop_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 32 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end


		    else if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000110101101:                                          // WDT enabled Interrupt 32 clocks before reset Decrement count wait and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0 && wdt_item.debug_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 32 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW) 

		    end


		    else if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end


          16'b0000000110110101:                                          // WDT enabled Interrupt 32 clocks before reset Decrement count stop and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0 && wdt_item.debug_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 32 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW)  //error

		    end


		    else if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000110111101:                                          // WDT enabled Interrupt 32 clocks before reset Decrement count wait, stop and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0 && wdt_item.debug_mode_i == 0 && wdt_item.wait_mode_i == 0  )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 32 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  //error

		    end


		    else if(wdt_item.wdt_counter <= 16'h001e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end


	
          
          16'b0000000111000101:                                          // WDT enabled Interrupt 64 clocks before reset Decrement count
		  begin
		    if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o == 1)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 64 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o != 1)
		    begin

              `uvm_error("Interrupt",$sformatf("Interrupt failed"))

		    end
		  end


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

          16'b0000000111001101:                                          // WDT enabled Interrupt 64 clocks before reset Decrement count wait mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 64 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  

		    end

		    else if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  

		    end
		  end

          16'b0000000111010101:                                          // WDT enabled Interrupt 64 clocks before reset Decrement count stop mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 64 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  

		    end

		    else if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  

		    end
		  end

          16'b0000000111100101:                                          // WDT enabled Interrupt 64 clocks before reset Decrement count debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o == 1 && wdt_item.debug_mode_i == 0)
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 64 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW) 
		    end

		    else if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  
		    end
		  end

          16'b0000000111011101:                                          // WDT enabled Interrupt 64 clocks before reset Decrement count wait and stop mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0 && wdt_item.stop_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 64 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  

		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)

		    end


		    else if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end

          16'b0000000111101101:                                          // WDT enabled Interrupt 64 clocks before reset Decrement count wait and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o == 1 && wdt_item.wait_mode_i == 0 && wdt_item.debug_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 64 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW) 

		    end


		    else if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  

		    end
		  end


          16'b0000000111110101:                                          // WDT enabled Interrupt 64 clocks before reset Decrement count stop and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0 && wdt_item.debug_mode_i == 0 )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 64 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW) 

		    end


		    else if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))

		    end
		  end

          16'b0000000111111101:                                          // WDT enabled Interrupt 64 clocks before reset Decrement count wait, stop and debug mode
		  begin
		    if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o == 1 && wdt_item.stop_mode_i == 0 && wdt_item.debug_mode_i == 0 && wdt_item.wait_mode_i == 0  )
		    begin

              `uvm_info("Interrupt",$sformatf("Interrupt set high 64 clocks before reset"),UVM_LOW)
		    
		    end
		    else if(wdt_item.stop_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in stop mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.debug_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in debug mode"),UVM_LOW)  //error

		    end
		    else if(wdt_item.wait_mode_i == 1 && wdt_item.wdt_interrupt_o == 1)
		    begin

            `uvm_info("Interrupt",$sformatf("Interrupt stopped in wait mode"),UVM_LOW)  //error

		    end


		    else if(wdt_item.wdt_counter <= 16'h003e && wdt_item.wdt_interrupt_o != 1)
		    begin

            `uvm_error("Interrupt",$sformatf("Interrupt failed"))  //error

		    end
		  end 

			
	    endcase
      end
    
	  
 // endtask
 endfunction

endclass



  
