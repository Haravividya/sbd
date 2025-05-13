class wdt_interrupt64_seq extends uvm_sequence#(wdt_seq_item);

  `uvm_object_utils(wdt_interrupt64_seq)

  wdt_seq_item wdt_item;
  rand logic [15:0] tmr = 0;
  int case_sel;

  function new(string name = "wdt");
    super.new(name);
  endfunction

  task body();

  case(case_sel)

//////////////////// TEST 80 /////////////////////
  80:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end

///////////////////////////////////////////////

//////////////////// TEST 81 /////////////////////
  81:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end  
  end


///////////////////////////////////////////////

//////////////////// TEST 82 /////////////////////
  82:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111000001;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end 
  end


///////////////////////////////////////////////


//////////////////// TEST 83 /////////////////////
  83:
  begin
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111001101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111001101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111001101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end  
  end


/////////////////////////////////////////////// 

//////////////////// TEST 84 /////////////////////
  84:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111010101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end


///////////////////////////////////////////////

//////////////////// TEST 85 /////////////////////
  85:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end


///////////////////////////////////////////////


//////////////////// TEST 86 /////////////////////
  86:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111011101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////

//////////////////// TEST 87 /////////////////////
  87:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////

//////////////////// TEST 88 /////////////////////
  88:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111110101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 
  end



///////////////////////////////////////////////

//////////////////// TEST 89 /////////////////////
  89:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111111101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end





///////////////////////////////////////////////


//////////////////// TEST 90 /////////////////////
  90:
  begin
    tmr = $urandom;
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0046;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000111011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////


  default: `uvm_error("CASE",$sformatf("Incorrect case selected"))
  endcase





  endtask
endclass
