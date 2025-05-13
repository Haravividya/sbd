class wdt_debug_seq extends uvm_sequence#(wdt_seq_item);

  `uvm_object_utils(wdt_debug_seq)

  wdt_seq_item wdt_item;
  rand logic [15:0] tmr = 0;
  int case_sel;

  function new(string name = "wdt");
    super.new(name);
  endfunction

  task body();

  case(case_sel)

//////////////////// TEST 42 /////////////////////
42:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end
  end

///////////////////////////////////////////////

//////////////////// TEST 28 /////////////////////
 /* 28:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h0000;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end
  end*/

///////////////////////////////////////////////


//////////////////// TEST 28 /////////////////////
 /* 28:
  begin

     begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100000101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    begin


   begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end
  end*/

///////////////////////////////////////////////



//////////////////// TEST 43 /////////////////////
  43:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end

///////////////////////////////////////////////

//////////////////// TEST 44 /////////////////////
  44:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end 
  end

///////////////////////////////////////////////

//////////////////// TEST 45 /////////////////////
  45:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

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

//////////////////// TEST 46 /////////////////////
  46:
  begin
  
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

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

//////////////////// TEST 47 /////////////////////
  47:
  begin

    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    repeat(5) 
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100100;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end

    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100000;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end
  end


///////////////////////////////////////////////

//////////////////// TEST 48 /////////////////////
  48:
  begin
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == 16'h001e;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    


    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
     
    
    repeat(5)
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

    end
    
    
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end
  end


///////////////////////////////////////////////

//////////////////// TEST 49 /////////////////////
  49:
  begin

   tmr = ($urandom_range(16'h00F0,16'h00FA)); 
  
  
    begin

      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 2'b01; wdt_item.wdt_reg_data == tmr; wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})
    
    end
    

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 0;})

    end

    repeat(10)
    begin
      `uvm_do_with(wdt_item,{wdt_item.wdt_reg_addr == 0; wdt_item.wdt_reg_data == 16'b0000000100100101;wdt_item.stop_mode_i == 0; wdt_item.wait_mode_i == 0; wdt_item.debug_mode_i == 1;})

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
