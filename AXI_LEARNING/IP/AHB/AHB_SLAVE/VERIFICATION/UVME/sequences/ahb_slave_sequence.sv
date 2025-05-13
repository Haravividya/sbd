/**************************************************************************
Project name:ahb_slave 
Description: This is the module which has the sequences of inputs and test scenarios
File name:ahb_slave_sequence.sv
**************************************************************************/

//user defined class derived from base class 
class ahb_slave_sequence_tb extends uvm_sequence#(ahb_slave_seq_item_tb);

  //factory registration
  `uvm_object_utils(ahb_slave_sequence_tb)
  
  //declaration of seq item instance 
  ahb_slave_seq_item_tb seq_item_inst; 
  
  //declaration of variables  
  int            scenario ;
  bit        hreset_n_seq ;
  bit [31:0]    haddr_seq ;
  bit [31:0]   hwdata_seq ;
  bit          hwrite_seq ;
  bit          hready_seq ;
  bit            hsel_seq ;
  bit [2:0]    hburst_seq ;
    
   
  //constructor
  function new(string name="ahb_slave_sequence_tb");
    super.new(name);
    seq_item_inst = ahb_slave_seq_item_tb::type_id::create("seq_item_inst"); //creates the obj of seq_item using create() method
  endfunction
 
  //using body() method 
  virtual task body();
    `uvm_info(get_name(),$sformatf("step 2 : inside sequence"),UVM_MEDIUM);

    //checking for scenarios (test cases) which is run in test class
      
    //RESET IS ACTIVE
	if(scenario == 1) 
    begin //scenarios are called in test class
	  repeat(1)
      begin
        `uvm_info(get_name(),$sformatf("scenario 1"),UVM_MEDIUM);
        `uvm_do_with(seq_item_inst,{seq_item_inst.hreset_n == hreset_n_seq;
                                      seq_item_inst.haddr   == haddr_seq   ;
                                      seq_item_inst.hwdata  == hwdata_seq  ;
                                      seq_item_inst.hwrite  == hwrite_seq  ;
                                      seq_item_inst.hready  == hready_seq  ;
                                      seq_item_inst.hsel    == hsel_seq    ;
                                      seq_item_inst.hburst  == hburst_seq  ;                                       
                                     });  
        //the below -defined 6 steps will be executed.
	
	    //seq_item_inst = ahb_slave_seq_item_tb::type_id::create("seq_item_inst");  //creates the obj of seq_item using create() method
		/*wait_for_grant();                  //wait for grant
		assert(seq_item_inst.randomize()); //randomize the seq_item_inst this will randomize data_in and step_size in seq_item                  
		send_request(seq_item_inst);       //send seq_item_inst to driver
		wait_for_item_done();             //wait for item done from driver
		get_response(seq_item_inst); */    //optional and get the resopnse from dut 
		
	  end
    end
          
    //RESET IS INACTIVE
    if(scenario == 2) 
    begin          
	  repeat(1) 
      begin
        `uvm_info(get_name(),$sformatf("scenario 2"),UVM_MEDIUM);
        `uvm_do_with(seq_item_inst,{seq_item_inst.hreset_n == hreset_n_seq;
                                      seq_item_inst.haddr    == haddr_seq   ;
                                      seq_item_inst.hwrite   == hwrite_seq  ;
                                      seq_item_inst.hburst   == hburst_seq  ;
                                      seq_item_inst.hready   == hready_seq  ;
                                      seq_item_inst.hsel     == hsel_seq  ;
                                      });
          
	     
	  end
    end

    //RESET IS RANDOM
    if(scenario == 3) 
    begin          
	  repeat(1) 
      begin
        `uvm_info(get_name(),$sformatf("scenario 3"),UVM_MEDIUM);
        `uvm_do_with(seq_item_inst,{
                                      seq_item_inst.haddr    == haddr_seq   ;
                                      seq_item_inst.hwrite   == hwrite_seq  ;
                                      seq_item_inst.hburst   == hburst_seq  ;
                                      seq_item_inst.hready   == hready_seq  ;
                                      seq_item_inst.hsel     == hsel_seq    ;
                                      });
          
	     
	  end
    end

    //RANDOM HSEL
    if(scenario == 4) 
    begin          
	  repeat(1) 
        begin
          `uvm_info(get_name(),$sformatf("scenario 4"),UVM_MEDIUM);
          `uvm_do_with(seq_item_inst,{seq_item_inst.hreset_n == hreset_n_seq;
                                      seq_item_inst.haddr    == haddr_seq   ;
                                      seq_item_inst.hwrite   == hwrite_seq  ;
                                      seq_item_inst.hburst   == hburst_seq  ;
                                      seq_item_inst.hready   == hready_seq  ;
                                      });
          
	     
	   end
    end

    //RANDOM HREADY
    if(scenario == 5) 
    begin          
	  repeat(1) 
      begin
        `uvm_info(get_name(),$sformatf("scenario 5"),UVM_MEDIUM);
        `uvm_do_with(seq_item_inst,{seq_item_inst.hreset_n == hreset_n_seq;
                                      seq_item_inst.haddr    == haddr_seq   ;
                                      seq_item_inst.hwrite   == hwrite_seq  ;
                                      seq_item_inst.hburst   == hburst_seq  ;
                                      seq_item_inst.hsel     == hsel_seq    ;
                                      });
          
	     
	  end
    end

    //scenario 6 
   	if(scenario == 6)
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 7 "),UVM_MEDIUM)
	  repeat(5)
      begin
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      hreset_n == 1;hwrite ==1;hready ==1;hsel==1; hburst==3;haddr==05;
                     });
          finish_item(seq_item_inst);
        end
      end
      
      repeat(6)
      begin
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      hreset_n == 1;hwrite ==0;hready ==1; hsel ==1;hburst ==3;haddr==05;
          });
          finish_item(seq_item_inst);
        end
	  end
    end 

    // scenario 7
   	if(scenario == 7)
    begin
      `uvm_info(get_name(),$sformatf("\n step 2 : inside sequence scenario 7 "),UVM_MEDIUM)
	  repeat(9)
      begin
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      hreset_n == 1;hwrite ==1;hready ==1;hsel==1;haddr==10;hburst==4;
                     });
          //hburst_seq=seq_item_inst.hburst;
          finish_item(seq_item_inst);
        end
      end
      
      repeat(10)
      begin
        begin
          start_item(seq_item_inst);
          assert(seq_item_inst.randomize() with {
                      hreset_n == 1;hwrite ==0;hready ==1; hsel ==1;haddr==10;hburst==4;
                      //hburst==hburst_seq;
          });
          finish_item(seq_item_inst);
        end
	  end
    end   
   
    //scenario 8
    if(scenario == 8) begin          
	    repeat(20) begin
        `uvm_info(get_name(),$sformatf("scenario 4"),UVM_MEDIUM);
          `uvm_do_with(seq_item_inst,{seq_item_inst.hreset_n == hreset_n_seq;
                                      seq_item_inst.hwrite   == hwrite_seq  ;
                                      seq_item_inst.hready   == hready_seq  ;
                                      });
          
	     
	   end
      end

    //scenario 9
    if(scenario == 9) begin          
	    repeat(20) begin
        `uvm_info(get_name(),$sformatf("scenario 4"),UVM_MEDIUM);
          `uvm_do_with(seq_item_inst,{seq_item_inst.hreset_n == hreset_n_seq;
                                      seq_item_inst.hready   == hready_seq  ;
                                      });
          
	     
	   end
      end
  


    `uvm_info(get_name(),$sformatf("step 5 : inside sequence done"),UVM_MEDIUM)

  endtask

   
endclass



