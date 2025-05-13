class div_monitor extends uvm_monitor;


  `uvm_component_utils(div_monitor)

  virtual div_interface intf;

  div_seq_item seq_item;

  
  uvm_analysis_port#(div_seq_item)analysis_port_monitor;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    analysis_port_monitor = new("analysis_port_monitor",this);
    if(!uvm_config_db#(virtual div_interface)::get(this,"","vif",intf))
      `uvm_error("Monitor","No resource found")

  endfunction

  virtual task run_phase(uvm_phase phase);

    forever begin
    
    seq_item = div_seq_item::type_id::create("seq_item");

     @(posedge intf.div_clock);
      seq_item.div_reset <= intf.div_reset;
      seq_item.valid_i <= intf.valid_i;
      seq_item.opcode <= intf.opcode;
      seq_item.operand_dividend <= intf.operand_dividend ;
      seq_item.operand_divisor <= intf.operand_divisor ;
      seq_item.valid_o <= intf.valid_o ;
      seq_item.result <= intf.result ;
      
      analysis_port_monitor.write(seq_item);
    end

  endtask

endclass

