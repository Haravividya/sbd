module pmp_address_matching
#(parameter DATA_WIDTH = 32,
  parameter PMP_WIDTH = 34,
  parameter RANGE_WIDTH=35 
)
(
input logic csr_clk,
input logic csr_rst,
input logic [DATA_WIDTH-1:0]pmpcfg0_i,
input logic [DATA_WIDTH-1:0]pmpcfg1_i,
input logic [DATA_WIDTH-1:0]pmpcfg2_i,
input logic [DATA_WIDTH-1:0]pmpcfg3_i,
input logic [PMP_WIDTH-1:2] pmpaddr0_i,
input logic [PMP_WIDTH-1:2] pmpaddr1_i,
input logic [PMP_WIDTH-1:2] pmpaddr2_i,
input logic [PMP_WIDTH-1:2] pmpaddr3_i,
input logic [PMP_WIDTH-1:2] pmpaddr4_i,
input logic [PMP_WIDTH-1:2] pmpaddr5_i,
input logic [PMP_WIDTH-1:2] pmpaddr6_i,
input logic [PMP_WIDTH-1:2] pmpaddr7_i,
input logic [PMP_WIDTH-1:2] pmpaddr8_i,
input logic [PMP_WIDTH-1:2] pmpaddr9_i,
input logic [PMP_WIDTH-1:2] pmpaddr10_i,
input logic [PMP_WIDTH-1:2] pmpaddr11_i,
input logic [PMP_WIDTH-1:2] pmpaddr12_i,
input logic [PMP_WIDTH-1:2] pmpaddr13_i,

input logic [PMP_WIDTH-1:2] pmpaddr14_i,
input logic [PMP_WIDTH-1:2] pmpaddr15_i,
output  logic [RANGE_WIDTH-1:0] start_address0,
output  logic [RANGE_WIDTH-1:0] start_address1,
output  logic [RANGE_WIDTH-1:0] start_address2,
output  logic [RANGE_WIDTH-1:0] start_address3,
output  logic [RANGE_WIDTH-1:0] start_address4,
output  logic [RANGE_WIDTH-1:0] start_address5,
output  logic [RANGE_WIDTH-1:0] start_address6,
output  logic [RANGE_WIDTH-1:0] start_address7,
output  logic [RANGE_WIDTH-1:0] start_address8,
output  logic [RANGE_WIDTH-1:0] start_address9,
output  logic [RANGE_WIDTH-1:0] start_address10,
output  logic [RANGE_WIDTH-1:0] start_address11,
output  logic [RANGE_WIDTH-1:0] start_address12,
output  logic [RANGE_WIDTH-1:0] start_address13,
output  logic [RANGE_WIDTH-1:0] start_address14,
output  logic [RANGE_WIDTH-1:0] start_address15,
output  logic [RANGE_WIDTH-1:0] end_address0,
output  logic [RANGE_WIDTH-1:0] end_address1,
output  logic [RANGE_WIDTH-1:0] end_address2,
output  logic [RANGE_WIDTH-1:0] end_address3,
output  logic [RANGE_WIDTH-1:0] end_address4,
output  logic [RANGE_WIDTH-1:0] end_address5,
output  logic [RANGE_WIDTH-1:0] end_address6,
output  logic [RANGE_WIDTH-1:0] end_address7,
output  logic [RANGE_WIDTH-1:0] end_address8,
output  logic [RANGE_WIDTH-1:0] end_address9,
output  logic [RANGE_WIDTH-1:0] end_address10,
output  logic [RANGE_WIDTH-1:0] end_address11,
output  logic [RANGE_WIDTH-1:0] end_address12,
output  logic [RANGE_WIDTH-1:0] end_address13,
output  logic [RANGE_WIDTH-1:0] end_address14,
output  logic [RANGE_WIDTH-1:0] end_address15,
output  logic region0_range_exception,
output  logic region1_range_exception,
output  logic region2_range_exception,
output  logic region3_range_exception,
output  logic region4_range_exception,
output  logic region5_range_exception,
output  logic region6_range_exception,
output  logic region7_range_exception,
output  logic region8_range_exception,
output  logic region9_range_exception,
output  logic region10_range_exception,
output  logic region11_range_exception,
output  logic region12_range_exception,
output  logic region13_range_exception,
output  logic region14_range_exception,
output  logic region15_range_exception





 );

 timeunit 1ns;
 timeprecision 1ps;
 
  logic  off_valid0;
  logic  tor_valid0;
  logic  na4_valid0;
  logic  napot_valid0;
 
  logic  off_valid1;
  logic  tor_valid1;
  logic  na4_valid1;
  logic  napot_valid1;
 
  logic  off_valid2;
  logic  tor_valid2;
  logic  na4_valid2;
  logic  napot_valid2;
 
  logic  off_valid3;
  logic  tor_valid3;
  logic  na4_valid3;
  logic  napot_valid3;
 
  logic  off_valid4;
  logic  tor_valid4;
  logic  na4_valid4;
  logic  napot_valid4;

  logic  off_valid5;
  logic  tor_valid5;
  logic  na4_valid5;
  logic  napot_valid5;
 
  logic  off_valid6;
  logic  tor_valid6;
  logic  na4_valid6;
  logic  napot_valid6;
 
  logic  off_valid7;
  logic  tor_valid7;
  logic  na4_valid7;
  logic  napot_valid7;
 
  logic  off_valid8;
  logic  tor_valid8;
  logic  na4_valid8;
  logic  napot_valid8;
 
  logic  off_valid9;
  logic  tor_valid9;
  logic  na4_valid9;
  logic  napot_valid9;
 
  logic  off_valid10;
  logic  tor_valid10;
  logic  na4_valid10;
  logic  napot_valid10;
 
  logic  off_valid11;
  logic  tor_valid11;
  logic  na4_valid11;
  logic  napot_valid11;
 
  logic  off_valid12;
  logic  tor_valid12;
  logic  na4_valid12;
  logic  napot_valid12;
 
  logic  off_valid13;
  logic  tor_valid13;
  logic  na4_valid13;
  logic  napot_valid13;
 
  logic  off_valid14;
  logic  tor_valid14;
  logic  na4_valid14;
  logic  napot_valid14;

  logic  off_valid15;
  logic  tor_valid15;
  logic  na4_valid15;
  logic  napot_valid15;

         logic [DATA_WIDTH-1:0]pmpcfg0_r;
         logic [DATA_WIDTH-1:0]pmpcfg1_r;
         logic [DATA_WIDTH-1:0]pmpcfg2_r;
         logic [DATA_WIDTH-1:0]pmpcfg3_r;

         logic [PMP_WIDTH-1:2] pmpaddr0_r;
         logic [PMP_WIDTH-1:2] pmpaddr1_r;
         logic [PMP_WIDTH-1:2] pmpaddr2_r;
         logic [PMP_WIDTH-1:2] pmpaddr3_r;
         logic [PMP_WIDTH-1:2] pmpaddr4_r;
         logic [PMP_WIDTH-1:2] pmpaddr5_r;
         logic [PMP_WIDTH-1:2] pmpaddr6_r;
         logic [PMP_WIDTH-1:2] pmpaddr7_r;
         logic [PMP_WIDTH-1:2] pmpaddr8_r;
         logic [PMP_WIDTH-1:2] pmpaddr9_r;
         logic [PMP_WIDTH-1:2] pmpaddr10_r;
         logic [PMP_WIDTH-1:2] pmpaddr11_r;
         logic [PMP_WIDTH-1:2] pmpaddr12_r;
         logic [PMP_WIDTH-1:2] pmpaddr13_r;
         logic [PMP_WIDTH-1:2] pmpaddr14_r;
         logic [PMP_WIDTH-1:2] pmpaddr15_r; 

         logic [34:0]zerobit_position0;
         logic [34:0]zerobit_position1;
         logic [34:0]zerobit_position2;
         logic [34:0]zerobit_position3;
         logic [34:0]zerobit_position4;
         logic [34:0]zerobit_position5;
         logic [34:0]zerobit_position6;
         logic [34:0]zerobit_position7;
         logic [34:0]zerobit_position8;
         logic [34:0]zerobit_position9;
         logic [34:0]zerobit_position10;
         logic [34:0]zerobit_position11;
         logic [34:0]zerobit_position12;
         logic [34:0]zerobit_position13;
         logic [34:0]zerobit_position14;
         logic [34:0]zerobit_position15;


        always_ff @(posedge csr_clk or negedge csr_rst)
        begin
            if(!csr_rst)
            begin
pmpcfg0_r <= {DATA_WIDTH{1'b0}};
pmpcfg1_r <= {DATA_WIDTH{1'b0}};
pmpcfg2_r <= {DATA_WIDTH{1'b0}};
pmpcfg3_r <= {DATA_WIDTH{1'b0}};

pmpaddr0_r <= {DATA_WIDTH{1'b0}};
pmpaddr1_r <= {DATA_WIDTH{1'b0}};
pmpaddr2_r <= {DATA_WIDTH{1'b0}};
pmpaddr3_r <= {DATA_WIDTH{1'b0}};
pmpaddr4_r <= {DATA_WIDTH{1'b0}};
pmpaddr5_r <= {DATA_WIDTH{1'b0}};
pmpaddr6_r <= {DATA_WIDTH{1'b0}};
pmpaddr7_r <= {DATA_WIDTH{1'b0}};
pmpaddr8_r <= {DATA_WIDTH{1'b0}};
pmpaddr9_r <= {DATA_WIDTH{1'b0}};
pmpaddr10_r <={DATA_WIDTH{1'b0}};
pmpaddr11_r <={DATA_WIDTH{1'b0}};
pmpaddr12_r <={DATA_WIDTH{1'b0}};
pmpaddr13_r <={DATA_WIDTH{1'b0}};
pmpaddr14_r <={DATA_WIDTH{1'b0}};
pmpaddr15_r <={DATA_WIDTH{1'b0}};
            end

else
begin
pmpcfg0_r <= pmpcfg0_i;
pmpcfg1_r <= pmpcfg1_i;
pmpcfg2_r <= pmpcfg2_i;
pmpcfg3_r <= pmpcfg3_i;

pmpaddr0_r <= pmpaddr0_i; 
pmpaddr1_r <= pmpaddr1_i;
pmpaddr2_r <= pmpaddr2_i;
pmpaddr3_r <= pmpaddr3_i;
pmpaddr4_r <= pmpaddr4_i;
pmpaddr5_r <= pmpaddr5_i;
pmpaddr6_r <= pmpaddr6_i;
pmpaddr7_r <= pmpaddr7_i;
pmpaddr8_r <= pmpaddr8_i;
pmpaddr9_r <= pmpaddr9_i;
pmpaddr10_r <= pmpaddr10_i;
pmpaddr11_r <= pmpaddr11_i;
pmpaddr12_r <= pmpaddr12_i;
pmpaddr13_r <= pmpaddr13_i;
pmpaddr14_r <= pmpaddr14_i;
pmpaddr15_r <= pmpaddr15_i;
end
end

always_comb
begin
if(pmpcfg0_i[7:0] != 8'b0)
begin
unique case({pmpcfg0_i[4],pmpcfg0_i[3]})
2'b00 : begin
         off_valid0 = 1'b1;
         tor_valid0 = 1'b0;
         na4_valid0 = 1'b0;
         napot_valid0 = 1'b0;
        end
2'b01 : begin
        tor_valid0 = 1'b1;
        off_valid0 = 1'b0;
        na4_valid0 = 1'b0;
        napot_valid0 = 1'b0;
        end
2'b10 : begin
        na4_valid0 = 1'b1;
        off_valid0 = 1'b0;
        tor_valid0 = 1'b0;
           
        napot_valid0 = 1'b0;
        end
2'b11 : begin 
        napot_valid0 = 1'b1;
        off_valid0 = 1'b0;
        tor_valid0 = 1'b0;
        na4_valid0 = 1'b0;
        end
          
default : begin
          off_valid0 = 1'b0;
          tor_valid0 = 1'b0;
          na4_valid0 = 1'b0;
          napot_valid0 = 1'b0;
          end
endcase
end
else 
begin
off_valid0 = 1'b0;
tor_valid0 = 1'b0;
na4_valid0 = 1'b0;
napot_valid0 = 1'b0;

end
end



always_comb
begin
if(pmpcfg0_i[15:8] != 8'b0)
begin


unique case({pmpcfg0_i[12],pmpcfg0_i[11]})
2'b00 : begin
        off_valid1 = 1'b1;
 
        tor_valid1 = 1'b0;
        na4_valid1 = 1'b0;
        napot_valid1 = 1'b0;
        end
2'b01 : begin
        tor_valid1 = 1'b1;
        off_valid1 = 1'b0;
            
        na4_valid1 = 1'b0;
        napot_valid1 = 1'b0;
        end
2'b10 : begin
        na4_valid1 = 1'b1;
        off_valid1 = 1'b0;
        tor_valid1 = 1'b0;
            
        napot_valid1 = 1'b0;
end
2'b11 : begin
        napot_valid1 = 1'b1;
        off_valid1 = 1'b0;
        tor_valid1 = 1'b0;
        na4_valid1 = 1'b0;
            
end
default : begin
            off_valid1 = 1'b0;
            tor_valid1 = 1'b0;
            na4_valid1 = 1'b0;
            napot_valid1 = 1'b0;
          end
endcase
end
else 
begin
  off_valid1 = 1'b0;
            tor_valid1 = 1'b0;
            na4_valid1 = 1'b0;
            napot_valid1 = 1'b0;


end
end




always_comb 
begin
if(pmpcfg0_i[23:16] != 8'b0)
begin


unique case({pmpcfg0_i[20],pmpcfg0_i[19]})
2'b00 : begin
            off_valid2 = 1'b1;

            tor_valid2 = 1'b0;
            na4_valid2 = 1'b0;
            napot_valid2 = 1'b0;
end
2'b01 : begin
            tor_valid2 = 1'b1;
            off_valid2 = 1'b0;
            
            na4_valid2 = 1'b0;
            napot_valid2 = 1'b0;
end
2'b10 : begin
            na4_valid2 = 1'b1;
            off_valid2 = 1'b0;
            tor_valid2 = 1'b0;
         
            napot_valid2 = 1'b0;
end
2'b11 : begin
            napot_valid2 = 1'b1;
            off_valid2 = 1'b0;
            tor_valid2 = 1'b0;
            na4_valid2 = 1'b0;
            
end
default : begin
            off_valid2 = 1'b0;
            tor_valid2 = 1'b0;
            na4_valid2 = 1'b0;
            napot_valid2 = 1'b0;
          end
endcase
end
else 
begin
   off_valid2 = 1'b0;
            tor_valid2 = 1'b0;
            na4_valid2 = 1'b0;
            napot_valid2 = 1'b0;

end
end


always_comb 
begin
if(pmpcfg0_i[31:24] != 8'b0)
begin

unique case({pmpcfg0_i[28],pmpcfg0_i[27]})
2'b00 : begin
            off_valid3 = 1'b1;
            tor_valid3 = 1'b0;
            na4_valid3 = 1'b0;
            napot_valid3 = 1'b0;
end
2'b01 : begin
            tor_valid3 = 1'b1;
            off_valid3 = 1'b0;
          
            na4_valid3 = 1'b0;
            napot_valid3 = 1'b0;
end
2'b10 :begin
            na4_valid3 = 1'b1;
            off_valid3 = 1'b0;
            tor_valid3 = 1'b0;
           
            napot_valid3 = 1'b0;
 end
2'b11 : begin
            napot_valid3 = 1'b1;
            off_valid3 = 1'b0;
            tor_valid3 = 1'b0;
            na4_valid3 = 1'b0;
          
end
default : begin
            off_valid3 = 1'b0;
            tor_valid3 = 1'b0;
            na4_valid3 = 1'b0;
            napot_valid3 = 1'b0;
          end
endcase
end
else 
begin
off_valid3 = 1'b0;
            tor_valid3 = 1'b0;
            na4_valid3 = 1'b0;
            napot_valid3 = 1'b0;

end
end

always_comb 
begin
if(pmpcfg1_i[7:0] != 8'b0)
begin
unique case({pmpcfg1_i[4],pmpcfg1_i[3]})
2'b00 : begin
           off_valid4 = 1'b1;
           tor_valid4 = 1'b0;
           na4_valid4 = 1'b0;
           napot_valid4 = 1'b0;
        end
2'b01 : begin
           tor_valid4 = 1'b1;
           off_valid4 = 1'b0;
           na4_valid4 = 1'b0;
           napot_valid4 = 1'b0;
        end
2'b10 : begin
            na4_valid4 = 1'b1;
            off_valid4 = 1'b0;
            tor_valid4 = 1'b0;
            napot_valid4 = 1'b0;
        end
2'b11 : begin
           napot_valid4 = 1'b1;
           off_valid4 = 1'b0;
           tor_valid4 = 1'b0;
           na4_valid4 = 1'b0;
           
        end
default : begin
           off_valid4 = 1'b0;
           tor_valid4 = 1'b0;
           na4_valid4 = 1'b0;
           napot_valid4 = 1'b0;
          end
endcase
end
else 
begin
 off_valid4 = 1'b0;
           tor_valid4 = 1'b0;
           na4_valid4 = 1'b0;
           napot_valid4 = 1'b0;

end
end



always_comb 
begin

if(pmpcfg1_i[15:8] != 8'b0)
begin

unique case({pmpcfg1_i[12],pmpcfg1_i[11]})
2'b00 : begin
        off_valid5 = 1'b1;
      
            tor_valid5 = 1'b0;
            na4_valid5 = 1'b0;
            napot_valid5 = 1'b0;

        end
2'b01 : begin 
        tor_valid5 = 1'b1;
        off_valid5 = 1'b0;
        na4_valid5 = 1'b0;
            napot_valid5 = 1'b0;

        end
2'b10 : begin 
        na4_valid5 = 1'b1;
        off_valid5 = 1'b0;
            tor_valid5 = 1'b0;
                       napot_valid5 = 1'b0;

        end
2'b11 : begin 
        napot_valid5 = 1'b1;
        off_valid5 = 1'b0;
            tor_valid5 = 1'b0;
            na4_valid5 = 1'b0;
         
        end
default : begin
            off_valid5 = 1'b0;
            tor_valid5 = 1'b0;
            na4_valid5 = 1'b0;
            napot_valid5 = 1'b0;
          end
endcase
end
else 
begin
 off_valid5 = 1'b0;
            tor_valid5 = 1'b0;
            na4_valid5 = 1'b0;
            napot_valid5 = 1'b0;


end
end




always_comb 
begin
if(pmpcfg1_i[23:16] != 8'b0)
begin



unique case({pmpcfg1_i[20],pmpcfg1_i[19]})
2'b00 : begin 
            off_valid6 = 1'b1;
            tor_valid6 = 1'b0;
            na4_valid6 = 1'b0;
            napot_valid6 = 1'b0;

end
2'b01 : begin 
            tor_valid6 = 1'b1;
            off_valid6 = 1'b0;
            
            na4_valid6 = 1'b0;
            napot_valid6 = 1'b0;

end
2'b10 : begin 
            na4_valid6 = 1'b1; 
            off_valid6 = 1'b0;
            tor_valid6 = 1'b0;
           
            napot_valid6 = 1'b0;

end
2'b11 : begin 
            napot_valid6 = 1'b1;
            off_valid6 = 1'b0;
            tor_valid6 = 1'b0;
            na4_valid6 = 1'b0;
       

 end
default : begin
            off_valid6 = 1'b0;
            tor_valid6 = 1'b0;
            na4_valid6 = 1'b0;
            napot_valid6 = 1'b0;
          end
endcase
end
else 
begin
  off_valid6 = 1'b0;
            tor_valid6 = 1'b0;
            na4_valid6 = 1'b0;
            napot_valid6 = 1'b0;

end
end



always_comb 
begin
if(pmpcfg1_i[31:24] != 8'b0)
begin

unique case({pmpcfg1_i[28],pmpcfg1_i[27]})
2'b00 : begin 
            off_valid7 = 1'b1;

            tor_valid7 = 1'b0;
            na4_valid7 = 1'b0;
            napot_valid7 = 1'b0;
            end
2'b01 : begin 
            tor_valid7 = 1'b1;
            off_valid7 = 1'b0;
            
            na4_valid7 = 1'b0;
            napot_valid7 = 1'b0;
            end
2'b10 : begin
            na4_valid7 = 1'b1;
            off_valid7 = 1'b0;
            tor_valid7 = 1'b0;
         
            napot_valid7 = 1'b0;
            end
2'b11 : begin 
            napot_valid7 = 1'b1;
            off_valid7 = 1'b0;
            tor_valid7 = 1'b0;
            na4_valid7 = 1'b0;
            
            end
default : begin
            off_valid7 = 1'b0;
            tor_valid7 = 1'b0;
            na4_valid7 = 1'b0;
            napot_valid7 = 1'b0;
          end
endcase
end
else 
begin
   off_valid7 = 1'b0;
            tor_valid7 = 1'b0;
            na4_valid7 = 1'b0;
            napot_valid7 = 1'b0;

end
end
always_comb 
begin
if(pmpcfg2_i[7:0] != 8'b0)
begin

unique case({pmpcfg2_i[4],pmpcfg2_i[3]})
2'b00 : begin 
            off_valid8 = 1'b1;
 
            tor_valid8 = 1'b0;
            na4_valid8 = 1'b0;
            napot_valid8 = 1'b0;
            end
2'b01 : begin 
            tor_valid8 = 1'b1;
            off_valid8 = 1'b0;
            
            na4_valid8 = 1'b0;
            napot_valid8 = 1'b0;
            end
2'b10 : begin 
            na4_valid8 = 1'b1;
            off_valid8 = 1'b0;
            tor_valid8 = 1'b0;
          
            napot_valid8 = 1'b0;
            end
2'b11 : begin 
            napot_valid8 = 1'b1;
            off_valid8 = 1'b0;
            tor_valid8 = 1'b0;
            na4_valid8 = 1'b0;
           
            end
default : begin
            off_valid8 = 1'b0;
            tor_valid8 = 1'b0;
            na4_valid8 = 1'b0;
            napot_valid8 = 1'b0;
          end
endcase
end
else
begin
off_valid8 = 1'b0;
            tor_valid8 = 1'b0;
            na4_valid8 = 1'b0;
            napot_valid8 = 1'b0;

end
end

always_comb
begin
if(pmpcfg2_i[15:8] != 8'b0)
begin


unique case({pmpcfg2_i[12],pmpcfg2_i[11]})
2'b00 : begin 
            off_valid9 = 1'b1;

            tor_valid9 = 1'b0;
            na4_valid9 = 1'b0;
            napot_valid9 = 1'b0;
            end
2'b01 : begin 
            tor_valid9 = 1'b1;
            off_valid9 = 1'b0;
          
            na4_valid9 = 1'b0;
            napot_valid9 = 1'b0;
            end
2'b10 : begin 
            na4_valid9 = 1'b1;
            off_valid9 = 1'b0;
            tor_valid9 = 1'b0;
            
            napot_valid9 = 1'b0;
            end
2'b11 : begin
            napot_valid9 = 1'b1;
            off_valid9 = 1'b0;
            tor_valid9 = 1'b0;
            na4_valid9 = 1'b0;
           
            end
default : begin
            off_valid9 = 1'b0;
            tor_valid9 = 1'b0;
            na4_valid9 = 1'b0;
            napot_valid9 = 1'b0;
          end
endcase
end
else
begin
 off_valid9 = 1'b0;
            tor_valid9 = 1'b0;
            na4_valid9 = 1'b0;
            napot_valid9 = 1'b0;


end
end


always_comb 
begin
if(pmpcfg2_i[23:16] != 8'b0)
begin

unique case({pmpcfg2_i[20],pmpcfg2_i[19]})
2'b00 : begin 
            off_valid10 = 1'b1;
 
            tor_valid10 = 1'b0;
            na4_valid10 = 1'b0;
            napot_valid10 = 1'b0;
            end
2'b01 : begin 
            tor_valid10 = 1'b1;
            off_valid10 = 1'b0;
          
            na4_valid10 = 1'b0;
            napot_valid10 = 1'b0;
            end
2'b10 : begin 
            na4_valid10 = 1'b1;
            off_valid10 = 1'b0;
            tor_valid10 = 1'b0;
          
            napot_valid10 = 1'b0;
            end
2'b11 : begin 
            napot_valid10 = 1'b1;
            off_valid10 = 1'b0;
            tor_valid10 = 1'b0;
            na4_valid10 = 1'b0;
          
            end
default : begin
            off_valid10 = 1'b0;
            tor_valid10 = 1'b0;
            na4_valid10 = 1'b0;
            napot_valid10 = 1'b0;
          end
endcase
end
 else
begin
  off_valid10 = 1'b0;
            tor_valid10 = 1'b0;
            na4_valid10 = 1'b0;
            napot_valid10 = 1'b0;


end
end



always_comb 
begin
if(pmpcfg2_i[31:24] != 8'b0)
begin

unique case({pmpcfg2_i[28],pmpcfg2_i[27]})
2'b00 : begin 
            off_valid11 = 1'b1;
  
            tor_valid11 = 1'b0;
            na4_valid11 = 1'b0;
            napot_valid11 = 1'b0;
            end
2'b01 : begin 
            tor_valid11 = 1'b1;
            off_valid11 = 1'b0;
         
            na4_valid11 = 1'b0;
            napot_valid11 = 1'b0;
end
2'b10 : begin
            na4_valid11 = 1'b1;   
            off_valid11 = 1'b0;
            tor_valid11 = 1'b0;
            napot_valid11 = 1'b0;
            end
2'b11 : begin 
            napot_valid11 = 1'b1;  
            off_valid11 = 1'b0;
            tor_valid11 = 1'b0;
            na4_valid11 = 1'b0;
           
            end
default : begin
            off_valid11 = 1'b0;
            tor_valid11 = 1'b0;
            na4_valid11 = 1'b0;
            napot_valid11 = 1'b0;
          end
endcase
end
 else
begin
      off_valid11 = 1'b0;
            tor_valid11 = 1'b0;
            na4_valid11 = 1'b0;
            napot_valid11 = 1'b0;


end
end

always_comb 
begin
if(pmpcfg3_i[7:0] != 8'b0)
begin

unique case({pmpcfg3_i[4],pmpcfg3_i[3]})
2'b00 : begin 
            off_valid12 = 1'b1;
 
            tor_valid12 = 1'b0;
            na4_valid12 = 1'b0;
            napot_valid12 = 1'b0;
            end
2'b01 : begin 
            tor_valid12 = 1'b1;
            off_valid12 = 1'b0;
            
            na4_valid12 = 1'b0;
            napot_valid12 = 1'b0;
            end
2'b10 : begin 
            na4_valid12 = 1'b1;
            off_valid12 = 1'b0;
            tor_valid12 = 1'b0;
            
            napot_valid12 = 1'b0;
            end
2'b11 : begin
            napot_valid12 = 1'b1;
            off_valid12 = 1'b0;
            tor_valid12 = 1'b0;
            na4_valid12 = 1'b0;
          
            end
default : begin
            off_valid12 = 1'b0;
            tor_valid12 = 1'b0;
            na4_valid12 = 1'b0;
            napot_valid12 = 1'b0;
          end
endcase
end
else
begin
   off_valid12 = 1'b0;
            tor_valid12 = 1'b0;
            na4_valid12 = 1'b0;
            napot_valid12 = 1'b0;


end
end



always_comb 
begin
if(pmpcfg3_i[15:8] != 8'b0)
begin

unique case({pmpcfg3_i[12],pmpcfg3_i[11]})
2'b00 : begin 
            off_valid13 = 1'b1;
            tor_valid13 = 1'b0;
            na4_valid13 = 1'b0;
            napot_valid13 = 1'b0;
            end
2'b01 : begin
            tor_valid13 = 1'b1;
            off_valid13 = 1'b0;
         
            na4_valid13 = 1'b0;
            napot_valid13 = 1'b0;
            end
2'b10 : begin 
            na4_valid13 = 1'b1;
            off_valid13 = 1'b0;
            tor_valid13 = 1'b0;
        
            napot_valid13 = 1'b0;
            end
2'b11 : begin 
            napot_valid13 = 1'b1;
            off_valid13 = 1'b0;
            tor_valid13 = 1'b0;
            na4_valid13 = 1'b0;
           
            end
default : begin
            off_valid13 = 1'b0;
            tor_valid13 = 1'b0;
            na4_valid13 = 1'b0;
            napot_valid13 = 1'b0;
          end
endcase
end
else
begin
   off_valid13 = 1'b0;
            tor_valid13 = 1'b0;
            na4_valid13 = 1'b0;
            napot_valid13 = 1'b0;


end
end


always_comb
begin
if(pmpcfg3_i[23:16] != 8'b0)
begin

unique case({pmpcfg3_i[20],pmpcfg3_i[19]})
2'b00 : begin 
            off_valid14 = 1'b1;
    
            tor_valid14 = 1'b0;
            na4_valid14 = 1'b0;
            napot_valid14 = 1'b0;
            end
2'b01 : begin 
            tor_valid14 = 1'b1;
            off_valid14 = 1'b0;
     
            na4_valid14 = 1'b0;
            napot_valid14 = 1'b0;
            end
2'b10 : begin 
            na4_valid14 = 1'b1;
            off_valid14 = 1'b0;
            tor_valid14 = 1'b0;
          
            napot_valid14 = 1'b0;
            end
2'b11 : begin 
            napot_valid14 = 1'b1;
            off_valid14 = 1'b0;
            tor_valid14 = 1'b0;
            na4_valid14 = 1'b0;
           
            end
default : begin
            off_valid14 = 1'b0;
            tor_valid14 = 1'b0;
            na4_valid14 = 1'b0;
            napot_valid14 = 1'b0;
          end
endcase
end
else
begin
     off_valid14 = 1'b0;
            tor_valid14 = 1'b0;
            na4_valid14 = 1'b0;
            napot_valid14 = 1'b0;


end
end



always_comb 
begin
if(pmpcfg3_i[31:24] != 8'b0)
begin

unique case({pmpcfg3_i[28],pmpcfg3_i[27]})
2'b00 : begin 
            off_valid15 = 1'b1;

            tor_valid15 = 1'b0;
            na4_valid15 = 1'b0;
            napot_valid15 = 1'b0;
            end
2'b01 : begin 
            tor_valid15 = 1'b1;
            off_valid15 = 1'b0;
      
            na4_valid15 = 1'b0;
            napot_valid15 = 1'b0;
            end
2'b10 : begin
            na4_valid15 = 1'b1;
            off_valid15 = 1'b0;
            tor_valid15 = 1'b0;
           
            napot_valid15 = 1'b0;
            end
2'b11 : begin 
            napot_valid15 = 1'b1;
            off_valid15 = 1'b0;
            tor_valid15 = 1'b0;
            na4_valid15 = 1'b0;
            
             end 
default : begin
            off_valid15 = 1'b0;
            tor_valid15 = 1'b0;
            na4_valid15 = 1'b0;
            napot_valid15 = 1'b0;
          end
endcase
end
else
begin
    off_valid15 = 1'b0;
            tor_valid15 = 1'b0;
            na4_valid15 = 1'b0;
            napot_valid15 = 1'b0;


end
end



always_comb 
begin
   
unique casex(pmpaddr0_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position0 =35'd8;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position0 =35'd16;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position0 =35'd32;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position0 =35'd64;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position0 =35'd128;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position0 =35'd256;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position0 =35'd512;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position0 =35'd1024;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position0 =35'd2048;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position0 =35'd4096;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position0 =35'd8192;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position0 =35'd16384;
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position0 =35'd32768;
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position0 =35'd65536;
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position0 =35'd131072;
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position0 =35'd262144;
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position0 =35'd524288;
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position0 =35'd1048576;
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position0 =35'd2097152;
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position0 =35'd4194304;
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position0 =35'd8388608;
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position0 =35'd16777216;
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position0 =35'd33554432;
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd67108864;
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd134217728;
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd268435456;
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd536870912;
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd1073741824;
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd2147483648;
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd4294967296 ;
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd8589934592;
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'd17179869184;
    default : zerobit_position0 = 35'd0;

endcase
end


always_comb 
begin
unique casex(pmpaddr1_i)
    
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position1 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position1 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position1 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position1 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position1 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position1 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position1 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position1 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position1 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position1 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position1 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position1 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position1 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position1 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position1 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position1 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position1 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position1 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position1 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position1 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position1 = 35'd17179869184;  
    default : zerobit_position1 = 35'd0;

endcase
end



always_comb 
begin
unique casex(pmpaddr2_i)
   
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position2 = 35'd8;            
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position2 = 35'd16;           
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position2 = 35'd32;           
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position2 = 35'd64;           
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position2 = 35'd128;          
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position2 = 35'd256;          
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position2 = 35'd512;          
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position2 = 35'd1024;         
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position2 = 35'd2048;         
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position2 = 35'd4096;         
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position2 = 35'd8192;         
   32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position2 = 35'd16384;        
   32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position2 = 35'd32768;        
   32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position2 = 35'd65536;        
   32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position2 = 35'd131072;       
   32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position2 = 35'd262144;       
   32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position2 = 35'd524288;       
   32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position2 = 35'd1048576;      
   32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position2 = 35'd2097152;      
   32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position2 = 35'd4194304;      
   32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd8388608;      
   32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd16777216;     
   32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd33554432;     
   32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd67108864;     
   32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd134217728;    
   32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd268435456;    
   32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd536870912;    
   32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd1073741824;   
   32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd2147483648;   
   32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd4294967296 ;  
   32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd8589934592;   
   32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position2 = 35'd17179869184;   
   default : zerobit_position2 = 35'd0;

endcase
end


always_comb 
begin
unique casex(pmpaddr3_i)
  
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position3 = 35'd8;            
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position3 = 35'd16;           
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position3 = 35'd32;           
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position3 = 35'd64;           
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position3 = 35'd128;          
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position3 = 35'd256;          
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position3 = 35'd512;          
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position3 = 35'd1024;         
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position3 = 35'd2048;         
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position3 = 35'd4096;         
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position3 = 35'd8192;         
  32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position3 = 35'd16384;        
  32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position3 = 35'd32768;        
  32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position3 = 35'd65536;        
  32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position3 = 35'd131072;       
  32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position3 = 35'd262144;       
  32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position3 = 35'd524288;       
  32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position3 = 35'd1048576;      
  32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position3 = 35'd2097152;      
  32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position3 = 35'd4194304;      
  32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd8388608;      
  32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd16777216;     
  32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd33554432;     
  32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd67108864;     
  32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd134217728;    
  32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd268435456;    
  32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd536870912;    
  32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd1073741824;   
  32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd2147483648;   
  32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd4294967296 ;  
  32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd8589934592;   
  32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position3 = 35'd17179869184; 
  default : zerobit_position3 = 35'd0;

endcase
end

always_comb 
begin
unique casex(pmpaddr4_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position4 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position4 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position4 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position4 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position4 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position4 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position4 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position4 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position4 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position4 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position4 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position4 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position4 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position4 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position4 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position4 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position4 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position4 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position4 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position4 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position4 = 35'd17179869184;  
      default : zerobit_position4 = 35'd0;

endcase
end

always_comb
begin
unique casex(pmpaddr5_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position5 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position5 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position5 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position5 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position5 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position5 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position5 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position5 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position5 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position5 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position5 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position5 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position5 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position5 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position5 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position5 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position5 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position5 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position5 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position5 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position5 = 35'd17179869184;  
      default : zerobit_position5 = 35'd0;

endcase
end

always_comb 
begin
unique casex(pmpaddr6_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position6 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position6 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position6 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position6 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position6 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position6 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position6 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position6 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position6 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position6 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position6 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position6 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position6 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position6 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position6 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position6 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position6 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position6 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position6 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position6 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position6 = 35'd17179869184;  
      default : zerobit_position6 = 35'd0;

endcase
end

always_comb
begin
unique casex(pmpaddr7_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position7 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position7 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position7 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position7 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position7 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position7 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position7 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position7 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position7 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position7 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position7 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position7 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position7 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position7 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position7 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position7 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position7 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position7 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position7 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position7 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position7 = 35'd17179869184;  
      default : zerobit_position7 = 35'd0;

endcase
end


always_comb 
begin
unique casex(pmpaddr8_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position8 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position8 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position8 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position8 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position8 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position8 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position8 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position8 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position8 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position8 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position8 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position8 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position8 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position8 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position8 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position8 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position8 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position8 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position8 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position8 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position8 = 35'd17179869184;  
      default : zerobit_position8 = 35'd0;

endcase
end

always_comb 
begin
unique casex(pmpaddr9_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position9 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position9 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position9 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position9 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position9 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position9 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position9 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position9 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position9 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position9 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position9 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position9 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position9 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position9 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position9 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position9 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position9 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position9 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position9 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position9 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position9 = 35'd17179869184;  
      default : zerobit_position9 = 35'd0;

endcase
end

always_comb 
begin
unique casex(pmpaddr10_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position10 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position10 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position10 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position10 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position10 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position10 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position10 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position10 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position10 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position10 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position10 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position10 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position10 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position10 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position10 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position10 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position10 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position10 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position10 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position10 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position10 = 35'd17179869184;  
      default : zerobit_position10 = 35'd0;

endcase
end

always_comb
begin
unique casex(pmpaddr11_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position11 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position11 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position11 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position11 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position11 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position11 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position11 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position11 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position11 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position11 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position11 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position11 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position11 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position11 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position11 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position11 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position11 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position11 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position11 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position11 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position11 = 35'd17179869184;  
      default : zerobit_position11 = 35'd0;

endcase
end

always_comb 
begin
unique casex(pmpaddr12_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position12 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position12 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position12 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position12 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position12 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position12 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position12 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position12 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position12 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position12 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position12 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position12 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position12 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position12 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position12 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position12 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position12 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position12 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position12 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position12 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position12 = 35'd17179869184;  
    default : zerobit_position12 = 35'd0;

endcase
end

always_comb 
begin
unique casex(pmpaddr13_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position13 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position13 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position13 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position13 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position13 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position13 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position13 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position13 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position13 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position13 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position13 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position13 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position13 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position13 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position13 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position13 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position13 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position13 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position13 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position13 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position13 = 35'd17179869184;  
    default : zerobit_position13 = 35'd0;

endcase
end

always_comb 
begin
unique casex(pmpaddr14_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position14 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position14 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position14 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position14 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position14 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position14 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position14 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position14 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position14 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position14 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position14 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position14 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position14 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position14 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position14 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position14 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position14 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position14 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position14 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position14 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position14 = 35'd17179869184;  
      default : zerobit_position14 = 35'd0;

endcase
end


always_comb 
begin
unique casex(pmpaddr15_i)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position15 = 35'd8;            
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position15 = 35'd16;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position15 = 35'd32;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position15 = 35'd64;           
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position15 = 35'd128;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position15 = 35'd256;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position15 = 35'd512;          
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position15 = 35'd1024;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position15 = 35'd2048;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position15 = 35'd4096;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position15 = 35'd8192;         
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position15 = 35'd16384;        
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position15 = 35'd32768;        
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position15 = 35'd65536;        
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position15 = 35'd131072;       
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position15 = 35'd262144;       
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position15 = 35'd524288;       
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position15 = 35'd1048576;      
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position15 = 35'd2097152;      
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position15 = 35'd4194304;      
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd8388608;      
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd16777216;     
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd33554432;     
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd67108864;     
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd134217728;    
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd268435456;    
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd536870912;    
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd1073741824;   
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd2147483648;   
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd4294967296 ;  
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd8589934592;   
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position15 = 35'd17179869184;  

    default : zerobit_position15 = 35'd0;

endcase



end



always_comb
begin
if(pmpcfg0_i[7:0] != 8'b0)
begin

       unique case({off_valid0 ,tor_valid0,na4_valid0 ,napot_valid0 })
          4'b1000:begin
                   start_address0 = {RANGE_WIDTH {1'b0}};
                   end_address0 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address0 = {RANGE_WIDTH {1'b0}};
                   end_address0 = {3'd0,pmpaddr0_i};
                  end
          4'b0010:begin
                   start_address0 = {3'd0,pmpaddr0_i};
                   end_address0 = {3'd0,pmpaddr0_i} + 35'd4;
                  end
          4'b0001:begin
                   //start_address0 = pmpaddr0_i;
                   // end_address0 =  {3'd0,pmpaddr0_i} +  zerobit_position0;
                  unique case(zerobit_position0)
                      35'd8 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:3],1'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:4],2'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:5],3'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:6],4'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:7],5'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:8],6'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:9],7'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:10],8'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:11],9'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:12],10'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:13],11'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:14],12'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:15],13'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:16],14'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:17],15'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:18],16'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:19],17'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:20],18'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:21],19'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:22],20'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:23],21'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:24],22'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:25],23'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:26],24'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:27],25'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:28],26'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:29],27'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:30],28'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:31],29'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1:32],30'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address0 = {3'd0,pmpaddr0_i[PMP_WIDTH-1],31'd0};
                              end_address0 =  {3'd0,pmpaddr0_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address0 = {RANGE_WIDTH {1'b0}};
                              end_address0 =  35'd17179869184;
                              end 
                    default:begin
                              start_address0 = {RANGE_WIDTH {1'b0}};
                              end_address0 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression
          default:begin
                   start_address0 = {RANGE_WIDTH {1'b0}};
                   end_address0 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase
  
  end
  else
  begin
      start_address0 = {RANGE_WIDTH {1'b0}};
      end_address0 = {RANGE_WIDTH {1'b0}};
  end
end


always_comb
begin
if(pmpcfg0_i[15:8] != 8'b0)
begin

      unique case({off_valid1 ,tor_valid1,na4_valid1 ,napot_valid1 })
          4'b1000:begin
                   start_address1 = {RANGE_WIDTH {1'b0}};
                   end_address1 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address1 ={3'd0, pmpaddr0_r} + 35'b1;
                   end_address1 = {3'd0,pmpaddr1_i};
                  end
          4'b0010:begin
                   start_address1 ={3'd0, pmpaddr1_i };
                   end_address1 = {3'd0,pmpaddr1_i} + 35'd4;
                  end
          4'b0001:begin
                   //start_address1 = pmpaddr1_i;
                  // end_address1 = {3'd0,pmpaddr1_i} +  zerobit_position1;
                  unique case(zerobit_position1)
                      35'd8 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:3],1'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:4],2'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:5],3'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:6],4'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:7],5'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:8],6'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:9],7'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:10],8'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:11],9'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:12],10'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:13],11'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:14],12'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:15],13'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:16],14'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:17],15'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:18],16'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:19],17'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:20],18'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:21],19'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:22],20'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:23],21'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:24],22'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:25],23'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:26],24'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:27],25'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:28],26'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:29],27'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:30],28'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:31],29'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1:32],30'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address1 = {3'd0,pmpaddr1_i[PMP_WIDTH-1],31'd0};
                              end_address1 =  {3'd0,pmpaddr1_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address1 = {RANGE_WIDTH {1'b0}};                         
                              end_address1 = 35'd17179869184;
                              end 
                    default:begin
                              start_address1 = {RANGE_WIDTH {1'b0}};
                              end_address1 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

                  
          default:begin
                   start_address1 = {RANGE_WIDTH {1'b0}};
                   end_address1 = {RANGE_WIDTH {1'b0}};
                  end
        
       endcase
       
   end 
  else
  begin
      start_address1 = {RANGE_WIDTH {1'b0}};
      end_address1 = {RANGE_WIDTH {1'b0}};
  end
end

always_comb
begin
if(pmpcfg0_i[23:16] != 8'b0)
begin

       unique case({off_valid2 ,tor_valid2,na4_valid2 ,napot_valid2 })
          4'b1000:begin
                   start_address2 = {RANGE_WIDTH {1'b0}};
                   end_address2 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address2 = {3'd0, pmpaddr1_r } + 35'b1;
                   end_address2 = {3'd0,pmpaddr2_i};
                  end
          4'b0010:begin
                   start_address2 = {3'd0, pmpaddr2_i };
                   end_address2 = {3'd0,pmpaddr2_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address2 = pmpaddr2_i;
                  // end_address2 =  {3'd0,pmpaddr2_i} +  zerobit_position2;
                   unique case(zerobit_position2)
                      35'd8 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:3],1'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:4],2'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:5],3'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:6],4'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:7],5'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:8],6'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:9],7'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:10],8'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:11],9'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:12],10'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:13],11'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:14],12'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:15],13'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:16],14'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:17],15'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:18],16'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:19],17'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:20],18'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:21],19'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:22],20'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:23],21'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:24],22'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:25],23'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:26],24'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:27],25'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:28],26'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:29],27'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:30],28'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:31],29'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1:32],30'd0};
                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address2 = {3'd0,pmpaddr2_i[PMP_WIDTH-1],31'd0};
                              end_address2 = 35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address2 = {RANGE_WIDTH {1'b0}};                              end_address2 =  {3'd0,pmpaddr2_i[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end 
                    default:begin
                              start_address2 = {RANGE_WIDTH {1'b0}};
                              end_address2 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address2 = {RANGE_WIDTH {1'b0}};
                   end_address2 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase
  end
  else
  begin
      start_address2 = {RANGE_WIDTH {1'b0}};
      end_address2 = {RANGE_WIDTH {1'b0}};
  end
end
always_comb
begin
if(pmpcfg0_i[31:24] != 8'b0)
begin

      unique case({off_valid3 ,tor_valid3,na4_valid3 ,napot_valid3 })
          4'b1000:begin
                   start_address3 = {RANGE_WIDTH {1'b0}};
                   end_address3 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address3 = {3'd0, pmpaddr2_r } + 35'b1;
                   end_address3 = {3'd0,pmpaddr3_i};
                  end
          4'b0010:begin
                   start_address3 = {3'd0, pmpaddr3_i };
                   end_address3 = {3'd0,pmpaddr3_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address3 = pmpaddr3_i;
                  // end_address3 =  {3'd0,pmpaddr3_i}  +  zerobit_position3;
                   unique case(zerobit_position3)
                      35'd8 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:3],1'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:4],2'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:5],3'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:6],4'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:7],5'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:8],6'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:9],7'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:10],8'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:11],9'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:12],10'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:13],11'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:14],12'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:15],13'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:16],14'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:17],15'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:18],16'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:19],17'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:20],18'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:21],19'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:22],20'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:23],21'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:24],22'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:25],23'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:26],24'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:27],25'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:28],26'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:29],27'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:30],28'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:31],29'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1:32],30'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address3 = {3'd0,pmpaddr3_i[PMP_WIDTH-1],31'd0};
                              end_address3 =  {3'd0,pmpaddr3_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address3 = {RANGE_WIDTH {1'b0}};
                              end_address3 =  35'd17179869184;
                              end 
                    default:begin
                              start_address3 ={RANGE_WIDTH {1'b0}};
                              end_address3 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address3 = {RANGE_WIDTH {1'b0}};
                   end_address3 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase

  end
  else
  begin
      start_address3 = {RANGE_WIDTH {1'b0}};
      end_address3 = {RANGE_WIDTH {1'b0}};
  end

end
always_comb
begin
if(pmpcfg1_i[7:0] != 8'b0)
begin

      unique case({off_valid4 ,tor_valid4,na4_valid4 ,napot_valid4 })
          4'b1000:begin
                   start_address4 = {RANGE_WIDTH {1'b0}};
                   end_address4 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address4 = {3'd0, pmpaddr3_r } + 35'b1;
                   end_address4 = {3'd0,pmpaddr4_i};
                  end
          4'b0010:begin
                   start_address4 = {3'd0, pmpaddr4_i };
                   end_address4 = {3'd0,pmpaddr4_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address4 = pmpaddr4_i;
                  // end_address4 = {3'd0,pmpaddr4_i} +  zerobit_position4;
                   unique case(zerobit_position4)
                      35'd8 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:3],1'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:4],2'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:5],3'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:6],4'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:7],5'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:8],6'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:9],7'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:10],8'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:11],9'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:12],10'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:13],11'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:14],12'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:15],13'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:16],14'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:17],15'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:18],16'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:19],17'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:20],18'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:21],19'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:22],20'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:23],21'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:24],22'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:25],23'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:26],24'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:27],25'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:28],26'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:29],27'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:30],28'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:31],29'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1:32],30'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address4 = {3'd0,pmpaddr4_i[PMP_WIDTH-1],31'd0};
                              end_address4 =  {3'd0,pmpaddr4_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address4 = {RANGE_WIDTH {1'b0}};
                              end_address4 = 35'd17179869184;
                              end 
                    default:begin
                              start_address4 = {RANGE_WIDTH {1'b0}};
                              end_address4 ={RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address4 = {RANGE_WIDTH {1'b0}};
                   end_address4 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase

  end

  else
  begin
      start_address4 = {RANGE_WIDTH {1'b0}};
      end_address4 = {RANGE_WIDTH {1'b0}};
  end
end
always_comb
begin
if(pmpcfg1_i[15:8] != 8'b0)
begin

      unique case({off_valid5 ,tor_valid5,na4_valid5 ,napot_valid5 })
          4'b1000:begin
                   start_address5 = {RANGE_WIDTH {1'b0}};
                   end_address5 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address5 = {3'd0, pmpaddr4_r } + 35'b1;
                   end_address5 = {3'd0,pmpaddr5_i};
                  end
          4'b0010:begin
                   start_address5 = {3'd0, pmpaddr5_i };
                   end_address5 = {3'd0,pmpaddr5_i} + 35'd4;
                  end
          4'b0001:begin
                   //start_address5 = pmpaddr5_i;
                 //  end_address5 = {3'd0,pmpaddr5_i} +  zerobit_position5;
                   unique case(zerobit_position5)
                      35'd8 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:3],1'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:4],2'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:5],3'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:6],4'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:7],5'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:8],6'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:9],7'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:10],8'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:11],9'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:12],10'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:13],11'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:14],12'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:15],13'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:16],14'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:17],15'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:18],16'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:19],17'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:20],18'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:21],19'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:22],20'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:23],21'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:24],22'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:25],23'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:26],24'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:27],25'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:28],26'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:29],27'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:30],28'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:31],29'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1:32],30'd0};
                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address5 = {3'd0,pmpaddr5_i[PMP_WIDTH-1],31'd0};
                              end_address5 =  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address5 = {RANGE_WIDTH {1'b0}};                              end_address5 =  {3'd0,pmpaddr5_i[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end 
                    default:begin
                              start_address5 = {RANGE_WIDTH {1'b0}};
                              end_address5 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address5 ={RANGE_WIDTH {1'b0}};
                   end_address5 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase
end
  else
  begin
      start_address5 = {RANGE_WIDTH {1'b0}};
      end_address5 = {RANGE_WIDTH {1'b0}};
  end


end
always_comb
begin
if(pmpcfg1_i[23:16] != 8'b0)
begin

      unique case({off_valid6 ,tor_valid6,na4_valid6 ,napot_valid6 })
          4'b1000:begin
                   start_address6 = {RANGE_WIDTH {1'b0}};
                   end_address6 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address6 = {3'd0, pmpaddr5_r } + 35'b1;
                   end_address6 = {3'd0,pmpaddr6_i};
                  end
          4'b0010:begin
                   start_address6 = {3'd0, pmpaddr6_i };
                   end_address6 = {3'd0,pmpaddr6_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address6 = pmpaddr6_i;
                  // end_address6 =  {3'd0,pmpaddr6_i} +  zerobit_position6;
                   unique case(zerobit_position6)
                      35'd8 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:3],1'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:4],2'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:5],3'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:6],4'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:7],5'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:8],6'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:9],7'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:10],8'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:11],9'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:12],10'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:13],11'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:14],12'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:15],13'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:16],14'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:17],15'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:18],16'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:19],17'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:20],18'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:21],19'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:22],20'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:23],21'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:24],22'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:25],23'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:26],24'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:27],25'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:28],26'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:29],27'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:30],28'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:31],29'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1:32],30'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address6 = {3'd0,pmpaddr6_i[PMP_WIDTH-1],31'd0};
                              end_address6 =  {3'd0,pmpaddr6_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address6 = {RANGE_WIDTH {1'b0}};
                              end_address6 = 35'd17179869184;
                              end 
                    default:begin
                              start_address6 = {RANGE_WIDTH {1'b0}};
                              end_address6 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address6 = {RANGE_WIDTH {1'b0}};
                   end_address6 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase

  end

   else
  begin
      start_address6 = {RANGE_WIDTH {1'b0}};
      end_address6 = {RANGE_WIDTH {1'b0}};
  end
 
  end
  
  always_comb
begin
if(pmpcfg1_i[31:24] != 8'b0)
begin


      unique case({off_valid7 ,tor_valid7,na4_valid7 ,napot_valid7 })
          4'b1000:begin
                   start_address7 = {RANGE_WIDTH {1'b0}};
                   end_address7 =   {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address7 = {3'd0, pmpaddr6_r } + 35'b1;
                   end_address7 = {3'd0,pmpaddr7_i};
                  end
          4'b0010:begin
                   start_address7 = {3'd0, pmpaddr7_i };
                   end_address7 = {3'd0,pmpaddr7_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address7 = pmpaddr7_i;
                  // end_address7 = {3'd0,pmpaddr7_i} +  zerobit_position7;
                   unique case(zerobit_position7)
                      35'd8 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:3],1'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:4],2'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:5],3'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:6],4'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:7],5'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:8],6'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:9],7'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:10],8'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:11],9'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:12],10'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:13],11'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:14],12'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:15],13'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:16],14'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:17],15'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:18],16'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:19],17'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:20],18'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:21],19'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:22],20'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:23],21'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:24],22'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:25],23'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:26],24'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:27],25'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:28],26'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:29],27'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:30],28'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1:31],29'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address7 ={3'd0,pmpaddr7_i[PMP_WIDTH-1:32],30'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address7 = {3'd0,pmpaddr7_i[PMP_WIDTH-1],31'd0};
                              end_address7 =  {3'd0,pmpaddr7_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address7 = {RANGE_WIDTH {1'b0}};
                              end_address7 = 35'd17179869184;
                              end 
                    default:begin
                              start_address7 = {RANGE_WIDTH {1'b0}};
                              end_address7 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address7 = {RANGE_WIDTH {1'b0}};
                   end_address7 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase

 end
  else
  begin
      start_address7 = {RANGE_WIDTH {1'b0}};
      end_address7 = {RANGE_WIDTH {1'b0}};
  end


end
always_comb
begin

if(pmpcfg2_i[7:0] != 8'b0)
begin

      unique case({off_valid8 ,tor_valid8,na4_valid8 ,napot_valid8 })
          4'b1000:begin
                   start_address8 = {RANGE_WIDTH {1'b0}};
                   end_address8 =  {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address8 = {3'd0, pmpaddr7_r } + 35'b1;
                   end_address8 = {3'd0,pmpaddr8_i};
                  end
          4'b0010:begin
                   start_address8 = {3'd0, pmpaddr8_i };
                   end_address8 = {3'd0,pmpaddr8_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address8 = pmpaddr8_i;
                  // end_address8 = {3'd0,pmpaddr8_i} +  zerobit_position8;
                   unique case(zerobit_position8)
                      35'd8 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:3],1'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:4],2'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:5],3'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:6],4'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:7],5'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:8],6'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:9],7'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:10],8'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:11],9'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:12],10'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:13],11'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:14],12'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:15],13'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:16],14'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:17],15'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:18],16'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:19],17'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:20],18'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:21],19'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:22],20'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:23],21'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:24],22'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:25],23'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:26],24'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:27],25'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:28],26'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:29],27'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:30],28'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:31],29'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1:32],30'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address8 = {3'd0,pmpaddr8_i[PMP_WIDTH-1],31'd0};
                              end_address8 =  {3'd0,pmpaddr8_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address8 = {RANGE_WIDTH {1'b0}};
                              end_address8 =35'd17179869184;
                              end 
                    default:begin
                              start_address8 = {RANGE_WIDTH {1'b0}};
                              end_address8 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address8 = {RANGE_WIDTH {1'b0}};
                   end_address8 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase

 end
  else
  begin
      start_address8 ={RANGE_WIDTH {1'b0}};
      end_address8 = {RANGE_WIDTH {1'b0}};
  end


end
always_comb
begin
if(pmpcfg2_i[15:8] != 8'b0)
begin

      unique case({off_valid9 ,tor_valid9,na4_valid9 ,napot_valid9 })
          4'b1000:begin
                   start_address9 ={RANGE_WIDTH {1'b0}};
                   end_address9 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address9 = {3'd0, pmpaddr8_r } + 35'b1;
                   end_address9 = {3'd0,pmpaddr9_i};
                  end
          4'b0010:begin
                   start_address9 = {3'd0, pmpaddr9_i };
                   end_address9 = {3'd0,pmpaddr9_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address9 = pmpaddr9_i;
                  // end_address9 =  {3'd0,pmpaddr9_i} +  zerobit_position9;
                   unique case(zerobit_position9)
                      35'd8 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:3],1'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:4],2'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:5],3'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:6],4'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:7],5'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:8],6'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:9],7'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:10],8'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:11],9'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:12],10'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:13],11'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:14],12'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:15],13'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:16],14'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:17],15'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:18],16'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:19],17'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:20],18'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:21],19'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:22],20'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:23],21'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:24],22'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:25],23'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:26],24'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:27],25'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:28],26'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:29],27'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:30],28'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:31],29'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1:32],30'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address9 = {3'd0,pmpaddr9_i[PMP_WIDTH-1],31'd0};
                              end_address9 =  {3'd0,pmpaddr9_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address9 = {RANGE_WIDTH {1'b0}};
                              end_address9 = 35'd17179869184;
                              end 
                    default:begin
                              start_address9 ={RANGE_WIDTH {1'b0}};
                              end_address9 ={RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address9 = {RANGE_WIDTH {1'b0}};
                   end_address9 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase

  end
  else
  begin
      start_address9 = {RANGE_WIDTH {1'b0}};
      end_address9 = {RANGE_WIDTH {1'b0}};
  end


end
always_comb
begin

if(pmpcfg2_i[23:16] != 8'b0)
begin

      unique case({off_valid10 ,tor_valid10,na4_valid10 ,napot_valid10 })
          4'b1000:begin
                   start_address10 = {RANGE_WIDTH {1'b0}};
                   end_address10 = {RANGE_WIDTH {1'b0}};
               end
          4'b0100:begin
                   start_address10 = {3'd0, pmpaddr9_r } + 35'b1;
                   end_address10 = {3'd0,pmpaddr10_i};
                  end
          4'b0010:begin
                   start_address10 = {3'd0, pmpaddr10_i };
                   end_address10 = {3'd0,pmpaddr10_i} + 35'd4;
                  end
          4'b0001:begin
                   //start_address10 = pmpaddr10_i;
                  // end_address10 = {3'd0,pmpaddr10_i} +  zerobit_position10;
                   unique case(zerobit_position10)
                      35'd8 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:3],1'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:4],2'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:5],3'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:6],4'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:7],5'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:8],6'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:9],7'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:10],8'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:11],9'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:12],10'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:13],11'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:14],12'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:15],13'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:16],14'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:17],15'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:18],16'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:19],17'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:20],18'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:21],19'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:22],20'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:23],21'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:24],22'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:25],23'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:26],24'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:27],25'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:28],26'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:29],27'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:30],28'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:31],29'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1:32],30'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address10 = {3'd0,pmpaddr10_i[PMP_WIDTH-1],31'd0};
                              end_address10 =  {3'd0,pmpaddr10_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address10 = {RANGE_WIDTH {1'b0}};
                              end_address10 = 35'd17179869184;
                              end 
                    default:begin
                              start_address10 = {RANGE_WIDTH {1'b0}};
                              end_address10 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address10 = {RANGE_WIDTH {1'b0}};
                   end_address10 = {RANGE_WIDTH {1'b0}};
               end
        
      endcase
      
  end      
   else
  begin
      start_address10 = {RANGE_WIDTH {1'b0}};
      end_address10 =  {RANGE_WIDTH {1'b0}};
  end
 end
  
always_comb
begin
if(pmpcfg2_i[31:24] != 8'b0)
begin
    
      unique case({off_valid11 ,tor_valid11,na4_valid11 ,napot_valid11 })
          4'b1000:begin
                   start_address11 = {RANGE_WIDTH {1'b0}};
                   end_address11 ={RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address11 = {3'd0, pmpaddr10_r } + 35'b1;
                   end_address11 = {3'd0,pmpaddr11_i};
                  end
          4'b0010:begin
                   start_address11 = {3'd0, pmpaddr11_i };
                   end_address11 = {3'd0,pmpaddr11_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address11 = pmpaddr11_i;
                  // end_address11 = {3'd0,pmpaddr11_i } +  zerobit_position11;
                   unique case(zerobit_position11)
                      35'd8 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:3],1'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:4],2'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:5],3'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:6],4'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:7],5'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:8],6'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:9],7'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:10],8'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:11],9'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:12],10'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:13],11'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:14],12'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:15],13'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:16],14'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:17],15'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:18],16'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:19],17'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:20],18'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:21],19'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:22],20'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:23],21'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:24],22'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:25],23'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:26],24'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:27],25'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:28],26'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:29],27'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:30],28'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:31],29'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1:32],30'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address11 = {3'd0,pmpaddr11_i[PMP_WIDTH-1],31'd0};
                              end_address11 =  {3'd0,pmpaddr11_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address11 ={RANGE_WIDTH {1'b0}};
                              end_address11 = 35'd17179869184;
                              end 
                    default:begin
                              start_address11 ={RANGE_WIDTH {1'b0}};
                              end_address11 ={RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address11 = {RANGE_WIDTH {1'b0}};
                   end_address11 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase
      
  end
  else
  begin
        start_address11 = {RANGE_WIDTH {1'b0}};
        end_address11 ={RANGE_WIDTH {1'b0}};

  end
end


always_comb
begin
if(pmpcfg3_i[7:0] != 8'b0)
begin

      unique case({off_valid12 ,tor_valid12,na4_valid12 ,napot_valid12 })
          4'b1000:begin
                   start_address12 ={RANGE_WIDTH {1'b0}};
                   end_address12 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address12 = {3'd0, pmpaddr11_r } + 35'b1;
                   end_address12 = {3'd0,pmpaddr12_i};
                  end
          4'b0010:begin
                   start_address12 = {3'd0, pmpaddr12_i };
                   end_address12 = {3'd0,pmpaddr12_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address12 = pmpaddr12_i;
                  // end_address12 = {3'd0,pmpaddr12_i } +  zerobit_position12;
                   unique case(zerobit_position12)
                      35'd8 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:3],1'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:4],2'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:5],3'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:6],4'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:7],5'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:8],6'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:9],7'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:10],8'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:11],9'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:12],10'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:13],11'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:14],12'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:15],13'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:16],14'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:17],15'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:18],16'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:19],17'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:20],18'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:21],19'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:22],20'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:23],21'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:24],22'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:25],23'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:26],24'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:27],25'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:28],26'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:29],27'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:30],28'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:31],29'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1:32],30'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address12 = {3'd0,pmpaddr12_i[PMP_WIDTH-1],31'd0};
                              end_address12 =  {3'd0,pmpaddr12_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address12 ={RANGE_WIDTH {1'b0}};
                              end_address12 = 35'd17179869184;
                              end 
                    default:begin
                              start_address12 ={RANGE_WIDTH {1'b0}};
                              end_address12 ={RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address12 = {RANGE_WIDTH {1'b0}};
                   end_address12 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase
 end
  else
  begin
     start_address12 = {RANGE_WIDTH {1'b0}};
     end_address12 = {RANGE_WIDTH {1'b0}};
  end
end
      
always_comb
begin
 
if(pmpcfg3_i[15:8] != 8'b0)
begin

      unique case({off_valid13 ,tor_valid13,na4_valid13 ,napot_valid13 })
          4'b1000:begin
                   start_address13 ={RANGE_WIDTH {1'b0}};
                   end_address13 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address13 = {3'd0, pmpaddr12_r } + 35'b1;
                   end_address13 = {3'd0,pmpaddr13_i};
                  end
          4'b0010:begin
                   start_address13 = {3'd0, pmpaddr13_i };
                   end_address13 = {3'd0,pmpaddr13_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address13 = pmpaddr13_i;
                  // end_address13 = {3'd0,pmpaddr13_i }+  zerobit_position13;
                   unique case(zerobit_position13)
                      35'd8 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:3],1'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:4],2'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:5],3'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:6],4'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:7],5'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:8],6'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:9],7'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:10],8'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:11],9'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:12],10'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:13],11'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:14],12'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:15],13'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:16],14'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:17],15'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:18],16'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:19],17'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:20],18'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:21],19'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:22],20'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:23],21'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:24],22'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:25],23'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:26],24'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:27],25'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:28],26'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:29],27'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:30],28'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:31],29'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1:32],30'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address13 = {3'd0,pmpaddr13_i[PMP_WIDTH-1],31'd0};
                              end_address13 =  {3'd0,pmpaddr13_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address13 ={RANGE_WIDTH {1'b0}};
                              end_address13 =  35'd17179869184;
                              end 
                    default:begin
                              start_address13 ={RANGE_WIDTH {1'b0}};
                              end_address13 ={RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address13 ={RANGE_WIDTH {1'b0}};
                   end_address13 = {RANGE_WIDTH {1'b0}};
                  end
        
      endcase
      
  end
  else
  begin
      start_address13 ={RANGE_WIDTH {1'b0}};
      end_address13 = {RANGE_WIDTH {1'b0}};
  end
end

always_comb
begin
if(pmpcfg3_i[23:16] != 8'b0)
begin

      unique case({off_valid14 ,tor_valid14,na4_valid14 ,napot_valid14 })
          4'b1000:begin
                   start_address14 ={RANGE_WIDTH {1'b0}};
                   end_address14 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address14 = {3'd0, pmpaddr13_r } + 35'b1;
                   end_address14 = {3'd0,pmpaddr14_i};
                  end
          4'b0010:begin
                   start_address14 = {3'd0, pmpaddr14_i };
                   end_address14 = {3'd0,pmpaddr14_i} + 35'd4;
                  end
          4'b0001:begin
                 //  start_address14 = pmpaddr14_i;
                 //  end_address14 = {3'd0,pmpaddr14_i }+  zerobit_position14;
                   unique case(zerobit_position14)
                      35'd8 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:3],1'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:4],2'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:5],3'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:6],4'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:7],5'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:8],6'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:9],7'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:10],8'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:11],9'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:12],10'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:13],11'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:14],12'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:15],13'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:16],14'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:17],15'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:18],16'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:19],17'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:20],18'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:21],19'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:22],20'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:23],21'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:24],22'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:25],23'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:26],24'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:27],25'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:28],26'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:29],27'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:30],28'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:31],29'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1:32],30'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address14 = {3'd0,pmpaddr14_i[PMP_WIDTH-1],31'd0};
                              end_address14 =  {3'd0,pmpaddr14_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address14 = {RANGE_WIDTH {1'b0}};
                              end_address14 = 35'd17179869184;
                              end 
                    default:begin
                              start_address14 ={RANGE_WIDTH {1'b0}};
                              end_address14 ={RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address14 = {RANGE_WIDTH {1'b0}};
                   end_address14 = {RANGE_WIDTH {1'b0}};
               end
        
      endcase
  end
  else
  begin
      start_address14 = {RANGE_WIDTH {1'b0}};
      end_address14 ={RANGE_WIDTH {1'b0}};
  end
end


always_comb
begin
if(pmpcfg3_i[31:24] != 8'b0)
begin

         unique case({off_valid15 ,tor_valid15,na4_valid15 ,napot_valid15 })
          4'b1000:begin
                   start_address15 = {RANGE_WIDTH {1'b0}};
                   end_address15 = {RANGE_WIDTH {1'b0}};
                  end
          4'b0100:begin
                   start_address15 = {3'd0, pmpaddr14_r } + 35'b1;
                   end_address15 = {3'd0,pmpaddr15_i};
                  end
          4'b0010:begin
                   start_address15 = {3'd0, pmpaddr15_i };
                   end_address15 = {3'd0,pmpaddr15_i} + 35'd4;
                  end
          4'b0001:begin
                  // start_address15 = pmpaddr15_i;
                 //  end_address15 = {3'd0,pmpaddr15_i }+  zerobit_position15;
                   unique case(zerobit_position15)
                      35'd8 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:3],1'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:3],1'd0} +  35'd8;
                              end            
                    35'd16  : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:4],2'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:4],2'd0} +   35'd16 ;
                              end          
                    35'd32  :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:5],3'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:5],3'd0} +   35'd32 ;
                              end           
                    35'd64 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:6],4'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:6],4'd0} +   35'd64 ;
                              end
                    35'd128 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:7],5'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:7],5'd0} +  35'd128;
                              end           
                    35'd256 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:8],6'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:8],6'd0} +  35'd256;
                              end           
                    35'd512 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:9],7'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:9],7'd0} +  35'd512;
                              end          
                    35'd1024 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:10],8'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:10],8'd0} +   35'd1024 ;
                              end          
                    35'd2048 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:11],9'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:11],9'd0} +   35'd2048 ;
                              end          
                    35'd4096 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:12],10'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:12],10'd0} +   35'd4096;
                              end         
                    35'd8192 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:13],11'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:13],11'd0} +  35'd8192 ;
                              end          
                    35'd16384 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:14],12'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:14],12'd0} +  35'd16384;
                              end         
                    35'd32768 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:15],13'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:15],13'd0} +   35'd32768;
                              end         
                    35'd65536 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:16],14'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:16],14'd0} +  35'd65536;
                              end         
                    35'd131072 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:17],15'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:17],15'd0} +  35'd131072;
                              end        
                    35'd262144 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:18],16'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:18],16'd0} +  35'd262144;
                              end        
                    35'd524288 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:19],17'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:19],17'd0} +  35'd524288;
                              end        
                    35'd1048576 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:20],18'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:20],18'd0} +  35'd1048576;
                              end       
                    35'd2097152 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:21],19'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:21],19'd0} +  35'd2097152;
                              end       
                    35'd4194304 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:22],20'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:22],20'd0} +  35'd4194304;
                              end       
                    35'd8388608 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:23],21'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:23],21'd0} +  35'd8388608;
                              end       
                    35'd16777216 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:24],22'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:24],22'd0} +  35'd16777216;
                              end     
                    35'd33554432 :begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:25],23'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:25],23'd0} +  35'd33554432;
                              end      
                    35'd67108864 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:26],24'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:26],24'd0} +  35'd67108864;
                              end      
                    35'd134217728 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:27],25'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:27],25'd0} +  35'd134217728;
                              end     
                    35'd268435456 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:28],26'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:28],26'd0} + 35'd268435456;
                              end     
                    35'd536870912 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:29],27'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:29],27'd0} +  35'd536870912;
                              end     
                    35'd1073741824 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:30],28'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:30],28'd0} +   35'd1073741824;
                              end    
                    35'd2147483648 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:31],29'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:31],29'd0} +  35'd2147483648;
                              end    
                    35'd4294967296 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1:32],30'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:32],30'd0} +  35'd4294967296;
                              end  
                    35'd8589934592 : begin
                              start_address15 = {3'd0,pmpaddr15_i[PMP_WIDTH-1],31'd0};
                              end_address15 =  {3'd0,pmpaddr15_i[PMP_WIDTH-1:33],31'd0} +  35'd8589934592;
                              end    
                    35'd17179869184 :begin
                              start_address15 = {RANGE_WIDTH {1'b0}};
                              end_address15 =  35'd17179869184;
                              end 
                    default:begin
                              start_address15 = {RANGE_WIDTH {1'b0}};
                              end_address15 = {RANGE_WIDTH {1'b0}};
                             end
                         endcase                   //end of inner unique case


                     end                             //end of outer unique case expression

          default:begin
                   start_address15 = {RANGE_WIDTH {1'b0}};
                   end_address15 =  {RANGE_WIDTH {1'b0}};
                  end
        
      endcase

  end

    else
  begin
      start_address15 = {RANGE_WIDTH {1'b0}};
      end_address15 = {RANGE_WIDTH {1'b0}};
  end

  end



  //range exception logic

  always_comb
  begin
      if((start_address0 != 1 && end_address0 !=0) && start_address0 > end_address0)
      begin
          region0_range_exception = 1'b1;
      end
      else
      begin
          region0_range_exception = 1'b0;
      end
  end

   always_comb
  begin
      if((start_address1 != 1 && end_address1 != 0) && start_address1 > end_address1)
      begin
          region1_range_exception = 1'b1;
      end
      else
      begin
          region1_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address2 != 1 && end_address2 !=0) && start_address2 > end_address2)
      begin
          region2_range_exception = 1'b1;
      end
      else
      begin
          region2_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address3 != 1 && end_address3 !=0) && start_address3 > end_address3)
      begin
          region3_range_exception = 1'b1;
      end
      else
      begin
          region3_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address4 != 1 && end_address4 !=0) && start_address4 > end_address4)
      begin
          region4_range_exception = 1'b1;
      end
      else
      begin
          region4_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address5 != 1 && end_address5 !=0) && start_address5 > end_address5)
      begin
          region5_range_exception = 1'b1;
      end
      else
      begin
          region5_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address6 != 1 && end_address6 !=0) && start_address6 > end_address6)
      begin
          region6_range_exception = 1'b1;
      end
      else
      begin
          region6_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address7 != 1 && end_address7 !=0) && start_address7 > end_address7)
      begin
          region7_range_exception = 1'b1;
      end
      else
      begin
          region7_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address8 != 1 && end_address8 !=0) && start_address8 > end_address8)
      begin
          region8_range_exception = 1'b1;
      end
      else
      begin
          region8_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address9 != 1 && end_address9 !=0) && start_address9 > end_address9)
      begin
          region9_range_exception = 1'b1;
      end
      else
      begin
          region9_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address10 != 1 && end_address10 !=0) && start_address10 > end_address10)
      begin
          region10_range_exception = 1'b1;
      end
      else
      begin
          region10_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address11 != 1 && end_address11 !=0) && start_address11 > end_address11)
      begin
          region11_range_exception = 1'b1;
      end
      else
      begin
          region11_range_exception = 1'b0;
      end
  end
 always_comb
  begin
      if((start_address12 != 1 && end_address12 !=0) && start_address12 > end_address12)
      begin
          region12_range_exception = 1'b1;
      end
      else
      begin
          region12_range_exception = 1'b0;
      end
  end

   always_comb
  begin
      if((start_address13 != 1 && end_address13 !=0) && start_address13 > end_address13)
      begin
          region13_range_exception = 1'b1;
      end
      else
      begin
          region13_range_exception = 1'b0;
      end
  end

 always_comb
  begin
      if((start_address14 != 1 && end_address14 !=0) && start_address14 > end_address14)
      begin
          region14_range_exception = 1'b1;
      end
      else
      begin
          region14_range_exception = 1'b0;
      end
  end

  always_comb
  begin
      if((start_address15 != 1 && end_address15 !=0) && start_address15 > end_address15)
      begin
          region15_range_exception = 1'b1;
      end
      else
      begin
          region15_range_exception = 1'b0;

      end
  end 

endmodule
