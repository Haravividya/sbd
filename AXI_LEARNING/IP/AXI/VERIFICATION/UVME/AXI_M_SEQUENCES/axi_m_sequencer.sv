class axi_m_sequencer extends uvm_sequencer#(axi_m_seq_item);

  `uvm_component_utils(axi_m_sequencer)


  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction


endclass
