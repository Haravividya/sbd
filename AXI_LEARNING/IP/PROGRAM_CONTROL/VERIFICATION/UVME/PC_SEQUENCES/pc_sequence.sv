class pc_sequence extends uvm_sequence#(pc_seq_item);

  `uvm_object_utils(pc_sequence)

  pc_seq_item pc_item;
  //int case_sel;
  int count = 3;
  int scenario=2;  

  logic        branch_valid_i_seq=0;
  logic [19:0] branch_pc_i_seq=20'd0;     
  //logic [19:0] csr_mepc_i_seq;
  //logic [63:0] csr_mtvec_i_seq;
  logic        csr_mstatus_mie_i_seq=0;
  logic        mret_valid_i_seq=0;
  logic        stall_valid_i_seq=0;
  logic        zic_int_req_i_seq=0;
  //logic [7:0]  zic_mmr_ack_id_i_seq;
  //logic [31:0] z_instruction_i_seq;
  logic        invalid_instr_valid_i_seq=0;
  logic        breakpoint_valid_i_seq=0;
  logic        ecall_valid_i_seq=0;
  logic [63:0] ld_sd_addr_i_seq=0;
  logic        ld_valid_i_seq=0;
  logic        sd_valid_i_seq=0;
  logic [1:0]  byte_sel_i_seq=2'b10;

 // logic [7:0]  csr_mcause_i_seq=8'd0;
  
  function new(string name = "pc_sequence");
    super.new(name);
  endfunction

  task body();
    if(scenario ==0)
    begin	
      `uvm_do_with(pc_item,
                  {pc_item.z_rst == 0;} ) //Reset : z_rst ==0
    end

    else if (scenario ==1)
    begin	
      `uvm_do(pc_item)                  // Random scenario
    end
    

    //Only Branch valid scenario
    else if(scenario ==2)      
    begin
      repeat(count)
        `uvm_do_with(pc_item,
                    {pc_item.branch_valid_i        == branch_valid_i_seq;
                     //pc_item.branch_pc_i           == branch_pc_i_seq;
                    }) 

    end

    //Only Interrupt scenario
	else if(scenario ==3)
    begin
      repeat(count)
        `uvm_do_with(pc_item,
                    {//pc_item.csr_mepc_i          == csr_mepc_i_seq; 
                    //pc_item.csr_mtvec_i         == csr_mtvec_i_seq; 
                    pc_item.csr_mstatus_mie_i     == csr_mstatus_mie_i_seq; 
                    pc_item.mret_valid_i          == mret_valid_i_seq; 
                    pc_item.zic_int_req_i         == zic_int_req_i_seq; 
                    //pc_item.zic_mmr_ack_id_i    == zic_mmr_ack_id_i_seq; 
                    //pc_item.z_instruction_i     == z_instruction_i_seq; 
                    }) 

    end

    //Only Exception scenario
	else if(scenario == 4)
    begin
      repeat(count)
      `uvm_do_with(pc_item,
                   {pc_item.branch_valid_i        == branch_valid_i_seq;
                    pc_item.branch_pc_i           == branch_pc_i_seq;
                    //pc_item.csr_mtvec_i         == csr_mtvec_i_seq; 
                    //pc_item.z_instruction_i     == z_instruction_i_seq; 
                    pc_item.invalid_instr_valid_i == invalid_instr_valid_i_seq; 
                    pc_item.breakpoint_valid_i    == breakpoint_valid_i_seq; 
                    pc_item.ecall_valid_i         == ecall_valid_i_seq; 
                    pc_item.ld_sd_addr_i          == ld_sd_addr_i_seq; 
                    pc_item.ld_valid_i            == ld_valid_i_seq;      
                    pc_item.sd_valid_i            == sd_valid_i_seq;      
                    pc_item.byte_sel_i            == byte_sel_i_seq; 
                    }) 

    end
	
    
    //Mixed Scenario
    else if(scenario == 5)
    begin
      repeat(count)
      `uvm_do_with(pc_item,
                   {pc_item.branch_valid_i        == branch_valid_i_seq;
                    //pc_item.branch_pc_i           == branch_pc_i_seq;
                    //pc_item.csr_mepc_i          == csr_mepc_i_seq; 
                    //pc_item.csr_mtvec_i         == csr_mtvec_i_seq; 
                    pc_item.csr_mstatus_mie_i     == csr_mstatus_mie_i_seq; 
                    pc_item.mret_valid_i          == mret_valid_i_seq; 
                    pc_item.stall_valid_i         == stall_valid_i_seq; 
                    pc_item.zic_int_req_i         == zic_int_req_i_seq; 
                    //pc_item.zic_mmr_ack_id_i    == zic_mmr_ack_id_i_seq; 
                    //pc_item.z_instruction_i     == z_instruction_i_seq; 
                    pc_item.invalid_instr_valid_i == invalid_instr_valid_i_seq; 
                    pc_item.breakpoint_valid_i    == breakpoint_valid_i_seq; 
                    pc_item.ecall_valid_i         == ecall_valid_i_seq; 
                    //pc_item.ld_sd_addr_i          == ld_sd_addr_i_seq; 
                    pc_item.ld_valid_i            == ld_valid_i_seq;      
                    pc_item.sd_valid_i            == sd_valid_i_seq;      
                    pc_item.byte_sel_i            == byte_sel_i_seq; 
                    }) 

    end	
	
  endtask //Body

  

endclass :pc_sequence

