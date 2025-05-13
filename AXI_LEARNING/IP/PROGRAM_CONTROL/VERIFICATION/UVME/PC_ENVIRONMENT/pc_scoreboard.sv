/***********************************************************

File name   : pc_scoreboard.sv
Description : 
***********************************************************/

class pc_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(pc_scoreboard)
	 
  pc_seq_item pc_item;
  pc_seq_item sampled_data[$];
  pc_seq_item scb_item;
  uvm_analysis_imp #(pc_seq_item,pc_scoreboard) scoreboard_analysis_imp;
  bit trap_valid_i =0;
  bit exception_valid_i=0;
  bit ld_sd_exception_i =0;
  bit interrupt_valid_i =0;
  bit instr_misalign =0;
  

  function new(string name, uvm_component parent);                      
    super.new(name,parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);                             //build phase
    scoreboard_analysis_imp = new("scoreboard_analysis_imp",this);	
  endfunction
    
  virtual function void write (input pc_seq_item pc_item);               // write phase  
    sampled_data.push_back(pc_item);
  endfunction : write
  
  task run_phase(uvm_phase phase);                                        //Run phase
    forever 
	begin
	  pc_seq_item pc_in;
	  wait(sampled_data.size()>0);
	  pc_in = sampled_data.pop_front();
    end
  endtask

/*
  task run_phase(uvm_phase phase);                                        //Run phase
    forever 
	begin
	  pc_seq_item pc_in;
	  wait(sampled_data.size()>0);
	  pc_in = sampled_data.pop_front();
	  scb_item = pc_seq_item :: type_id :: create("scb_item");
	  
	  fork
	    //Calling
	  
	  join
		
	end
  endtask


  //RESET  - move to RESET phase
  function reset(pc_seq_item pc_in);
    if(!pc_in.z_rst)
      scb_item.csr_mstatus_mie_set_o = 0;
	  scb_item.csr_mstatus_mie_clear_o =0;
	  scb_item.csr_mepc_write_valid_o = 0;
	  scb_item.zic_mmr_ack_read_valid_o =0;
	  scb_item.zic_mmr_eoi_write_valid_o =0;
	  scb_item.zic_mmr_eoi_id_o=0;
	  scb_item.zic_mmr_eoi_write_valid_o= 0;
	  scb_item.z_instruction_read_enable_0 =  0;
	  scb_item.instr_read_addr_o = 0;
	  scb_item.z_instruction_o = 'NOP';	  	  
  endfunction
  
  
  //Branch operation
  function branch_valid(pc_seq_item pc_in);
    if(pc_in.branch_valid_i == 1'b1)
	begin
	  scb_item.csr_mepc_o = 0;
	  scb_item.instr_read_addr_o = branch_pc_i;
	  scb_item.z_instruction_read_enable_0 = 2'b1;
	  scb_item.z_instruction_o = 'NOP'; 
	  //shall other outputs too be added ?
	  
          scb_item.exception_id_o = 0;
	  scb_item.exception_valid_o =0;
	  scb_item.csr_mepc_write_valid_o =0;
	  scb_item.csr_mstatus_mie_clear_o =0;
	  scb_item.csr_mstatus_mie_set_o = 1; //??Indu
	  scb_item.zic_mmr_ack_read_valid_o =0;
	  scb_item.zic_mmr_eoi_id_o=0;
	  scb_item.zic_mmr_eoi_write_valid_o = 0;
	  
	  
	end
	if (pc_in.branch_valid_i == 1'b1 && pc_in.branch_pc_i[1:0]!=0)
	  instr_misalign =1;
	else 
	  instr_misalign =0;
  endfunction

  //TRAP_ENTRY , EXCEPTION Entry
  function trap_entry(pc_seq_item pc_in);
    trap_valid_i =0;
    exception_valid_i=0;
    ld_sd_exception_i =0;
	interrupt_valid_i =0;
    
	//ld_sd exception
	if((pc_in.byte_sel_i == 1 and pc_in.ld_sd_addr_i[0]!=0)     or 
	   (pc_in.byte_sel_i == 2 and pc_in.ld_sd_addr_i[1:0]!=0)   or 
	   (pc_in.byte_sel_i == 3 and pc_in.ld_sd_addr_i[2:0]!=0))
      ld_sd_exception_i=1;
	else 
	  ld_sd_exception_i=0;
	
	//Exception : Instruction misalign addr
    if (pc_in.branch_valid_i == 1'b1 && pc_in.branch_pc_i[1:0]!=0)
	  instr_misalign =1;
	else 
	  instr_misalign =0;
	
	//All Exceptions
	if (pc_in.breakpoint_valid_i or pc_in.ecall_valid_i or pc_in.invalid_instr_valid_i 
	    or ld_sd_exception_i ==1 or instr_misalign ==1)
	  exception_valid_i = 1;
	else 
	  exception_valid_i = 0;
		
	//Interrupt 
    interrupt_valid_i = (pc_in.csr_mstatus_mie_i && pc_in.zic_int_req_i);
	
	//Output based on interrupt or exception
    if(interrupt_valid_i or exception_valid_i)
	begin
	  scb_item.csr_mepc_write_valid_o   = 1;
	  scb_item.csr_mstatus_mie_clear_o  = 1;
	  scb_item.csr_mstatus_mie_set_o    = 0;	  
	  scb_item.zic_mmr_ack_read_valid_o = 1;
	  scb_item.zic_mmr_eoi_id_o=0;
	  scb_item.zic_mmr_eoi_write_valid_o= 0;	
	  scb_item.z_instruction_read_enable_0 = 2'b1;
	  
	  if(interrupt_valid_i)
	    scb_item.csr_mepc_o = scb_item.csr_mtvec_i + 4*scb_item.zic_mmr_ack_id_i;
	  else if (exception_valid_i)
	    begin
		  if(instr_misalign == 1) 
		    scb_item.exception_id_o = 0;
		  else if (pc_in.invalid_instr_valid_i ==1)
		    scb_item.exception_id_o = 2;
		  else if (pc_in.breakpoint_valid_i ==1)
		    scb_item.exception_id_o = 3;
		  else if (pc_in.ecall_valid_i ==1)
		    scb_item.exception_id_o = 11;
		  else if (pc_in.ld_sd_exception_i ==1 && pc_in.ld_valid_i ==1)
		    scb_item.exception_id_o = 4;
		  else if (pc_in.ld_sd_exception_i ==1 && pc_in.sd_valid_i ==1)
		    scb_item.exception_id_o =6;
			
	      scb_item.csr_mepc_o = {scb_item.csr_mtvec_i[63:2],2'b00} +  4*scb_item.exception_id_o;
		end  
	end 
  endfunction

  //TRAP_EXIT 
  function trap_exit(pc_seq_item pc_in)
    if(pc_in.mret_valid_i)
      scb_item.csr_mstatus_mie_set_o = 1;
	  scb_item.csr_mstatus_mie_clear_o =0;
	  scb_item.csr_mepc_write_valid_o = 0;
	  scb_item.zic_mmr_ack_read_valid_o =0;
	  scb_item.zic_mmr_eoi_write_valid_o =0;
	  scb_item.zic_mmr_eoi_id_o=0;
	  scb_item.zic_mmr_eoi_write_valid_o= 0;
	  scb_item.z_instruction_read_enable_0 = 2'b1;
	  scb_item.instr_read_addr_o = pc_in.csr_mepc_i;
	  scb_item.z_instruction_o = 'NOP';	  
  endfunction
  
  //STALL or Instruction Buffer
  function instruction_buffer(pc_seq_item pc_in)
    
  
  
  endfunction
*/

endclass :pc_scoreboard




