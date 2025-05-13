class axi_m_env extends uvm_env;

   axi_m_agent agent;
   axi_m_scoreboard scoreboard;
 
   `uvm_component_utils(axi_m_env)

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    agent      = axi_m_agent :: type_id :: create("agent",this);
    scoreboard = axi_m_scoreboard::type_id::create("scoreboard",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    agent.analysis_port_agent.connect(scoreboard.analysis_imp_scoreboard);
  endfunction
  
endclass
