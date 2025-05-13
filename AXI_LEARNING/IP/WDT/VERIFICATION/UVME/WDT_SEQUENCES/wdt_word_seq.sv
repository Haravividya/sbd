class wdt_word_seq extends uvm_sequence#(wdt_seq_item);

  `uvm_object_utils(wdt_word_seq)

  wdt_seq_item wdt_item;
  logic [15:0] tmr = 0;
  int case_sel;

  function new(string name = "wdt");
    super.new(name);
  endfunction

  task body();

  case(case_sel)


//////////////////// TEST 18 /////////////////////
/* 18:
  begin


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2; wdt_item.wdt_reg_data == 16'haaaa;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end*/
    
///////////////////////////////////////////////

//////////////////// TEST 9 /////////////////////
  18:
  begin


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b00; wdt_item.wdt_reg_data ==16'b0000000100000100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end



    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2; wdt_item.wdt_reg_data == 16'haaaa;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

     

  end
    
///////////////////////////////////////////////




//////////////////// TEST 19 /////////////////////
  19:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end

 
///////////////////////////////////////////////

//////////////////// TEST 20 /////////////////////
  20:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
    
        begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

        begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h0000;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'haaaa;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end
 
/////////////////////////////////////////////// 

//////////////////// TEST 21 /////////////////////
  21:
  begin
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
   
   repeat(3)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000000;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'haaaa;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end
 
///////////////////////////////////////////////


//////////////////// TEST 22 /////////////////////
  22:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000111;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

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


//////////////////// TEST 23 /////////////////////
  23:
  begin


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b10; wdt_item.wdt_reg_data == 16'h5555;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end


    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2; wdt_item.wdt_reg_data == 16'haaaa;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end
    
///////////////////////////////////////////////



  default: `uvm_error("CASE",$sformatf("Incorrect case selected"))
  endcase

 
 
 endtask
endclass
