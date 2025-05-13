class pc_int_exp_test extends uvm_test;

  `uvm_component_utils(pc_int_exp_test)

  pc_env env;
  pc_sequence seq;
  
  //int test_case;
 
  function new(string name="pc_test", uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    env = pc_env::type_id::create("env",this);
	seq = pc_sequence::type_id::create("seq");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    begin        
      `uvm_info("Test Scenario : 0 ", $sformatf("RESET"), UVM_LOW)
      seq.scenario =0; //RESET
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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



       `uvm_info("Test Scenario : 3 ", $sformatf("Interrupt"), UVM_LOW) 
      //Interrupt condition - Trap entry
      seq.count = 1;
      seq.scenario =3; // Starting test scenario - based on control signals.
      seq.csr_mstatus_mie_i_seq =1;
      seq.mret_valid_i_seq      =0;
      seq.zic_int_req_i_seq     =1;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      
       `uvm_info("Test Scenario : 3 ", $sformatf(" Trap EXIT "), UVM_LOW) 
      //TRAP EXIT 
      seq.count = 1;
      seq.scenario =3; // Starting test scenario - based on control signals.
      seq.csr_mstatus_mie_i_seq =0;
      seq.mret_valid_i_seq      =1;
      seq.zic_int_req_i_seq     =0;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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


      `uvm_info("Test Scenario : 0 ", $sformatf("RESET"), UVM_LOW)
      seq.scenario =0; //RESET
      seq.start(env.pc_agnt.pc_seqr);


      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 2;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Invalid instruction"), UVM_LOW) 
      //Exception condition - Invalid instruction      
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =1;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;
      seq.ld_sd_addr_i_seq          =0;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Breakpoint"), UVM_LOW) 
      //Exception condition - Breakpoint
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =1;
      seq.ecall_valid_i_seq         =0;
      seq.ld_sd_addr_i_seq          =0;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Ecall"), UVM_LOW) 
      //Exception condition - ecall
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =1;
      seq.ld_sd_addr_i_seq          =0;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Misaligned scenarios ,Halfword - LOAD "), UVM_LOW) 
      //Exception Scenarions - Misaligned scenarios  
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;

      seq.ld_sd_addr_i_seq          =64'hA764B890A764B891;
      seq.ld_valid_i_seq            =1;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b01;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Misaligned scenarios ,Word - LOAD "), UVM_LOW) 
      //Exception Scenarions - Misaligned scenarios  
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;
      seq.ld_sd_addr_i_seq          =64'hA764B890A764B893;
      seq.ld_valid_i_seq            =1;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b10;
      seq.start(env.pc_agnt.pc_seqr);


      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Misaligned scenarios ,Doubleword - LOAD "), UVM_LOW) 
      //Exception Scenarions - Misaligned scenarios  
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;
      seq.ld_sd_addr_i_seq          =64'hA764B890A764B897;
      seq.ld_valid_i_seq            =1;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b11;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Misaligned scenarios ,Halfword - store "), UVM_LOW) 
      //Exception Scenarions - Misaligned scenarios  
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;

      seq.ld_sd_addr_i_seq          =64'hA764B890A764B891;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =1;
      seq.byte_sel_i_seq            =2'b01;
      seq.start(env.pc_agnt.pc_seqr);


      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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
      
      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Misaligned scenarios ,Word - STORE "), UVM_LOW) 
      //Exception Scenarions - Misaligned scenarios  
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;
      seq.ld_sd_addr_i_seq          =64'hA764B890A764B893;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =1;
      seq.byte_sel_i_seq            =2'b10;
      seq.start(env.pc_agnt.pc_seqr);


      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Misaligned scenarios ,Doubleword - STORE "), UVM_LOW) 
      //Exception Scenarions - Misaligned scenarios  
      seq.branch_valid_i_seq        =0;
      seq.branch_pc_i_seq           =20'd0;
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;
      seq.ld_sd_addr_i_seq          =64'hA764B890A764B897;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =1;
      seq.byte_sel_i_seq            =2'b11;
      seq.start(env.pc_agnt.pc_seqr);


      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

       seq.scenario =4; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 4 ", $sformatf("Exception - Instruction Misaligned scenarios  "), UVM_LOW) 
      //Exception Scenarions - Misaligned scenarios  
      seq.branch_valid_i_seq        =1;
      seq.branch_pc_i_seq           =20'h38AB3; //20 bit value
      seq.invalid_instr_valid_i_seq =0;
      seq.zic_int_req_i_seq         =0;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;
      seq.ld_sd_addr_i_seq          =64'd0;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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

      seq.scenario =5; 
      seq.count = 1;
      `uvm_info("Test Scenario : 5 ", $sformatf("Interrupt and Exception : Invalid instruction"), UVM_LOW) 
      //Interrupt and Exception (Invalid instruction ) - TOGETHER
      seq.branch_valid_i_seq        =0;
      seq.csr_mstatus_mie_i_seq     =1;
      seq.mret_valid_i_seq          =0;
      seq.stall_valid_i_seq         =0;
      seq.zic_int_req_i_seq         =1;
      seq.invalid_instr_valid_i_seq =1;
      seq.breakpoint_valid_i_seq    =0;
      seq.ecall_valid_i_seq         =0;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b10;
      seq.start(env.pc_agnt.pc_seqr);

      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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


      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 1;
      `uvm_info("Test Scenario : 5 ", $sformatf("Interrupt and Exception : Breakpoint"), UVM_LOW) 
      //Interrupt and Exception  - Breakpoint
      seq.branch_valid_i_seq        =0;
      seq.csr_mstatus_mie_i_seq     =1;
      seq.mret_valid_i_seq          =0;
      seq.stall_valid_i_seq         =0;
      seq.zic_int_req_i_seq         =1;
      seq.invalid_instr_valid_i_seq =0;
      seq.breakpoint_valid_i_seq    =1;
      seq.ecall_valid_i_seq         =0;
      seq.ld_valid_i_seq            =0;
      seq.sd_valid_i_seq            =0;
      seq.byte_sel_i_seq            =2'b10;
      seq.start(env.pc_agnt.pc_seqr);


      seq.scenario =5; // Starting test scenario - based on control signals.
      seq.count = 10;
      `uvm_info("Test Scenario : 5 ", $sformatf("Normal Condition"), UVM_LOW) 
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
