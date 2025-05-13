/*************************************************
File name:pmp_seq_tb.sv
Description:

**************************************************/

class pmp_seq_tb extends uvm_sequence#(pmp_seq_item_tb);
   
  `uvm_object_utils(pmp_seq_tb)
  pmp_seq_item_tb seq_item_inst; 
  int scenario; 
  bit  	csr_rst_seq;	
  bit  [31:0]    csr_write_data_seq;
  bit  [11:0]   csr_write_addr_seq;
  bit  csr_write_en_seq;
  bit  kernel_mode_signal_seq;
  bit machine_mode_valid_seq;
  bit [11:0] csr_read_addr_seq;
  bit csr_read_en_seq;
  bit pmp_en_seq;
  bit [31:0] memory_access_write_address_seq;
  bit [31:0] memory_access_read_address_seq;
  bit memory_access_write_en_seq;
  bit memory_access_read_en_seq;


  function new(string name = "base_seq");
    super.new(name);
    seq_item_inst = pmp_seq_item_tb::type_id::create("seq_item_inst");
  endfunction
   
  virtual task body();
    `uvm_info(get_name(),$sformatf("step 2 : inside sequence"),UVM_MEDIUM)

	if(scenario == 1) begin
	  repeat(30) begin
        `uvm_do(seq_item_inst
);
        // the below -defined 6 steps will be executed		
	/*	req = mem_seq_item::type_id::create("req");  //create the req (seq item)
		wait_for_grant();                            //wait for grant
		assert(req.randomize());                     //randomize the req                   
		send_request(req);                           //send req to driver
		wait_for_item_done();                        //wait for item done from driver
		get_response(rsp);     
		*/
	  end
	end

	if(scenario == 2) begin
	  repeat(20) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_data==csr_write_data_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_en==csr_read_en_seq;
                     seq_item_inst.kernel_mode_signal== kernel_mode_signal_seq;
                     seq_item_inst.pmp_en == pmp_en_seq;
                     seq_item_inst.memory_access_write_address==memory_access_write_address_seq;
                     seq_item_inst.memory_access_read_address==memory_access_read_address_seq;
                     seq_item_inst.memory_access_write_en==memory_access_write_en_seq;
                     }
		            );
	  end
	end
	
	if(scenario == 3) begin
	  repeat(10) begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                      seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.kernel_mode_signal== kernel_mode_signal_seq;
                     seq_item_inst.pmp_en == pmp_en_seq;
                      }
		            );
	  end
	end
    	if(scenario == 4) begin
	  repeat(10) begin
        `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     
                      }
		            );
	  end
	end 
   // write test case 
    	if(scenario == 5) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      seq_item_inst.csr_write_data ==csr_write_data_seq;

                                          }
		            );
	  end
	end
	
	if(scenario == 6) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                    seq_item_inst.csr_write_en== csr_write_en_seq;
                    seq_item_inst.csr_read_addr==csr_read_addr_seq;
                    seq_item_inst.csr_write_data ==csr_write_data_seq;


 
                                        }
		            );
	  end
	end
	
	if(scenario == 7) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;


                                       }
		            );
       end
      end
       	if(scenario == 8) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                       seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                   }
		            );
	  end
	end
	
	if(scenario == 9) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                         seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

               }
		            );
	  end
	end
	
	if(scenario == 10) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;


                                       }
		            );

	  end
	end
	
	if(scenario == 11) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                     }
		            );
	  end
	end
	
	if(scenario == 12) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;


                                        }
		            );
	  end
	end
	
	if(scenario == 13) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                       seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                }
		            );
       end
      end

	if(scenario == 14) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                     }
		            );
	  end
	end
	
	if(scenario == 15) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                   }
		            );
	  end
	end
	
	if(scenario == 16) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                  }
		            );
       end
      end
	if(scenario == 17) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                   }
		            );
	  end
	end
	
	if(scenario == 18) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                  }
		            );
       end
      end
	if(scenario == 19) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;


                                   } );
	  end
	end
	
	if(scenario == 20) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                  } );
	  end
	end
	
	if(scenario == 21) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;


                                       }
		            );

    end
   end

   
   if(scenario == 22) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                                          }
		            );
	  end
	end
	
	if(scenario == 23) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;


                                        }
		            );
	  end
	end
	
	if(scenario == 24) begin
	  repeat(5) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;



                                       }
		            );
       end
      end
       	if(scenario == 25) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                      seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;


                                          }
		            );
	  end
	end
	
	if(scenario == 26) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;



                                        }
		            );
	  end
	end
	// read
	if(scenario == 27) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;



                                       }
		            );

	  end
	end
	
	if(scenario == 28) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                     }
		            );
	  end
	end
	
	if(scenario == 29) begin
	  repeat(5) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
          }
		            );
	  end
	end
	
	if(scenario == 30) begin
	  repeat(5) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;

                                       }
		            );
       end
      end
	if(scenario == 31) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;

                                          }
		            );
	  end
	end
	
	if(scenario == 32) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;        }
		            );
	  end
	end
	
	if(scenario == 33) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq; }
		            );
       end
      end
	if(scenario == 34) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq; }
		            );
	  end
	end
	
	if(scenario == 35) begin
	  repeat(5) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;

                                       }
		            );
       end
      end
	if(scenario == 36) begin
	  repeat(5) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;

                                   } );
	  end
	end
	
	if(scenario == 37) begin
	  repeat(5) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;

                                        } );
	  end
	end
	
	if(scenario == 38) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;  }
		            );

    end
   end
 
if(scenario == 39) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
 
                                        }
		            );
	  end
	end
	
	if(scenario == 40) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                                       }
		            );
       end
      end
       	if(scenario == 41) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                   }
		            );
	  end
	end
	
	if(scenario == 42) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
               }
		            );
	  end
	end
	
	if(scenario == 43) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;

                                       }
		            );

	  end
	end
	
	if(scenario == 44) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end
	
	if(scenario == 45) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                                        }
		            );
	  end
	end
	
	if(scenario == 46) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                }
		            );
       end
      end
	if(scenario == 47) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end

    	if(scenario == 48) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end
	if(scenario == 49) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end

    if(scenario == 50) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end
   if(scenario == 51) begin

	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end

     if(scenario == 52) begin

	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end

 if(scenario == 53) begin

	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end

 if(scenario == 54) begin

	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end

     if(scenario == 55) begin

	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     }
		            );
	  end
	end

 if(scenario == 56) begin

	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.kernel_mode_signal==kernel_mode_signal_seq;
                     } );
	  end
	end


	if(scenario == 58) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                                          }
		            );
	  end
	end
	
	if(scenario == 59) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                    seq_item_inst.csr_write_en== csr_write_en_seq;
                    seq_item_inst.csr_read_addr==csr_read_addr_seq;
                    seq_item_inst.csr_write_data ==csr_write_data_seq;

 
                                        }
		            );
	  end
	end
	
	if(scenario == 60) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;

                                       }
		            );
       end
      end
       	if(scenario == 61) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                       seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

                   }
		            );
	  end
	end
	
	if(scenario == 62) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                         seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_data ==csr_write_data_seq;

               }
		            );
	  end
	end
	
	if(scenario == 63) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;

                                       }
		            );

	  end
	end
	
	if(scenario == 64) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     }
		            );
	  end
	end
	
	if(scenario == 65) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;

                                        }
		            );
	  end
	end
	
	if(scenario == 66) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                       seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                }
		            );
       end
      end
	if(scenario == 67) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     }
		            );
	  end
	end
	
	if(scenario == 68) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                   }
		            );
	  end
	end
	
	if(scenario == 69) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                  }
		            );
       end
      end

	if(scenario == 70) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                   }
		            );
	  end
	end
	
	if(scenario == 71) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                  }
		            );
       end
      end

	if(scenario == 72) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;

                                   } );
	  end
	end
	
	if(scenario == 73) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                  } );
	  end
	end
	
	if(scenario == 74) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                          }
		            );

    end
   end

   
   if(scenario == 75) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                                          }
		            );
	  end
	end
	
	if(scenario == 76) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                      }
		            );
	  end
	end
	
	if(scenario == 77) begin
	  repeat(5) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_read_addr==csr_read_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_read_en== csr_read_en_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.csr_write_en==csr_write_en_seq;
                      }
		            );
       end
      end
       	
   if(scenario == 78) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-1:Reset Condition;"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

	  // Scenario-2:Reset Condition;
      //// When csr_rst = 1 and all other inputs are Zero. 
      if(scenario == 79) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-2:Reset Condition;"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 
  	  
	  // Scenario-3:Disable Write;
      //// csr_rst = 1; csr_write_en = 0 and all other inputs are randomized. 
      if(scenario == 80) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-3:Disable Write;"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;}
          );		
        end 
      end 

	  // Scenario-4:Disable Read;
      //// csr_rst = 1; csr_read_en = 0 and all other inputs are randomized. 
      if(scenario == 81) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-4:Disable Read;"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;}
          );		
        end 
      end 

	  // Scenario-5:Disable Read & Write;
      //// csr_rst = 1; csr_write_en = 0, csr_read_en = 0,random inputs. 
      if(scenario == 82) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-5:Disable Read & Write;"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          }
          );		
        end 
      end 
      
      // Scenario-6:Write operation:TOR 
      // csr_rst = 1; csr_write_en = 1, csr_read_en = random, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = random, csr_write_addr = Valid, csr_write_data = for TOR.
      if(scenario == 83) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-6:Write operation:TOR"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

      // Scenario-7:Write operation:NA4
      // csr_rst = 1; csr_write_en = 1, csr_read_en = random, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = random, csr_write_addr = Valid, csr_write_data = for NA4.
      if(scenario == 84) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-7:Write operation:NA4"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

      // Scenario-8:Write operation:NAPOT
      // csr_rst = 1; csr_write_en = 1, csr_read_en = random, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = random, csr_write_addr = Valid, csr_write_data = for NAPOT.
      if(scenario == 85) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-8:Write operation:NAPOT"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

      // Scenario-9:Write:Complete Address Matching
      // csr_rst = 1; csr_write_en = 1, csr_read_en = random, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = random, csr_write_addr = Valid, csr_write_data = Complete Address Matching.
      if(scenario == 86) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-9:Write:Complete Address Matching"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

	  // Scenario-10:Read Operation:TOR
      // csr_rst = 1; csr_write_en = random, csr_read_en = 1, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = Valid, csr_write_addr = Valid, csr_write_data = for TOR.
      if(scenario == 87) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-10:Read Operation:TOR"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

	  // Scenario-11:Read Operation:NA4
      // csr_rst = 1; csr_write_en = random, csr_read_en = 1, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = Valid, csr_write_addr = Valid, csr_write_data = for NA4.
      if(scenario == 88) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-11:Read Operation:NA4"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 
	  // Scenario-12:Read Operation:NAPOT
      // csr_rst = 1; csr_write_en = random, csr_read_en = 1, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = Valid, csr_write_addr = Valid, csr_write_data = for NAPOT.
      if(scenario == 89) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-12:Read Operation:NAPOT"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 
	  // Scenario-13:Read Operation:Complete Address Matching
      // csr_rst = 1; csr_write_en = random, csr_read_en = 1, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = Valid, csr_write_addr = Valid, csr_write_data = Complete Address Matching.
      if(scenario == 90) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-13:Read:Complete Address Matching"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

	  // Scenario-14:Write-Read:TOR
      // csr_rst = 1 ; csr_write_en = 1, csr_read_en = 1, machine_mode_signl=1, kernel mode signal=0. 
      // csr_read_addr = Valid, csr_write_addr = Valid, csr_write_data = TOR
      if(scenario == 91) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-14:Write-Read:TOR"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 
	  // Scenario-15:Write-Read:NA4
      // csr_rst = 1 ; csr_write_en = 1, csr_read_en = 1, machine_mode_signl=1, kernel mode signal=0. 
      // csr_read_addr = Valid, csr_write_addr = Valid, csr_write_data = NA4
      if(scenario == 92) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-15:Write-Read:NA4"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 
	  // Scenario-16:Write-Read:NAPOT
      // csr_rst = 1 ; csr_write_en = 1, csr_read_en = 1, machine_mode_signl=1, kernel mode signal=0. 
      // csr_read_addr = Valid, csr_write_addr = Valid, csr_write_data = NAPOT
      if(scenario == 93) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 
	  // Scenario-17:Write-Read:Cpmplete Address Matching
      // csr_rst = 1 ; csr_write_en = 1, csr_read_en = 1, machine_mode_signl=1, kernel mode signal=0. 
      // csr_read_addr = Valid, csr_write_addr = Valid, csr_write_data = Cpmplete Address Matching
      if(scenario == 94) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-17:Write-Read:TOR"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.pmp_en == pmp_en_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

	  // Scenario-18:pmpcfg exception
      // csr_rst = 1 ; csr_read_en = random, csr_write_en=1, machine_mode_signl=random, kernel mode signal=1,
      // random csr_read_addr, pmpcfg csr_write_addr, random csr_write_data.
      if(scenario == 95) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-18:pmpcfg exception"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          }
          );		
        end 
      end 
	  // Scenario-19:pmpaddr exception
      // csr_rst = 1 ; csr_read_en = random, csr_write_en=1, machine_mode_signl=random, kernel mode signal=1,
      // random csr_read_addr, pmpaddr csr_write_addr, random csr_write_data.
      if(scenario == 96) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-19:pmpaddr exception"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          }
          );		
        end 
      end 
	  // Scenario-20:region range exception
      // csr_rst = 1; csr_write_en = 1, csr_read_en = random, machine_mode_signl=1, kernel_mode_signal=0,
      // csr_read_addr = random, csr_write_addr = Valid, csr_write_data = for TOR.
      if(scenario == 97) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-20:Scenario-18:region range exception"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

 	  // Scenario 21: Random Condition.
      //// csr_rst = 1 and all other inputs are random. 
      if(scenario == 98) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step 2 : scenario-21"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;}
          );		
        end 
      end 
 	  // Scenario 22: Random Condition.
      //// all the inputs are random. 
      if(scenario == 99) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step 2 : scenario-22"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do(seq_item_inst);
        end 
      end 
    if(scenario == 100) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(5) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end
       if(scenario == 101) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

       if(scenario == 102) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(5) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.pmp_en == pmp_en_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end
       if(scenario == 103) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          seq_item_inst.pmp_en == pmp_en_seq;

          }
          );		
        end 
      end  if(scenario == 104) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(5) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.pmp_en == pmp_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end
       if(scenario == 105) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 


       if(scenario == 106) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(10) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 
 if(scenario == 107) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(10) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 
 if(scenario == 108) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(10) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end

       if(scenario == 109) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(10) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          }
          );		
        end 
      end 

       if(scenario == 110) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(1) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_write_data == csr_write_data_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.pmp_en == pmp_en_seq;
          seq_item_inst.memory_access_write_en == memory_access_write_en_seq; 
          seq_item_inst.memory_access_read_en == memory_access_read_en_seq; 
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
           seq_item_inst.memory_access_write_address == memory_access_write_address_seq; 
          seq_item_inst.memory_access_read_address == memory_access_read_address_seq;
          }
          );		
        end 
      end 
    
      if(scenario == 111) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(10) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          seq_item_inst.pmp_en == pmp_en_seq;
          seq_item_inst.memory_access_write_en == memory_access_write_en_seq; 
          seq_item_inst.memory_access_read_en == memory_access_read_en_seq; 
          seq_item_inst.memory_access_write_address == memory_access_write_address_seq; 
          seq_item_inst.memory_access_read_address == memory_access_read_address_seq;
          }
          );		
        end 
      end 

       if(scenario == 112) 
	  begin 
	  //getting seq_item
	    `uvm_info(get_name(),$sformatf("step-2: Scenario-16:Write-Read:NAPOT"),UVM_MEDIUM)
        repeat(10) 
	    begin 
	      //Communication between the Sequence and driver with defined constraints.	  
	      `uvm_do_with(seq_item_inst, 
		  {seq_item_inst.csr_rst == csr_rst_seq;
          seq_item_inst.csr_write_en == csr_write_en_seq;
          seq_item_inst.csr_write_addr == csr_write_addr_seq;
          seq_item_inst.csr_read_en == csr_read_en_seq;
          seq_item_inst.csr_read_addr == csr_read_addr_seq;
          seq_item_inst.kernel_mode_signal == kernel_mode_signal_seq;
          seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
          seq_item_inst.pmp_en == pmp_en_seq;
          seq_item_inst.memory_access_write_en == memory_access_write_en_seq; 
          seq_item_inst.memory_access_read_en == memory_access_read_en_seq; 
          seq_item_inst.memory_access_write_address == memory_access_write_address_seq; 
          seq_item_inst.memory_access_read_address == memory_access_read_address_seq;
          }
          );		
        end 
      end 






 `uvm_info(get_name(),$sformatf("step 5 : inside sequence done"),UVM_MEDIUM)

  endtask
   
endclass




