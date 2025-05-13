class debug_sequence extends uvm_sequence#(debug_seq_item);
  `uvm_object_utils(debug_sequence)
 
  logic [40:0] data_seq[int];
  logic [1:0] ir_dr_sel[int];
  jtag_instr_registers instr_seq[int];

  debug_seq_item seq_item;
  
  function new (string name = "debug_sequence");
    super.new(name);
  endfunction
  
  task body();
  
    `uvm_info("Sequence ", $sformatf("Starting particular sequence item "), UVM_LOW)
 
    foreach(data_seq[i]) begin
        `uvm_do_with(seq_item,
                  {
                   seq_item.ir_dr[1:0] == ir_dr_sel[i][1:0];
                   seq_item.instr      == instr_seq[i];
                   seq_item.data       == data_seq[i] ;
                  } )
    end

   for(int i = 0 ; i <= 3 ; i++ )begin
       `uvm_do_with(seq_item , {
           seq_item.ebreak == i[0] ;
           seq_item.step   == i[1] ; 
           })
      end 
       
    `uvm_info("Sequence ", $sformatf("Ending  sequence items "), UVM_LOW)

  endtask
endclass
