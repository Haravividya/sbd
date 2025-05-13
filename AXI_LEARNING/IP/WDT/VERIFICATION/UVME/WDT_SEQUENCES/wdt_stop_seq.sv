class wdt_stop_seq extends uvm_sequence#(wdt_seq_item);

  `uvm_object_utils(wdt_stop_seq)

  wdt_seq_item wdt_item;
  rand logic [15:0] tmr = 0;

  // logic [15:0] timer = 0;
  int case_sel;

  function new(string name = "wdt");
    super.new(name);
  endfunction

  task body();

  case(case_sel)


//////////////////// TEST 33 /////////////////////
  33:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end

///////////////////////////////////////////////



//////////////////// TEST 34 /////////////////////
  34:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end

///////////////////////////////////////////////



//////////////////// TEST 35 /////////////////////
  35:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end

///////////////////////////////////////////////

//////////////////// TEST 36 /////////////////////
  36:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end

///////////////////////////////////////////////

//////////////////// TEST 37 /////////////////////
  37:
  begin
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'haaaa;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h0000;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end


///////////////////////////////////////////////

//////////////////// TEST 38 /////////////////////
  38:
  begin
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'haaaa;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h0000;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end  
  end


///////////////////////////////////////////////

//////////////////// TEST 39 /////////////////////
  39:
  begin
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    repeat(5) 
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010100;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010000;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end


///////////////////////////////////////////////

//////////////////// TEST 40 /////////////////////
  40:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    
    repeat(5)
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    
    
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end


///////////////////////////////////////////////


//////////////////// TEST 41 /////////////////////
  41:
  begin

    tmr = ($urandom_range(16'h0020,16'h0050)); 
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'haaaa;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h0000;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end  
  end


///////////////////////////////////////////////


  default: `uvm_error("CASE",$sformatf("Incorrect case selected"))
  endcase
 
 


  endtask
endclass
