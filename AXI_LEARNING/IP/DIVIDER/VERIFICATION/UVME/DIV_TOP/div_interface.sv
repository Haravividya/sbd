interface div_interface (input div_clock);
    
    // Inputs
    logic          div_reset        ;
    logic          valid_i          ;
    logic  [31:0]  opcode           ;
    logic  [63:0]  operand_dividend ;
    logic  [63:0]  operand_divisor  ;

    // Outputs
    logic         valid_o          ;
    logic [63:0]  result           ;

endinterface


