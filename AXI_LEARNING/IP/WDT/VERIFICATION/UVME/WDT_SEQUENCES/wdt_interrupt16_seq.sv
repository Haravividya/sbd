class wdt_interrupt16_seq extends uvm_sequence#(wdt_seq_item);

  `uvm_object_utils(wdt_interrupt16_seq)

  wdt_seq_item wdt_item;
  rand logic [15:0] tmr = 0;
  int case_sel;

  function new(string name = "wdt");
    super.new(name);
  endfunction

  task body();

  case(case_sel)

//////////////////// TEST 57 /////////////////////

57:
  begin
  repeat(20)
   begin
   

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end  
  end

///////////////////////////////////////////////


//////////////////// TEST 58 /////////////////////

  58:
  begin
   begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h1111;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0000;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0011;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end  
  end

///////////////////////////////////////////////




//////////////////// TEST 59 /////////////////////
  59:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(25)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end  
  end


///////////////////////////////////////////////

//////////////////// TEST 60 /////////////////////
  60:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(25)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101000001;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end 
  end


///////////////////////////////////////////////


//////////////////// TEST 61 /////////////////////
  61:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101001101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101001101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101001101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 
  end


/////////////////////////////////////////////// 

//////////////////// TEST 62 /////////////////////
  62:
  begin
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101010101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101010101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 
  end


///////////////////////////////////////////////

//////////////////// TEST 63 /////////////////////
  63:
  begin
    
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 
  end


///////////////////////////////////////////////


//////////////////// TEST 64 /////////////////////
  64:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101011101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101011101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////

//////////////////// TEST 65 /////////////////////
  65:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////

//////////////////// TEST 66 /////////////////////
  66:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101110101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101110101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 
  end



///////////////////////////////////////////////

//////////////////// TEST 67 /////////////////////
  67:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////


//////////////////// TEST 68 /////////////////////
  68:
  begin

    tmr = ($urandom_range(16'h00F5,16'h00FF)); 
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 1; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end 

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101111101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end



///////////////////////////////////////////////

    
//////////////////// TEST 91 /////////////////////
/* 91:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h000C;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    
    repeat(20)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i ==1;})

    end
    
    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(5)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 1; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000101101101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end*/



///////////////////////////////////////////////

 default: `uvm_error("CASE",$sformatf("Incorrect case selected"))
  endcase







  endtask
endclass
