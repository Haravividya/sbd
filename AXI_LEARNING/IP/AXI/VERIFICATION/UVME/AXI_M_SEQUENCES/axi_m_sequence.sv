class axi_m_sequence extends uvm_sequence#(axi_m_seq_item);

    `uvm_object_utils(axi_m_sequence)
   
    axi_m_seq_item seq_item;

    int         scenario;
    logic       wr_en_seq;
    logic       rd_en_seq;
    logic [1:0] byte_seq;
    logic [1:0] wr_addr1_seq;
    logic       wr_addr2_seq;
    logic [1:0] w_resp_seq;
    logic [1:0] r_resp_seq;

  function new(string name = "axi_m_sequence");
    super.new(name);
  endfunction

  task body();
  begin
    `uvm_info ("Sequence", $sformatf("Starting Sequence"), UVM_LOW)

      if(scenario == 0)
      begin
        `uvm_do_with(seq_item, {seq_item.axi4_lite_rstn == 0;})
      end
          
      if(scenario == 2)
      begin
        `uvm_do_with(seq_item, {seq_item.wr_en_in == wr_en_seq; seq_item.rd_en_in == rd_en_seq; seq_item.byte_en == byte_seq; 
         seq_item.wr_addr_in[1:0] == wr_addr1_seq; seq_item.M_B_RESP_IN == w_resp_seq; })
      end
      
            
      if(scenario == 3)
      begin
        `uvm_do_with(seq_item, {seq_item.wr_en_in == wr_en_seq; seq_item.rd_en_in == rd_en_seq; seq_item.byte_en == byte_seq; 
        seq_item.wr_addr_in[1] == wr_addr2_seq; seq_item.M_B_RESP_IN == w_resp_seq; })
      end

      if(scenario == 4)
      begin
        `uvm_do_with(seq_item, {seq_item.wr_en_in == wr_en_seq; seq_item.rd_en_in == rd_en_seq; seq_item.byte_en == byte_seq; 
        seq_item.M_B_RESP_IN == w_resp_seq; })
      end

      if(scenario == 5)
      begin
        `uvm_do_with(seq_item, {seq_item.wr_en_in == wr_en_seq; seq_item.rd_en_in == rd_en_seq; seq_item.M_R_RESP_IN == r_resp_seq;})                        
      end
  end
 

  endtask

endclass
  


