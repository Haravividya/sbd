class mul_seq_item extends uvm_sequence_item;

 // inputs
      logic                   mul_reset;
    rand  logic [`DATA_WIDTH-1:0]  oper1 ;
    rand  logic [`DATA_WIDTH-1:0]  oper2 ;

// output
  logic [(`DATA_WIDTH*2)-1:0] result;

 `uvm_object_utils_begin(mul_seq_item)
    `uvm_field_int(mul_reset,UVM_ALL_ON);
    `uvm_field_int(oper1,UVM_ALL_ON);
    `uvm_field_int(oper2,UVM_ALL_ON);
    `uvm_field_int(result,UVM_ALL_ON);
 `uvm_object_utils_end

  function new (string name = "mul_seq_item");
    super.new(name);
  endfunction

 endclass
