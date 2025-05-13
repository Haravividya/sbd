class csr_hpmc_uncovered_seq extends uvm_sequence #(csr_seqitem);

//Factory registration
	`uvm_object_utils(csr_hpmc_uncovered_seq)
		csr_seqitem seq_item;
		logic [11:0]hpmc_counter[];
		int count;
//Constructor

	function new(string name = "csr_hpmc_uncovered_seq");
		super.new(name);
	endfunction
	
	task body();
	    hpmc_counter=new[58];
	    hpmc_counter='{12'hB03,12'hB04,12'hB05,12'hB06,12'hB07,12'hB08,12'hB09,12'hB0A,12'hB0B,12'hB0C,12'hB0D,12'hB0E,12'hB0F,12'hB10,12'hB11,12'hB12,12'hB13,12'hB14,12'hB15,12'hB16,12'hB17,12'hB18,12'hB19,12'hB1A,12'hB1B,12'hB1C,12'hB1D,12'hB1E,12'hB1F,12'h323,12'h324,12'h325,12'h326,12'h327,12'h328,12'h329,12'h32A,12'h32B,12'h32C,12'h32D,12'h32E,12'h32F,12'h330,12'h331,12'h332,12'h333,12'h334,12'h335,12'h336,12'h337,12'h338,12'h339,12'h33A,12'h33B,12'h33C,12'h33D,12'h33E,12'h33F};
		
	repeat(count)begin
	
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==1;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_write_data_in==64'hffff_ffff_ffff_ffff;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{hpmc_counter};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.csr_mepc_write_valid==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});
	
    `uvm_do_with(seq_item,{seq_item.csr_write_en_in==1;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_write_data_in==64'h0000_0000_0000_0000;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{hpmc_counter};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.csr_mepc_write_valid==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});
	
    `uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{hpmc_counter};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.csr_mepc_write_valid==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});
   
     end
   endtask
endclass
