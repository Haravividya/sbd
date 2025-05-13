
interface mul_interface (input logic mul_clk);

 // inputs
  logic                   mul_reset;
  logic [`DATA_WIDTH-1:0]  oper1;
  logic [`DATA_WIDTH-1:0]  oper2;

// output
  logic [(`DATA_WIDTH*2)-1:0] result;

endinterface
 

