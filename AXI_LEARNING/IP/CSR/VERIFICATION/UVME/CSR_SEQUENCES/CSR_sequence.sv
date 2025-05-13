class csr_sequence extends uvm_sequence #(csr_seqitem);

//Factory registration
	`uvm_object_utils(csr_sequence)
		csr_seqitem seq_item;
		logic [11:0]address_array[];
		int scenario;
		int count;
	
//Constructor

	function new(string name = "csr_sequence");
		super.new(name);
	endfunction
	
	task body();

	address_array=new[16];
	address_array='{12'hF11,12'hF12,12'hF13,12'hF14,12'h300,12'h301,12'h304,12'h305,12'h340,12'h341,12'h342,12'h344,12'h320,12'h343,12'hFC0,12'hBC0};
	
	  if(scenario==1)begin//write
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==1;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.csr_mepc_write_valid==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});
	end
	end
	
	if(scenario==2)begin//read
	repeat(count)begin
    `uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.csr_mepc_write_valid==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});
	end
	end
	
	if(scenario==3)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==1;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-write
	end
	end
	
	if(scenario==4)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==1;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==0;seq_item.csr_set_bit_in==1;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside {address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//write-set
	end
	end
	
	
	if(scenario==5)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==1;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==1;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;}); //write-clear
	end
	end
	
	
	if(scenario==7)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==1;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-clear
	end
	end
	
	if(scenario==8)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==1;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//interrupt_valid_in


	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==1;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//interrupt_valid_in
	end
	end
	
	
	if(scenario==9)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==1;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-mie_set
	end
	end
	
	if(scenario==10)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==1;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-mie_clear
	end
	end
	
	if(scenario==11)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside {address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==1;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-exception_valid_in


	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 1;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside {address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==1;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-exception_valid_in
	end
	end
	
	if(scenario==12)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==1;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-ld_sd_misalign_valid_in
	end
	end
	
	if(scenario==13)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==1;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-instr_misalign_valid_in
	end
	end
	
	if(scenario==14)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==1;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-clear-invalid_instr_valid_in

	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 1;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside {address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==1;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-exception_valid_in
	end
	end
	
	if(scenario==15)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==1;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==1;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-clear-exception_valid_in-ld_sd_misalign_valid_in
	end
	end
	
	if(scenario==16)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==1;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//ld_sd_misalign_valid_in
	end
	end
	
	if(scenario==17)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==1;seq_item.invalid_instr_valid_in==0;});//instr_misalign_valid_in
	end
	end
	
	if(scenario==18)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==1;});//invalid_instr_valid_in
	end
	end
	
	
	if(scenario==19)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==1;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside {address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==1;seq_item.invalid_instr_valid_in==0;});//read-set-clear-exception_valid_in-instr_misalign_valid_in
	end
	end
	
	if(scenario==20)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-clear-exception_valid_in-invalid_instr_valid_in
	end
	end
	
	if(scenario==21)begin
	repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==1;seq_item.csr_clear_bit_in==1;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//read-set-clear
	end
	end

       if(scenario==22)begin
       repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==1;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//csr_mepc_write_valid-read
        end
        end

       if(scenario==23)begin
       repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==1;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});//csr_mepc_write_valid-exception_valid_in-read
        end
        end

       if(scenario==24)begin//mret_valid_i-read_en
       repeat(count)begin
	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==1;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});
        end
        end

       if(scenario==25)begin//read_en-exception_write_valid_i
       repeat(count)begin
`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==1;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});


	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 1;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});
        end
        end
       if(scenario==26)begin//read_en-interrupt_write_valid_i
       repeat(count)begin
`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i ==0;seq_item.interrupt_id_write_valid_i==0;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==1;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});


	`uvm_do_with(seq_item,{seq_item.csr_write_en_in==0;seq_item.exception_id_write_valid_i == 0;seq_item.interrupt_id_write_valid_i==1;mret_valid_i==0;seq_item.csr_mepc_write_valid==0;seq_item.csr_read_en_in==1;seq_item.csr_set_bit_in==0;seq_item.csr_clear_bit_in==0;seq_item.csr_addr_in inside{address_array};seq_item.interrupt_valid_in==0;seq_item.mie_set==0;seq_item.mie_clear==0;seq_item.exception_valid_in==0;seq_item.ld_sd_misalign_valid_in==0;seq_item.instr_misalign_valid_in==0;seq_item.invalid_instr_valid_in==0;});
        end
        end
	endtask
endclass
