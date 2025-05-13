class axi_m_monitor extends uvm_monitor;

  `uvm_component_utils(axi_m_monitor)

  virtual intf vif;
  axi_m_seq_item seq_item;
  uvm_analysis_port#(axi_m_seq_item)analysis_port_monitor;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_port_monitor = new("analysis_port_monitor",this);
    
    if(!uvm_config_db#(virtual intf)::get(this,"","pif",vif))
    `uvm_error("monitor","No resource found")
  endfunction
 
  task run_phase(uvm_phase phase);
  
    forever 
    begin
      @(posedge vif.axi4_lite_clk)
      seq_item = axi_m_seq_item::type_id::create("seq_item");
      
      seq_item.axi4_lite_rstn  = vif.axi4_lite_rstn;
      seq_item.M_AW_ADDR_OUT   = vif.M_AW_ADDR_OUT;  
      seq_item.M_AW_VALID_OUT  = vif.M_AW_VALID_OUT;
      seq_item.M_AW_READY_IN   = vif.M_AW_READY_IN; 
      seq_item.M_W_DATA_OUT    = vif.M_W_DATA_OUT;  
      seq_item.M_W_STRB_OUT    = vif.M_W_STRB_OUT;  
      seq_item.M_W_VALID_OUT   = vif.M_W_VALID_OUT; 
      seq_item.M_W_READY_IN    = vif.M_W_READY_IN;  
      seq_item.M_B_RESP_IN     = vif.M_B_RESP_IN;   
      seq_item.M_B_VALID_IN    = vif.M_B_VALID_IN;  
      seq_item.M_B_READY_OUT   = vif.M_B_READY_OUT; 
      seq_item.M_AR_ADDR_OUT   = vif.M_AR_ADDR_OUT; 
      seq_item.M_AR_VALID_OUT  = vif.M_AR_VALID_OUT;
      seq_item.M_AR_READY_IN   = vif.M_AR_READY_IN; 
      seq_item.M_R_DATA_IN     = vif.M_R_DATA_IN;   
      seq_item.M_R_RESP_IN     = vif.M_R_RESP_IN;   
      seq_item.M_R_VALID_IN    = vif.M_R_VALID_IN;  
      seq_item.M_R_READY_OUT   = vif.M_R_READY_OUT; 
      seq_item.wr_en_in        = vif.wr_en_in;                 
      seq_item.rd_en_in        = vif.rd_en_in;         
      seq_item.byte_en         = vif.byte_en;         
      seq_item.wr_addr_in      = vif.wr_addr_in;    
      seq_item.rd_addr_in      = vif.rd_addr_in;     
      seq_item.m_data_in       = vif.m_data_in;        
      seq_item.m_data_out      = vif.m_data_out;       
                                      
      analysis_port_monitor.write(seq_item);

    end

endtask

endclass          
