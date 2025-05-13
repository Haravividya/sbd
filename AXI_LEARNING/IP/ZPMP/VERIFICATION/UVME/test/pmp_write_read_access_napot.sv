class pmp_write_read_access_napot extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_write_read_access_napot)
 
// pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_write_read_access_napot",uvm_component parent=null);
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
         seq_inst.csr_write_data_seq = 32'h1F1F1F1F;   //pmpcfg0 with NAPOT with both read and write access 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          //pmpcfg1 with NAPOT with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h1F1F1F1F;   //pmpcfg1 with NAPOT with both read and write access 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg2 with NAPOT with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h1F1F1F1F;   //pmpcfg1 with NAPOT with both read and write access 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          //pmpcfg3 with NAPOT with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h1F1F1F1F;   //pmpcfg1 with NAPOT with both read and write access 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 



        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'hBF33FE8C;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h10000F13;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h11312136;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h8496076F;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h996407BF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h99640FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hABCFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h1000677F;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
       
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h2087FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h29BFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h55555557;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'hC9FFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h5777789F;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h600000FF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h655353FF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h77FF7FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
        seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_address_seq = $urandom_range(32'hBF33FE8C,32'hBF33FE9C); 
         seq_inst.memory_access_read_address_seq =32'h14141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h14141415; 
          seq_inst.memory_access_read_address_seq =$urandom_range(32'hBF33FE8D,32'hBF33FE90);

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h10000F10,32'h10000F29);
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h10000F10,32'h10000F29);

          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h11312136,32'h1131213A);

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h11312138,32'h1131213B);
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        

          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h84960764,32'h849607C0);
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h8496076A,32'h849607D0);
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
         
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h9964078D,32'h99640980);
         seq_inst.memory_access_read_address_seq =32'h15141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h9964078D,32'h99640980); 
          seq_inst.memory_access_read_address_seq =32'h15141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h9964078D,32'h99640980);

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h99640011,32'h99648000);

          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h9964001F,32'h99647000);
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h99640011,32'h99648000); 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'hABC00000,32'hAC400000);

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'hABC00000,32'hAC400000);

         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h10006700,32'h10006B00);

         seq_inst.memory_access_read_address_seq =32'h16141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h16141415; 
          seq_inst.memory_access_read_address_seq =$urandom_range(32'h10006700,32'h10006B00);


        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h20800000,32'h20C00000);
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h20800000,32'h20C00000);
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h29800000,32'h2B800000);

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.memory_access_read_address_seq =$urandom_range(32'h29800000,32'h2B800000);

          seq_inst.memory_access_write_address_seq =$urandom_range(32'h29800000,32'h2B800000);

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h55555551,32'h55555560);
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h55555551,32'h55555560);
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

     
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'hC8000001,32'hD7000000); 
         seq_inst.memory_access_read_address_seq =32'h17141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h17141415; 
          seq_inst.memory_access_read_address_seq =$urandom_range(32'hC8000003,32'hD7000000);

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h57777885,32'h57777970);

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h57777885,32'h57777970); 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h60000000,32'h60000800);
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h60000000,32'h60000800);
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h65535000,32'h65537000);

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h65535000,32'h65537000);
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom_range(32'h77FF0000,32'h78030000);

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h77FF0000,32'h78030000);
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       //pmpcfg0 with NAPOT with   READ access 101 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h1D1D1D1D;   //pmpcfg0 with NAPOT with  read  
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        //pmpcfg1 with NAPOT with  READ access 101
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h1D1D1D1D;   //pmpcfg1 with NAPOT with  read 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
         //pmpcfg2 with NAPOT with READ access  011
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h1D1D1D1D;   //pmpcfg1 with NAPOT with 101
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
       
       //pmpcfg3 with NAPOT with READ access 101
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h1D1D1D1D;   //pmpcfg3 with NAPOT with READ access  101
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h15151515;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h198BBBA2;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end


         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h199542B2;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'hA2427372;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

                 
       
       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hA5141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hA98BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
     
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hA92542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hC2427373;
         seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

             
       
       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'hB6141413;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
      repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'hBA8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hBA2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'hD2427373;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hC7141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

              end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hCB8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;

          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end


         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hCB2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'hD2427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
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
          seq_inst.memory_access_read_address_seq =$urandom;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h199542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h199542B6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
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
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA5141415; 
          seq_inst.memory_access_read_address_seq =32'hA5141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hA98BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA98BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

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
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA92542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

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


          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
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
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
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
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
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
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hD2427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
 
   


   //pmpcfg0 with NAPOT with  no access 000 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h10101010;
         seq_inst.pmp_en_seq = 0;
           seq_inst.kernel_mode_signal_seq = 0;                      //pmpcfg0 with NAPOT WITH 00         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       //pmpcfg1 with NAPOT with  no access 000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h10101010;   //pmpcfg1 with NAPOT with 000
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

        //pmpcfg2 with NAPOT with no access  000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h10101010; 
         seq_inst.pmp_en_seq = 0;//pmpcfg1 with NAPOT with 000 
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg3 with NAPOT with no access 000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h10101010;   //pmpcfg3 with NAPOT  000
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h15151515;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h198BBBA2;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h199542B2;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'hA2427372;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          

         
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hA5141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hA98BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hADFBBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hC2427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end


        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'hB6141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'hBA8BBBA3;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end


          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hBA2542B3;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'hD2427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hC7141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hCB8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hCB2542B3;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'hD2427373;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end



       

      repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h15151516; 
         seq_inst.memory_access_read_address_seq =32'h15151517;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h15151518; 
          seq_inst.memory_access_read_address_seq =32'h15151519;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

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
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1C8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h199542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h199542B6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

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
 


       
         //pmpcfg0 with NAPOT with  011 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h1B1B1B1B;   //pmpcfg0 with NAPOT with 011 
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        
        //pmpcfg1 with NAPOT with  011 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h1B1B1B1B;   //pmpcfg1 with NA4 with 011
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


         //pmpcfg2 with NAPOT  011
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h1B1B1B1B;
         seq_inst.pmp_en_seq = 0;//pmpcfg2 with NAPOT with 011
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        


         //pmpcfg3 with NAPOT with no  011
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h1B1B1B1B;   //pmpcfg3 with NAPOT with write access  011
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h1ABC1110;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h111111A5;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
       
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h31342522;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h90444434;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hB5141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hE98BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hE92542B3;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hEE427373;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'hDD141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'hFF8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h1F2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
 
          
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'hFB427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hCC141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hCB8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hDF2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'hFA427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
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
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h111111A7;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h111111A6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
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
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h90444435;
          seq_inst.kernel_mode_signal_seq = 1;
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
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFB427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

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
 




      
         //pmpcfg0 with TOR with  001 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h19191919;   //pmpcfg0 with tor with 001 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       //pmpcfg1 with NAPOT with  001 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h19191919;   //pmpcfg1 with NAPOT with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg2 with NAPOT   001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h19191919;   //pmpcfg2 with NAPOT with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

        //pmpcfg3 with NAPOT with no  001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h19191919;   //pmpcfg3 with NAPOT with write access  001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h1FFC1110;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h891111A5;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h27342522;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h98444434;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hF5141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hDA8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hAF2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hFC427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
          
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h83141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'hED8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hAD2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h9A427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h1E141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hEC8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hDE2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h8C427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end


          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1115; 
         seq_inst.memory_access_read_address_seq =32'h1FFC1113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1112; 
         seq_inst.memory_access_read_address_seq =32'h1FFC1113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1112; 
          seq_inst.memory_access_read_address_seq =32'h1FFC1114;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h891111A7;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h891111A6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h27342526;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h27342524; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                    
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h98444435;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h98444436; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
         
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hF5141416; 
         seq_inst.memory_access_read_address_seq =32'hF5141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hF5141415; 
          seq_inst.memory_access_read_address_seq =32'hF5141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hDA8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hDA8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hAF2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hAF2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                    
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFC427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFC427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
          
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h83141416; 
         seq_inst.memory_access_read_address_seq =32'h83141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h83141415; 
          seq_inst.memory_access_read_address_seq =32'h83141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hED8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hED8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hAD2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hAD2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h9A427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h9A427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h1E141416; 
         seq_inst.memory_access_read_address_seq =32'h1E141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h1E141415; 
          seq_inst.memory_access_read_address_seq =32'h1E141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hEC8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hEC8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hDE2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hDE2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                    
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h8C427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h8C427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
 
      
         //pmpcfg0 with NAPOT with  100 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h1C1C1C1C;   //pmpcfg0 with NAPOT with 100 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg1 with NAPOT with  100 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h1C1C1C1C;   //pmpcfg1 with NAPOT with 100
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg2 with NAPOT  100
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h1C1C1C1C;   //pmpcfg1 with NAPOT with 100
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         //pmpcfg3 with NAPOT with no  100
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h1C1C1C1C;   //pmpcfg3 with NAPOT with write access  100
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h1FFC1110;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h891111A5;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h27342522;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h98444434;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hF5141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hDA8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hAF2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hFC427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h03141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h5D8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hED2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h9F427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hFE141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hFC8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hAE2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'hFB427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end









   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1115; 
         seq_inst.memory_access_read_address_seq =32'h1FFC1113;
          seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1112; 
         seq_inst.memory_access_read_address_seq =32'h1FFC1113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1112; 
          seq_inst.memory_access_read_address_seq =32'h1FFC1114;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h891111A7;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h891111A6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h27342526;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h27342524; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h98444435;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h98444436; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
          
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hF5141416; 
         seq_inst.memory_access_read_address_seq =32'hF5141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hF5141415; 
          seq_inst.memory_access_read_address_seq =32'hF5141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hDA8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hDA8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hAF2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hAF2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFC427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFC427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h03141416; 
         seq_inst.memory_access_read_address_seq =32'h03141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h03141415; 
          seq_inst.memory_access_read_address_seq =32'h03141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h5D8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h5D8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hED2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hED2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h9F427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h9F427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hFE141416; 
         seq_inst.memory_access_read_address_seq =32'hFE141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hFE141415; 
          seq_inst.memory_access_read_address_seq =32'hFE141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFC8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFC8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hAE2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hAE2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
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
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      
      //pmpcfg0 with NULL with  111 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h07070707;   //pmpcfg0 with NULL with 100 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h1FFC1110;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h891111A5;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;

         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h27342522;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h98444434;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
       //pmpcfg1 with NULL with  111 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h07070707;   //pmpcfg1 with NULL with 111
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hF5141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hDA8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hAF2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hFC427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         //pmpcfg2 with NULL  111
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h07070707;   //pmpcfg1 with NULL with 111
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h03141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h5D8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hED2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h9F427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        //pmpcfg3 with NULL with no  111
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h07070707;   //pmpcfg3 with NULL with write access  111
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hFE141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hFC8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hAE2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'hFB427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end









   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1115; 
         seq_inst.memory_access_read_address_seq =32'h1FFC1113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1112; 
         seq_inst.memory_access_read_address_seq =32'h1FFC1113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1112; 
          seq_inst.memory_access_read_address_seq =32'h1FFC1114;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h891111A7;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h891111A6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h27342526;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h27342524; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h98444435;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h98444436; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
          
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hF5141416; 
         seq_inst.memory_access_read_address_seq =32'hF5141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hF5141415; 
          seq_inst.memory_access_read_address_seq =32'hF5141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hDA8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hDA8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hAF2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hAF2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFC427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFC427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h03141416; 
         seq_inst.memory_access_read_address_seq =32'h03141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h03141415; 
          seq_inst.memory_access_read_address_seq =32'h03141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h5D8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h5D8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hED2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hED2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h9F427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h9F427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hFE141416; 
         seq_inst.memory_access_read_address_seq =32'hFE141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hFE141415; 
          seq_inst.memory_access_read_address_seq =32'hFE141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFC8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFC8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hAE2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hAE2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

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
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

 



             //pmpcfg0 with NAPOT with  random combination
       /* repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = $urandom;   //pmpcfg0 with NA4 with random
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=$urandom_range(32'h1FFFF906,32'h1FFFF807);
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h1FFFF867,32'h1FFFF906);
          seq_inst.memory_access_read_address_seq =$urandom_range(32'h1FFFF867,32'h1FFFF906);
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h1FFFF867,32'h1FFFF906);

         seq_inst.memory_access_read_address_seq =$urandom_range(32'h1FFFF867,32'h1FFFF906);


          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = $urandom;
         seq_inst.memory_access_write_en_seq = $urandom;
         seq_inst.memory_access_write_address_seq =$urandom; 
          seq_inst.memory_access_read_address_seq =$urandom;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=$urandom;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
           end
         
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = $urandom;
         seq_inst.memory_access_read_en_seq = $urandom;
         seq_inst.memory_access_write_address_seq = $urandom; 
         seq_inst.memory_access_read_address_seq =$urandom;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = $urandom;
         seq_inst.memory_access_read_en_seq =$urandom ;
         seq_inst.memory_access_write_en_seq = $urandom;
         seq_inst.memory_access_write_address_seq = $urandom; 
          seq_inst.memory_access_read_address_seq =$urandom;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=$urandom;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = $urandom;
         seq_inst.memory_access_read_en_seq = $urandom;
         seq_inst.memory_access_write_address_seq = $urandom; 
         seq_inst.memory_access_read_address_seq =$urandom;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h27342524; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=$urandom;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h98444435;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h98444436; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
       //pmpcfg1 with NA4 with  100 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h14141414;   //pmpcfg1 with NA4 with 100
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hF5141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hF5141416; 
         seq_inst.memory_access_read_address_seq =32'hF5141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hF5141415; 
          seq_inst.memory_access_read_address_seq =32'hF5141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hDA8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hDA8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hDA8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;
       seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hAF2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hAF2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hAF2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hFC427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFC427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFC427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
       //pmpcfg2 with NA4 w  100
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h14141414;   //pmpcfg1 with NA4 with 100
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h03141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h03141416; 
         seq_inst.memory_access_read_address_seq =32'h03141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h03141415; 
          seq_inst.memory_access_read_address_seq =32'h03141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h5D8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h5D8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h5D8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hED2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hED2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hED2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h9F427373;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h9F427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h9F427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      //pmpcfg3 with NA4 with no  100
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h14141414;   //pmpcfg3 with NA4 with write access  001
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hFE141413;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hFE141416; 
         seq_inst.memory_access_read_address_seq =32'hFE141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hFE141415; 
          seq_inst.memory_access_read_address_seq =32'hFE141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hFC8BBBA3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFC8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFC8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hAE2542B3;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hAE2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hAE2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
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


*/




          //pmpcfg0 with NAPOT with  MIX combination
        repeat(2) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h191B1C1F;   //pmpcfg0 with tor with MIX COM 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

             //pmpcfg1 with NAPOT with  001 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h1F1D1B19;   //pmpcfg1 with NAPOT with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
        //pmpcfg2 with NAPOT   001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h191D1B1F;   //pmpcfg2 with NAPOT with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg3 with NAPOT with no  001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h191D1B1F;   //pmpcfg3 with NAPOT with write access  001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h000AFFFF;         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h0015FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h002BFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h0057FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h00AFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h015FFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h02BFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h057FFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h0AFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h15FFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h2BFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h57FFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hAFFFFFFF;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
         end

         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h4FFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h5FFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h7FFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00F5EEEE;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFC427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
      
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00000FFF; 
         seq_inst.memory_access_read_address_seq =32'h000000FB;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h03141415; 
          seq_inst.memory_access_read_address_seq =32'h03141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h5D8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h5D8BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hED2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hED2542B4; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       

          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h9F427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h9F427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hFE141416; 
         seq_inst.memory_access_read_address_seq =32'hFE141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = $urandom; 
          seq_inst.memory_access_read_address_seq =$urandom;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                    

        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFC8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00001234; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00F3CCCC;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =$urandom;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00F2FFFF; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         

         repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h000A0000,32'h000ABBF); 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                   
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq = $urandom_range(32'h00A00000,32'h00ABBBBF);
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = $urandom_range(32'h0A000000,32'h0AEBBBBF); 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq =  $urandom_range(32'hA0000000,32'hAFEBBBBF);
         seq_inst.memory_access_read_address_seq = $urandom_range(32'h0A000000,32'h0AEBBBBF);

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq =  $urandom_range(32'h0A000000,32'h0AEBBBBF); 
          seq_inst.memory_access_read_address_seq = $urandom_range(32'h00000000,32'h7EFBBBBF);
        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq = $urandom_range(32'h00280000,32'h00480000);
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq =  $urandom_range(32'h0A000000,32'h0AEBBBBF);
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


//coverage purposes

          //pmpcfg0 with NAPOT with  MIX combination
        repeat(2) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h191B1C1F;   //pmpcfg0 with tor with MIX COM 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

             //pmpcfg1 with NAPOT with  001 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h1F1D1B19;   //pmpcfg1 with NAPOT with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
        //pmpcfg2 with NAPOT   001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h191D1B1F;   //pmpcfg2 with NAPOT with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg3 with NAPOT with no  001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h191D1B1F;   //pmpcfg3 with NAPOT with write access  001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h000AFFFF;         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h0015FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h002BFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h0057FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h00AFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h015FFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h02BFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h057FFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h0AFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h15FFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h2BFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h57FFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h1FFFFFFF;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
         end

         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h4FFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h3FFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h7FFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

     
        
      
         //pmpcfg0 with TOR with  001 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h18181818;   //pmpcfg0 with tor with 001 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       //pmpcfg1 with NAPOT with  001 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h18181818;   //pmpcfg1 with NAPOT with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg2 with NAPOT   001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h18181818;   //pmpcfg2 with NAPOT with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

        //pmpcfg3 with NAPOT with no  001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h18181818;   //pmpcfg3 with NAPOT with write access  001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h1FFC1110;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h891111A5;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h27342522;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h98444434;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'hF5141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'hDA8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'hAF2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'hFC427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
          
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h83141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'hED8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'hAD2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h9A427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h1E141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hEC8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'hDE2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h8C427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end


          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1115; 
         seq_inst.memory_access_read_address_seq =32'h1FFC1113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1112; 
         seq_inst.memory_access_read_address_seq =32'h1FFC1113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h1FFC1112; 
          seq_inst.memory_access_read_address_seq =32'h1FFC1114;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h891111A7;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h891111A6; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h27342526;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h27342524; 
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

 


