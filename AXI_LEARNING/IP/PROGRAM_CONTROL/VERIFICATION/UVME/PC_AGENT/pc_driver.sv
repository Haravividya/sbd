class pc_driver extends uvm_driver#(pc_seq_item);

  `uvm_component_utils(pc_driver)

  virtual pc_interface pc_vif;
  pc_seq_item pc_item;

  function new(string name="pc_driver",uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(virtual pc_interface)::get(this,"","intf",pc_vif))
      `uvm_error("Driver","No resource found")
  endfunction

  task run_phase(uvm_phase phase);
    forever  
    begin
      seq_item_port.get_next_item(pc_item);
      if(pc_item.z_rst == 0)
      begin
       pc_vif.z_rst =0;
       pc_vif.branch_valid_i        = 0;
       pc_vif.branch_pc_i           = 0;
       pc_vif.csr_mepc_i            = 0;
       pc_vif.csr_mtvec_i           = 0;
       pc_vif.csr_mstatus_mie_i     = 0;
       pc_vif.mret_valid_i          = 0;
       pc_vif.stall_valid_i         = 0;
       pc_vif.zic_int_req_i         = 0;
       pc_vif.zic_mmr_ack_id_i      = 0;
       pc_vif.z_instruction_i       = 0;
       pc_vif.invalid_instr_valid_i = 0;
       pc_vif.breakpoint_valid_i    = 0;
       pc_vif.ecall_valid_i         = 0;
       pc_vif.ld_sd_addr_i          = 0;
       pc_vif.ld_valid_i            = 0;
       pc_vif.sd_valid_i            = 0;	
       pc_vif.byte_sel_i            = 0;
       pc_vif.csr_mcause_id_i       = 0;
       repeat(5) @(posedge pc_vif.z_clk);
       pc_vif.z_rst = 1;
      end
        
      else if (pc_item.z_rst == 1)
      begin
        @(posedge pc_vif.z_clk) 
        `uvm_info("Driver ", $sformatf("Driving inputs , when reset is HIGH"), UVM_LOW)
        pc_vif.branch_valid_i        = pc_item.branch_valid_i;
        pc_vif.branch_pc_i           = pc_item.branch_pc_i;
        pc_vif.csr_mepc_i            = pc_item.csr_mepc_i;
        pc_vif.csr_mtvec_i           = pc_item.csr_mtvec_i ;
        pc_vif.csr_mstatus_mie_i     = pc_item.csr_mstatus_mie_i;
        pc_vif.mret_valid_i          = pc_item.mret_valid_i ;
        pc_vif.stall_valid_i         = pc_item.stall_valid_i;
        pc_vif.zic_int_req_i         = pc_item.zic_int_req_i;
        pc_vif.zic_mmr_ack_id_i      = pc_item.zic_mmr_ack_id_i;
        pc_vif.z_instruction_i       = pc_item.z_instruction_i ;
        pc_vif.invalid_instr_valid_i = pc_item.invalid_instr_valid_i;
        pc_vif.breakpoint_valid_i    = pc_item.breakpoint_valid_i;
        pc_vif.ecall_valid_i         = pc_item.ecall_valid_i;
        pc_vif.ld_sd_addr_i          = pc_item.ld_sd_addr_i;
        pc_vif.ld_valid_i            = pc_item.ld_valid_i; 
        pc_vif.sd_valid_i	         = pc_item.sd_valid_i;
        pc_vif.byte_sel_i            = pc_item.byte_sel_i;
        pc_vif.z_rst                 = 1;
        pc_vif.csr_mcause_id_i       = pc_item.csr_mcause_id_i;
      
	  end
	  
      seq_item_port.item_done();
      
    end //forever
  endtask

endclass:pc_driver
