class pmp_na4 extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_na4)
 
// pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_na4",uvm_component parent=null);
    super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
  endfunction
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
	
    `uvm_info(get_name(),$sformatf("step 1 : inside test"),UVM_MEDIUM)
    repeat(10) 
    begin
    seq_inst.scenario = 1;
        repeat(1) 
	    begin 
          seq_inst.csr_rst_seq = 0;
          seq_inst.csr_write_en_seq = 0;
          seq_inst.csr_write_data_seq = 0;
          seq_inst.csr_write_addr_seq = 0;
          seq_inst.csr_read_en_seq = 0;
          seq_inst.csr_read_addr_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.machine_mode_valid_seq = 0;
          seq_inst.pmp_en_seq=0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

	  // Scenario-2:Reset Condition;
      //// When csr_rst = 1 and all other inputs are Zero. 
        seq_inst.scenario = 2;
        repeat(1) 
	    begin 
          seq_inst.csr_rst_seq = 1;
          seq_inst.csr_write_en_seq = 0;
          seq_inst.csr_write_data_seq = 0;
          seq_inst.csr_write_addr_seq = 0;
          seq_inst.csr_read_en_seq = 0;
          seq_inst.csr_read_addr_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.machine_mode_valid_seq = 0;
          seq_inst.pmp_en_seq=0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
  	  
	  // Scenario-3:Disable Write;
      //// csr_rst = 1; csr_write_en = 0 and all other inputs are randomized. 
        seq_inst.scenario = 3;
        repeat(1) 
	    begin 
          seq_inst.csr_rst_seq = 0;
          seq_inst.csr_write_en_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      // Scenario-7:Write operation:NA4
      // csr_rst = 1; csr_write_en = 1, csr_read_en = random, machine_mode_signl=1, kernal_mode_signal=0,
      // csr_read_addr = random, csr_write_addr = Valid, csr_write_data = for NA4.
        seq_inst.scenario = 92;
        seq_inst.csr_rst_seq = 1;
        seq_inst.csr_write_en_seq = 1;
        seq_inst.kernel_mode_signal_seq = 0;
        seq_inst.machine_mode_valid_seq = 1;
        seq_inst.pmp_en_seq=0;
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h00000010;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h00001000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h00001000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h00001011;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h00100000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h00101000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h10000000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h10001000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 





       repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h10101010;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1ABC1110;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h10000001;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h5010205A;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG1:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h11111111;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR4:REGION-4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h8BBBBBBB;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR5:REGION-5
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hDFFFFFFE;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR6:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hA1BCDEF9;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR7:REGION-7
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hDEDEEFAC;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG2:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h12121212;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR8:REGION-8
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h10001000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR9:REGION-9
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hAAADDADD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR10:REGION-10
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h111111A5;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR11:REGION-11
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h31342522;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG3:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h14141414;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR12:REGION-12
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h78389033;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR13:REGION-13
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h90444434;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR14:REGION-14
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h48935566;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR15:REGION-15
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h23456777;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h13131313;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1ABC111A;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h10000006;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h5010205A;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG1:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h16161616;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR4:REGION-4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h8BBBBB1B;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR5:REGION-5
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hDFFFFF1E;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR6:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hA1BCDE19;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR7:REGION-7
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hDEDEEF1C;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG2:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h15151515;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR8:REGION-8
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h10001010;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR9:REGION-9
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hAAADDA1D;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR10:REGION-10
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h11111115;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR11:REGION-11
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h31342322;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG3:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h17171717;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR12:REGION-12
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h78389133;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR13:REGION-13
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h90444134;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(2) //PMPADDR14:REGION-14
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h48935526;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(2) //PMPADDR15:REGION-15
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h23456766;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

/*
////////WRITE INTO ALL PMPCFG FIRST, THEN INTO PMPADDR
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h10101010;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG1:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h11111111;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG2:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h12121212;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG3:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h14141414;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1ABC1110;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h10000001;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h5010205A;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR4:REGION-4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h8BBBBBBB;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR5:REGION-5
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hDFFFFFFE;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR6:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hA1BCDEF9;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR7:REGION-7
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hDEDEEFAC;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR8:REGION-8
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h10001000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR9:REGION-9
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hAAADDADD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR10:REGION-10
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h111111A5;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR11:REGION-11
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h31342522;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR12:REGION-12
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h78389033;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR13:REGION-13
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h90444434;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR14:REGION-14
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h48935566;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR15:REGION-15
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h23456777;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

////////CORNER CASE: LOCK BIT = 1
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_rst_seq = 1'b0;
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_rst_seq = 1'b1;
        end 
        repeat(1) //PMPCFG0:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h90909090;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG1:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h91919191;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG2:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h92929292;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPCFG3:NA4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h94949494;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1ABC1110;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h10000001;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h5010205A;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR4:REGION-4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h8BBBBBBB;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR5:REGION-5
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hDFFFFFFE;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR6:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hA1BCDEF9;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR7:REGION-7
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hDEDEEFAC;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR8:REGION-8
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h10001000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR9:REGION-9
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hAAADDADD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR10:REGION-10
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h111111A5;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR11:REGION-11
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h31342522;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR12:REGION-12
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h78389033;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR13:REGION-13
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h90444434;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR14:REGION-14
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h48935566;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR15:REGION-15
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h23456777;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end */






// FOR COVERAGE ENHANCEMENT


  seq_inst.scenario = 102;
         seq_inst.csr_rst_seq = 1;
        seq_inst.csr_write_en_seq = 1;
        seq_inst.kernel_mode_signal_seq = 0;
        seq_inst.machine_mode_valid_seq = 1;
        seq_inst.pmp_en_seq=0;

        repeat(1) //PMPCFG0:NAPOT
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h17171717;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        

 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        


 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       

 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
       
        

    


        repeat(1) //PMPCFG1:NAPOT
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h17171717;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
        

 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
    
 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
        
    





         repeat(1) //PMPCFG1:NAPOT
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h17171717;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
     
 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
     
 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hABAFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
    
 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hABBFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
       


        



         repeat(1) //PMPCFG1:NAPOT
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h17171717;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hABC0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hABC0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hABC057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hABC57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hABCFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
        

 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hABD0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hABD0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hABD057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hABD57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hABDFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       


 repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hABE0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hABE0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hABE057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hABE57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hABEFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
      repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h1FFFFFF0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hABF0FFFD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h7FFFFF47;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hFF7FFFAF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h1FFFF15F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hABF0F2BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h7FF7F57F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hF7FFFAFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h0FFF15FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h1FFF2BFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hABF057FF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h7FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hFF715FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h1FF2BFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hABF57FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h7FFAFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hF715FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h0F2BFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h1F57FFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hABFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h715FFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h2BFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h57FFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'hAFFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h3FFFAFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        
       




        // For Coverage Purposes
         seq_inst.scenario = 103;
        seq_inst.csr_rst_seq = 1;
        seq_inst.csr_write_en_seq = 1;
        seq_inst.kernel_mode_signal_seq = 0;
        seq_inst.machine_mode_valid_seq = 1;
        seq_inst.pmp_en_seq=0;
        repeat(1) //PMPCFG0:NAPOT
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h00000000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) //PMPCFG1:NAPOT
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h00000000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) //PMPCFG1:NAPOT
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h00000000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

        repeat(1) //PMPCFG1:NAPOT
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h00000000;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) //PMPADDR0:REGION-0
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq = 32'h1FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR1:REGION-1
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq = 32'hABCDEF13;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR2:REGION-2
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq = 32'h11312136;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR3:REGION-3
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq = 32'h8496076F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        
        repeat(1) //PMPADDR4:REGION-4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq = 32'h996407BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR5:REGION-5
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq = 32'h99640FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR5:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq = 32'hABCFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR5:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq = 32'h1000677F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

          
        repeat(1) //PMPADDR4:REGION-4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq = 32'h996407BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR5:REGION-5
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq = 32'h99640FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR5:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq = 32'hABCFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR5:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq = 32'hABCFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end



        repeat(1) //PMPADDR4:REGION-4
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq = 32'h996407BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1) //PMPADDR5:REGION-5
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq = 32'h99640FFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1) //PMPADDR5:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq = 32'hABCFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

        repeat(1) //PMPADDR5:REGION-6
	    begin 
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq = 32'h7FFFFFFF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       

     /*
      //// RANDOM DATA
     seq_inst.scenario = 106;
        seq_inst.csr_rst_seq = 1;
        seq_inst.csr_write_en_seq = 1;
        seq_inst.kernel_mode_signal_seq = 0;
        seq_inst.machine_mode_valid_seq = 1;
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end


*/
         
 
 
    end
 `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass

 
