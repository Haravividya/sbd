
class apb_slave2_rand_test extends uvm_test;

  `uvm_component_utils(apb_slave2_rand_test)
  //Declare Env and sequence 
   apb_slave2_env env;
   apb_slave2_rand_sequence seq;

    
   function new (string name="apb_slave2_test", uvm_component parent=null);
	super.new(name, parent);
	`uvm_info("Test ", $sformatf(" Entry to Test"), UVM_LOW)
   endfunction : new

  // Create Env and sequence 
   function void build_phase (uvm_phase phase);
   	super.build_phase(phase);
	env = apb_slave2_env :: type_id :: create("env",this);
	seq = apb_slave2_rand_sequence :: type_id :: create("seq");

   endfunction : build_phase

   //run phase
   task run_phase(uvm_phase phase);
	super.run_phase(phase);
  	
	phase.raise_objection(this);
   // forever
	begin
	//	`uvm_info("Test file ", $sformatf("in Test , to start sequencer : Goes to sequence"), UVM_LOW)

		seq.scenario = 0;// presetn
			seq.start(env.apb_slave2_agnt.sequencer);

		seq.scenario = 2;
            repeat(5)
            begin
		 	  seq.start(env.apb_slave2_agnt.sequencer);
            end
 //		seq.scenario = 3;
 //         repeat(5)
 //         begin
 //		 	  seq.start(env.apb_slave2_agnt.sequencer);
 //         end


		repeat(30)
           begin
			seq.scenario     = 1;
			seq.paddr_seq    =$urandom_range(64'h95,64'h105);
			seq.pwdata_seq   =$urandom_range(64'h100,64'h999);
			seq.pwrite_seq   =$urandom_range(0,1);
			seq.psel1_seq    =$urandom_range(0,1);
            seq.penable_seq  =$urandom_range(0,1);          
			seq.start(env.apb_slave2_agnt.sequencer);
		   end




	//	`uvm_info("Test file ", $sformatf("in Test , post starting the sequencer "), UVM_LOW)
	end
    repeat (20)@(posedge env.apb_slave2_agnt.driver.intf.pclock)
     	phase.drop_objection(this);
	
    //	`uvm_info("Test file ", $sformatf(" Dropping objection : of Test"), UVM_LOW)

    endtask :run_phase

endclass : apb_slave2_rand_test
