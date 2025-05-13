class pmp_write_read_access_tor extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_write_read_access_tor)
 
// pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_write_read_access_tor",uvm_component parent=null);
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

      // Scenario-7:Write operation:tor
      // csr_rst = 1; csr_write_en = 1, csr_read_en = random, machine_mode_signl=1, kernal_mode_signal=0,
      // csr_read_addr = random, csr_write_addr = Valid, csr_write_data = for NA4.
        seq_inst.scenario = 110;
        seq_inst.csr_rst_seq = 1;
        seq_inst.csr_write_en_seq = 1;
        seq_inst.machine_mode_valid_seq = 1;
        
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h0F0F0F0F;   //pmp0cfg with TOR with both read and write access 
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg1 with TOR with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h0F0F0F0F;   //pmpcfg1 with TOR with both read and write access 1
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.pmp_en_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       //pmpcfg2 with TOR with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h0F0F0F0F;   //pmpcfg1 with TOR with both read and write access 
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;


         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

            //pmpcfg3 with TOR with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h0F0F0F0F;   //pmpcfg1 with TOR with both read and write access 
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h000100AA;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
   
                 
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h000202D5;					
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.pmp_en_seq = 0;
          

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h0004072C;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.pmp_en_seq = 0;
         

         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         

         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h00050FDA;
         seq_inst.kernel_mode_signal_seq = 0; 

         seq_inst.pmp_en_seq = 0;

         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

                
       
               repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h00060730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.pmp_en_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h00070730;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.pmp_en_seq = 0;

         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

        
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h00080730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.pmp_en_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h00090730;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.pmp_en_seq = 0;

         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h000A0730;
         seq_inst.kernel_mode_signal_seq = 0;

         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h000B0730;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
      
      repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h000C0730;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
     
     repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h000D0730;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h000E0730;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h000F0730;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
          seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h000FF999;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h000FFFFF;
         //seq_inst.csr_write_en_seq=1;
          seq_inst.pmp_en_seq = 0;
           seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
         repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h0000003; 
         seq_inst.memory_access_read_address_seq =32'h00000002;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00000112;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00000118; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


          
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00001243; 
         seq_inst.memory_access_read_address_seq =32'h0000000A;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h000100AF;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h000101FF; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h0001072F;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00010730;
         seq_inst.memory_access_read_address_seq =32'h0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       

   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00010FEF; 
         seq_inst.memory_access_read_address_seq =32'h00010FED;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00010FED; 
          seq_inst.memory_access_read_address_seq =32'h00010FFF;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00010739;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0001074F; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h0002073F;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h000307FF;
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h000407DD;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0005073F; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h000F07FF;
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h000E07DD;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h000C073F; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h000B07FF;
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


        repeat(1)  
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h000D07DD;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.kernel_mode_signal_seq = 1;

         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h000E073F; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h000E0728; 
         seq_inst.memory_access_read_address_seq =32'h000F0720;

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

       
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00000123; 
         seq_inst.memory_access_read_address_seq =32'h00002588;

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
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'hFB8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hFB8BBBA3; 
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
         seq_inst.memory_access_read_address_seq =32'h00060000;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00070000; 
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
         seq_inst.memory_access_write_address_seq = $urandom; 
         seq_inst.memory_access_read_address_seq =32'h0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       //pmpcfg0 with TOR with   write access 110 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h03030303;   //pmpcfg0 with TOR 110
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         //pmpcfg1 with TOR with  write access 110
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h03030303;   //pmpcfg1 with TOR    
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg2 with TOR with write access  110
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h03030303;   //pmpcfg2 with TOR with 110
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         //pmpcfg3 with TOR with write access 110
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h03030303;   //pmpcfg3 with TOR with write access  110
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h001100AA;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h00220205;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h0024072C;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h0044072C;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h00550FDA;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h00660730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h00770730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h00880730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h00990730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h00AA0730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h00BB0730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h00CC0730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h00DD0730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h00EE0730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h00FF0730;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h00FFFFFF;
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
         seq_inst.memory_access_write_address_seq = 32'h00012345; 
         seq_inst.memory_access_read_address_seq =32'h00099999;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h0001100AA; 
          seq_inst.memory_access_read_address_seq =32'h00110000;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00200000;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00199999; 
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
         seq_inst.memory_access_read_address_seq =32'h00660735;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00550FC9; 
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
         seq_inst.memory_access_read_address_seq =32'h00CC0000;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00DC0777; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
         
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hFFFFFFFF; 
         seq_inst.memory_access_read_address_seq =32'hEEEEEEEE;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h11111111; 
          seq_inst.memory_access_read_address_seq =32'h22222222;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00FFFFEE;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00EE0000; 
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
         seq_inst.memory_access_read_address_seq =32'h00AAEEEE;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00AB0000; 
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
         seq_inst.memory_access_read_address_seq =32'h00DD0000;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00CCEEEE; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
         
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00DD0077; 
         seq_inst.memory_access_read_address_seq =32'h00DD0725;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'hB6141415; 
          seq_inst.memory_access_read_address_seq =32'hB6141416;

        
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00660390;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00630084; 
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
         seq_inst.memory_access_read_address_seq =32'h00220206;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00320000; 
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
         seq_inst.memory_access_read_address_seq =32'h00012345;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00F00000; 
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
         seq_inst.memory_access_read_address_seq =32'h00BBBBBB;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00FAAAAA; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
 
   


       

        //pmpcfg0 with TOR with  no access 000 combination & overlalpping Execptions
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h08080808; 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
                                                     //pmpcfg0 with TOR WITH 00         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg1 with TOR with  no access 000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h08080808;   //pmpcfg1 with TOR with 000
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         //pmpcfg2 with TOR with no access  000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h08080808;   //pmpcfg1 with TOR with 000         
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        
        //pmpcfg3 with TOR with no access 000
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h08080808;   //pmpcfg3 with TOR  000
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h15151515;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         //seq_inst.csr_write_en_seq=1;
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
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         //seq_inst.csr_write_en_seq=1;
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
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

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
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'hC7141413;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         //seq_inst.csr_write_en_seq=1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'hCB8BBBA3;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         //seq_inst.csr_write_en_seq=1;
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
 


       
         //pmpcfg0 with TOR with  101 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h0D0D0D0D;   //pmpcfg0 with TOR with 101 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          //pmpcfg1 with TOR with  101 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h0D0D0D0D;   //pmpcfg1 with TOR with 101
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

        //pmpcfg2 with NAPOT  101
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h0D0D0D0D;   //pmpcfg2 with TOR with 101
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg3 with TOR with no  101
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h0D0D0D0D;   //pmpcfg3 with TOR with write access  000
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h01234678;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h02345786;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h03342522;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h04444434;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h05141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h068BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end


   
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h072542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
       
         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h08427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
      
              repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h09FFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h0AFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
          
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h0BFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
      
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h0CFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h0DFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h0EFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h0FFFFAAA;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h0FFFFFFF;
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
         seq_inst.memory_access_write_address_seq = 32'h01111111; 
         seq_inst.memory_access_read_address_seq =32'h02222222;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h03333333; 
          seq_inst.memory_access_read_address_seq =32'h01231111;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h01255837;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0354789; 
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
         seq_inst.memory_access_read_address_seq =32'h04578921;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h01342524; 
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
         seq_inst.memory_access_read_address_seq =32'hFFFFFFFF;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h04444360; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
       repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h05141416; 
         seq_inst.memory_access_read_address_seq =32'h05141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h05141415; 
          seq_inst.memory_access_read_address_seq =32'h05141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h098BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h098BBBA3; 
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
         seq_inst.memory_access_read_address_seq =32'h092542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h012542B4; 
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
         seq_inst.memory_access_read_address_seq =32'h00427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       
          
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00141416; 
         seq_inst.memory_access_read_address_seq =32'h00141417;

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
         seq_inst.memory_access_read_address_seq =32'h0F2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0F2542B4; 
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
         seq_inst.memory_access_read_address_seq =32'h0F427374;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0F427375; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h0C141416; 
         seq_inst.memory_access_read_address_seq =32'h0C141417;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h0C141415; 
          seq_inst.memory_access_read_address_seq =32'h07141416;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

                  repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h0B8BBBA4;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0B8BBBA3; 
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
         seq_inst.memory_access_read_address_seq =32'h0B2542B3;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h09999999; 
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
         seq_inst.memory_access_read_address_seq =32'h09523145;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0FFFFEEE; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
 




      
         //pmpcfg0 with TOR with  001 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h09090909;   //pmpcfg0 with TOR with 001 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
        //pmpcfg1 with TOR with  001 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h09090909;   //pmpcfg1 with TOR with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          //pmpcfg2 with TOR   001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h09090909;   //pmpcfg2 with TOR with 001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
         //pmpcfg3 with TOR with no  001
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h09090909;   //pmpcfg3 with TOR with write access  001
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h00000012;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h00000024;
         //seq_inst.csr_write_en_seq=1;
         
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h00000036;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h00000048;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h00000056;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h00000100;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h00000150;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h00001502;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
       

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h00001803;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
       
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h00001950;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h00002000;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h00002FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h00003FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h00004FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h00005FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h00006FFF;
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
         seq_inst.memory_access_write_address_seq = 32'h00001115; 
         seq_inst.memory_access_read_address_seq =32'h00001113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00001112; 
         seq_inst.memory_access_read_address_seq =32'h00001113;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00002999; 
          seq_inst.memory_access_read_address_seq =32'h00002999;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

      repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00003888;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00004777; 
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
         seq_inst.memory_access_read_address_seq =32'h00004666;

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
 

       
         //pmpcfg0 with NULL with  111 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h07070707;   //pmpcfg0 with NULL with 111 
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
       
       //pmpcfg2 with NULL   111
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h07070707;   //pmpcfg2 with NULL with 111
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 


       //pmpcfg3 with NULL with   111
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h07070707;   //pmpcfg3 with NULL with write access  111
         
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h00000F00;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h00000FAA;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h00000FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h0000F100;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h0000F1FF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h0000F2FF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h000F2FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h000F3FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h000F4FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
       
       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h000F5FFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h00F10F00;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h00FFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h0FF10000;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h0FF20000;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h0FF30000;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h0FFFFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
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
 




      
         //pmpcfg0 with TOR with  100 combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h0B0B0B0B;   //pmpcfg0 with TOR with 100 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg1 with TOR with  100 combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h0B0B0B0B;   //pmpcfg1 with TOR with 100
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg2 with TOR  100
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h0B0B0B0B;   //pmpcfg1 with TOR with 100
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        
          //pmpcfg3 with TOR with no  100
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h0B0B0B0B;   //pmpcfg3 with TOR with write access  100
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h000000FF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h00000FFA;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h0000FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h000FAAAA;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h000FCCCC;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h000FDDDD;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h000FEEEE;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h000FFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h00F20000;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h00F2FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h00F3FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

            repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h00F4FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h00F5FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h00F6FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h00F7FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h00F8FFFF;
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
         seq_inst.memory_access_write_address_seq = 32'h0000000F; 
         seq_inst.memory_access_read_address_seq =32'h00000000;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end
         
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h00000012;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h00000FF; 
          seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
             repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'hA; 
         seq_inst.memory_access_read_address_seq =32'h00078674;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0006AAAA; 
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
         seq_inst.memory_access_read_address_seq =32'h00004AAA;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0007CCCC; 
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
         seq_inst.memory_access_read_address_seq =32'h00000123;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00000AAA; 
         seq_inst.memory_access_read_address_seq =32'h0;

        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       
       
       
       
       
   
          repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h000F1999; 
         seq_inst.memory_access_read_address_seq =32'h000000AB;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_write_address_seq = 32'h0000CECE; 
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
         seq_inst.memory_access_read_address_seq =32'h000FFFFF;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00F8CDEF; 
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
         seq_inst.memory_access_read_address_seq =32'h00F7AAAA;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h00F6BBBB; 
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

      
      //pmpcfg0 with TOR with  MIX combination
        repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A0;
         seq_inst.csr_write_data_seq = 32'h0C0B0F09;   //pmpcfg0 with TOR with MIX 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg1 with TOR with  MIX combination
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h0B0F090C;   //pmpcfg1 with TOR with MIX
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg2 with TOR  MIX
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h080B0F09;   //pmpcfg1 with TOR with 100
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        
          //pmpcfg3 with TOR with MIX
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h0F08090B;   //pmpcfg3 with TOR with write access  MIX
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h000000FF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h00000FFA;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h0000FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h000FAAAA;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h000FCCCC;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h000FDDDD;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h000FEEEE;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h000FFFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
         
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h00F20000;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h00F2FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h00F3FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

            repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h00F4FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end
        
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h00F5FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h00F6FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h00F7FFFF;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h00F8FFFF;
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
     
         
 
 
    end
 `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass

 



