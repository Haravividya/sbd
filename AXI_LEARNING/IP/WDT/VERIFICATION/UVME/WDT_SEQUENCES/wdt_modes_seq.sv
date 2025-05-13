class wdt_modes_seq extends uvm_sequence#(wdt_seq_item);

  `uvm_object_utils(wdt_modes_seq)

  wdt_seq_item wdt_item;
  rand logic [15:0] tmr = 0;
  int case_sel;

  function new(string name = "wdt");
    super.new(name);
  endfunction

  task body();
  
  case(case_sel)

//////////////////// TEST 50 /////////////////////
  50:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 
  end



///////////////////////////////////////////////

//////////////////// TEST 51 /////////////////////
  51:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////

//////////////////// TEST 52 /////////////////////
  52:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100110101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 
  end



///////////////////////////////////////////////

//////////////////// TEST 53 /////////////////////
  53:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end





///////////////////////////////////////////////

//////////////////// TEST 54 /////////////////////
  54:
  begin

   begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////

//////////////////// TEST 55 /////////////////////
  55:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100001101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100001101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100010101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 
  end



///////////////////////////////////////////////


//////////////////// TEST 56 /////////////////////
  56:
  begin

     tmr = ($urandom_range(16'h00F0,16'h00FF)); 


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end





///////////////////////////////////////////////

  default: `uvm_error("CASE",$sformatf("Incorrect case selected"))
  endcase


  endtask
endclass
