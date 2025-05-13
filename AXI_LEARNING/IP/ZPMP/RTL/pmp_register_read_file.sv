module pmpcsr_read
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)
(

input logic  [CSR_ADDR_WIDTH-1:0]	   csr_read_addr,
input logic                          csr_read_en,
  
input logic [DATA_WIDTH-1:0]         pmpcfg0_i,
input logic [DATA_WIDTH-1:0]         pmpcfg1_i,
input logic [DATA_WIDTH-1:0]         pmpcfg2_i,
input logic [DATA_WIDTH-1:0]         pmpcfg3_i,

input logic [PMP_WIDTH-1:2]        pmpaddr0_i,
input logic [PMP_WIDTH-1:2]        pmpaddr1_i,
input logic [PMP_WIDTH-1:2]        pmpaddr2_i,
input logic [PMP_WIDTH-1:2]        pmpaddr3_i,

input logic [PMP_WIDTH-1:2]        pmpaddr4_i,
input logic [PMP_WIDTH-1:2]        pmpaddr5_i,
input logic [PMP_WIDTH-1:2]        pmpaddr6_i,
input logic [PMP_WIDTH-1:2]        pmpaddr7_i,


input logic [PMP_WIDTH-1:2]        pmpaddr8_i,
input logic [PMP_WIDTH-1:2]        pmpaddr9_i,
input logic [PMP_WIDTH-1:2]        pmpaddr10_i,
input logic [PMP_WIDTH-1:2]        pmpaddr11_i,


input logic [PMP_WIDTH-1:2]        pmpaddr12_i,
input logic [PMP_WIDTH-1:2]        pmpaddr13_i,
input logic [PMP_WIDTH-1:2]        pmpaddr14_i,
input logic [PMP_WIDTH-1:2]        pmpaddr15_i,


output logic  [DATA_WIDTH-1:0]        pmpcsr_read_data_o



);

 timeunit 1ns;
 timeprecision 1ps;

logic  [DATA_WIDTH-1:0]          pmpcsr_read_data_r;



always_comb
begin
    
     if(csr_read_en)
     begin
         unique case(csr_read_addr)
             12'h3A0 :  pmpcsr_read_data_r = pmpcfg0_i;
             12'h3A1 :  pmpcsr_read_data_r = pmpcfg1_i;
             12'h3A2 :  pmpcsr_read_data_r = pmpcfg2_i;
             12'h3A3 :  pmpcsr_read_data_r = pmpcfg3_i;
             12'h3B0 :  pmpcsr_read_data_r = pmpaddr0_i;
             12'h3B1 :  pmpcsr_read_data_r = pmpaddr1_i;
             12'h3B2 :  pmpcsr_read_data_r = pmpaddr2_i;
             12'h3B3 :  pmpcsr_read_data_r = pmpaddr3_i;
             12'h3B4 :  pmpcsr_read_data_r = pmpaddr4_i;
             12'h3B5 :  pmpcsr_read_data_r = pmpaddr5_i;
             12'h3B6 :  pmpcsr_read_data_r = pmpaddr6_i;
             12'h3B7 :  pmpcsr_read_data_r = pmpaddr7_i;
             12'h3B8 :  pmpcsr_read_data_r = pmpaddr8_i;
             12'h3B9 :  pmpcsr_read_data_r = pmpaddr9_i;
             12'h3BA :  pmpcsr_read_data_r = pmpaddr10_i;
             12'h3BB :  pmpcsr_read_data_r = pmpaddr11_i;
             12'h3BC :  pmpcsr_read_data_r = pmpaddr12_i;
             12'h3BD :  pmpcsr_read_data_r = pmpaddr13_i;
             12'h3BE :  pmpcsr_read_data_r = pmpaddr14_i;
             12'h3BF :  pmpcsr_read_data_r = pmpaddr15_i;
             default :  pmpcsr_read_data_r = {DATA_WIDTH{1'b0}};
         endcase
     end
     else
     begin
          pmpcsr_read_data_r = {DATA_WIDTH{1'b0}};
     end
 end

assign pmpcsr_read_data_o = pmpcsr_read_data_r;

endmodule



    
