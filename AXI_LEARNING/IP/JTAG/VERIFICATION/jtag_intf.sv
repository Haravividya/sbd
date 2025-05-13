interface dut_if (input logic TCK);
  
  //Inputs
  logic TRST;
  logic TMS;
  logic TDI; 
  logic [7:0] user_data_in;
  
  //Outputs
  logic TDO;
  logic [7:0] user_data_out;
         
endinterface
