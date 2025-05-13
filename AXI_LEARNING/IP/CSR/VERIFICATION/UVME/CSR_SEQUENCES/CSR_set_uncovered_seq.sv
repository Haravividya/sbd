class csr_set_uncovered_sequence extends uvm_sequence #(csr_seqitem);

//Factory registration
	`uvm_object_utils(csr_set_uncovered_sequence)
		csr_seqitem seq_item;
		logic [11:0]array_set[];
		int scenario;
		int count;
	
//Constructor

	function new(string name = "csr_set_uncovered_sequence");
		super.new(name);
	endfunction
	
	task body();

	array_set=new[6];
	array_set='{12'h300,12'h340,12'h342,12'h344,12'h304,12'h305,12'h320};
	
	repeat(count)begin
	
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==1;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_write_data_in==64'h0000_0000_0000_0000;seq_item.csr_set_bit_in==1;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{array_set};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//write-set

	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{array_set};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read
	end
	endtask
endclass

