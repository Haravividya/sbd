class csr_sequencer extends uvm_sequencer #(csr_seqitem);
//factory registration
	`uvm_component_utils(csr_sequencer)
//constructor
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction  
endclass
		
