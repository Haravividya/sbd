//`define ZILLA_32_BIT
//Use defines here 63 & 31 ; 
`define ZILLA_64_BIT

`ifdef ZILLA_64_BIT 
  `define DATA_WIDTH 64  
`elsif ZILLA_32_BIT 
  `define DATA_WIDTH 32  
`endif


