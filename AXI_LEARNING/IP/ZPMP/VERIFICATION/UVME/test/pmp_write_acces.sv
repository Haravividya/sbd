class pmp_write_read_access_na4 extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_write_read_access_na4)
 
// pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_write_read_access_na4",uvm_component parent=null);
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
          seq_inst.pmp_en_seq = 0;
          seq_inst.memory_access_write_address_seq=0;
          seq_inst.memory_access_read_address_seq=0;
          seq_inst.memory_access_write_en_seq=0;
          seq_inst.memory_access_read_en_seq=0;



          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
  	  
	  // Scenario-3:Disable Write;
      //// csr_rst = 1; csr_write_en = 0 and all other inputs are randomized. 
        seq_inst.scenario = 3;
        repeat(1) 
	    begin 
          seq_inst.csr_rst_seq = 0;
          seq_inst.csr_write_en_seq = 0;
          seq_inst.pmp_en_seq =0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      // Scenario-7:Write operation:NA4
      // csr_rst = 1; csr_write_en = 1, csr_read_en = random, machine_mode_signl=1, kernal_mode_signal=0,
      // csr_read_addr = random, csr_write_addr = Valid, csr_write_data = for NA4.
        seq_inst.scenario = 110;
        seq_inst.csr_rst_seq = 1;
        seq_inst.csr_write_en_seq = 1;
        seq_inst.kernel_mode_signal_seq = 0;
        seq_inst.machine_mode_valid_seq = 1;
        
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h17171717;   //pmpcfg0 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h14141414;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h14141416; 
         seq_inst.memory_access_read_address_seq =32'h14141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h14141415; 
          seq_inst.memory_access_read_address_seq =32'h14141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h188BBBA2;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h188BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h188BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h182542B2;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h182542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h188BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h52427372;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h52427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h52427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
       //pmpcfg1 with NA4 with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h17171717;   //pmpcfg1 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h15141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h15141416; 
         seq_inst.memory_access_read_address_seq =32'h15141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h15141415; 
          seq_inst.memory_access_read_address_seq =32'h15141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h198BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h198BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h198BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h192542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h192542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h192542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h62427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h62427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h62427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
       //pmpcfg2 with NA4 with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h17171717;   //pmpcfg1 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h16141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h16141416; 
         seq_inst.memory_access_read_address_seq =32'h16141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h16141415; 
          seq_inst.memory_access_read_address_seq =32'h16141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h1A8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h1A8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1A8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h1A2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h1A2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1A2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h72427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h72427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h72427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      //pmpcfg3 with NA4 with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h17171717;   //pmpcfg1 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h17141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h17141416; 
         seq_inst.memory_access_read_address_seq =32'h17141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h17141415; 
          seq_inst.memory_access_read_address_seq =32'h17141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h1B8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h1B8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1B8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h1B2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h1B2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1B2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h82427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h82427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h82427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       //pmpcfg0 with NA4 with   write access 110 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h16161616;   //pmpcfg0 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h15151515;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h15151516; 
         seq_inst.memory_access_read_address_seq =32'h15151517;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h15151518; 
          seq_inst.memory_access_read_address_seq =32'h15151519;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h198BBBA2;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h1C8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1C8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h199542B2;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h199542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h199542B6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'hA2427372;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hA2427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
       //pmpcfg1 with NA4 with  write access 110
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h16161616;   //pmpcfg1 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hA5141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hA5141416; 
         seq_inst.memory_access_read_address_seq =32'hA5141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hA5141415; 
          seq_inst.memory_access_read_address_seq =32'hA5141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hA98BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hA98BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA98BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hA92542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hA92542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA92542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hC2427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hC2427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hC2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
       //pmpcfg2 with NA4 with write access  110
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h16161616;   //pmpcfg1 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'hB6141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hB6141416; 
         seq_inst.memory_access_read_address_seq =32'hB6141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hB6141415; 
          seq_inst.memory_access_read_address_seq =32'hB6141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'hBA8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hBA8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hBA8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hBA2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hBA2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hBA2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'hD2427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hD2427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hD2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      //pmpcfg3 with NA4 with write access 110
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h16161616;   //pmpcfg3 with NA4 with write access  110
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hC7141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hC7141416; 
         seq_inst.memory_access_read_address_seq =32'hC7141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hC7141415; 
          seq_inst.memory_access_read_address_seq =32'hC7141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hCB8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hCB8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hCB8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hCB2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hCB2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hCB2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'hD2427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hD2427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hD2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
 
   


       

        //pmpcfg0 with NA4 with  no access 000 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h10101010;   //pmpcfg0 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h15151515;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h15151516; 
         seq_inst.memory_access_read_address_seq =32'h15151517;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h15151518; 
          seq_inst.memory_access_read_address_seq =32'h15151519;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h198BBBA2;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h1C8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1C8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h199542B2;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h199542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h199542B6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'hA2427372;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hA2427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
       //pmpcfg1 with NA4 with  no access 000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h10101010;   //pmpcfg1 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hA5141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hA5141416; 
         seq_inst.memory_access_read_address_seq =32'hA5141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hA5141415; 
          seq_inst.memory_access_read_address_seq =32'hA5141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hA98BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hA98BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA98BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hA92542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hA92542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA92542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hC2427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hC2427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hC2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
       //pmpcfg2 with NA4 with no access  000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h10101010;   //pmpcfg1 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'hB6141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hB6141416; 
         seq_inst.memory_access_read_address_seq =32'hB6141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hB6141415; 
          seq_inst.memory_access_read_address_seq =32'hB6141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'hBA8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hBA8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hBA8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hBA2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hBA2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hBA2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'hD2427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hD2427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hD2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      //pmpcfg3 with NA4 with no access 000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h10101010;   //pmpcfg3 with NA4 with write access  000
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hC7141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hC7141416; 
         seq_inst.memory_access_read_address_seq =32'hC7141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hC7141415; 
          seq_inst.memory_access_read_address_seq =32'hC7141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hCB8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hCB8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hCB8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hCB2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hCB2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hCB2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'hD2427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hD2427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hD2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
 


       
         //pmpcfg0 with NA4 with  101 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h15151515;   //pmpcfg0 with NA4 with both read and write access 
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h1ABC1110;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h1ABC1112; 
         seq_inst.memory_access_read_address_seq =32'h1ABC1113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h1ABC1112; 
          seq_inst.memory_access_read_address_seq =32'h1ABC1114;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h111111A5;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h111111A7;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h111111A6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h31342522;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h31342526;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h31342524; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h90444434;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h90444435;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h90444436; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
       //pmpcfg1 with NA4 with  101 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h15151515;   //pmpcfg1 with NA4 with 101
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hB5141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hB5141416; 
         seq_inst.memory_access_read_address_seq =32'hB5141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hB5141415; 
          seq_inst.memory_access_read_address_seq =32'hB5141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hE98BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hE98BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hE98BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hE92542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hE92542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hE92542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hEE427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hEE427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hEE427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
       //pmpcfg2 with NA4 w  101
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h10151515;   //pmpcfg1 with NA4 with 101
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'hDD141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hDD141416; 
         seq_inst.memory_access_read_address_seq =32'hDD141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hDD141415; 
          seq_inst.memory_access_read_address_seq =32'hDD141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'hFF8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFF8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFF8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h1F2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h1F2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1F2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'hFB427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFB427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFB427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      //pmpcfg3 with NA4 with no  101
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h15151515;   //pmpcfg3 with NA4 with write access  000
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hCC141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hCC141416; 
         seq_inst.memory_access_read_address_seq =32'hCC141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hCC141415; 
          seq_inst.memory_access_read_address_seq =32'hC7141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hCB8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hCB8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hCB8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hDF2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hCB2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hDF2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'hFA427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFA427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFA427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
 






         
 
 
    end
 `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass

 

