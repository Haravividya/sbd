class mul_monitor extends uvm_monitor;


  `uvm_component_utils(mul_monitor)

  virtual mul_interface intf;

  mul_seq_item seq_item;

  
  uvm_analysis_port#(mul_seq_item)analysis_port_monitor;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    analysis_port_monitor = new("analysis_port_monitor",this);
    if(!uvm_config_db#(virtual mul_interface)::get(this,"","vif",intf))
      `uvm_error("Monitor","No resource found")

  endfunction

  virtual task run_phase(uvm_phase phase);

    forever begin
    
    seq_item = mul_seq_item::type_id::create("seq_item");

     @(posedge intf.mul_clk);
      seq_item.mul_reset <= intf.mul_reset;
      seq_item.oper1 <= intf.oper1;
      seq_item.oper2 <= intf.oper2;
      seq_item.result <= intf.result ;
      analysis_port_monitor.write(seq_item);
    end

  endtask

endclass
