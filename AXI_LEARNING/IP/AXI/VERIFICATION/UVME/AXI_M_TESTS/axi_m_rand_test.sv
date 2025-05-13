class axi_m_rand_test extends uvm_test;

   axi_m_env env;
   axi_m_rand_sequence rand_seq;
   axi_m_driver driver;

   `uvm_component_utils(axi_m_rand_test)

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    env = axi_m_env :: type_id :: create("env",this);
  endfunction

  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);

     begin
      rand_seq = axi_m_rand_sequence :: type_id :: create("rand_seq",this);

      rand_seq.scenario  = 1;
      rand_seq.start(env.agent.sequencer); 

      rand_seq.scenario        = 2;
      rand_seq.wr_en_seq       = 1;
      rand_seq.rd_en_seq       = 0;
      rand_seq.start(env.agent.sequencer); 

      rand_seq.scenario        = 3;
      rand_seq.wr_en_seq       = 0;
      rand_seq.rd_en_seq       = 1;
      rand_seq.start(env.agent.sequencer); 

      rand_seq.scenario  = 1;
      rand_seq.start(env.agent.sequencer);

    
     end

    phase.drop_objection(this);
    
   
  endtask

endclass

