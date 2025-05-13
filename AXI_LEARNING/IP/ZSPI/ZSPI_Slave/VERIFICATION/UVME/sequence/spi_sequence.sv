/*************************************************
Project:Spi_slave
Author: B Bhagavantu
File name:spi_sequence.sv
Description:This module contains various sequences to be sent for test
**************************************************/
//spi_seq is derived from uvm_sequence base class
class spi_seq extends uvm_sequence#(spi_seq_item);
  
  //factory registration
  `uvm_object_utils(spi_seq)  
  
  spi_seq_item seq_item_inst;   // seq_item handle

  //variables declaration for scenarios
  int       scenario   ;
  bit       reset_seq  ;
  bit       rx_e_seq,mosi_seq,load_seq,ss_seq;
  bit [7:0] data_in_seq;
  
  //constructor
  function new(string name = "spi_seq");
    super.new(name);
  endfunction
   
  //task body
  virtual task body();
    seq_item_inst = spi_seq_item::type_id::create("seq_item_inst"); //creating object
    
    //scenario 1 - initially reset = 0 and outputs are zero
	if(scenario == 1) 
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 1 "),UVM_MEDIUM)
	  repeat(5)
      begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.reset == reset_seq;});
      end
	end
   
    // scenario 2 reset= 1 and  all inputs are zero
    if(scenario == 2) 
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 2 "),UVM_MEDIUM)
	  repeat(2)
      begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.reset == reset_seq;
                      seq_item_inst.rx_e == rx_e_seq;
                      seq_item_inst.load == load_seq;
                      seq_item_inst.ss == ss_seq;
                      seq_item_inst.mosi == mosi_seq;
                      seq_item_inst.data_in == data_in_seq;
                                         });
      end
	end


    // scenario 3 reset =1 and other inputs are randomised
	if(scenario == 3) 
      begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 3 "),UVM_MEDIUM)
      repeat(10)
      begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.reset == reset_seq;
                     });
      end
	end 

    // scenario 4 ss low 
	if(scenario == 4) 
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 4 "),UVM_MEDIUM)
	  repeat(10)
      begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.reset == reset_seq;
                      seq_item_inst.ss == ss_seq;
                      });
      end
	end

    // scenario 5 constant data_in 
	if(scenario == 5) 
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 4 "),UVM_MEDIUM)
	  repeat(5)
      begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.reset == reset_seq;
                      seq_item_inst.data_in == data_in_seq;
                      });
      end
	end


    
    // scenario 6 each data_in load
   	if(scenario == 6)
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 7 "),UVM_MEDIUM)
	  repeat(20)
      begin
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      load==1;reset==1;ss==0;
                      });
          data_in_seq= seq_item_inst.data_in;
          finish_item(seq_item_inst);
        end
 
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      load==0; reset==1;ss==0;seq_item_inst.data_in==data_in_seq;
                      });
          finish_item(seq_item_inst);
        end
	  end
    end


    // scenario 7 alternate data in load
	if(scenario == 7)
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 6 "),UVM_MEDIUM)
	   repeat(20)
       begin
         begin
         start_item(seq_item_inst);
         assert(seq_item_inst.randomize() with {
                      load==1; reset==1;ss==0;
                      });
         finish_item(seq_item_inst);
         end

         begin
         start_item(seq_item_inst);
         assert(seq_item_inst.randomize() with {
                      load==0;reset==1;ss==0;
                      });
         finish_item(seq_item_inst);
         end
	  end
    end
    
        
    // scenario 8 for random reset for data_in
    if(scenario == 8)
    begin
       `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 8 "),UVM_MEDIUM)
	   repeat(20)
       begin
         begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      load==1;ss==0;
                      });
          data_in_seq= seq_item_inst.data_in;
          finish_item(seq_item_inst);
        end
 
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      load==0;seq_item_inst.data_in==data_in_seq;ss==0;
                      });
          finish_item(seq_item_inst);
        end
	  end
    end


    //scenario 9 transmission of data for random load signal
    if(scenario == 9) 
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 9 "),UVM_MEDIUM)
	  repeat(10)
      begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.reset == reset_seq;
                      seq_item_inst.rx_e == rx_e_seq;

                      });
      end
	end

    //scenario 10 transmission of  each data_in load
    if(scenario == 10)
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 10 "),UVM_MEDIUM)
	  repeat(20)
      begin
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      load==1;rx_e==1;ss==0;reset==1;
                      });
          data_in_seq= seq_item_inst.data_in;
          finish_item(seq_item_inst);
        end
 
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      load==0; seq_item_inst.data_in==data_in_seq; rx_e==1;ss==0;reset==1;
                      });
          finish_item(seq_item_inst);
        end
	  end
    end

    // scenario 11 alternate data in transmission 
	if(scenario == 11)
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 6 "),UVM_MEDIUM)
	   repeat(20)
       begin
         begin
         start_item(seq_item_inst);
         assert(seq_item_inst.randomize() with {
                      load==1; reset==1; rx_e==1;ss==0;
                      });
         finish_item(seq_item_inst);
         end

         begin
         start_item(seq_item_inst);
         assert(seq_item_inst.randomize() with {
                      load==0;reset==1;rx_e==1;ss==0;
                      });
         finish_item(seq_item_inst);
         end
	  end
    end
    
   
    //scenario 12 reception of data for random load signal
    if(scenario == 12) 
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 9 "),UVM_MEDIUM)
	  repeat(10)
      begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.reset == reset_seq;
                      seq_item_inst.rx_e == rx_e_seq;
                      seq_item_inst.ss == ss_seq;

                      });
      end
	end

    //scenario 13 reception of each data_in load
    if(scenario == 13)
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 10 "),UVM_MEDIUM)
	  repeat(20)
      begin
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      load==1;rx_e==0;ss==0;reset==1;
                      });
          data_in_seq= seq_item_inst.data_in;
          finish_item(seq_item_inst);
        end
 
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      load==0; seq_item_inst.data_in==data_in_seq; rx_e==0;ss==0;reset==1;
                      });
          finish_item(seq_item_inst);
        end
	  end
    end

    // scenario 14 reception of alternate data
	if(scenario == 14)
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 6 "),UVM_MEDIUM)
	   repeat(20)
       begin
         begin
         start_item(seq_item_inst);
         assert(seq_item_inst.randomize() with {
                      load==1; reset==1; rx_e==0;ss==0;
                      });
         finish_item(seq_item_inst);
         end

         begin
         start_item(seq_item_inst);
         assert(seq_item_inst.randomize() with {
                      load==0;reset==1;rx_e==0;ss==0;
                      });
         finish_item(seq_item_inst);
         end
	  end
    end

    // scenario 15 random data means all inputs are randomised
	if(scenario == 15) 
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 5 "),UVM_MEDIUM)
	  repeat(20)
      begin
        `uvm_do(seq_item_inst);
      end
	end

    `uvm_info(get_name(),$sformatf("step 5 : inside sequence done"),UVM_MEDIUM)

  endtask
   
endclass
