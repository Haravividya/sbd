class csr_driver extends uvm_driver #(csr_seqitem);
//virtual interface handle
	virtual csr_intf csr_vif;
	csr_seqitem seq_item;

//factory registration
	`uvm_component_utils(csr_driver)
	
//constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
    endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	if(!uvm_config_db#(virtual csr_intf)::get(this,"","intf",csr_vif))	
		`uvm_error("driver","No resource found")
	endfunction
	
	task run_phase(uvm_phase phase);
	
		wait(csr_vif.csr_rst==0); //////in reset mode//////
				csr_vif.csr_write_en_in			            =	0;
				csr_vif.csr_write_data_in		        	=	0;
				csr_vif.csr_addr_in  			        	=	0;
				csr_vif.csr_read_en_in   		        	=	0;
				csr_vif.csr_set_bit_in 			         	=	0;
				csr_vif.csr_clear_bit_in			        =	0;
				csr_vif.interrupt_valid_in			        =	0;
				csr_vif.mie_set					            =	0;
				csr_vif.mie_clear                           =   0;
				csr_vif.interrupt_code_in			        =	0;
				csr_vif.exception_valid_in		        	=	0;
				csr_vif.exception_code_in		        	=	0;
				csr_vif.ld_sd_misalign_valid_in	        	=	0;
				csr_vif.ld_sd_misalign_addr_in	        	=	0;
				csr_vif.instr_misalign_valid_in	        	=	0;
				csr_vif.instr_misalign_addr_in	        	=	0;
				csr_vif.invalid_instr_valid_in          	=	0;
				csr_vif.invalid_instruction_in		        =	0;
				csr_vif.pc_in					        	=	0;
                csr_vif.csr_mepc_in                         =   0;
                csr_vif.csr_mepc_write_valid                =   0;
                csr_vif.interrupt_lvl_pr_i                  =   0; 
                csr_vif.exception_id_write_valid_i          =   0;
                csr_vif.interrupt_id_write_valid_i          =   0;
			    csr_vif.mret_valid_i                        =   0;
		wait(csr_vif.csr_rst==1);		///out of reset mode ****active low reset*****///
			forever
			begin
			@(posedge csr_vif.csr_clk);
			begin
			seq_item_port.get_next_item(seq_item);

            if(csr_vif.csr_rst==1)
					begin
                   
							csr_vif.csr_write_en_in			            =	seq_item.csr_write_en_in;
							csr_vif.csr_write_data_in		        	=	seq_item.csr_write_data_in;
							csr_vif.csr_read_en_in			            =   seq_item.csr_read_en_in;
							csr_vif.csr_addr_in                         =   seq_item.csr_addr_in;
							csr_vif.csr_set_bit_in 			        	=	seq_item.csr_set_bit_in;
							csr_vif.csr_clear_bit_in		        	=	seq_item.csr_clear_bit_in;
							csr_vif.interrupt_valid_in		        	=	seq_item.interrupt_valid_in;
							csr_vif.mie_set                             =   seq_item.mie_set;
							csr_vif.mie_clear                           =   seq_item.mie_clear;
							csr_vif.interrupt_code_in		        	=	seq_item.interrupt_code_in;
							csr_vif.exception_valid_in		        	=	seq_item.exception_valid_in;
							csr_vif.exception_code_in		        	=	seq_item.exception_code_in;
							csr_vif.ld_sd_misalign_valid_in	        	=	seq_item.ld_sd_misalign_valid_in;
							csr_vif.ld_sd_misalign_addr_in	        	=	seq_item.ld_sd_misalign_addr_in;
							csr_vif.instr_misalign_valid_in	        	=	seq_item.instr_misalign_valid_in;
							csr_vif.instr_misalign_addr_in	        	=	seq_item.instr_misalign_addr_in;
							csr_vif.invalid_instr_valid_in          	=	seq_item.invalid_instr_valid_in;
							csr_vif.invalid_instruction_in		        =	seq_item.invalid_instruction_in;
							csr_vif.pc_in					        	=	seq_item.pc_in;
                            csr_vif.csr_mepc_in                         =   seq_item.csr_mepc_in;
                            csr_vif.csr_mepc_write_valid                =   seq_item.csr_mepc_write_valid;
                            csr_vif.interrupt_lvl_pr_i                  =   seq_item.interrupt_lvl_pr_i; 
							csr_vif.exception_id_write_valid_i          =   seq_item.exception_id_write_valid_i;
				            csr_vif.interrupt_id_write_valid_i          =   seq_item.interrupt_id_write_valid_i; 
                            csr_vif.mret_valid_i                        =   seq_item.mret_valid_i;
                    end
		     
				else /////////reset condition////////////
					begin
					
					     csr_vif.csr_write_en_in			          =	  0;
						 csr_vif.csr_write_data_in			          =   0;
						 csr_vif.csr_addr_in  			      	      =   0;
						 csr_vif.csr_read_en_in   			          =	  0;
						 csr_vif.csr_set_bit_in 				      =	  0;
					 	 csr_vif.csr_clear_bit_in			          =	  0;
						 csr_vif.interrupt_valid_in			          =	  0;
						 csr_vif.mie_set                              =   0;
						 csr_vif.mie_clear                            =   0;
						 csr_vif.interrupt_code_in		     	      =	  0;
						 csr_vif.exception_valid_in		              =	  0;
					     csr_vif.exception_code_in		           	  =	  0;
						 csr_vif.ld_sd_misalign_valid_in		      =	  0;
						 csr_vif.ld_sd_misalign_addr_in	              =	  0;
						 csr_vif.instr_misalign_valid_in		      =	  0;
						 csr_vif.instr_misalign_addr_in		          =	  0;
						 csr_vif.invalid_instr_valid_in  	          =	  0;
						 csr_vif.invalid_instruction_in	        	  =   0;
					     csr_vif.pc_in					              =	  0;
                         csr_vif.csr_mepc_in                          =   0;
                         csr_vif.csr_mepc_write_valid                 =   0;
                         csr_vif.interrupt_lvl_pr_i                   =   0; 
                         csr_vif.exception_id_write_valid_i           =   0;
                         csr_vif.interrupt_id_write_valid_i           =   0;
                         csr_vif.mret_valid_i                         =   0;
					end
				seq_item_port.item_done();
			end
		end
	endtask
endclass
	
	

