class apb_slave2_64_test extends uvm_test;

  `uvm_component_utils(apb_slave2_64_test)
  //Declare Env and sequence 
   apb_slave2_env env;
   apb_slave2_64_sequence seq;

    
   function new (string name="apb_slave2_test", uvm_component parent=null);
	super.new(name, parent);
	`uvm_info("Test ", $sformatf(" Entry to Test"), UVM_LOW)
   endfunction : new

  // Create Env and sequence 
   function void build_phase (uvm_phase phase);
   	super.build_phase(phase);
	env = apb_slave2_env :: type_id :: create("env",this);
	seq = apb_slave2_64_sequence :: type_id :: create("seq");

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





			seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h11;
			seq.pwdata_seq   = 64'h200;
	     	seq.pwrite_seq   = 1;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);



		//	seq.scenario = 0;// presetn
		//	seq.start(env.apb_slave2_agnt.sequencer);



            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h11;
			seq.pwdata_seq   = 64'h300;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);

            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h12;
			seq.pwdata_seq   = 64'h300;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 0;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);

            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h12;
			seq.pwdata_seq   = 64'h400;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 0;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);
			
			
			seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h12;
			seq.pwdata_seq   = 64'h300;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 0;
			seq.penable_seq  = 0;			
			seq.start(env.apb_slave2_agnt.sequencer);

            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h12;
			seq.pwdata_seq   = 64'h400;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 0;
			seq.penable_seq  = 0;			
			seq.start(env.apb_slave2_agnt.sequencer);

    /* 
            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h13;
			seq.pwdata_seq   = 64'h750;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);
      */

            seq.scenario     = 1;           			
	     	seq.paddr_seq    = 64'h13;
			seq.pwdata_seq   = 64'h500;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 0;			
			seq.start(env.apb_slave2_agnt.sequencer);


            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h14;
			seq.pwdata_seq   = 64'h250;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 0;			
			seq.start(env.apb_slave2_agnt.sequencer);
			
			
			seq.scenario     = 1;           			
	     	seq.paddr_seq    = 64'h13;
			seq.pwdata_seq   = 64'h500;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 0;
			seq.penable_seq  = 0;			
			seq.start(env.apb_slave2_agnt.sequencer);


            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h14;
			seq.pwdata_seq   = 64'h250;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 0;
			seq.penable_seq  = 0;			
			seq.start(env.apb_slave2_agnt.sequencer);
			
			
			
			seq.scenario     = 1;           			
			seq.paddr_seq    = 64'100;
			seq.pwdata_seq   = 64'h250;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);

            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h100;
			seq.pwdata_seq   = 64'h250;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);
            
            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h314;
			seq.pwdata_seq   = 64'h250;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);

            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h314;
			seq.pwdata_seq   = 64'h250;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);


            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h15;
			seq.pwdata_seq   = 64'h78;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 0;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);

            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h15;
			seq.pwdata_seq   = 64'h250;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 0;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave2_agnt.sequencer);

            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h16;
			seq.pwdata_seq   = 64'h85;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 0;			
			seq.start(env.apb_slave2_agnt.sequencer);

            seq.scenario     = 1;           			
			seq.paddr_seq    = 64'h16;
			seq.pwdata_seq   = 64'h250;
			seq.pwrite_seq   = 0;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 0;			
			seq.start(env.apb_slave2_agnt.sequencer);




		repeat(20)
           begin
			seq.scenario     = 1;
			seq.paddr_seq    =$urandom_range(64'h10,64'h15);
			seq.pwdata_seq   =$urandom_range(64'h100,64'h999);
			seq.pwrite_seq   =$urandom_range(0,1);
			seq.psel1_seq    =1;
            seq.penable_seq  =1;          
			seq.start(env.apb_slave2_agnt.sequencer);
		   end




	//	`uvm_info("Test file ", $sformatf("in Test , post starting the sequencer "), UVM_LOW)
	end
    repeat (20)@(posedge env.apb_slave2_agnt.driver.intf.pclock)
     	phase.drop_objection(this);
	
    //	`uvm_info("Test file ", $sformatf(" Dropping objection : of Test"), UVM_LOW)

    endtask :run_phase

endclass : apb_slave2_64_test


