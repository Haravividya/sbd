class csr_agent extends uvm_agent;
	`uvm_component_utils(csr_agent)
	
//constructor
	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction
	
 //declaring agent components
	csr_driver driver;
	csr_sequencer sequencer;
	csr_monitor monitor;
	
 //build phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		driver = csr_driver::type_id::create("driver", this);
		sequencer = csr_sequencer::type_id::create("sequencer", this);
		monitor = csr_monitor::type_id::create("monitor", this);
	endfunction
	
 //connect_phase
	function void connect_phase(uvm_phase phase);
	begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
	endfunction
endclass
