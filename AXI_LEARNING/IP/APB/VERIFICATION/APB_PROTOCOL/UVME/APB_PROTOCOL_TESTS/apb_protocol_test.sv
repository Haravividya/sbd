/***********************************************************

File name   : apb_protocol_test.svh
Description : Userdefine test is derived from uvm_test is inherirted from uvm_component.

The test defines - test scenario for test bench . 

The test class - contains - Environment , config properties , class overrides etc.

Sequence/Sequences - are created and started in the test.

Test case is a pattern to check and verify specific features and functionalities of a design. 
A verification plan - lists all features and other functional items that needs to verified and the tests needed to cover each one of them.

A lot of different tests are typically reqd to verify complex designs. 

Instead of writing same code for different testcases , we put entire TB into a container called an Environment. and
use the same environment : with different config for each test. 

***********************************************************/
class apb_protocol_test extends uvm_test;

  `uvm_component_utils(apb_protocol_test)

  //Declare Env and sequence 
  apb_protocol_env env;
  apb_protocol_sequence seq;

  function new (string name="apb_protocol_test", uvm_component parent=null);
    super.new(name, parent);
    `uvm_info("Test ", $sformatf("Initial Entry to Test"), UVM_LOW)
  endfunction : new

  // Create Env and sequence 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    env = apb_protocol_env :: type_id :: create("env",this);
    seq = apb_protocol_sequence :: type_id :: create("seq");
  endfunction : build_phase

//run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("Test file ", $sformatf(" Raising  objection : of Test"), UVM_LOW)

    phase.raise_objection(this);
    begin
      `uvm_info("Test file ", $sformatf("in Test , Goes to sequence : to start sequencer "), UVM_LOW)

      seq.scenario = 0;// presetn
      seq.start(env.agent.sequencer);

      seq.scenario = 1;
      repeat(5)
        begin
	  seq.start(env.agent.sequencer);
        end

      seq.scenario = 2;
      seq.transfer_seq=1; 
	  seq.read_write_seq=1; 
	  seq.apb_write_paddr_seq=22; 
	  seq.apb_write_data_seq=22; 
	  seq.apb_read_paddr_seq=22;
      seq.wait_time_seq  = 150;
      seq.start(env.agent.sequencer);

      seq.scenario = 0;// presetn , when presetn ==1
      seq.start(env.agent.sequencer);

      seq.scenario = 2;
      seq.transfer_seq=1; 
	  seq.read_write_seq=0; 
	  seq.apb_write_paddr_seq=22; 
	  seq.apb_write_data_seq=22; 
	  seq.apb_read_paddr_seq=22;
      seq.wait_time_seq  = 250;
      seq.start(env.agent.sequencer);

       repeat(100)
       begin
       seq.scenario = 2;
       seq.transfer_seq=1; 
       seq.read_write_seq=$urandom_range(0,1); 
       seq.apb_write_paddr_seq=$urandom_range(15,25);
       seq.apb_write_data_seq=$urandom_range(100,900);
       seq.apb_read_paddr_seq=$urandom_range(15,25);
       seq.wait_time_seq  = 150;
       seq.start(env.agent.sequencer);
       end


      `uvm_info("Test file ", $sformatf("in Test , All sequences executed"), UVM_LOW)
    end
    
    `uvm_info("Test file ", $sformatf(" Dropping objection : of Test"), UVM_LOW)
    phase.drop_objection(this);
	
    
  endtask :run_phase

endclass : apb_protocol_test

