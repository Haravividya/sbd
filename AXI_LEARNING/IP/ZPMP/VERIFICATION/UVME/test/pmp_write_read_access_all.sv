//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////Copyright © 2022 Vivartan Technologies., All rights reserved////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
//All works published under Zilla_Gen_0 by Vivartan Technologies is copyrighted by the Association and ownership// 
//of all right, title and interest in and to the works remains with Vivartan Technologies. No works or documents//
//published under Zilla_Gen_0 by Vivartan Technologies may be reproduced,transmitted or copied without the expre//
//-ss written permission of Vivartan Technologies will be considered as a violations of Copyright Act and it may//
//lead to legal action.                                                                                         //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////
* File Name : pmp_write_read_access_all.sv

* Purpose :

* Creation Date : 13-12-2022

* Last Modified : Wed 21 Dec 2022 04:10:21 PM IST

* Created By :  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

class pmp_write_read_access_all extends pmp_base_test_tb;
 
  `uvm_component_utils(pmp_write_read_access_all)
 
// pmp_agent_tb agent_inst;
 
  function new(string name = "pmp_write_read_access_all",uvm_component parent=null);
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

      // Scenario-7:Write operation:ALL
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
         seq_inst.csr_write_data_seq = 32'h07170F1F;   //pmpcfg0 with ALL with both read and write access OFF,NA4,TOR,NAPOT
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        //pmpcfg1 with ALL with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A1;
         seq_inst.csr_write_data_seq = 32'h1D00170F;   //pmpcfg1 with ALL with both read and write access WITH NAPOT,NULL,NA4,TOR 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

         //pmpcfg2 with NAPOT with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A2;
         seq_inst.csr_write_data_seq = 32'h17190F00;   //pmpcfg1 with NAPOT with both read and write access 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end

          //pmpcfg3 with NAPOT with both read and write access
       repeat(1) 
	    begin 

         seq_inst.csr_write_addr_seq = 12'h3A3;
         seq_inst.csr_write_data_seq = 32'h170F001F;   //pmpcfg1 with NAPOT with both read and write access 
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B0;
         seq_inst.csr_write_data_seq=32'h14141414;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B1;
         seq_inst.csr_write_data_seq=32'h188BBBA2;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B2;
         seq_inst.csr_write_data_seq=32'h182542B2;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B3;
         seq_inst.csr_write_data_seq=32'h52427372;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          
       
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B4;
         seq_inst.csr_write_data_seq=32'h15141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B5;
         seq_inst.csr_write_data_seq=32'h198BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

           repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B6;
         seq_inst.csr_write_data_seq=32'h192542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B7;
         seq_inst.csr_write_data_seq=32'h62427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         
       
      
        repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B8;
         seq_inst.csr_write_data_seq=32'h16141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3B9;
         seq_inst.csr_write_data_seq=32'h1A8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BA;
         seq_inst.csr_write_data_seq=32'h1A2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BB;
         seq_inst.csr_write_data_seq=32'h72427373;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

       repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BC;
         seq_inst.csr_write_data_seq=32'h17141413;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BD;
         seq_inst.csr_write_data_seq=32'h1B8BBBA3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

         repeat(2)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BE;
         seq_inst.csr_write_data_seq=32'h1B2542B3;
         //seq_inst.csr_write_en_seq=1;
         seq_inst.pmp_en_seq = 0;
         seq_inst.kernel_mode_signal_seq = 0;

          seq_inst.start(env_inst.agent_inst.sequencer_inst);

         end

          repeat(1)
        begin
         seq_inst.csr_write_addr_seq = 12'h3BF;
         seq_inst.csr_write_data_seq=32'h82427373;
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
          seq_inst.kernel_mode_signal_seq = 1;
        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

          
        repeat(1) 
        begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h198BBBA4;
         seq_inst.kernel_mode_signal_seq = 1;
          seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 
       repeat(1) 
	    begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_read_en_seq = 0;
         seq_inst.memory_access_write_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h198BBBA3; 
          seq_inst.memory_access_read_address_seq =32'h0;
          seq_inst.kernel_mode_signal_seq = 1;
        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

        

         repeat(1)
         begin
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h192542B3;
         seq_inst.kernel_mode_signal_seq = 1; 
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
         seq_inst.pmp_en_seq = 1;
         seq_inst.memory_access_write_en_seq = 0;
         seq_inst.memory_access_read_en_seq = 1;
         seq_inst.memory_access_write_address_seq = 32'h0; 
         seq_inst.memory_access_read_address_seq =32'h1B2542B3;
           seq_inst.kernel_mode_signal_seq = 1;
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
         seq_inst.kernel_mode_signal_seq = 1;
        // seq_inst.csr_write_addr_seq = 12'h3B0;

         seq_inst.start(env_inst.agent_inst.sequencer_inst);
        end 

           end
 `uvm_info(get_name(),$sformatf("step 6 : inside test done "),UVM_MEDIUM)

    phase.drop_objection(this);
   // uvm_test_done.set_drain_time(this,50000);
  endtask
 
endclass

 



