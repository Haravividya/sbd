/**************************************************************************
Project name:ahb_master 
Description: This is the module which has the sequences of inputs and test scenarios
File name:ahb_master_sequence.sv
**************************************************************************/

//user defined class derived from base class 
class ahb_master_sequence_tb extends uvm_sequence#(ahb_master_seq_item_tb);

//factory registration
  `uvm_object_utils(ahb_master_sequence_tb)
  
//declaration of seq item instance 
  ahb_master_seq_item_tb seq_item_inst; 
  
//declaration of variables  
  int          scenario;
  bit        hrst_n_seq;
  bit [31:0]   addr_seq;
  bit [31:0]  wdata_seq;
  bit [31:0] hrdata_seq;
  bit        iwrite_seq;
  bit        hready_seq;
  bit         hresp_seq;
  bit [2:0]  iburst_seq;
  bit [2:0]   isize_seq; 
  bit [1:0]  itrans_seq;
  bit        busreq_seq;
  bit        hgrant_seq;
 
//constructor
  function new(string name="ahb_master_sequence_tb");
   super.new(name);
    seq_item_inst = ahb_master_seq_item_tb::type_id::create("seq_item_inst"); //creates the obj of seq_item using create() method
  endfunction
 
//using body() method 
  virtual task body();
    `uvm_info(get_name(),$sformatf("step 2 : inside sequence"),UVM_MEDIUM);

//checking for scenarios (test cases) which is run in test class
      
      //RESET IS ACTIVE
	  if(scenario == 1) begin //scenarios are called in test class
	    repeat(50) begin
        `uvm_info(get_name(),$sformatf("scenario 1"),UVM_MEDIUM);
         `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                      seq_item_inst.addr    == addr_seq  ;
                                      seq_item_inst.isize   == isize_seq ;
                                      seq_item_inst.wdata   == wdata_seq ;
                                      seq_item_inst.hrdata  == hrdata_seq;
                                      seq_item_inst.iwrite  == iwrite_seq;
                                      seq_item_inst.hready  == hready_seq;
                                      seq_item_inst.hresp   == hresp_seq ;
                                      seq_item_inst.iburst  == iburst_seq;
                                      seq_item_inst.itrans  == itrans_seq;    
                                      seq_item_inst.busreq  == busreq_seq;
                                      seq_item_inst.hgrant  == hgrant_seq;
  
                                     });  // the below -defined 6 steps will be executed.
/*	
	   //seq_item_inst = ahb_master_seq_item_tb::type_id::create("seq_item_inst");  //creates the obj of seq_item using create() method
		wait_for_grant();                  //wait for grant
		assert(seq_item_inst.randomize()); //randomize the seq_item_inst this will randomize data_in and step_size in seq_item                  
		send_request(seq_item_inst);       //send seq_item_inst to driver
		wait_for_item_done();             //wait for item done from driver
		get_response(seq_item_inst);     //optional and get the resopnse from dut 
	*/	
	       end
       end
          
      //RESET IS INACTIVE
      if(scenario == 2) begin
	    repeat(10) begin
        `uvm_info(get_name(),$sformatf("scenario 2"),UVM_MEDIUM);
          `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                      seq_item_inst.addr == addr_seq;
                                      });
          
	     end
	   end

       
       //WRITE MODE WITH RAND WDATA
       if(scenario == 4) begin 
        repeat(50) begin
        `uvm_info(get_name(),$sformatf("scenario 4"),UVM_MEDIUM);
          `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                      seq_item_inst.addr == addr_seq;
                                      seq_item_inst.iwrite == iwrite_seq;                                     
                                      });         
	      end
  	    end
	
	   

       //WRITE MODE WITH CONST WDATA
       if(scenario == 5)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 5"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                       seq_item_inst.wdata == wdata_seq;
                                       seq_item_inst.iwrite == iwrite_seq;                                     
                                     }); 
       	                                     
          end
	    end
 
       //READ MODE WITH RAND HRDATA
       if(scenario == 6) begin 
        repeat(50) begin
        `uvm_info(get_name(),$sformatf("scenario 6"),UVM_MEDIUM);
          `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                      seq_item_inst.addr == addr_seq;
                                      seq_item_inst.iwrite == iwrite_seq;                                     
                                      });         
	      end
  	    end
	
	   

       //READ MODE WITH CONST HRDATA
       if(scenario == 7)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 7"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                       seq_item_inst.hrdata == hrdata_seq;
                                       seq_item_inst.iwrite == iwrite_seq;                                     
                                     }); 
       	                                     
          end
	    end

       //ADDR RANDOM
       if(scenario == 8)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 8"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.busreq == busreq_seq;
                                       }); 
       	                                     
          end
	    end

       //ADDR CONST 
       if(scenario == 9)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 9"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                       seq_item_inst.busreq == busreq_seq;                                     
                                     }); 
       	                                     
          end
	    end

       //HGRANT CONST 
       if(scenario == 10)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 10"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                       seq_item_inst.hgrant == hgrant_seq;
                                     }); 
       	                                     
          end
	    end


        //HGRANT RAND
       if(scenario == 11)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 11"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                       seq_item_inst.hready == hready_seq;
                                     }); 
       	                                     
          end
	    end


     //HGRANT AND HREADY FOR READ/WRITE MODE
       if(scenario == 12)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 12"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                       seq_item_inst.hready == hready_seq;
                                       seq_item_inst.hgrant == hgrant_seq;
                                     }); 
       	                                     
          end
	    end

     //BUSREQ 
       if(scenario == 13)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 13"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.busreq == busreq_seq;
				                       seq_item_inst.addr == addr_seq;
                                     }); 
       	                                     
          end
	    end
     
     //BUSREQ RAND 
       if(scenario == 14)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 14"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;                                       
                                      }); 
       	                                     
          end
	    end


     //HREADY 
       if(scenario == 15)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 15"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.hready == hready_seq;
				                       seq_item_inst.addr == addr_seq;
                                     }); 
       	                                     
          end
	    end
     
     //HREADY RAND
       if(scenario == 16)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 16"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;                                       
                                      });

         end
	    end


     //HRESP
       if(scenario == 17)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 17"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                       seq_item_inst.hresp == hresp_seq;
                                     }); 
       	                                     
          end
	    end

     //HRESP RAND 
       if(scenario == 18)begin
         repeat (50) begin           
         `uvm_info(get_name(),$sformatf("scinario 18"),UVM_MEDIUM);
           `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                     }); 
       	                                     
          end
	    end

     //IBURST 
     if(scenario == 19) begin 
	 repeat(100) begin
        `uvm_info(get_name(),$sformatf("scenario 19"),UVM_MEDIUM);
         `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                       seq_item_inst.addr == addr_seq;
                                       seq_item_inst.iburst == iburst_seq;
                                       seq_item_inst.iwrite == iwrite_seq;
                                       seq_item_inst.hresp == hresp_seq;
                                     }); 

           end
	    end


        
    
     //IBURST RAND
     if(scenario == 20) begin 
	 repeat(50) begin
        `uvm_info(get_name(),$sformatf("scenario 20"),UVM_MEDIUM);
         `uvm_do_with(seq_item_inst,{seq_item_inst.hrst_n == hrst_n_seq;
                                     seq_item_inst.addr == addr_seq;
                                     seq_item_inst.iwrite == iwrite_seq;
                                     });
        end
	 end

    `uvm_info(get_name(),$sformatf("step 5 : inside sequence done"),UVM_MEDIUM)

  endtask

   
endclass



