class jtag_test extends uvm_test;

  `uvm_component_utils(jtag_test)
  //Declare Env and sequence 
  jtag_env env;
  jtag_sequence seq;
  bit TMS_array[];

  function new (string name="jtag_test", uvm_component parent=null);
    super.new(name, parent);
	`uvm_info("Test ", $sformatf(" Entry to Test"), UVM_LOW)
  endfunction : new

  // Create Env and sequence 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	env = jtag_env :: type_id :: create("env",this);
	seq = jtag_sequence :: type_id :: create("seq");
  endfunction : build_phase

   //run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);  	
    phase.raise_objection(this);
    begin
      `uvm_info("Test file ", $sformatf("in Test , to start sequencer : Goes to sequence"), UVM_LOW)


      `uvm_info("Driver ", $sformatf("Driving : RESET via TRST "), UVM_LOW)

      seq.scenario = 0;// reset - with TRST
      seq.start(env.agt.sqr);

    
      seq.scenario = 1;
      seq.TMS_seq = 0; //Run_test- IDLE
      seq.start(env.agt.sqr);

      `uvm_info("Driver ", $sformatf("Driving : BYPASS reg selection  "), UVM_LOW)
      //shift BYPASS instruction in Shift_IR state :: 4'hF
      TMS_array={0,1,1,0,  
	             0,0,0,0,  
	             1,0,1,1,  
                 1,0,0,  
	             0,0,0,0, 
                 1,0,1,1,0};  
	
      // 0 - Run-Test , 1- Select DR Scan, 1 - Select IR Scan , 0-Capture IR ,0-Shift IR
      // 4 times 0 : to put Instruction related TDI into IR  (By default : 0001 in IR)
      // 1- Exit1-IR , 0 - Pause IR , 1- Exit2-IR , 1-Update IR 
      // 1- Select DR Scan, 0 - Capture DR , 0-Shift DR ,
      // 4 times 0 : to put data for Bypass ,
      // 1 - Exit DR , 0 - Pause DR , 1- Exit2-DR , 1 - Update DR , 1- Idle	
	
      seq.TDI_seq=1;
      foreach(TMS_array[i])
      begin
        seq.TMS_seq=TMS_array[i];
         `uvm_info (" Test ",$sformatf(" %t , TMS  : %d " , $realtime, seq.TMS_seq), UVM_LOW)
	seq.start(env.agt.sqr);
      end 


		
      //Shift IDCODE : instr_reg_out = 4'h2 , 4'b0010 
      seq.scenario = 1;
      `uvm_info("Driver ", $sformatf("Driving : IDCODE reg selection  "), UVM_LOW)
      TMS_array={0,1,1,0,  
                 0,0,0,0,  
	             1,0,1,1,  
                 1,0,0,  
	             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                 1,0,1,1,0};
	
      seq.TDI_seq = 1;
      foreach(TMS_array[i])
      begin
        seq.TMS_seq=TMS_array[i];
        if(i==4)  //0010 : instr_reg_out
          seq.TDI_seq = 0;
        else if(i==5)
          seq.TDI_seq = 0;
        else if (i==6)
          seq.TDI_seq = 1;
        else if (i==7)
	      seq.TDI_seq = 0;
        else 
          seq.TDI_seq = 1;
        seq.start(env.agt.sqr);
      end 
	
	
      //Shift USERCODE reg : instr_reg_out : 4'h6 , 4'b 0110
      `uvm_info("Driver ", $sformatf("Driving : USERCODE reg selection  "), UVM_LOW)
      TMS_array={0,1,1,0,  
                 0,0,0,0,  
	             1,0,1,1,  
                 1,0,  
	             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 
                 1,0,1,1,0};
	
      seq.TDI_seq = 1;
      foreach(TMS_array[i])
      begin
      seq.TMS_seq=TMS_array[i];
        if(i==4)  //0110 : instr_reg_out
          seq.TDI_seq = 0;
        else if(i==5)
          seq.TDI_seq = 1;
        else if (i==6)
          seq.TDI_seq = 1;
        else if (i==7)
	      seq.TDI_seq = 0;
        else 
          seq.TDI_seq = 1;
        seq.start(env.agt.sqr);
      end 


	
    //Shift USERDATA reg : instr_reg_out :  4'h8 , 4'b1000
      seq.user_data_in_seq = 8'h86; //8 bit value
      `uvm_info("Driver ", $sformatf("Driving : USERDATA reg selection  "), UVM_LOW)
      TMS_array={0,1,1,0,  
                 0,0,0,0,  
	             1,0,1,1,  
                 1,0,  
	             0,0,0,0,0,0,0,0,0, 
                 1,0,1,1,0};
	
      seq.TDI_seq = 1;
      foreach(TMS_array[i])
      begin
      seq.TMS_seq=TMS_array[i];
        if(i==4)  //1000 : instr_reg_out
          seq.TDI_seq = 1;
        else if(i==5)
          seq.TDI_seq = 0;
        else if (i==6)
          seq.TDI_seq = 0;
        else if (i==7)
	      seq.TDI_seq = 0;
        else 
          seq.TDI_seq = 1;
        seq.start(env.agt.sqr);
      end 

      `uvm_info("Driver ", $sformatf("Driving : Stay IDLE  "), UVM_LOW)
      //Stay idle 
      seq.TMS_seq = 0;
      seq.start(env.agt.sqr);
      seq.TMS_seq = 0;
      seq.start(env.agt.sqr);
      seq.TMS_seq = 0;
      seq.start(env.agt.sqr);

      `uvm_info("Driver ", $sformatf("Driving : RESET  "), UVM_LOW)	
      //Go to reset : 5 times TMS
      seq.TMS_seq = 1;
      seq.start(env.agt.sqr);
      seq.TMS_seq = 1;
      seq.start(env.agt.sqr);
      seq.TMS_seq = 1;
      seq.start(env.agt.sqr);
      seq.TMS_seq = 1;
      seq.start(env.agt.sqr);
      seq.TMS_seq = 1;
      seq.start(env.agt.sqr);
      

     
      seq.scenario = 0;// reset - with TRST
      seq.start(env.agt.sqr);


      //Shift DR without loadng any instruction to IR
      seq.user_data_in_seq = 8'h0;
      seq.scenario = 1;
      `uvm_info("Driver ", $sformatf("Driving : selecting DR path without loading IR  "), UVM_LOW)
      TMS_array={0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0};
      seq.TDI_seq = 1;
      foreach(TMS_array[i])
      begin
        seq.TMS_seq=TMS_array[i];
        seq.start(env.agt.sqr);
      end
	
      //Shortest path for IR ,then read default TDO in shift_DR 
      seq.scenario = 1;
      `uvm_info("Driver ", $sformatf("Driving : shortest path for IR  "), UVM_LOW)
      TMS_array={0,1,1,0,  1,1,1,0,0,  0,0,0,0,  1,1,0};
      seq.TDI_seq = 1;
      foreach(TMS_array[i])
      begin
        seq.TMS_seq=TMS_array[i];
        seq.start(env.agt.sqr);
      end

      // loading instruction with pause in between
      seq.scenario = 1;
      `uvm_info("Driver ", $sformatf("Driving : loading instruction with pause in between  "), UVM_LOW)
      TMS_array={0,1,1,0,0, 0,0, 1,0,0,0,0,0, 1,0, 0,0, 1,1,  1,0,0,  0,0,0,0,0,0,0,0,  1,1,0};
      seq.TDI_seq = 1;
      seq.user_data_in_seq = 8'h86; //8 bit value
      foreach(TMS_array[i])
      begin
        seq.TMS_seq=TMS_array[i];
        
        if(i==5)  //1000 : instr_reg_out
          seq.TDI_seq = 1;
        else if(i==6)
          seq.TDI_seq = 0;
        else if (i==15)
          seq.TDI_seq = 0;
        else if (i==16)
	      seq.TDI_seq = 0;
        else 
          seq.TDI_seq = 1;
        seq.start(env.agt.sqr);
      end
      
      // shifting DR with pause in between
      seq.scenario = 1;
      `uvm_info("Driver ", $sformatf("Driving : loading instruction with pause in between  "), UVM_LOW)
      TMS_array={0,1,0,1,0,  0,0,0,0,   1,0,  0,0,0,  1,1,0};
      seq.TDI_seq = 1;
      //seq.user_data_in_seq = 8'h86; //8 bit value
      foreach(TMS_array[i])
      begin
        seq.TMS_seq=TMS_array[i];
        seq.start(env.agt.sqr);
      end
      
      `uvm_info("Test file ", $sformatf("in Test , post starting the sequencer "), UVM_LOW)
    end
    phase.drop_objection(this);
	
    `uvm_info("Test file ", $sformatf(" Dropping objection : of Test"), UVM_LOW)

  endtask :run_phase

endclass : jtag_test
