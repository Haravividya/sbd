class axi_m_rand_sequence extends uvm_sequence#(axi_m_seq_item);

    `uvm_object_utils(axi_m_rand_sequence)
   
    axi_m_seq_item seq_item;

    int count;

  function new(string name = "axi_m_rand_sequence");
    super.new(name);
  endfunction

    int          scenario;
    logic        wr_en_seq;
    logic        rd_en_seq;


  task body();
  begin
  
    `uvm_info ("Sequence", $sformatf("Starting Sequence"), UVM_LOW)

      if(scenario == 1)
      begin
        `uvm_do_with(seq_item, {seq_item.axi4_lite_rstn == 0;})
      end

                  
      if(scenario == 2)
      begin

        `uvm_do_with(seq_item, {seq_item.wr_en_in == wr_en_seq; seq_item.rd_en_in == rd_en_seq;})

      end

      if(scenario == 3)
      begin
        `uvm_do_with(seq_item, {seq_item.wr_en_in == wr_en_seq; seq_item.rd_en_in == rd_en_seq;})                        
      end 

      
  end
 
  endtask

endclass
  



