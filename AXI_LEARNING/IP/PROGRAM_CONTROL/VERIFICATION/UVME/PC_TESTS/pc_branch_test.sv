class pc_branch_test extends uvm_test;

  `uvm_component_utils(pc_branch_test)

  pc_env env;
  pc_sequence seq;

 
  function new(string name="pc_branch_test", uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    env = pc_env::type_id::create("env",this);
	seq = pc_sequence::type_id::create("seq");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    begin
      //branch = {1,  1,   1,  1,  1, 1,  1,  1,  2,  2,  2, 2,  2,  2};
      // normal = {10, 10,  2,  2,  2, 2,  2,  2,  2,  2,  3, 5,  10, 10};

      `uvm_info("Test Scenario : 0 ", $sformatf("RESET"), UVM_LOW)
      seq.scenario =0; //RESET
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

     `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 1;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);
      
               
      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 1;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 1;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 1;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 1;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);
   

      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 1;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      
      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 1;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);


      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 1;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);



      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 2;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);


      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 2;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 2;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 3;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);


      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 2;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 5;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);


      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 2;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      
      `uvm_info("Test Scenario : 2 ", $sformatf(" Directed Test Case "), UVM_LOW) 
      //Branch condition
      seq.count = 2;
      seq.scenario =2; // Starting test scenario - based on control signals.
      `uvm_info("Test Scenario : 2 ", $sformatf(" Branch, No. of branches = %d",seq.count), UVM_LOW)   
      seq.branch_valid_i_seq    =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition, Cycles = %d",seq.count), UVM_LOW) 
      //NORMAL condition
      seq.branch_valid_i_seq    =0;
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =0;
      seq.stall_valid_i_seq     =0;
      seq.zic_int_req_i_seq     =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq =0;
      seq.ecall_valid_i_seq  =0;
      seq.ld_valid_i_seq     =0;
      seq.sd_valid_i_seq     =0;
      seq.byte_sel_i_seq     =2'b10;
      seq.start(env.pc_agnt.pc_seqr);


    end
    phase.drop_objection(this);
    
  endtask

endclass



