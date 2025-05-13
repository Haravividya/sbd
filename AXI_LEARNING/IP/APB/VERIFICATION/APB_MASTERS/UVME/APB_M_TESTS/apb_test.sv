class apb_test extends uvm_test;
 
  apb_env env;
  apb_sequence seqce;
  apb_driver drv;
 
  `uvm_component_utils(apb_test)
 
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    env = apb_env::type_id::create("env",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    begin
      seqce = apb_sequence::type_id::create("seqce",this);    
      
      seqce.scenario  = 1;		//write random
      seqce.read_writet = 0;
      //seqce.apb_write_paddrt = 32'h14255429;
      seqce.transfert =1;
      seqce.start(env.agn.seq);
      
      seqce.scenario  = 2;		//write fixed data
      seqce.read_writet = 0;
      seqce.apb_write_datat = 32'h00000000;
      seqce.transfert =1;
      seqce.start(env.agn.seq);

      seqce.scenario  = 3;		//write fixed data   
      seqce.read_writet = 0;
      seqce.apb_write_datat = 32'hffffffff;
      seqce.transfert =1;
      seqce.start(env.agn.seq);

      seqce.scenario  = 4;		//read random address
      seqce.read_writet = 1;
      //seqce.apb_write_paddrt = 32'h14255429;
      seqce.transfert =1;
      seqce.start(env.agn.seq);

      seqce.scenario  = 5;		//read fixed address 
      seqce.read_writet = 1;
      seqce.apb_read_paddrt = 32'h00000000;
      seqce.transfert =1;
      seqce.start(env.agn.seq);

      seqce.scenario  = 6;		//read fixed address 
      seqce.read_writet = 1;
      seqce.apb_read_paddrt = 32'hffffffff;
      seqce.transfert =1;
      seqce.start(env.agn.seq);

      seqce.scenario  = 7;		//no transfer 
      seqce.read_writet = 1;
      seqce.apb_read_paddrt = 32'h55555555;
      seqce.transfert =0;
      seqce.start(env.agn.seq);

      seqce.scenario  = 8;		//no transfer write
      seqce.read_writet = 0;
      //seqce.apb_write_paddrt = 32'hffffffff;
      seqce.transfert =0;
      seqce.start(env.agn.seq); 
     
      seqce.scenario  = 4;		//read random address
      seqce.read_writet = 1;
      //seqce.apb_write_paddrt = 32'h14255429;
      seqce.transfert =1;
      seqce.start(env.agn.seq);


      //seqce.scenario  = 2;		//read
      //seqce.start(env.agn.seq);

    phase.phase_done.set_drain_time(this, 20ns);

    end
    phase.drop_objection(this);

  endtask

endclass
