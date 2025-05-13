class pc_agent extends uvm_agent;

  `uvm_component_utils(pc_agent)

  pc_driver    pc_drive;
  pc_monitor   pc_mon;
  pc_sequencer pc_seqr;


  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase); 
    pc_drive  = pc_driver::type_id::create("pc_drive",this);
    pc_mon    = pc_monitor::type_id::create("pc_mon",this);
    pc_seqr   = pc_sequencer::type_id::create("pc_seqr",this);
  endfunction


  function void connect_phase(uvm_phase phase);
    pc_drive.seq_item_port.connect(pc_seqr.seq_item_export);
  endfunction

endclass :pc_agent
