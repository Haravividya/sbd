/*************************************************
File name:pmp_driver_tb.sv
Description:

**************************************************/

class pmp_driver_tb extends uvm_driver #(pmp_seq_item_tb);
  `uvm_component_utils(pmp_driver_tb)

  virtual pmp_interface_tb interface_inst;
  pmp_seq_item_tb seq_item_inst;


  function new (string name = "pmp_driver_tb", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	
    // uvm_config_db#(virtual interface_tb)::get(this, "", "INTERFACE_INST_DB", interface_inst);
	  if(!uvm_config_db#(virtual pmp_interface_tb)::get(this, "", "INTERFACE_INST_DB", interface_inst))
        `uvm_fatal("NO_VIF",{"virtual interface must be set for: ", get_full_name(),".interface_inst"})
  endfunction

  
  // important
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
     interface_inst.csr_rst=0;
    interface_inst.csr_write_addr=0;
    interface_inst.csr_write_data=0;

        interface_inst.csr_write_en =0;
        interface_inst.kernel_mode_signal=0;
        interface_inst.machine_mode_valid =0;
         interface_inst.csr_read_en =0;
         interface_inst.csr_read_addr=0;
         interface_inst.pmp_en=0;
          interface_inst.memory_access_write_en=0;
           interface_inst.memory_access_read_en=0;
           interface_inst.memory_access_write_address=0;
           interface_inst.memory_access_read_address=0;
    repeat(2) 
      begin
        @(negedge interface_inst.clk);
          interface_inst.csr_rst = ~interface_inst.csr_rst; // toggle reset
      end


	forever
	begin
	
      seq_item_port.get_next_item(seq_item_inst);
	  
	  `uvm_info(get_name(),$sformatf("step 3 : inside driver - run phase "),UVM_MEDIUM)
      
      @(negedge interface_inst.clk);


	  // sequence item to interface -> this will reach RTL
       interface_inst.csr_rst  = seq_item_inst.csr_rst;

      interface_inst.csr_write_addr = seq_item_inst.csr_write_addr ;// data in which will be random vlaue
      interface_inst.csr_write_en   = seq_item_inst.csr_write_en ;
      interface_inst.csr_write_data = seq_item_inst.csr_write_data ;
      interface_inst.kernel_mode_signal = seq_item_inst.kernel_mode_signal ;
      interface_inst.machine_mode_valid = seq_item_inst.machine_mode_valid;
      interface_inst.csr_read_en = seq_item_inst.csr_read_en;
      interface_inst.csr_read_addr = seq_item_inst.csr_read_addr ;
      interface_inst.pmp_en = seq_item_inst.pmp_en;
      interface_inst.memory_access_write_en = seq_item_inst.memory_access_write_en;
      interface_inst.memory_access_write_address = seq_item_inst.memory_access_write_address;
      interface_inst.memory_access_read_en = seq_item_inst.memory_access_read_en;
      interface_inst.memory_access_read_address = seq_item_inst.memory_access_read_address;



	  
	   



      `uvm_info(get_name(),$sformatf("step 4 : inside driver - run phase - done"),UVM_MEDIUM)
      
      seq_item_port.item_done();
	
	end
	
  endtask

endclass





