`timescale 1ns/1ps
module pre_processing # ( `ifdef DIV_32BIT                
                                parameter DW = 32,          
                                parameter NO_ITR_WIDTH = 6
                            `else
                                parameter DW = 64,           
                                parameter NO_ITR_WIDTH = 7
                            `endif
                          )
(
        input   [DW-1:0]            dividend           ,
        input   [DW-1:0]            divisor            ,
        output  [NO_ITR_WIDTH-1:0]  iterations_value   ,
        output  [DW+1:0]            dividend_star      ,
        output  [DW+1:0]            divisor_star       ,
        output  [NO_ITR_WIDTH-1:0]  no_bits_divisor_o  ,
        output  [NO_ITR_WIDTH-1:0]  no_bits_dividend_o  
);

reg [DW-1:0] dividend_temp     ;
reg [DW-1:0] divisor_temp      ;
reg [NO_ITR_WIDTH-1:0]    no_bits_dividend  ;
reg [NO_ITR_WIDTH-1:0]    no_bits_divisor   ;

wire [NO_ITR_WIDTH-1:0] one_6bit;
wire [NO_ITR_WIDTH-1:0] csa_0_out;
wire [NO_ITR_WIDTH-1:0] csa_1_out;
wire [NO_ITR_WIDTH-1:0] csa_2_out;

wire [NO_ITR_WIDTH-1:0] nobits_divisor_neg;

// outputs
assign dividend_star = {2'b00,dividend_temp};
assign iterations_value = (dividend != {DW{1'b0}}) ? (csa_2_out) : {NO_ITR_WIDTH{1'b0}} ; 
assign divisor_star = {1'b0, divisor_temp, 1'b0};


assign one_6bit = {{NO_ITR_WIDTH-1{1'b0}},1'b1};

CarrySaveAdd #(NO_ITR_WIDTH) csa_inst_0 (
    .input_a    (no_bits_dividend   ),
    .input_b    (one_6bit           ),
    .output_y   (csa_0_out          ) 
);

assign nobits_divisor_neg = ~no_bits_divisor;
CarrySaveAdd #(NO_ITR_WIDTH) csa_inst_1 (
    .input_a    (nobits_divisor_neg ),
    .input_b    (one_6bit           ),
    .output_y   (csa_1_out          ) 
);

CarrySaveAdd #(NO_ITR_WIDTH) csa_inst_2 (
    .input_a    (csa_0_out  ),
    .input_b    (csa_1_out  ),
    .output_y   (csa_2_out  ) 
);


assign no_bits_divisor_o    = no_bits_divisor;
assign no_bits_dividend_o   = no_bits_dividend;

always@(*)
begin
    `ifdef DIV_32BIT
	casex(dividend)
	    32'b1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = dividend;
                no_bits_dividend = 6'd32;
			end
				
		32'b01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[30:0] , 1'b0 };
                no_bits_dividend = 6'd31;
			end
		32'b001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[29:0] , 2'b0 };
                no_bits_dividend = 6'd30;
			end
		32'b0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[28:0] , 3'b0 };
                no_bits_dividend = 6'd29;
			end
		32'b0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[27:0] , 4'b0000 };
                no_bits_dividend = 6'd28;
			end	
		32'b0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[26:0] , 5'b0};
                no_bits_dividend = 6'd27;
			end			
		32'b0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[25:0] , 6'b0 };
                no_bits_dividend = 6'd26;
			end	
		32'b0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[24:0] , 7'b0 };
                no_bits_dividend = 6'd25;
			end	
		32'b0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[23:0] , 8'b0 } ;
                no_bits_dividend = 6'd24;
			end	
		32'b0000_0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[22:0] , 9'b0 };
                no_bits_dividend = 6'd23;
			end	
		32'b0000_0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[21:0] , 10'b0 } ;
                no_bits_dividend = 6'd22;
			end
		32'b0000_0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[20:0] , 11'b0};
                no_bits_dividend = 6'd21;
			end	
		32'b0000_0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[19:0] , 12'b0 } ;
                no_bits_dividend = 6'd20;
			end		
		32'b0000_0000_0000_01xx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[18:0] , 13'b0 };
                no_bits_dividend = 6'd19;
			end	
		32'b0000_0000_0000_001x_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[17:0] , 14'b0 } ;
                no_bits_dividend = 6'd18;
			end		
		32'b0000_0000_0000_0001_xxxx_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[16:0] , 15'b0 };
                no_bits_dividend = 6'd17;
			end	
		32'b0000_0000_0000_0000_1xxx_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[15:0] , 16'b0 } ;
                no_bits_dividend = 6'd16;
			end		
		32'b0000_0000_0000_0000_01xx_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[14:0] , 17'b0 };
                no_bits_dividend = 6'd15;
			end	
		32'b0000_0000_0000_0000_001x_xxxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[13:0] , 18'b0 } ;
                no_bits_dividend = 6'd14;
			end		
		32'b0000_0000_0000_0000_0001_xxxx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[12:0] , 19'b0 };
                no_bits_dividend = 6'd13;
			end	
		32'b0000_0000_0000_0000_0000_1xxx_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[11:0] , 20'b0 } ;
                no_bits_dividend = 6'd12;
			end		
		32'b0000_0000_0000_0000_0000_01xx_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[10:0] , 21'b0 };
                no_bits_dividend = 6'd11;
			end	
		32'b0000_0000_0000_0000_0000_001x_xxxx_xxxx  : 
			begin 
				dividend_temp = {dividend[9:0] , 22'b0 } ;
                no_bits_dividend = 6'd10;
			end		
		32'b0000_0000_0000_0000_0000_0001_xxxx_xxxx : 
			begin 
				dividend_temp = {dividend[8:0] , 23'b0 };
                no_bits_dividend = 6'd9;
			end	
		32'b0000_0000_0000_0000_0000_0000_1xxx_xxxx  : 
			begin 
				dividend_temp = {dividend[7:0] , 24'b0 } ;
                no_bits_dividend = 6'd8;
			end		
		32'b0000_0000_0000_0000_0000_0000_01xx_xxxx : 
			begin 
				dividend_temp = {dividend[6:0] , 25'b0 };
                no_bits_dividend = 6'd7;
			end	
		32'b0000_0000_0000_0000_0000_0000_001x_xxxx  : 
			begin 
				dividend_temp = {dividend[5:0] , 26'b0 } ;
                no_bits_dividend = 6'd6;
			end		
		32'b0000_0000_0000_0000_0000_0000_0001_xxxx : 
			begin 
				dividend_temp = {dividend[4:0] , 27'b0 };
                no_bits_dividend = 6'd5;
			end	
		32'b0000_0000_0000_0000_0000_0000_0000_1xxx  : 
			begin 
				dividend_temp = {dividend[3:0] , 28'b0 } ;
                no_bits_dividend = 6'd4;
			end		
		32'b0000_0000_0000_0000_0000_0000_0000_01xx : 
			begin 
				dividend_temp = {dividend[2:0] , 29'b0 };
                no_bits_dividend = 6'd3;
			end	
		32'b0000_0000_0000_0000_0000_0000_0000_001x  : 
			begin 
				dividend_temp = {dividend[1:0] , 30'b0 } ;
                no_bits_dividend = 6'd2;
			end		
		32'b0000_0000_0000_0000_0000_0000_0000_0001 : 
			begin 
				dividend_temp = {dividend[0] , 31'b0 };
                no_bits_dividend = 6'd1;
			end	
		default:
			begin
				dividend_temp = 32'b0 ;
                no_bits_dividend = 6'd0;
			end
	endcase
    `else 
    casex(dividend)
        64'b1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = dividend;    no_bits_dividend = 7'd64; end
        64'b01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[62:0] , 1'b0 };    no_bits_dividend = 7'd63; end
        64'b001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[61:0] , 2'b0 };    no_bits_dividend = 7'd62; end
        64'b0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[60:0] , 3'b0 };    no_bits_dividend = 7'd61; end
        64'b00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[59:0] , 4'b0 };    no_bits_dividend = 7'd60; end
        64'b000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[58:0] , 5'b0 };    no_bits_dividend = 7'd59; end
        64'b0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[57:0] , 6'b0 };    no_bits_dividend = 7'd58; end
        64'b00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[56:0] , 7'b0 };    no_bits_dividend = 7'd57; end
        64'b00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[55:0] , 8'b0 };    no_bits_dividend = 7'd56; end
        64'b00000000_01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[54:0] , 9'b0 };    no_bits_dividend = 7'd55; end
        64'b00000000_001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[53:0] , 10'b0 };    no_bits_dividend = 7'd54; end
        64'b00000000_0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[52:0] , 11'b0 };    no_bits_dividend = 7'd53; end
        64'b00000000_00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[51:0] , 12'b0 };    no_bits_dividend = 7'd52; end
        64'b00000000_000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[50:0] , 13'b0 };    no_bits_dividend = 7'd51; end
        64'b00000000_0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[49:0] , 14'b0 };    no_bits_dividend = 7'd50; end
        64'b00000000_00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[48:0] , 15'b0 };    no_bits_dividend = 7'd49; end
        64'b00000000_00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[47:0] , 16'b0 };    no_bits_dividend = 7'd48; end
        64'b00000000_00000000_01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[46:0] , 17'b0 };    no_bits_dividend = 7'd47; end
        64'b00000000_00000000_001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[45:0] , 18'b0 };    no_bits_dividend = 7'd46; end
        64'b00000000_00000000_0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[44:0] , 19'b0 };    no_bits_dividend = 7'd45; end
        64'b00000000_00000000_00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[43:0] , 20'b0 };    no_bits_dividend = 7'd44; end
        64'b00000000_00000000_000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[42:0] , 21'b0 };    no_bits_dividend = 7'd43; end
        64'b00000000_00000000_0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[41:0] , 22'b0 };    no_bits_dividend = 7'd42; end
        64'b00000000_00000000_00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[40:0] , 23'b0 };    no_bits_dividend = 7'd41; end
        64'b00000000_00000000_00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[39:0] , 24'b0 };    no_bits_dividend = 7'd40; end
        64'b00000000_00000000_00000000_01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[38:0] , 25'b0 };    no_bits_dividend = 7'd39; end
        64'b00000000_00000000_00000000_001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[37:0] , 26'b0 };    no_bits_dividend = 7'd38; end
        64'b00000000_00000000_00000000_0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[36:0] , 27'b0 };    no_bits_dividend = 7'd37; end
        64'b00000000_00000000_00000000_00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[35:0] , 28'b0 };    no_bits_dividend = 7'd36; end
        64'b00000000_00000000_00000000_000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[34:0] , 29'b0 };    no_bits_dividend = 7'd35; end
        64'b00000000_00000000_00000000_0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[33:0] , 30'b0 };    no_bits_dividend = 7'd34; end
        64'b00000000_00000000_00000000_00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[32:0] , 31'b0 };    no_bits_dividend = 7'd33; end
        64'b00000000_00000000_00000000_00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[31:0] , 32'b0 };    no_bits_dividend = 7'd32; end
        64'b00000000_00000000_00000000_00000000_01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[30:0] , 33'b0 };    no_bits_dividend = 7'd31; end
        64'b00000000_00000000_00000000_00000000_001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[29:0] , 34'b0 };    no_bits_dividend = 7'd30; end
        64'b00000000_00000000_00000000_00000000_0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[28:0] , 35'b0 };    no_bits_dividend = 7'd29; end
        64'b00000000_00000000_00000000_00000000_00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[27:0] , 36'b0 };    no_bits_dividend = 7'd28; end
        64'b00000000_00000000_00000000_00000000_000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[26:0] , 37'b0 };    no_bits_dividend = 7'd27; end
        64'b00000000_00000000_00000000_00000000_0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[25:0] , 38'b0 };    no_bits_dividend = 7'd26; end
        64'b00000000_00000000_00000000_00000000_00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[24:0] , 39'b0 };    no_bits_dividend = 7'd25; end
        64'b00000000_00000000_00000000_00000000_00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[23:0] , 40'b0 };    no_bits_dividend = 7'd24; end
        64'b00000000_00000000_00000000_00000000_00000000_01xxxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[22:0] , 41'b0 };    no_bits_dividend = 7'd23; end
        64'b00000000_00000000_00000000_00000000_00000000_001xxxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[21:0] , 42'b0 };    no_bits_dividend = 7'd22; end
        64'b00000000_00000000_00000000_00000000_00000000_0001xxxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[20:0] , 43'b0 };    no_bits_dividend = 7'd21; end
        64'b00000000_00000000_00000000_00000000_00000000_00001xxx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[19:0] , 44'b0 };    no_bits_dividend = 7'd20; end
        64'b00000000_00000000_00000000_00000000_00000000_000001xx_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[18:0] , 45'b0 };    no_bits_dividend = 7'd19; end
        64'b00000000_00000000_00000000_00000000_00000000_0000001x_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[17:0] , 46'b0 };    no_bits_dividend = 7'd18; end
        64'b00000000_00000000_00000000_00000000_00000000_00000001_xxxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[16:0] , 47'b0 };    no_bits_dividend = 7'd17; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_1xxxxxxx_xxxxxxxx: begin dividend_temp = {dividend[15:0] , 48'b0 };    no_bits_dividend = 7'd16; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_01xxxxxx_xxxxxxxx: begin dividend_temp = {dividend[14:0] , 49'b0 };    no_bits_dividend = 7'd15; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_001xxxxx_xxxxxxxx: begin dividend_temp = {dividend[13:0] , 50'b0 };    no_bits_dividend = 7'd14; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_0001xxxx_xxxxxxxx: begin dividend_temp = {dividend[12:0] , 51'b0 };    no_bits_dividend = 7'd13; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00001xxx_xxxxxxxx: begin dividend_temp = {dividend[11:0] , 52'b0 };    no_bits_dividend = 7'd12; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_000001xx_xxxxxxxx: begin dividend_temp = {dividend[10:0] , 53'b0 };    no_bits_dividend = 7'd11; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_0000001x_xxxxxxxx: begin dividend_temp = {dividend[09:0] , 54'b0 };    no_bits_dividend = 7'd10; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000001_xxxxxxxx: begin dividend_temp = {dividend[08:0] , 55'b0 };    no_bits_dividend = 7'd09; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_1xxxxxxx: begin dividend_temp = {dividend[07:0] , 56'b0 };    no_bits_dividend = 7'd08; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_01xxxxxx: begin dividend_temp = {dividend[06:0] , 57'b0 };    no_bits_dividend = 7'd07; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_001xxxxx: begin dividend_temp = {dividend[05:0] , 58'b0 };    no_bits_dividend = 7'd06; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_0001xxxx: begin dividend_temp = {dividend[04:0] , 59'b0 };    no_bits_dividend = 7'd05; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00001xxx: begin dividend_temp = {dividend[03:0] , 60'b0 };    no_bits_dividend = 7'd04; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_000001xx: begin dividend_temp = {dividend[02:0] , 61'b0 };    no_bits_dividend = 7'd03; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_0000001x: begin dividend_temp = {dividend[01:0] , 62'b0 };    no_bits_dividend = 7'd02; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000001: begin dividend_temp = {dividend[1] , 63'b0 };    no_bits_dividend = 7'd01; end
        default:
            begin dividend_temp =  64'b0;    no_bits_dividend = 7'd00; end
        endcase 
  `endif
end


always@(*)
begin
    `ifdef DIV_32BIT
	casex(divisor)
	    32'b1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = divisor;
                no_bits_divisor = 6'd32;
			end
				
		32'b01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[30:0] , 1'b0 };
                no_bits_divisor = 6'd31;
			end
		32'b001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[29:0] , 2'b0 };
                no_bits_divisor = 6'd30;
			end
		32'b0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[28:0] , 3'b0 };
                no_bits_divisor = 6'd29;
			end
		32'b0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[27:0] , 4'b0000 };
                no_bits_divisor = 6'd28;
			end	
		32'b0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[26:0] , 5'b0};
                no_bits_divisor = 6'd27;
			end			
		32'b0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[25:0] , 6'b0 };
                no_bits_divisor = 6'd26;
			end	
		32'b0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[24:0] , 7'b0 };
                no_bits_divisor = 6'd25;
			end	
		32'b0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[23:0] , 8'b0 } ;
                no_bits_divisor = 6'd24;
			end	
		32'b0000_0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[22:0] , 9'b0 };
                no_bits_divisor = 6'd23;
			end	
		32'b0000_0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[21:0] , 10'b0 } ;
                no_bits_divisor = 6'd22;
			end
		32'b0000_0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[20:0] , 11'b0};
                no_bits_divisor = 6'd21;
			end	
		32'b0000_0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[19:0] , 12'b0 } ;
                no_bits_divisor = 6'd20;
			end		
		32'b0000_0000_0000_01xx_xxxx_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[18:0] , 13'b0 };
                no_bits_divisor = 6'd19;
			end	
		32'b0000_0000_0000_001x_xxxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[17:0] , 14'b0 } ;
                no_bits_divisor = 6'd18;
			end		
		32'b0000_0000_0000_0001_xxxx_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[16:0] , 15'b0 };
                no_bits_divisor = 6'd17;
			end	
		32'b0000_0000_0000_0000_1xxx_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[15:0] , 16'b0 } ;
                no_bits_divisor = 6'd16;
			end		
		32'b0000_0000_0000_0000_01xx_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[14:0] , 17'b0 };
                no_bits_divisor = 6'd15;
			end	
		32'b0000_0000_0000_0000_001x_xxxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[13:0] , 18'b0 } ;
                no_bits_divisor = 6'd14;
			end		
		32'b0000_0000_0000_0000_0001_xxxx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[12:0] , 19'b0 };
                no_bits_divisor = 6'd13;
			end	
		32'b0000_0000_0000_0000_0000_1xxx_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[11:0] , 20'b0 } ;
                no_bits_divisor = 6'd12;
			end		
		32'b0000_0000_0000_0000_0000_01xx_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[10:0] , 21'b0 };
                no_bits_divisor = 6'd11;
			end	
		32'b0000_0000_0000_0000_0000_001x_xxxx_xxxx  : 
			begin 
				divisor_temp = {divisor[9:0] , 22'b0 } ;
                no_bits_divisor = 6'd10;
			end		
		32'b0000_0000_0000_0000_0000_0001_xxxx_xxxx : 
			begin 
				divisor_temp = {divisor[8:0] , 23'b0 };
                no_bits_divisor = 6'd9;
			end	
		32'b0000_0000_0000_0000_0000_0000_1xxx_xxxx  : 
			begin 
				divisor_temp = {divisor[7:0] , 24'b0 } ;
                no_bits_divisor = 6'd8;
			end		
		32'b0000_0000_0000_0000_0000_0000_01xx_xxxx : 
			begin 
				divisor_temp = {divisor[6:0] , 25'b0 };
                no_bits_divisor = 6'd7;
			end	
		32'b0000_0000_0000_0000_0000_0000_001x_xxxx  : 
			begin 
				divisor_temp = {divisor[5:0] , 26'b0 } ;
                no_bits_divisor = 6'd6;
			end		
		32'b0000_0000_0000_0000_0000_0000_0001_xxxx : 
			begin 
				divisor_temp = {divisor[4:0] , 27'b0 };
                no_bits_divisor = 6'd5;
			end	
		32'b0000_0000_0000_0000_0000_0000_0000_1xxx  : 
			begin 
				divisor_temp = {divisor[3:0] , 28'b0 } ;
                no_bits_divisor = 6'd4;
			end		
		32'b0000_0000_0000_0000_0000_0000_0000_01xx : 
			begin 
				divisor_temp = {divisor[2:0] , 29'b0 };
                no_bits_divisor = 6'd3;
			end	
		32'b0000_0000_0000_0000_0000_0000_0000_001x  : 
			begin 
				divisor_temp = {divisor[1:0] , 30'b0 } ;
                no_bits_divisor = 6'd2;
			end		
		32'b0000_0000_0000_0000_0000_0000_0000_0001 : 
			begin 
				divisor_temp = {divisor[0] , 31'b0 };
                no_bits_divisor = 6'd1;
			end	
		default:
			begin
				divisor_temp = 32'd0 ;
                no_bits_divisor = 6'd0;
			end
	endcase
    `else
    casex(divisor)
        64'b1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = divisor;    no_bits_divisor = 7'd64; end
        64'b01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[62:0] , 1'b0 };    no_bits_divisor = 7'd63; end
        64'b001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[61:0] , 2'b0 };    no_bits_divisor = 7'd62; end
        64'b0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[60:0] , 3'b0 };    no_bits_divisor = 7'd61; end
        64'b00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[59:0] , 4'b0 };    no_bits_divisor = 7'd60; end
        64'b000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[58:0] , 5'b0 };    no_bits_divisor = 7'd59; end
        64'b0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[57:0] , 6'b0 };    no_bits_divisor = 7'd58; end
        64'b00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[56:0] , 7'b0 };    no_bits_divisor = 7'd57; end
        64'b00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[55:0] , 8'b0 };    no_bits_divisor = 7'd56; end
        64'b00000000_01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[54:0] , 9'b0 };    no_bits_divisor = 7'd55; end
        64'b00000000_001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[53:0] , 10'b0 };    no_bits_divisor = 7'd54; end
        64'b00000000_0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[52:0] , 11'b0 };    no_bits_divisor = 7'd53; end
        64'b00000000_00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[51:0] , 12'b0 };    no_bits_divisor = 7'd52; end
        64'b00000000_000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[50:0] , 13'b0 };    no_bits_divisor = 7'd51; end
        64'b00000000_0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[49:0] , 14'b0 };    no_bits_divisor = 7'd50; end
        64'b00000000_00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[48:0] , 15'b0 };    no_bits_divisor = 7'd49; end
        64'b00000000_00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[47:0] , 16'b0 };    no_bits_divisor = 7'd48; end
        64'b00000000_00000000_01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[46:0] , 17'b0 };    no_bits_divisor = 7'd47; end
        64'b00000000_00000000_001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[45:0] , 18'b0 };    no_bits_divisor = 7'd46; end
        64'b00000000_00000000_0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[44:0] , 19'b0 };    no_bits_divisor = 7'd45; end
        64'b00000000_00000000_00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[43:0] , 20'b0 };    no_bits_divisor = 7'd44; end
        64'b00000000_00000000_000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[42:0] , 21'b0 };    no_bits_divisor = 7'd43; end
        64'b00000000_00000000_0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[41:0] , 22'b0 };    no_bits_divisor = 7'd42; end
        64'b00000000_00000000_00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[40:0] , 23'b0 };    no_bits_divisor = 7'd41; end
        64'b00000000_00000000_00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[39:0] , 24'b0 };    no_bits_divisor = 7'd40; end
        64'b00000000_00000000_00000000_01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[38:0] , 25'b0 };    no_bits_divisor = 7'd39; end
        64'b00000000_00000000_00000000_001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[37:0] , 26'b0 };    no_bits_divisor = 7'd38; end
        64'b00000000_00000000_00000000_0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[36:0] , 27'b0 };    no_bits_divisor = 7'd37; end
        64'b00000000_00000000_00000000_00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[35:0] , 28'b0 };    no_bits_divisor = 7'd36; end
        64'b00000000_00000000_00000000_000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[34:0] , 29'b0 };    no_bits_divisor = 7'd35; end
        64'b00000000_00000000_00000000_0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[33:0] , 30'b0 };    no_bits_divisor = 7'd34; end
        64'b00000000_00000000_00000000_00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[32:0] , 31'b0 };    no_bits_divisor = 7'd33; end
        64'b00000000_00000000_00000000_00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[31:0] , 32'b0 };    no_bits_divisor = 7'd32; end
        64'b00000000_00000000_00000000_00000000_01xxxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[30:0] , 33'b0 };    no_bits_divisor = 7'd31; end
        64'b00000000_00000000_00000000_00000000_001xxxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[29:0] , 34'b0 };    no_bits_divisor = 7'd30; end
        64'b00000000_00000000_00000000_00000000_0001xxxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[28:0] , 35'b0 };    no_bits_divisor = 7'd29; end
        64'b00000000_00000000_00000000_00000000_00001xxx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[27:0] , 36'b0 };    no_bits_divisor = 7'd28; end
        64'b00000000_00000000_00000000_00000000_000001xx_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[26:0] , 37'b0 };    no_bits_divisor = 7'd27; end
        64'b00000000_00000000_00000000_00000000_0000001x_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[25:0] , 38'b0 };    no_bits_divisor = 7'd26; end
        64'b00000000_00000000_00000000_00000000_00000001_xxxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[24:0] , 39'b0 };    no_bits_divisor = 7'd25; end
        64'b00000000_00000000_00000000_00000000_00000000_1xxxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[23:0] , 40'b0 };    no_bits_divisor = 7'd24; end
        64'b00000000_00000000_00000000_00000000_00000000_01xxxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[22:0] , 41'b0 };    no_bits_divisor = 7'd23; end
        64'b00000000_00000000_00000000_00000000_00000000_001xxxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[21:0] , 42'b0 };    no_bits_divisor = 7'd22; end
        64'b00000000_00000000_00000000_00000000_00000000_0001xxxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[20:0] , 43'b0 };    no_bits_divisor = 7'd21; end
        64'b00000000_00000000_00000000_00000000_00000000_00001xxx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[19:0] , 44'b0 };    no_bits_divisor = 7'd20; end
        64'b00000000_00000000_00000000_00000000_00000000_000001xx_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[18:0] , 45'b0 };    no_bits_divisor = 7'd19; end
        64'b00000000_00000000_00000000_00000000_00000000_0000001x_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[17:0] , 46'b0 };    no_bits_divisor = 7'd18; end
        64'b00000000_00000000_00000000_00000000_00000000_00000001_xxxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[16:0] , 47'b0 };    no_bits_divisor = 7'd17; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_1xxxxxxx_xxxxxxxx: begin divisor_temp = {divisor[15:0] , 48'b0 };    no_bits_divisor = 7'd16; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_01xxxxxx_xxxxxxxx: begin divisor_temp = {divisor[14:0] , 49'b0 };    no_bits_divisor = 7'd15; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_001xxxxx_xxxxxxxx: begin divisor_temp = {divisor[13:0] , 50'b0 };    no_bits_divisor = 7'd14; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_0001xxxx_xxxxxxxx: begin divisor_temp = {divisor[12:0] , 51'b0 };    no_bits_divisor = 7'd13; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00001xxx_xxxxxxxx: begin divisor_temp = {divisor[11:0] , 52'b0 };    no_bits_divisor = 7'd12; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_000001xx_xxxxxxxx: begin divisor_temp = {divisor[10:0] , 53'b0 };    no_bits_divisor = 7'd11; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_0000001x_xxxxxxxx: begin divisor_temp = {divisor[09:0] , 54'b0 };    no_bits_divisor = 7'd10; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000001_xxxxxxxx: begin divisor_temp = {divisor[08:0] , 55'b0 };    no_bits_divisor = 7'd09; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_1xxxxxxx: begin divisor_temp = {divisor[07:0] , 56'b0 };    no_bits_divisor = 7'd08; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_01xxxxxx: begin divisor_temp = {divisor[06:0] , 57'b0 };    no_bits_divisor = 7'd07; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_001xxxxx: begin divisor_temp = {divisor[05:0] , 58'b0 };    no_bits_divisor = 7'd06; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_0001xxxx: begin divisor_temp = {divisor[04:0] , 59'b0 };    no_bits_divisor = 7'd05; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00001xxx: begin divisor_temp = {divisor[03:0] , 60'b0 };    no_bits_divisor = 7'd04; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_000001xx: begin divisor_temp = {divisor[02:0] , 61'b0 };    no_bits_divisor = 7'd03; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_0000001x: begin divisor_temp = {divisor[01:0] , 62'b0 };    no_bits_divisor = 7'd02; end
        64'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000001: begin divisor_temp = {divisor[1] , 63'b0 };    no_bits_divisor = 7'd01; end
        default:
            begin divisor_temp =  64'b0;    no_bits_divisor = 7'd00; end
        
        endcase 
    `endif
end
endmodule
