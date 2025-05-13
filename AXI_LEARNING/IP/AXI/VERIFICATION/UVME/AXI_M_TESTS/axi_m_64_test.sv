class axi_m_64_test extends uvm_test;

   axi_m_env env;
   axi_m_64_sequence seq;
   axi_m_driver driver;

   `uvm_component_utils(axi_m_64_test)

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    env = axi_m_env :: type_id :: create("env",this);
  endfunction

  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);

    begin
      seq = axi_m_64_sequence :: type_id :: create("seq",this);

      seq.scenario  = 0;
      seq.start(env.agent.sequencer); 

      seq.scenario        = 2;

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b00;
      seq.wr_addr1_seq    = 3'b111;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b00;
      seq.wr_addr1_seq    = 3'b110;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 
    
      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b00;
      seq.wr_addr1_seq    = 3'b101;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b00;
      seq.wr_addr1_seq    = 3'b100;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b00;
      seq.wr_addr1_seq    = 3'b011;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b00;
      seq.wr_addr1_seq    = 3'b010;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer);

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b00;
      seq.wr_addr1_seq    = 3'b001;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b00;
      seq.wr_addr1_seq    = 3'b000;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.scenario        = 3;

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b01;
      seq.wr_addr2_seq    = 2'b11;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b01;
      seq.wr_addr2_seq    = 2'b10;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b01;
      seq.wr_addr2_seq    = 2'b01;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b01;
      seq.wr_addr2_seq    = 2'b00;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.scenario        = 4;

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b10;
      seq.wr_addr3_seq    = 1'b1;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b10;
      seq.wr_addr3_seq    = 1'b0;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.scenario        = 5;

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b11;
      seq.w_resp_seq        = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b11;
      seq.w_resp_seq        = 2'b11;
      seq.start(env.agent.sequencer); 

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'b1z;
      seq.w_resp_seq      = 2'b00;
      seq.start(env.agent.sequencer);

      seq.wr_en_seq       = 1;
      seq.rd_en_seq       = 0;
      seq.byte_seq        = 2'bz1;
      seq.w_resp_seq      = 2'b00;
      seq.start(env.agent.sequencer);

      seq.scenario        = 6;
      seq.wr_en_seq       = 0;
      seq.rd_en_seq       = 1;
      seq.r_resp_seq      = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.scenario        = 6;
      seq.wr_en_seq       = 0;
      seq.rd_en_seq       = 1;
      seq.r_resp_seq      = 2'b11;
      seq.start(env.agent.sequencer); 

      seq.scenario        = 6;
      seq.wr_en_seq       = 0;
      seq.rd_en_seq       = 1;
      seq.r_resp_seq      = 2'b00;
      seq.start(env.agent.sequencer); 

      seq.scenario  = 0;
      seq.start(env.agent.sequencer);

    end
    phase.drop_objection(this);
    
   
  endtask

endclass

