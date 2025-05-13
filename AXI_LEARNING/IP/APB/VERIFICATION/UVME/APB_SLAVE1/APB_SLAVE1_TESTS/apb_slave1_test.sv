
class apb_slave1_test extends uvm_test;

  `uvm_component_utils(apb_slave1_test)
  //Declare Env and sequence 
   apb_slave1_env env;
   apb_slave1_sequence seq;

    
   function new (string name="apb_slave1_test", uvm_component parent=null);
      super.new(name, parent);
      `uvm_info("Test ", $sformatf(" Entry to Test"), UVM_LOW)
   endfunction : new

   // Create Env and sequence 
   function void build_phase (uvm_phase phase);
      super.build_phase(phase);
      env = apb_slave1_env :: type_id :: create("env",this);
      seq = apb_slave1_sequence :: type_id :: create("seq");
   endfunction : build_phase

   //run phase
   task run_phase(uvm_phase phase);
      super.run_phase(phase);  	
      phase.raise_objection(this);
   // forever
	begin
	//`uvm_info("Test file ", $sformatf("in Test , to start sequencer : Goes to sequence"), UVM_LOW)

	    seq.scenario = 0;// presetn
	     seq.start(env.apb_slave1_agnt.sequencer);

	    seq.scenario = 2;
            repeat(5)
            begin
	       seq.start(env.apb_slave1_agnt.sequencer);
            end
 		
	    seq.scenario = 3;
            repeat(5)
            begin
 	       seq.start(env.apb_slave1_agnt.sequencer);
            end

	    seq.scenario     = 1;           			
	     seq.paddr_seq    = 11;
	     seq.pwdata_seq   = 200;
	     seq.pwrite_seq   = 1;
	     seq.psel1_seq    = 1;
	     seq.penable_seq  = 1;			
	     seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
	        seq.paddr_seq    = 11;
		seq.pwdata_seq   = 300;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 12;
		seq.pwdata_seq   = 300;
		seq.pwrite_seq   = 1;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 12;
		seq.pwdata_seq   = 400;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

    /* 
            seq.scenario     = 1;           			
			seq.paddr_seq    = 13;
			seq.pwdata_seq   = 750;
			seq.pwrite_seq   = 1;
			seq.psel1_seq    = 1;
			seq.penable_seq  = 1;			
			seq.start(env.apb_slave1_agnt.sequencer);
      */

            seq.scenario     = 1;           			
	     	seq.paddr_seq    = 13;
		seq.pwdata_seq   = 500;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);


            seq.scenario     = 1;           			
		seq.paddr_seq    = 14;
		seq.pwdata_seq   =250;
		seq.pwrite_seq   = 1;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);
            
            seq.scenario     = 1;           			
		seq.paddr_seq    = 314;
		seq.pwdata_seq   =250;
		seq.pwrite_seq   = 1;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 314;
		seq.pwdata_seq   =250;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);


            seq.scenario     = 1;           			
		seq.paddr_seq    = 15;
		seq.pwdata_seq   =78;
		seq.pwrite_seq   = 1;
		seq.psel1_seq    = 0;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 15;
		seq.pwdata_seq   =250;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 0;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 16;
		seq.pwdata_seq   = 85;
		seq.pwrite_seq   = 1;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 0;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 16;
		seq.pwdata_seq   =250;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 0;			
		seq.start(env.apb_slave1_agnt.sequencer);

	repeat(20)
           begin
	    seq.scenario     = 1;
		seq.paddr_seq    =$urandom_range(10,15);
		seq.pwdata_seq   =$urandom_range(100,999);
		seq.pwrite_seq   =$urandom_range(0,1);
		seq.psel1_seq    =1;
                seq.penable_seq  =1;          
	        seq.start(env.apb_slave1_agnt.sequencer);
          end

            seq.scenario     = 1;           			
		seq.paddr_seq    = 32'hffffffff;
		seq.pwdata_seq   = 32'hffffffff;
		seq.pwrite_seq   = 1;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 32'hffffffff;
		seq.pwdata_seq   = 400;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);


            seq.scenario     = 1;           			
		seq.paddr_seq    = 32'hff;
		seq.pwdata_seq   = 32'hffffffff;
		seq.pwrite_seq   = 1;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 32'hff;
		seq.pwdata_seq   = 400;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 32'hff;
		seq.pwdata_seq   = 400;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario = 0;// presetn
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 32'hff;
		seq.pwdata_seq   = 32'hffffffff;
		seq.pwrite_seq   = 1;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

            seq.scenario     = 1;           			
		seq.paddr_seq    = 32'hff;
		seq.pwdata_seq   = 400;
		seq.pwrite_seq   = 0;
		seq.psel1_seq    = 1;
		seq.penable_seq  = 1;			
		seq.start(env.apb_slave1_agnt.sequencer);

       	repeat(20)
           begin
	    seq.scenario     = 1;
		seq.paddr_seq    =$urandom_range(10,15);
		seq.pwdata_seq   =$urandom_range(100,999);
		seq.pwrite_seq   =$urandom_range(0,1);
		seq.psel1_seq    =1;
                seq.penable_seq  =1;          
		seq.start(env.apb_slave1_agnt.sequencer);
         end

	//`uvm_info("Test file ", $sformatf("in Test , post starting the sequencer "), UVM_LOW)
 end
    repeat (20)@(posedge env.apb_slave1_agnt.driver.intf.pclock)
     	phase.drop_objection(this);
	
    //	`uvm_info("Test file ", $sformatf(" Dropping objection : of Test"), UVM_LOW)

    endtask :run_phase

endclass : apb_slave1_test
