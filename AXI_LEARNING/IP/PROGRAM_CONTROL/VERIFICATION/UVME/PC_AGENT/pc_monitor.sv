class pc_monitor extends uvm_monitor;

  `uvm_component_utils(pc_monitor)

  pc_seq_item pc_item;

  virtual pc_interface pc_vif;
  uvm_analysis_port#(pc_seq_item) analysis_port_monitor;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    analysis_port_monitor = new("analysis_port_monitor",this);
    if(!uvm_config_db#(virtual pc_interface)::get(this,"","intf",pc_vif))
      `uvm_error("Monitor","No resource found")
  endfunction

  task run_phase(uvm_phase phase);
    forever 
    begin
	  pc_item = pc_seq_item :: type_id :: create("pc_item");
      @(posedge pc_vif.z_clk)
   
      
      pc_item.branch_valid_i        = pc_vif.branch_valid_i;
      pc_item.branch_pc_i           = pc_vif.branch_pc_i;
      pc_item.csr_mepc_i            = pc_vif.csr_mepc_i;
      pc_item.csr_mtvec_i           = pc_vif.csr_mtvec_i;

      pc_item.csr_mstatus_mie_i     = pc_vif.csr_mstatus_mie_i;
      pc_item.mret_valid_i          = pc_vif.mret_valid_i;
      pc_item.stall_valid_i         = pc_vif.stall_valid_i;
      pc_item.zic_int_req_i         = pc_vif.zic_int_req_i;
      pc_item.zic_mmr_ack_id_i      = pc_vif.zic_mmr_ack_id_i;
      pc_item.z_rst                 = pc_vif.z_rst;

      pc_item.z_instruction_i       = pc_vif.z_instruction_i;
      pc_item.invalid_instr_valid_i = pc_vif.invalid_instr_valid_i;
      pc_item.breakpoint_valid_i    = pc_vif.breakpoint_valid_i;
      pc_item.ecall_valid_i         = pc_vif.ecall_valid_i;
      pc_item.ld_sd_addr_i          = pc_vif.ld_sd_addr_i;
      pc_item.ld_valid_i            = pc_vif.ld_valid_i; 
      pc_item.sd_valid_i	        = pc_vif.sd_valid_i;
      pc_item.byte_sel_i            = pc_vif.byte_sel_i;
      pc_item.csr_mcause_id_i       = pc_vif.csr_mcause_id_i;

  


      pc_item.csr_mepc_o                   = pc_vif.csr_mepc_o;
      pc_item.instr_read_addr_o            = pc_vif.instr_read_addr_o;
      pc_item.csr_mepc_write_valid_o       = pc_vif.csr_mepc_write_valid_o;
      pc_item.csr_mstatus_mie_clear_o      = pc_vif.csr_mstatus_mie_clear_o;
      pc_item.csr_mstatus_mie_set_o        = pc_vif.csr_mstatus_mie_set_o;
      pc_item.z_instruction_o              = pc_vif.z_instruction_o;
 
      pc_item.exception_valid_o            = pc_vif.exception_valid_o;
      pc_item.exception_id_o               = pc_vif.exception_id_o;

      pc_item.interrupt_valid_o            = pc_vif.interrupt_valid_o;
      pc_item.ld_sd_misalign_valid_o       = pc_vif.ld_sd_misalign_valid_o;
      pc_item.ld_sd_misalign_addr_o        = pc_vif.ld_sd_misalign_addr_o;
      pc_item.instr_misalign_valid_o       = pc_vif.instr_misalign_valid_o;
      pc_item.instr_misalign_addr_o        = pc_vif.instr_misalign_addr_o;
      pc_item.invalid_instr_valid_o        = pc_vif.invalid_instr_valid_o;
 
      pc_item.zic_mmr_ack_read_valid_o     = pc_vif.zic_mmr_ack_read_valid_o;
      pc_item.zic_mmr_eoi_id_o             = pc_vif.zic_mmr_eoi_id_o;
      pc_item.zic_mmr_eoi_write_valid_o    = pc_vif.zic_mmr_eoi_write_valid_o;
      pc_item.z_instruction_read_enable_o  = pc_vif.z_instruction_read_enable_o;
      pc_item.decode_instruction_valid_o  = pc_vif.decode_instruction_valid_o;


      `uvm_info("Monitor", $sformatf("Monitor_Check"), UVM_LOW)
      pc_item.print(); 

      analysis_port_monitor.write(pc_item);
    end //forever

  endtask //Runphase

endclass :pc_monitor
