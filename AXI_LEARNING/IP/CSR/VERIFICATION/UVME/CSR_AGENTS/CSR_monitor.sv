class csr_monitor extends uvm_monitor;

	`uvm_component_utils(csr_monitor)
		virtual csr_intf csr_vif;
		csr_seqitem seq_item;
		uvm_analysis_port#(csr_seqitem) monitor_analysis_port;
		
//constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
    endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_analysis_port = new("monitor_analysis_port", this);
	if(!uvm_config_db#(virtual csr_intf)::get(this,"","intf",csr_vif))
    `uvm_error("monitor","No resource found")
	endfunction
	
	task run_phase(uvm_phase phase);
            wait(csr_vif.csr_rst==0); 
        fork
		forever
		begin
                   
		@(posedge csr_vif.csr_clk);
      
		seq_item = csr_seqitem :: type_id :: create("seq_item");
			 
			begin
                seq_item.csr_rst                            =   csr_vif.csr_rst;
				seq_item.csr_write_en_in 		        	= 	csr_vif.csr_write_en_in;
				seq_item.csr_write_data_in 		        	=	csr_vif.csr_write_data_in;
				seq_item.csr_addr_in			        	= 	csr_vif.csr_addr_in;
				seq_item.csr_read_en_in 		        	= 	csr_vif.csr_read_en_in;
				seq_item.csr_set_bit_in  		        	= 	csr_vif.csr_set_bit_in;
				seq_item.csr_clear_bit_in 		         	= 	csr_vif.csr_clear_bit_in;
				seq_item.interrupt_valid_in  		 	    = 	csr_vif.interrupt_valid_in;
				seq_item.mie_set                    		=	csr_vif.mie_set;
				seq_item.mie_clear                 		    =	csr_vif.mie_clear;
				seq_item.interrupt_code_in 		        	= 	csr_vif.interrupt_code_in;
				seq_item.exception_valid_in 	        	= 	csr_vif.exception_valid_in;
				seq_item.exception_code_in		        	=   csr_vif.exception_code_in;
				seq_item.ld_sd_misalign_valid_in        	=	csr_vif.ld_sd_misalign_valid_in;
				seq_item.ld_sd_misalign_addr_in	        	=	csr_vif.ld_sd_misalign_addr_in;
				seq_item.instr_misalign_valid_in        	=	csr_vif.instr_misalign_valid_in;
				seq_item.instr_misalign_addr_in	        	=	csr_vif.instr_misalign_addr_in;
				seq_item.invalid_instr_valid_in	        	=	csr_vif.invalid_instr_valid_in;
				seq_item.invalid_instruction_in	        	=	csr_vif.invalid_instruction_in;
				seq_item.pc_in					        	=	csr_vif.pc_in;
				seq_item.csr_read_data_o		         	=	csr_vif.csr_read_data_o;
                seq_item.csr_mepc_in                        =   csr_vif.csr_mepc_in;                        
                seq_item.csr_mepc_write_valid               =   csr_vif.csr_mepc_write_valid;                
                seq_item.interrupt_lvl_pr_i                 =   csr_vif.interrupt_lvl_pr_i;                  
                seq_item.interrupt_active_level_priority_o  =   csr_vif.interrupt_active_level_priority_o;
                seq_item.csr_mepc_o                         =   csr_vif.csr_mepc_o;                          
                seq_item.csr_mtvec_o                        =   csr_vif.csr_mtvec_o;                        
                seq_item.mstatus_mie_o                      =   csr_vif.mstatus_mie_o; 
                seq_item.csr_mcause_o                       =   csr_vif.csr_mcause_o;
			    seq_item.exception_id_write_valid_i	        =   csr_vif.exception_id_write_valid_i; 
                seq_item.interrupt_id_write_valid_i         =   csr_vif.interrupt_id_write_valid_i; 
                seq_item.mret_valid_i                       =   csr_vif.mret_valid_i;
	    `uvm_info("MINTSTATUS CSR monitor",$sformatf("rtl_csr_read_data : %0h active_level_priority : %0h",csr_vif.csr_read_data_o,csr_vif.interrupt_active_level_priority_o), UVM_MEDIUM)
                        monitor_analysis_port.write(seq_item);
			end
                
	    end

       forever
       begin
	    @(negedge csr_vif.csr_rst );

		seq_item = csr_seqitem :: type_id :: create("seq_item");
			 
			begin
                seq_item.csr_rst                            =   csr_vif.csr_rst;
				seq_item.csr_write_en_in 		        	= 	csr_vif.csr_write_en_in;
				seq_item.csr_write_data_in 		        	=	csr_vif.csr_write_data_in;
				seq_item.csr_addr_in			        	= 	csr_vif.csr_addr_in;
				seq_item.csr_read_en_in 		        	= 	csr_vif.csr_read_en_in;
				seq_item.csr_set_bit_in  		        	= 	csr_vif.csr_set_bit_in;
				seq_item.csr_clear_bit_in 		         	= 	csr_vif.csr_clear_bit_in;
				seq_item.interrupt_valid_in  		 	    = 	csr_vif.interrupt_valid_in;
				seq_item.mie_set                    		=	csr_vif.mie_set;
				seq_item.mie_clear                 		    =	csr_vif.mie_clear;
				seq_item.interrupt_code_in 		        	= 	csr_vif.interrupt_code_in;
				seq_item.exception_valid_in 	        	= 	csr_vif.exception_valid_in;
				seq_item.exception_code_in		        	=   csr_vif.exception_code_in;
				seq_item.ld_sd_misalign_valid_in        	=	csr_vif.ld_sd_misalign_valid_in;
				seq_item.ld_sd_misalign_addr_in	        	=	csr_vif.ld_sd_misalign_addr_in;
				seq_item.instr_misalign_valid_in        	=	csr_vif.instr_misalign_valid_in;
				seq_item.instr_misalign_addr_in	        	=	csr_vif.instr_misalign_addr_in;
				seq_item.invalid_instr_valid_in	        	=	csr_vif.invalid_instr_valid_in;
				seq_item.invalid_instruction_in	        	=	csr_vif.invalid_instruction_in;
				seq_item.pc_in					        	=	csr_vif.pc_in;
				seq_item.csr_read_data_o		         	=	csr_vif.csr_read_data_o;
                seq_item.csr_mepc_in                        =   csr_vif.csr_mepc_in;                        
                seq_item.csr_mepc_write_valid               =   csr_vif.csr_mepc_write_valid;                
                seq_item.interrupt_lvl_pr_i                 =   csr_vif.interrupt_lvl_pr_i;                  
                seq_item.interrupt_active_level_priority_o  =   csr_vif.interrupt_active_level_priority_o;
                seq_item.csr_mepc_o                         =   csr_vif.csr_mepc_o;                          
                seq_item.csr_mtvec_o                        =   csr_vif.csr_mtvec_o;                        
                seq_item.mstatus_mie_o                      =   csr_vif.mstatus_mie_o; 
                seq_item.csr_mcause_o                       =   csr_vif.csr_mcause_o;
			    seq_item.exception_id_write_valid_i	        =   csr_vif.exception_id_write_valid_i; 
                seq_item.interrupt_id_write_valid_i         =   csr_vif.interrupt_id_write_valid_i; 
				seq_item.mret_valid_i                       =   csr_vif.mret_valid_i;		
                        monitor_analysis_port.write(seq_item);
			end
       end

       join_none
  endtask
endclass
