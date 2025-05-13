class div_driver extends uvm_driver#(div_seq_item);

 //Virtual interface handle
 virtual div_interface intf;
 div_seq_item seq_item;

 //factory registration
	`uvm_component_utils(div_driver)
	
//constructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
    endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	if(!uvm_config_db#(virtual div_interface)::get(this,"","vif",intf))	
		`uvm_error("driver","No resource found");
	endfunction
	

  // run phase
  task run_phase(uvm_phase phase);
    
       intf.operand_dividend = 0;
       intf.operand_divisor = 0;
       intf.result   = 0;
        intf.valid_i = 0 ;
      
      @(posedge intf.div_clock);
      wait(intf.div_reset == 1);

 forever 
   begin
    if(intf.div_reset == 1)
    begin

      @(posedge intf.div_clock);
      begin
        seq_item_port.get_next_item(seq_item);
             //  intf.valid_i = seq_item.valid_i;
        intf.opcode = seq_item.opcode ;
        intf.operand_dividend = seq_item.operand_dividend;
        intf.operand_divisor = seq_item.operand_divisor;
       // seq_item.print();
        intf.valid_i = 1 ;
        repeat(1)  @(posedge intf.div_clock);
        intf.valid_i = 0 ;

        seq_item_port.item_done();
        repeat(65)@(negedge intf.div_clock) ;
      end
    end
   end

  endtask

endclass
 

   
/*task reset_phase(uvm_phase phase);
  phase.raise_objection(this);
  intf.div_reset = 1'b1;
//  repeat($urandom_range(2,5)) @(posedge vif.riscv_clock);
  @(negedge intf.div_clock)
  intf.div_reset = 1'b0;
  repeat($urandom_range(2,5)) @(negedge intf.div_clock);
  intf.div_reset = 1'b1;
  phase.drop_objection(this);
endtask 
*/

 


