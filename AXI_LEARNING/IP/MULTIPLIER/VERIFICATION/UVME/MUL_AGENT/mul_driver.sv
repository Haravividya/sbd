class mul_driver extends uvm_driver#(mul_seq_item);

 //Virtual interface handle
 virtual mul_interface intf;
 mul_seq_item seq_item;

 //factory registration
	`uvm_component_utils(mul_driver)
	
//constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
    endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	if(!uvm_config_db#(virtual mul_interface)::get(this,"","vif",intf))	
		`uvm_error("driver","No resource found");
	endfunction
	

   
task reset_phase(uvm_phase phase);
  phase.raise_objection(this);
  intf.mul_reset = 1'b1;
//  repeat($urandom_range(2,5)) @(posedge vif.riscv_clk);
  @(negedge intf.mul_clk)
  intf.mul_reset = 1'b0;
  repeat($urandom_range(2,5)) @(negedge intf.mul_clk);
  intf.mul_reset = 1'b1;
  phase.drop_objection(this);
endtask 


  // run phase
  task run_phase(uvm_phase phase);
    
       intf.oper1 = 0;
       intf.oper2 = 0;
       intf.result   = 0;
      
      @(posedge intf.mul_clk);
      wait(intf.mul_reset == 1);

 forever 
   begin
    if(intf.mul_reset == 1)
    begin

      @(posedge intf.mul_clk);
      begin
        seq_item_port.get_next_item(seq_item);
        intf.oper1 = seq_item.oper1;
        intf.oper2 = seq_item.oper2;
        //seq_item.print();
        seq_item_port.item_done();
        repeat(20)@(negedge intf.mul_clk) ;
      end
    end
   end

  endtask

endclass
 

 

