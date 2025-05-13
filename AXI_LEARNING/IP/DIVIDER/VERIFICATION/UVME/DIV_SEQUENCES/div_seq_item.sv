class div_seq_item extends uvm_sequence_item;

  // Inputs
      logic           div_reset        ;
rand  logic           valid_i          ;
rand  logic   [31:0]  opcode           ;
rand  logic   [63:0]  operand_dividend ;
rand  logic   [63:0]  operand_divisor  ;

    // Outputs
   logic         valid_o          ;
   logic [63:0]  result           ;


  `uvm_object_utils_begin(div_seq_item)
    `uvm_field_int(div_reset,UVM_ALL_ON);
    `uvm_field_int(valid_i,UVM_ALL_ON);
    `uvm_field_int(opcode,UVM_ALL_ON);
    `uvm_field_int(operand_dividend,UVM_ALL_ON);
    `uvm_field_int(operand_divisor,UVM_ALL_ON);
    `uvm_field_int(valid_o,UVM_ALL_ON);
    `uvm_field_int(result,UVM_ALL_ON);
 `uvm_object_utils_end

  function new (string name = "div_seq_item");
    super.new(name);
  endfunction

 endclass


