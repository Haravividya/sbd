/*************************************************
File name:pmp_write_seq.sv
Description:

**************************************************/

class pmp_write_seq extends pmp_seq_tb;
   
  `uvm_object_utils(pmp_seq_tb)
 // pmp_seq_item_tb seq_item_inst; 
 /* int scenario; 
  bit  	csr_rst_seq;	
  bit  [31:0]    csr_write_data_seq;
  bit  [11:0]   csr_write_addr_seq;
  bit  csr_write_en_seq;
  bit  kernel_mode_signal_seq;
  bit machine_mode_valid_seq;
  bit [11:0] csr_read_addr_seq;
  bit csr_read_en_seq;*/

  function new(string name = "base_seq");
    super.new(name);
    //seq_item_inst = pmp_write_seq::type_id::create("seq_item_inst");
  endfunction
   
  virtual task body();
    `uvm_info(get_name(),$sformatf("step 2 : inside sequence"),UVM_MEDIUM)
	  
    	if(scenario == 5) begin
	  repeat(10) begin
       `uvm_do_with(seq_item_inst,
		             {seq_item_inst.csr_rst == csr_rst_seq;
                     seq_item_inst.csr_write_addr==csr_write_addr_seq;
                     seq_item_inst.machine_mode_valid == machine_mode_valid_seq;
                     seq_item_inst.csr_write_en== csr_write_en_seq;
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
                     seq_item_inst.csr_write_en== csr_write_en_seq;
                     
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
                                       }
		            );

    end
   end
	
    `uvm_info(get_name(),$sformatf("step 5 : inside sequence done"),UVM_MEDIUM)

  endtask
   
endclass





