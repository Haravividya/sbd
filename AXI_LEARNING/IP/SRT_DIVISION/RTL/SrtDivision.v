`timescale 1ns/1ps
module srt_division     # ( `ifdef DIV_32BIT                
                                parameter DW = 32,          
                                parameter NO_ITR_WIDTH = 6
                            `else
                                parameter DW = 64,           
                                parameter NO_ITR_WIDTH = 7
                            `endif
                          )
(
    input 	        			clk         ,
    input 		        		rst_n       ,
    input	        			div_start   ,//Start Division signal
    input       [DW-1:0]		dividend    ,
    input       [DW-1:0] 		divisor     ,
    output      [DW-1:0] 		quotient    ,
    output reg  [DW-1:0] 		remainder   ,
    output                      div_busy_o  ,
    output		        		div_done    ,//Division done signal
    output			        	div_error    //Error for divide by zero
);
 
//Internal wire and reg declaration
wire   [DW+1:0]     dividend_temp_w ;//temporary wire for output of preprocessing
wire   [DW+1:0]     divisor_temp_w  ;

reg    [DW+1:0]      dividend_star_r   ;//preprocessed dividend register 
reg    [DW+1:0]      divisor_star_r    ;//preprocessed divisor register
reg    [DW+1:0]      divisor_2s_star ;//reg for 2s compliment of divisor
reg    [DW+1:0]      remainder_reg   ;//partial remainder 

wire [DW+1:0] dividend_rem_1;//Partial remainder after first iteration
wire [DW+1:0] dividend_ls;

wire [DW+1:0] dividend_csa_in;
reg [DW+1:0] divisor_csa_in;
wire [DW+1:0] csa_output;

wire   [1:0]       compare_bits ;//bits used to commpare wheather to add,sub or nop
wire   [DW+1:0]      divisor_neg  ;//compliment of divisor
wire   [DW+1:0]      divisor_2s   ;//2's compliment of divisor
wire   [DW+1:0]      one_34bit    ;
wire   [DW+1:0]      divisor_2s_w ;

wire    nop_valid;//no operation valid signal
wire    sub_valid;//subtract valid signal
wire    add_valid;//add valid signal

wire        div_busy;
reg [NO_ITR_WIDTH-1:0]   itr_count;
wire        toggle_w;
reg         toggle_r;
wire [NO_ITR_WIDTH-1:0] num_itr;
wire div_start_toggle;

wire    [NO_ITR_WIDTH-1:0]  no_bits_divisor_w;
reg     [NO_ITR_WIDTH-1:0]  no_bits_divisor_r;
wire    [NO_ITR_WIDTH-1:0]  no_bits_dividend_w;
reg     [NO_ITR_WIDTH-1:0]  no_bits_dividend_r;

reg [DW-1 :0]   dividend_reg;//Registering the inputs
reg [DW-1 :0]   divisor_reg;

wire    [DW+1 : 0] remainder_temp_w;
wire [DW+1 :0] remainder_after_adding_dividend_w;

//Quotient logic declarations
reg     [DW-1 : 0] quotient_temp_r;
reg     [DW-1 : 0] quotient_correction_r;
reg     [DW-1 : 0] add_one_to_q;
wire    [DW-1 : 0] quotient_correction_2;

wire    [DW-1 : 0] q_c2_neg;
wire    [DW-1 : 0] quotient_correction_2s;

wire [DW-1:0] one_32bit;//one -to be added for 2s compliment
wire [DW-1:0] quotient_corrn_2swire;//csa output for adding 1 in 2s compliment
wire    [DW-1 : 0] quotient_csa_out;
reg     [DW-1 : 0] quotient_w;

wire quotient_bit;
wire q_correction_lsb;


wire    before_div_done;
wire partial_rem_neg;

reg div_error_reg;//registering of div_error


//Div busy output signal
assign div_busy_o = div_busy;

//Division error logic
assign div_error = ((divisor=={DW{1'b0}}) | (divisor > dividend)) /*& (div_start)*/ ;   //by default div_error is 1 (i.e. in reset condition)

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        dividend_reg <= {DW{1'b0}};
        divisor_reg  <= {DW{1'b0}};
    end
    else
    begin
        if(div_start && (!div_error))
        begin
            dividend_reg <= dividend;
            divisor_reg  <= divisor;
        end
    end
end


// instance preprocessign
pre_processing #(DW) pre_process_inst (
    .dividend           (dividend_reg       ),
    .divisor            (divisor_reg        ),
    .iterations_value   (num_itr            ),
    .divisor_star       (divisor_temp_w     ),
    .dividend_star      (dividend_temp_w    ),
    .no_bits_divisor_o  (no_bits_divisor_w  ),
    .no_bits_dividend_o (no_bits_dividend_w ) 
);

assign dividend_ls = {dividend_temp_w[DW : 0], 1'b0};

assign divisor_neg = ~divisor_temp_w ;
assign divisor_2s  = divisor_2s_w;  

assign one_34bit   = {{DW+1{1'b0}},1'b1}; 

//Instantiate CSA for adding 1 to divisor_neg
CarrySaveAdd #(DW+2) csa_instance6 (
    .input_a    (divisor_neg    ),
    .input_b    (one_34bit      ),
    .output_y   (divisor_2s_w   )
);

//First iteration addition with 2s comp(divisor)
CarrySaveAdd #(DW+2) csa_instance1 (
    .input_a    (dividend_ls    ),
    .input_b    (divisor_2s     ),
    .output_y   (dividend_rem_1 )
);


//inputs registered here after preprocessing and first iteration
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        dividend_star_r     <= {DW+2{1'b0}} ;
        divisor_star_r      <= {DW+2{1'b0}} ;
        divisor_2s_star     <= {DW+2{1'b0}} ;
        no_bits_divisor_r   <= {NO_ITR_WIDTH{1'b0}};
        no_bits_dividend_r  <= {NO_ITR_WIDTH{1'b0}};
    end
    else
    begin
        if(!div_error)
        begin
            dividend_star_r     <= dividend_rem_1       ;
            divisor_star_r      <= divisor_temp_w       ;
            divisor_2s_star     <= divisor_2s           ;
            no_bits_divisor_r   <= no_bits_divisor_w    ;
            no_bits_dividend_r  <= no_bits_dividend_w   ;
        end
    end
end



assign compare_bits = remainder_reg [DW : DW-1]; //MOVE IT DOWN LATER!!!!!!!!!!!!!!!!!


//valid signal generation
assign nop_valid = ((itr_count == {{DW-1{1'b0}}, 1'b1}) ? ((~dividend_star_r[DW+1]) ^ dividend_star_r[DW]) :  (~(compare_bits[1]) ^ compare_bits[0])) & div_busy ;
assign sub_valid = ((itr_count == {{DW-1{1'b0}}, 1'b1}) ? ((~dividend_star_r[DW+1]) & dividend_star_r[DW]) :  ((~compare_bits[1]) & compare_bits[0])) & div_busy ;
assign add_valid = ((itr_count == {{DW-1{1'b0}}, 1'b1}) ? (dividend_star_r[DW+1] & (~dividend_star_r[DW])) : (compare_bits[1] & (~compare_bits[0]))) & div_busy ;


//

always@(*)
begin
        case({nop_valid, sub_valid, add_valid})
            3'b100 :    begin
                            divisor_csa_in = {DW+2{1'b0}};
                        end
            3'b010 :    begin
                            divisor_csa_in = divisor_2s_star;
                        end
            3'b001 :    begin
                            divisor_csa_in = divisor_star_r;
                        end
            default:    begin
                            divisor_csa_in = {DW+2{1'b0}};
                        end
        endcase
end

assign dividend_csa_in = (itr_count == {{NO_ITR_WIDTH-1{1'b0}},1'b1}) ? {dividend_star_r[DW+1:0]} : {remainder_reg[DW:0], 1'b0} ;//if count is 1 then feed dividend star else feed next partial remainder values

//Instantiate CSA to add at every posedge
CarrySaveAdd #(DW+2) csa_instance2 (
    .input_a    (dividend_csa_in    ),
    .input_b    (divisor_csa_in     ),
    .output_y   (csa_output         )
);

//CSA output is fed to Partial remainder register
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        remainder_reg <= {DW+2{1'b0}};
    else
    begin
        if(div_busy && (!div_done))
            remainder_reg <= csa_output;
        else
            remainder_reg <= {DW+2{1'b0}};
    end
end

//remainder selection logic
always@(*)
begin
    if(div_done)
    begin
        if(no_bits_divisor_r == no_bits_dividend_r)
        begin
            `ifdef DIV_32BIT
                case(no_bits_divisor_r)
                    6'b00_0001 : begin remainder = {{DW-1 {1'b0}}, dividend_star_r[DW]} ; end       
                    6'b00_0010 : begin remainder = {{DW-2 {1'b0}}, dividend_star_r[DW:DW-1 ]}; end  
                    6'b00_0011 : begin remainder = {{DW-3 {1'b0}}, dividend_star_r[DW:DW-2 ]}; end  
                    6'b00_0100 : begin remainder = {{DW-4 {1'b0}}, dividend_star_r[DW:DW-3 ]}; end  
                    6'b00_0101 : begin remainder = {{DW-5 {1'b0}}, dividend_star_r[DW:DW-4 ]}; end  
                    6'b00_0110 : begin remainder = {{DW-6 {1'b0}}, dividend_star_r[DW:DW-5 ]}; end  
                    6'b00_0111 : begin remainder = {{DW-7 {1'b0}}, dividend_star_r[DW:DW-6 ]}; end  
                    6'b00_1000 : begin remainder = {{DW-8 {1'b0}}, dividend_star_r[DW:DW-7 ]}; end  
                    6'b00_1001 : begin remainder = {{DW-9 {1'b0}}, dividend_star_r[DW:DW-8 ]}; end  
                    6'b00_1010 : begin remainder = {{DW-10{1'b0}}, dividend_star_r[DW:DW-9 ]}; end  
                    6'b00_1011 : begin remainder = {{DW-11{1'b0}}, dividend_star_r[DW:DW-10]}; end  
                    6'b00_1100 : begin remainder = {{DW-12{1'b0}}, dividend_star_r[DW:DW-11]}; end  
                    6'b00_1101 : begin remainder = {{DW-13{1'b0}}, dividend_star_r[DW:DW-12]}; end  
                    6'b00_1110 : begin remainder = {{DW-14{1'b0}}, dividend_star_r[DW:DW-13]}; end  
                    6'b00_1111 : begin remainder = {{DW-15{1'b0}}, dividend_star_r[DW:DW-14]}; end  
                    6'b01_0000 : begin remainder = {{DW-16{1'b0}}, dividend_star_r[DW:DW-15]}; end  
                    6'b01_0001 : begin remainder = {{DW-17{1'b0}}, dividend_star_r[DW:DW-16]}; end  
                    6'b01_0010 : begin remainder = {{DW-18{1'b0}}, dividend_star_r[DW:DW-17]}; end  
                    6'b01_0011 : begin remainder = {{DW-19{1'b0}}, dividend_star_r[DW:DW-18]}; end  
                    6'b01_0100 : begin remainder = {{DW-20{1'b0}}, dividend_star_r[DW:DW-19]}; end  
                    6'b01_0101 : begin remainder = {{DW-21{1'b0}}, dividend_star_r[DW:DW-20]}; end  
                    6'b01_0110 : begin remainder = {{DW-22{1'b0}}, dividend_star_r[DW:DW-21]}; end  
                    6'b01_0111 : begin remainder = {{DW-23{1'b0}}, dividend_star_r[DW:DW-22]}; end  
                    6'b01_1000 : begin remainder = {{DW-24{1'b0}}, dividend_star_r[DW:DW-23]}; end  
                    6'b01_1001 : begin remainder = {{DW-25{1'b0}}, dividend_star_r[DW:DW-24]}; end  
                    6'b01_1010 : begin remainder = {{DW-26{1'b0}}, dividend_star_r[DW:DW-25]}; end  
                    6'b01_1011 : begin remainder = {{DW-27{1'b0}}, dividend_star_r[DW:DW-26]}; end  
                    6'b01_1100 : begin remainder = {{DW-28{1'b0}}, dividend_star_r[DW:DW-27]}; end
                    6'b01_1101 : begin remainder = {{DW-29{1'b0}}, dividend_star_r[DW:DW-28]}; end
                    6'b01_1110 : begin remainder = {{DW-30{1'b0}}, dividend_star_r[DW:DW-29]}; end  
                    6'b01_1111 : begin remainder = {{DW-31{1'b0}}, dividend_star_r[DW:DW-30]}; end  
                    6'b10_0000 : begin remainder = dividend_star_r[DW:DW-31]; end
                    default   : begin remainder = {DW{1'd0}}; end
                endcase
            `else
                case(no_bits_divisor_r)
                    7'b000_0001 : begin remainder = {{DW-1 {1'b0}}, dividend_star_r[DW]} ; end       
                    7'b000_0010 : begin remainder = {{DW-2 {1'b0}}, dividend_star_r[DW:DW-1 ]}; end  
                    7'b000_0011 : begin remainder = {{DW-3 {1'b0}}, dividend_star_r[DW:DW-2 ]}; end  
                    7'b000_0100 : begin remainder = {{DW-4 {1'b0}}, dividend_star_r[DW:DW-3 ]}; end  
                    7'b000_0101 : begin remainder = {{DW-5 {1'b0}}, dividend_star_r[DW:DW-4 ]}; end  
                    7'b000_0110 : begin remainder = {{DW-6 {1'b0}}, dividend_star_r[DW:DW-5 ]}; end  
                    7'b000_0111 : begin remainder = {{DW-7 {1'b0}}, dividend_star_r[DW:DW-6 ]}; end  
                    7'b000_1000 : begin remainder = {{DW-8 {1'b0}}, dividend_star_r[DW:DW-7 ]}; end  
                    7'b000_1001 : begin remainder = {{DW-9 {1'b0}}, dividend_star_r[DW:DW-8 ]}; end  
                    7'b000_1010 : begin remainder = {{DW-10{1'b0}}, dividend_star_r[DW:DW-9 ]}; end  
                    7'b000_1011 : begin remainder = {{DW-11{1'b0}}, dividend_star_r[DW:DW-10]}; end  
                    7'b000_1100 : begin remainder = {{DW-12{1'b0}}, dividend_star_r[DW:DW-11]}; end  
                    7'b000_1101 : begin remainder = {{DW-13{1'b0}}, dividend_star_r[DW:DW-12]}; end  
                    7'b000_1110 : begin remainder = {{DW-14{1'b0}}, dividend_star_r[DW:DW-13]}; end  
                    7'b000_1111 : begin remainder = {{DW-15{1'b0}}, dividend_star_r[DW:DW-14]}; end  
                    7'b001_0000 : begin remainder = {{DW-16{1'b0}}, dividend_star_r[DW:DW-15]}; end  
                    7'b001_0001 : begin remainder = {{DW-17{1'b0}}, dividend_star_r[DW:DW-16]}; end  
                    7'b001_0010 : begin remainder = {{DW-18{1'b0}}, dividend_star_r[DW:DW-17]}; end  
                    7'b001_0011 : begin remainder = {{DW-19{1'b0}}, dividend_star_r[DW:DW-18]}; end  
                    7'b001_0100 : begin remainder = {{DW-20{1'b0}}, dividend_star_r[DW:DW-19]}; end  
                    7'b001_0101 : begin remainder = {{DW-21{1'b0}}, dividend_star_r[DW:DW-20]}; end  
                    7'b001_0110 : begin remainder = {{DW-22{1'b0}}, dividend_star_r[DW:DW-21]}; end  
                    7'b001_0111 : begin remainder = {{DW-23{1'b0}}, dividend_star_r[DW:DW-22]}; end  
                    7'b001_1000 : begin remainder = {{DW-24{1'b0}}, dividend_star_r[DW:DW-23]}; end  
                    7'b001_1001 : begin remainder = {{DW-25{1'b0}}, dividend_star_r[DW:DW-24]}; end  
                    7'b001_1010 : begin remainder = {{DW-26{1'b0}}, dividend_star_r[DW:DW-25]}; end  
                    7'b001_1011 : begin remainder = {{DW-27{1'b0}}, dividend_star_r[DW:DW-26]}; end  
                    7'b001_1100 : begin remainder = {{DW-28{1'b0}}, dividend_star_r[DW:DW-27]}; end
                    7'b001_1101 : begin remainder = {{DW-29{1'b0}}, dividend_star_r[DW:DW-28]}; end
                    7'b001_1110 : begin remainder = {{DW-30{1'b0}}, dividend_star_r[DW:DW-29]}; end  
                    7'b001_1111 : begin remainder = {{DW-31{1'b0}}, dividend_star_r[DW:DW-30]}; end  
                    7'b010_0000 : begin remainder = {{DW-32{1'b0}}, dividend_star_r[DW:DW-31]}; end                       
                    7'b010_0001 : begin remainder = {{DW-33{1'b0}}, dividend_star_r[DW:DW-32]}; end        
                    7'b010_0010 : begin remainder = {{DW-34{1'b0}}, dividend_star_r[DW:DW-33]}; end  
                    7'b010_0011 : begin remainder = {{DW-35{1'b0}}, dividend_star_r[DW:DW-34]}; end
                    7'b010_0100 : begin remainder = {{DW-36{1'b0}}, dividend_star_r[DW:DW-35]}; end
                    7'b010_0101 : begin remainder = {{DW-37{1'b0}}, dividend_star_r[DW:DW-36]}; end
                    7'b010_0110 : begin remainder = {{DW-38{1'b0}}, dividend_star_r[DW:DW-37]}; end
                    7'b010_0111 : begin remainder = {{DW-39{1'b0}}, dividend_star_r[DW:DW-38]}; end
                    7'b010_1000 : begin remainder = {{DW-40{1'b0}}, dividend_star_r[DW:DW-39]}; end
                    7'b010_1001 : begin remainder = {{DW-41{1'b0}}, dividend_star_r[DW:DW-40]}; end
                    7'b010_1010 : begin remainder = {{DW-42{1'b0}}, dividend_star_r[DW:DW-41]}; end
                    7'b010_1011 : begin remainder = {{DW-43{1'b0}}, dividend_star_r[DW:DW-42]}; end
                    7'b010_1100 : begin remainder = {{DW-44{1'b0}}, dividend_star_r[DW:DW-43]}; end
                    7'b010_1101 : begin remainder = {{DW-45{1'b0}}, dividend_star_r[DW:DW-44]}; end 
                    7'b010_1110 : begin remainder = {{DW-46{1'b0}}, dividend_star_r[DW:DW-45]}; end
                    7'b010_1111 : begin remainder = {{DW-47{1'b0}}, dividend_star_r[DW:DW-46]}; end
                    7'b011_0000 : begin remainder = {{DW-48{1'b0}}, dividend_star_r[DW:DW-47]}; end
                    7'b011_0001 : begin remainder = {{DW-49{1'b0}}, dividend_star_r[DW:DW-48]}; end
                    7'b011_0010 : begin remainder = {{DW-50{1'b0}}, dividend_star_r[DW:DW-49]}; end
                    7'b011_0011 : begin remainder = {{DW-51{1'b0}}, dividend_star_r[DW:DW-50]}; end
                    7'b011_0100 : begin remainder = {{DW-52{1'b0}}, dividend_star_r[DW:DW-51]}; end
                    7'b011_0101 : begin remainder = {{DW-53{1'b0}}, dividend_star_r[DW:DW-52]}; end
                    7'b011_0110 : begin remainder = {{DW-54{1'b0}}, dividend_star_r[DW:DW-53]}; end
                    7'b011_0111 : begin remainder = {{DW-55{1'b0}}, dividend_star_r[DW:DW-54]}; end
                    7'b011_1000 : begin remainder = {{DW-56{1'b0}}, dividend_star_r[DW:DW-55]}; end
                    7'b011_1001 : begin remainder = {{DW-57{1'b0}}, dividend_star_r[DW:DW-56]}; end
                    7'b011_1010 : begin remainder = {{DW-58{1'b0}}, dividend_star_r[DW:DW-57]}; end
                    7'b011_1011 : begin remainder = {{DW-59{1'b0}}, dividend_star_r[DW:DW-58]}; end
                    7'b011_1100 : begin remainder = {{DW-60{1'b0}}, dividend_star_r[DW:DW-59]}; end
                    7'b011_1101 : begin remainder = {{DW-61{1'b0}}, dividend_star_r[DW:DW-60]}; end
                    7'b011_1110 : begin remainder = {{DW-62{1'b0}}, dividend_star_r[DW:DW-61]}; end
                    7'b011_1111 : begin remainder = {{DW-63{1'b0}}, dividend_star_r[DW:DW-62]}; end
                    7'b100_0000 : begin remainder = dividend_star_r[DW:DW-63]; end                 
                    default   : begin remainder = {DW{1'd0}}; end
                endcase
            `endif
        end
        else
        begin
            `ifdef DIV_32BIT
                case(no_bits_divisor_r)
                /* 0*/    6'b00_0000 : begin remainder = {DW{1'd0}}; end
                /* 1*/    6'b00_0001 : begin remainder = {{DW-1 {1'b0}}, remainder_temp_w[DW]} ; end
                /* 2*/    6'b00_0010 : begin remainder = {{DW-2 {1'b0}}, remainder_temp_w[DW:DW-1 ]}; end
                /* 3*/    6'b00_0011 : begin remainder = {{DW-3 {1'b0}}, remainder_temp_w[DW:DW-2 ]}; end
                /* 4*/    6'b00_0100 : begin remainder = {{DW-4 {1'b0}}, remainder_temp_w[DW:DW-3 ]}; end
                /* 5*/    6'b00_0101 : begin remainder = {{DW-5 {1'b0}}, remainder_temp_w[DW:DW-4 ]}; end
                /* 6*/    6'b00_0110 : begin remainder = {{DW-6 {1'b0}}, remainder_temp_w[DW:DW-5 ]}; end
                /* 7*/    6'b00_0111 : begin remainder = {{DW-7 {1'b0}}, remainder_temp_w[DW:DW-6 ]}; end
                /* 8*/    6'b00_1000 : begin remainder = {{DW-8 {1'b0}}, remainder_temp_w[DW:DW-7 ]}; end
                /* 9*/    6'b00_1001 : begin remainder = {{DW-9 {1'b0}}, remainder_temp_w[DW:DW-8 ]}; end
                /*10*/    6'b00_1010 : begin remainder = {{DW-10{1'b0}}, remainder_temp_w[DW:DW-9 ]}; end
                /*11*/    6'b00_1011 : begin remainder = {{DW-11{1'b0}}, remainder_temp_w[DW:DW-10]}; end
                /*12*/    6'b00_1100 : begin remainder = {{DW-12{1'b0}}, remainder_temp_w[DW:DW-11]}; end
                /*13*/    6'b00_1101 : begin remainder = {{DW-13{1'b0}}, remainder_temp_w[DW:DW-12]}; end
                /*14*/    6'b00_1110 : begin remainder = {{DW-14{1'b0}}, remainder_temp_w[DW:DW-13]}; end
                /*15*/    6'b00_1111 : begin remainder = {{DW-15{1'b0}}, remainder_temp_w[DW:DW-14]}; end
                /*16*/    6'b01_0000 : begin remainder = {{DW-16{1'b0}}, remainder_temp_w[DW:DW-15]}; end
                /*17*/    6'b01_0001 : begin remainder = {{DW-17{1'b0}}, remainder_temp_w[DW:DW-16]}; end
                /*18*/    6'b01_0010 : begin remainder = {{DW-18{1'b0}}, remainder_temp_w[DW:DW-17]}; end
                /*19*/    6'b01_0011 : begin remainder = {{DW-19{1'b0}}, remainder_temp_w[DW:DW-18]}; end
                /*20*/    6'b01_0100 : begin remainder = {{DW-20{1'b0}}, remainder_temp_w[DW:DW-19]}; end
                /*21*/    6'b01_0101 : begin remainder = {{DW-21{1'b0}}, remainder_temp_w[DW:DW-20]}; end
                /*22*/    6'b01_0110 : begin remainder = {{DW-22{1'b0}}, remainder_temp_w[DW:DW-21]}; end
                /*23*/    6'b01_0111 : begin remainder = {{DW-23{1'b0}}, remainder_temp_w[DW:DW-22]}; end
                /*24*/    6'b01_1000 : begin remainder = {{DW-24{1'b0}}, remainder_temp_w[DW:DW-23]}; end
                /*25*/    6'b01_1001 : begin remainder = {{DW-25{1'b0}}, remainder_temp_w[DW:DW-24]}; end
                /*26*/    6'b01_1010 : begin remainder = {{DW-26{1'b0}}, remainder_temp_w[DW:DW-25]}; end
                /*27*/    6'b01_1011 : begin remainder = {{DW-27{1'b0}}, remainder_temp_w[DW:DW-26]}; end
                /*28*/    6'b01_1100 : begin remainder = {{DW-28{1'b0}}, remainder_temp_w[DW:DW-27]}; end
                /*29*/    6'b01_1101 : begin remainder = {{DW-29{1'b0}}, remainder_temp_w[DW:DW-28]}; end
                /*30*/    6'b01_1110 : begin remainder = {{DW-30{1'b0}}, remainder_temp_w[DW:DW-29]}; end
                /*31*/    6'b01_1111 : begin remainder = {{DW-31{1'b0}}, remainder_temp_w[DW:DW-30]}; end
                          default    : begin remainder = {DW{1'd0}}; end
            endcase
            `else
                case(no_bits_divisor_r)
                /* 0*/    7'b00_00000 : begin remainder = {DW{1'd0}}; end
                /* 1*/    7'b000_0001 : begin remainder = {{DW-1 {1'b0}}, remainder_temp_w[DW]} ; end       
                /* 2*/    7'b000_0010 : begin remainder = {{DW-2 {1'b0}}, remainder_temp_w[DW:DW-1 ]}; end
                /* 3*/    7'b000_0011 : begin remainder = {{DW-3 {1'b0}}, remainder_temp_w[DW:DW-2 ]}; end
                /* 4*/    7'b000_0100 : begin remainder = {{DW-4 {1'b0}}, remainder_temp_w[DW:DW-3 ]}; end
                /* 5*/    7'b000_0101 : begin remainder = {{DW-5 {1'b0}}, remainder_temp_w[DW:DW-4 ]}; end
                /* 6*/    7'b000_0110 : begin remainder = {{DW-6 {1'b0}}, remainder_temp_w[DW:DW-5 ]}; end
                /* 7*/    7'b000_0111 : begin remainder = {{DW-7 {1'b0}}, remainder_temp_w[DW:DW-6 ]}; end
                /* 8*/    7'b000_1000 : begin remainder = {{DW-8 {1'b0}}, remainder_temp_w[DW:DW-7 ]}; end
                /* 9*/    7'b000_1001 : begin remainder = {{DW-9 {1'b0}}, remainder_temp_w[DW:DW-8 ]}; end
                /*10*/    7'b000_1010 : begin remainder = {{DW-10{1'b0}}, remainder_temp_w[DW:DW-9 ]}; end
                /*11*/    7'b000_1011 : begin remainder = {{DW-11{1'b0}}, remainder_temp_w[DW:DW-10]}; end
                /*12*/    7'b000_1100 : begin remainder = {{DW-12{1'b0}}, remainder_temp_w[DW:DW-11]}; end
                /*13*/    7'b000_1101 : begin remainder = {{DW-13{1'b0}}, remainder_temp_w[DW:DW-12]}; end
                /*14*/    7'b000_1110 : begin remainder = {{DW-14{1'b0}}, remainder_temp_w[DW:DW-13]}; end
                /*15*/    7'b000_1111 : begin remainder = {{DW-15{1'b0}}, remainder_temp_w[DW:DW-14]}; end
                /*16*/    7'b001_0000 : begin remainder = {{DW-16{1'b0}}, remainder_temp_w[DW:DW-15]}; end
                /*17*/    7'b001_0001 : begin remainder = {{DW-17{1'b0}}, remainder_temp_w[DW:DW-16]}; end
                /*18*/    7'b001_0010 : begin remainder = {{DW-18{1'b0}}, remainder_temp_w[DW:DW-17]}; end
                /*19*/    7'b001_0011 : begin remainder = {{DW-19{1'b0}}, remainder_temp_w[DW:DW-18]}; end
                /*20*/    7'b001_0100 : begin remainder = {{DW-20{1'b0}}, remainder_temp_w[DW:DW-19]}; end
                /*21*/    7'b001_0101 : begin remainder = {{DW-21{1'b0}}, remainder_temp_w[DW:DW-20]}; end
                /*22*/    7'b001_0110 : begin remainder = {{DW-22{1'b0}}, remainder_temp_w[DW:DW-21]}; end
                /*23*/    7'b001_0111 : begin remainder = {{DW-23{1'b0}}, remainder_temp_w[DW:DW-22]}; end
                /*24*/    7'b001_1000 : begin remainder = {{DW-24{1'b0}}, remainder_temp_w[DW:DW-23]}; end
                /*25*/    7'b001_1001 : begin remainder = {{DW-25{1'b0}}, remainder_temp_w[DW:DW-24]}; end
                /*26*/    7'b001_1010 : begin remainder = {{DW-26{1'b0}}, remainder_temp_w[DW:DW-25]}; end
                /*27*/    7'b001_1011 : begin remainder = {{DW-27{1'b0}}, remainder_temp_w[DW:DW-26]}; end
                /*28*/    7'b001_1100 : begin remainder = {{DW-28{1'b0}}, remainder_temp_w[DW:DW-27]}; end
                /*29*/    7'b001_1101 : begin remainder = {{DW-29{1'b0}}, remainder_temp_w[DW:DW-28]}; end
                /*30*/    7'b001_1110 : begin remainder = {{DW-30{1'b0}}, remainder_temp_w[DW:DW-29]}; end
                /*31*/    7'b001_1111 : begin remainder = {{DW-31{1'b0}}, remainder_temp_w[DW:DW-30]}; end
                /*32*/    7'b010_0000 : begin remainder = {{DW-32{1'b0}}, remainder_temp_w[DW:DW-31]}; end     
                /*33*/    7'b010_0001 : begin remainder = {{DW-33{1'b0}}, remainder_temp_w[DW:DW-32]}; end
                /*34*/    7'b010_0010 : begin remainder = {{DW-34{1'b0}}, remainder_temp_w[DW:DW-33]}; end
                /*35*/    7'b010_0011 : begin remainder = {{DW-35{1'b0}}, remainder_temp_w[DW:DW-34]}; end
                /*36*/    7'b010_0100 : begin remainder = {{DW-36{1'b0}}, remainder_temp_w[DW:DW-35]}; end
                /*37*/    7'b010_0101 : begin remainder = {{DW-37{1'b0}}, remainder_temp_w[DW:DW-36]}; end
                /*38*/    7'b010_0110 : begin remainder = {{DW-38{1'b0}}, remainder_temp_w[DW:DW-37]}; end
                /*39*/    7'b010_0111 : begin remainder = {{DW-39{1'b0}}, remainder_temp_w[DW:DW-38]}; end
                /*40*/    7'b010_1000 : begin remainder = {{DW-40{1'b0}}, remainder_temp_w[DW:DW-39]}; end
                /*41*/    7'b010_1001 : begin remainder = {{DW-41{1'b0}}, remainder_temp_w[DW:DW-40]}; end
                /*42*/    7'b010_1010 : begin remainder = {{DW-42{1'b0}}, remainder_temp_w[DW:DW-41]}; end
                /*43*/    7'b010_1011 : begin remainder = {{DW-43{1'b0}}, remainder_temp_w[DW:DW-42]}; end
                /*44*/    7'b010_1100 : begin remainder = {{DW-44{1'b0}}, remainder_temp_w[DW:DW-43]}; end
                /*45*/    7'b010_1101 : begin remainder = {{DW-45{1'b0}}, remainder_temp_w[DW:DW-44]}; end
                /*46*/    7'b010_1110 : begin remainder = {{DW-46{1'b0}}, remainder_temp_w[DW:DW-45]}; end
                /*47*/    7'b010_1111 : begin remainder = {{DW-47{1'b0}}, remainder_temp_w[DW:DW-46]}; end
                /*48*/    7'b011_0000 : begin remainder = {{DW-48{1'b0}}, remainder_temp_w[DW:DW-47]}; end
                /*49*/    7'b011_0001 : begin remainder = {{DW-49{1'b0}}, remainder_temp_w[DW:DW-48]}; end
                /*50*/    7'b011_0010 : begin remainder = {{DW-50{1'b0}}, remainder_temp_w[DW:DW-49]}; end
                /*51*/    7'b011_0011 : begin remainder = {{DW-51{1'b0}}, remainder_temp_w[DW:DW-50]}; end
                /*52*/    7'b011_0100 : begin remainder = {{DW-52{1'b0}}, remainder_temp_w[DW:DW-51]}; end
                /*53*/    7'b011_0101 : begin remainder = {{DW-53{1'b0}}, remainder_temp_w[DW:DW-52]}; end
                /*54*/    7'b011_0110 : begin remainder = {{DW-54{1'b0}}, remainder_temp_w[DW:DW-53]}; end
                /*55*/    7'b011_0111 : begin remainder = {{DW-55{1'b0}}, remainder_temp_w[DW:DW-54]}; end
                /*56*/    7'b011_1000 : begin remainder = {{DW-56{1'b0}}, remainder_temp_w[DW:DW-55]}; end
                /*57*/    7'b011_1001 : begin remainder = {{DW-57{1'b0}}, remainder_temp_w[DW:DW-56]}; end
                /*58*/    7'b011_1010 : begin remainder = {{DW-58{1'b0}}, remainder_temp_w[DW:DW-57]}; end
                /*59*/    7'b011_1011 : begin remainder = {{DW-59{1'b0}}, remainder_temp_w[DW:DW-58]}; end
                /*60*/    7'b011_1100 : begin remainder = {{DW-60{1'b0}}, remainder_temp_w[DW:DW-59]}; end
                /*61*/    7'b011_1101 : begin remainder = {{DW-61{1'b0}}, remainder_temp_w[DW:DW-60]}; end
                /*62*/    7'b011_1110 : begin remainder = {{DW-62{1'b0}}, remainder_temp_w[DW:DW-61]}; end
                /*63*/    7'b011_1111 : begin remainder = {{DW-63{1'b0}}, remainder_temp_w[DW:DW-62]}; end
                          default     : begin remainder = {DW{1'd0}}; end
                endcase
            `endif
        end
    end
    else
    begin
        remainder = {DW{1'd0}};
    end
end
        
//Instantiate CSA to add dividend to remainder if partial remainder is negative after last iteration
CarrySaveAdd #(DW+2) csa_instance3 (
    .input_a    (remainder_reg                      ),
    .input_b    (divisor_star_r                     ),
    .output_y   (remainder_after_adding_dividend_w  ) 
);

assign remainder_temp_w = div_done ? ((remainder_reg [DW+1:DW] == 2'b11) ? remainder_after_adding_dividend_w : remainder_reg) : {DW+2{1'b0}};


//Logic leading to counter logic

//Posedge detection of div_start signal
assign toggle_w = (( ~div_error ) & div_start | div_done) ? (~toggle_r) : toggle_r ;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        toggle_r <= 1'b0    ;
    else 
        toggle_r <= toggle_w;
end

//Division busy signal logic
assign div_start_toggle = toggle_r  ;

assign div_busy = div_start_toggle;  

//Iteration counter logic
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        itr_count <= {NO_ITR_WIDTH{1'b0}};
    end
    else
    begin
        if(div_busy && (itr_count <= num_itr) )
            itr_count <= itr_count + {{NO_ITR_WIDTH-1{1'b0}},1'b1};
        else 
            itr_count <= {NO_ITR_WIDTH{1'b0}};
    end
end

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        div_error_reg <= 1'b0;
    else
        div_error_reg <= div_error;
end

assign div_done = (itr_count == (num_itr + {{NO_ITR_WIDTH-1{1'b0}},1'b1})); 


//Quotient bit logic for each iteration
assign quotient_bit = (sub_valid);

//lsb correction bit is high when the itr count equals number of iterations
assign q_correction_lsb = (add_valid);

assign before_div_done = (itr_count == num_itr);
//Quotient Logic
always@(posedge clk or negedge rst_n)
begin:god
    if(!rst_n)
    begin
        quotient_temp_r         <= {DW{1'b0}};
        quotient_correction_r   <= {DW{1'b0}};
    end
    else
    begin
        if(!div_done)
        begin
            `ifdef DIV_32BIT
            case(itr_count)
                6'b00_0001 : begin quotient_temp_r [DW-1 ] <= 1'b1;             quotient_correction_r [DW-1 ] <= 1'b0; end              
                6'b00_0010 : begin quotient_temp_r [DW-2 ] <= quotient_bit;     quotient_correction_r [DW-2 ] <= q_correction_lsb; end
                6'b00_0011 : begin quotient_temp_r [DW-3 ] <= quotient_bit;     quotient_correction_r [DW-3 ] <= q_correction_lsb; end
                6'b00_0100 : begin quotient_temp_r [DW-4 ] <= quotient_bit;     quotient_correction_r [DW-4 ] <= q_correction_lsb; end
                6'b00_0101 : begin quotient_temp_r [DW-5 ] <= quotient_bit;     quotient_correction_r [DW-5 ] <= q_correction_lsb; end
                6'b00_0110 : begin quotient_temp_r [DW-6 ] <= quotient_bit;     quotient_correction_r [DW-6 ] <= q_correction_lsb; end
                6'b00_0111 : begin quotient_temp_r [DW-7 ] <= quotient_bit;     quotient_correction_r [DW-7 ] <= q_correction_lsb; end
                6'b00_1000 : begin quotient_temp_r [DW-8 ] <= quotient_bit;     quotient_correction_r [DW-8 ] <= q_correction_lsb; end
                6'b00_1001 : begin quotient_temp_r [DW-9 ] <= quotient_bit;     quotient_correction_r [DW-9 ] <= q_correction_lsb; end
                6'b00_1010 : begin quotient_temp_r [DW-10] <= quotient_bit;     quotient_correction_r [DW-10] <= q_correction_lsb; end
                6'b00_1011 : begin quotient_temp_r [DW-11] <= quotient_bit;     quotient_correction_r [DW-11] <= q_correction_lsb; end
                6'b00_1100 : begin quotient_temp_r [DW-12] <= quotient_bit;     quotient_correction_r [DW-12] <= q_correction_lsb; end
                6'b00_1101 : begin quotient_temp_r [DW-13] <= quotient_bit;     quotient_correction_r [DW-13] <= q_correction_lsb; end
                6'b00_1110 : begin quotient_temp_r [DW-14] <= quotient_bit;     quotient_correction_r [DW-14] <= q_correction_lsb; end
                6'b00_1111 : begin quotient_temp_r [DW-15] <= quotient_bit;     quotient_correction_r [DW-15] <= q_correction_lsb; end
                6'b01_0000 : begin quotient_temp_r [DW-16] <= quotient_bit;     quotient_correction_r [DW-16] <= q_correction_lsb; end
                6'b01_0001 : begin quotient_temp_r [DW-17] <= quotient_bit;     quotient_correction_r [DW-17] <= q_correction_lsb; end
                6'b01_0010 : begin quotient_temp_r [DW-18] <= quotient_bit;     quotient_correction_r [DW-18] <= q_correction_lsb; end
                6'b01_0011 : begin quotient_temp_r [DW-19] <= quotient_bit;     quotient_correction_r [DW-19] <= q_correction_lsb; end
                6'b01_0100 : begin quotient_temp_r [DW-20] <= quotient_bit;     quotient_correction_r [DW-20] <= q_correction_lsb; end
                6'b01_0101 : begin quotient_temp_r [DW-21] <= quotient_bit;     quotient_correction_r [DW-21] <= q_correction_lsb; end
                6'b01_0110 : begin quotient_temp_r [DW-22] <= quotient_bit;     quotient_correction_r [DW-22] <= q_correction_lsb; end
                6'b01_0111 : begin quotient_temp_r [DW-23] <= quotient_bit;     quotient_correction_r [DW-23] <= q_correction_lsb; end
                6'b01_1000 : begin quotient_temp_r [DW-24] <= quotient_bit;     quotient_correction_r [DW-24] <= q_correction_lsb; end
                6'b01_1001 : begin quotient_temp_r [DW-25] <= quotient_bit;     quotient_correction_r [DW-25] <= q_correction_lsb; end
                6'b01_1010 : begin quotient_temp_r [DW-26] <= quotient_bit;     quotient_correction_r [DW-26] <= q_correction_lsb; end
                6'b01_1011 : begin quotient_temp_r [DW-27] <= quotient_bit;     quotient_correction_r [DW-27] <= q_correction_lsb; end
                6'b01_1100 : begin quotient_temp_r [DW-28] <= quotient_bit;     quotient_correction_r [DW-28] <= q_correction_lsb; end
                6'b01_1101 : begin quotient_temp_r [DW-29] <= quotient_bit;     quotient_correction_r [DW-29] <= q_correction_lsb; end
                6'b01_1110 : begin quotient_temp_r [DW-30] <= quotient_bit;     quotient_correction_r [DW-30] <= q_correction_lsb; end
                6'b01_1111 : begin quotient_temp_r [DW-31] <= quotient_bit;     quotient_correction_r [DW-31] <= q_correction_lsb; end
                6'b10_0000 : begin quotient_temp_r [DW-32] <= quotient_bit;     quotient_correction_r [DW-32] <= q_correction_lsb; end
            endcase
        `else
            case(itr_count)
                7'b000_0001 : begin quotient_temp_r [DW-1 ] <= 1'b1        ;     quotient_correction_r [DW-1 ] <= 1'b0            ; end                 
                7'b000_0010 : begin quotient_temp_r [DW-2 ] <= quotient_bit;     quotient_correction_r [DW-2 ] <= q_correction_lsb; end     
                7'b000_0011 : begin quotient_temp_r [DW-3 ] <= quotient_bit;     quotient_correction_r [DW-3 ] <= q_correction_lsb; end     
                7'b000_0100 : begin quotient_temp_r [DW-4 ] <= quotient_bit;     quotient_correction_r [DW-4 ] <= q_correction_lsb; end     
                7'b000_0101 : begin quotient_temp_r [DW-5 ] <= quotient_bit;     quotient_correction_r [DW-5 ] <= q_correction_lsb; end     
                7'b000_0110 : begin quotient_temp_r [DW-6 ] <= quotient_bit;     quotient_correction_r [DW-6 ] <= q_correction_lsb; end     
                7'b000_0111 : begin quotient_temp_r [DW-7 ] <= quotient_bit;     quotient_correction_r [DW-7 ] <= q_correction_lsb; end     
                7'b000_1000 : begin quotient_temp_r [DW-8 ] <= quotient_bit;     quotient_correction_r [DW-8 ] <= q_correction_lsb; end     
                7'b000_1001 : begin quotient_temp_r [DW-9 ] <= quotient_bit;     quotient_correction_r [DW-9 ] <= q_correction_lsb; end     
                7'b000_1010 : begin quotient_temp_r [DW-10] <= quotient_bit;     quotient_correction_r [DW-10] <= q_correction_lsb; end     
                7'b000_1011 : begin quotient_temp_r [DW-11] <= quotient_bit;     quotient_correction_r [DW-11] <= q_correction_lsb; end     
                7'b000_1100 : begin quotient_temp_r [DW-12] <= quotient_bit;     quotient_correction_r [DW-12] <= q_correction_lsb; end     
                7'b000_1101 : begin quotient_temp_r [DW-13] <= quotient_bit;     quotient_correction_r [DW-13] <= q_correction_lsb; end     
                7'b000_1110 : begin quotient_temp_r [DW-14] <= quotient_bit;     quotient_correction_r [DW-14] <= q_correction_lsb; end     
                7'b000_1111 : begin quotient_temp_r [DW-15] <= quotient_bit;     quotient_correction_r [DW-15] <= q_correction_lsb; end     
                7'b001_0000 : begin quotient_temp_r [DW-16] <= quotient_bit;     quotient_correction_r [DW-16] <= q_correction_lsb; end     
                7'b001_0001 : begin quotient_temp_r [DW-17] <= quotient_bit;     quotient_correction_r [DW-17] <= q_correction_lsb; end     
                7'b001_0010 : begin quotient_temp_r [DW-18] <= quotient_bit;     quotient_correction_r [DW-18] <= q_correction_lsb; end     
                7'b001_0011 : begin quotient_temp_r [DW-19] <= quotient_bit;     quotient_correction_r [DW-19] <= q_correction_lsb; end     
                7'b001_0100 : begin quotient_temp_r [DW-20] <= quotient_bit;     quotient_correction_r [DW-20] <= q_correction_lsb; end     
                7'b001_0101 : begin quotient_temp_r [DW-21] <= quotient_bit;     quotient_correction_r [DW-21] <= q_correction_lsb; end     
                7'b001_0110 : begin quotient_temp_r [DW-22] <= quotient_bit;     quotient_correction_r [DW-22] <= q_correction_lsb; end     
                7'b001_0111 : begin quotient_temp_r [DW-23] <= quotient_bit;     quotient_correction_r [DW-23] <= q_correction_lsb; end     
                7'b001_1000 : begin quotient_temp_r [DW-24] <= quotient_bit;     quotient_correction_r [DW-24] <= q_correction_lsb; end     
                7'b001_1001 : begin quotient_temp_r [DW-25] <= quotient_bit;     quotient_correction_r [DW-25] <= q_correction_lsb; end     
                7'b001_1010 : begin quotient_temp_r [DW-26] <= quotient_bit;     quotient_correction_r [DW-26] <= q_correction_lsb; end     
                7'b001_1011 : begin quotient_temp_r [DW-27] <= quotient_bit;     quotient_correction_r [DW-27] <= q_correction_lsb; end     
                7'b001_1100 : begin quotient_temp_r [DW-28] <= quotient_bit;     quotient_correction_r [DW-28] <= q_correction_lsb; end     
                7'b001_1101 : begin quotient_temp_r [DW-29] <= quotient_bit;     quotient_correction_r [DW-29] <= q_correction_lsb; end     
                7'b001_1110 : begin quotient_temp_r [DW-30] <= quotient_bit;     quotient_correction_r [DW-30] <= q_correction_lsb; end     
                7'b001_1111 : begin quotient_temp_r [DW-31] <= quotient_bit;     quotient_correction_r [DW-31] <= q_correction_lsb; end     
                7'b010_0000 : begin quotient_temp_r [DW-32] <= quotient_bit;     quotient_correction_r [DW-32] <= q_correction_lsb; end     
                 
                7'b010_0001 : begin quotient_temp_r [DW-33] <= quotient_bit;     quotient_correction_r [DW-33] <= q_correction_lsb; end
                7'b010_0010 : begin quotient_temp_r [DW-34] <= quotient_bit;     quotient_correction_r [DW-34] <= q_correction_lsb; end
                7'b010_0011 : begin quotient_temp_r [DW-35] <= quotient_bit;     quotient_correction_r [DW-35] <= q_correction_lsb; end
                7'b010_0100 : begin quotient_temp_r [DW-36] <= quotient_bit;     quotient_correction_r [DW-36] <= q_correction_lsb; end
                7'b010_0101 : begin quotient_temp_r [DW-37] <= quotient_bit;     quotient_correction_r [DW-37] <= q_correction_lsb; end
                7'b010_0110 : begin quotient_temp_r [DW-38] <= quotient_bit;     quotient_correction_r [DW-38] <= q_correction_lsb; end
                7'b010_0111 : begin quotient_temp_r [DW-39] <= quotient_bit;     quotient_correction_r [DW-39] <= q_correction_lsb; end
                7'b010_1000 : begin quotient_temp_r [DW-40] <= quotient_bit;     quotient_correction_r [DW-40] <= q_correction_lsb; end
                7'b010_1001 : begin quotient_temp_r [DW-41] <= quotient_bit;     quotient_correction_r [DW-41] <= q_correction_lsb; end
                7'b010_1010 : begin quotient_temp_r [DW-42] <= quotient_bit;     quotient_correction_r [DW-42] <= q_correction_lsb; end
                7'b010_1011 : begin quotient_temp_r [DW-43] <= quotient_bit;     quotient_correction_r [DW-43] <= q_correction_lsb; end
                7'b010_1100 : begin quotient_temp_r [DW-44] <= quotient_bit;     quotient_correction_r [DW-44] <= q_correction_lsb; end
                7'b010_1101 : begin quotient_temp_r [DW-45] <= quotient_bit;     quotient_correction_r [DW-45] <= q_correction_lsb; end
                7'b010_1110 : begin quotient_temp_r [DW-46] <= quotient_bit;     quotient_correction_r [DW-46] <= q_correction_lsb; end
                7'b010_1111 : begin quotient_temp_r [DW-47] <= quotient_bit;     quotient_correction_r [DW-47] <= q_correction_lsb; end
                7'b011_0000 : begin quotient_temp_r [DW-48] <= quotient_bit;     quotient_correction_r [DW-48] <= q_correction_lsb; end
                7'b011_0001 : begin quotient_temp_r [DW-49] <= quotient_bit;     quotient_correction_r [DW-49] <= q_correction_lsb; end
                7'b011_0010 : begin quotient_temp_r [DW-50] <= quotient_bit;     quotient_correction_r [DW-50] <= q_correction_lsb; end
                7'b011_0011 : begin quotient_temp_r [DW-51] <= quotient_bit;     quotient_correction_r [DW-51] <= q_correction_lsb; end
                7'b011_0100 : begin quotient_temp_r [DW-52] <= quotient_bit;     quotient_correction_r [DW-52] <= q_correction_lsb; end
                7'b011_0101 : begin quotient_temp_r [DW-53] <= quotient_bit;     quotient_correction_r [DW-53] <= q_correction_lsb; end
                7'b011_0110 : begin quotient_temp_r [DW-54] <= quotient_bit;     quotient_correction_r [DW-54] <= q_correction_lsb; end
                7'b011_0111 : begin quotient_temp_r [DW-55] <= quotient_bit;     quotient_correction_r [DW-55] <= q_correction_lsb; end
                7'b011_1000 : begin quotient_temp_r [DW-56] <= quotient_bit;     quotient_correction_r [DW-56] <= q_correction_lsb; end
                7'b011_1001 : begin quotient_temp_r [DW-57] <= quotient_bit;     quotient_correction_r [DW-57] <= q_correction_lsb; end
                7'b011_1010 : begin quotient_temp_r [DW-58] <= quotient_bit;     quotient_correction_r [DW-58] <= q_correction_lsb; end
                7'b011_1011 : begin quotient_temp_r [DW-59] <= quotient_bit;     quotient_correction_r [DW-59] <= q_correction_lsb; end
                7'b011_1100 : begin quotient_temp_r [DW-60] <= quotient_bit;     quotient_correction_r [DW-60] <= q_correction_lsb; end
                7'b011_1101 : begin quotient_temp_r [DW-61] <= quotient_bit;     quotient_correction_r [DW-61] <= q_correction_lsb; end
                7'b011_1110 : begin quotient_temp_r [DW-62] <= quotient_bit;     quotient_correction_r [DW-62] <= q_correction_lsb; end
                7'b011_1111 : begin quotient_temp_r [DW-63] <= quotient_bit;     quotient_correction_r [DW-63] <= q_correction_lsb; end
                7'b100_0000 : begin quotient_temp_r [DW-64] <= quotient_bit;     quotient_correction_r [DW-64] <= q_correction_lsb; end
            endcase
        `endif
        end
        else
        begin
            quotient_temp_r         <= {DW{1'b0}};
            quotient_correction_r   <= {DW{1'b0}};
        end
    end
end


//subtract 1 if the remainder after last iteration is negative logic
assign partial_rem_neg = (div_done) ? (remainder_reg[DW+1]) : 1'b0;

always@(*)
begin
    if(div_done)
    begin
        add_one_to_q = {{DW-1{1'b0}},partial_rem_neg};
    end
    else
    begin
        add_one_to_q = {DW{1'b0}};
    end     
end
   

CarrySaveAdd #(DW) csa_instance4 (
    .input_a    (quotient_correction_r  ),
    .input_b    (add_one_to_q           ),
    .output_y   (quotient_correction_2  ) 
);

assign q_c2_neg = ~(quotient_correction_2);
assign quotient_correction_2s = quotient_corrn_2swire ;

assign one_32bit = {{DW-1{1'b0}},1'b1};
CarrySaveAdd #(DW) csa_instance7 (
    .input_a    (q_c2_neg               ),
    .input_b    (one_32bit              ),
    .output_y   (quotient_corrn_2swire  ) 
);


//Instantiate CSA to add temporary quotient with quotient correction
CarrySaveAdd #(DW) csa_instance5 (
    .input_a    (quotient_temp_r        ),
    .input_b    (quotient_correction_2s ),
    .output_y   (quotient_csa_out       ) 
);


//Quotient Selection logic
always@(*)
begin
    if(div_done)
    begin
        `ifdef DIV_32BIT
        case(num_itr)
            6'b00_0001 : begin quotient_w = {{DW-1 {1'b0}}, quotient_csa_out[DW-1 ]}; end           
            6'b00_0010 : begin quotient_w = {{DW-2 {1'b0}}, quotient_csa_out[DW-1 : DW-2 ]}; end
            6'b00_0011 : begin quotient_w = {{DW-3 {1'b0}}, quotient_csa_out[DW-1 : DW-3 ]}; end
            6'b00_0100 : begin quotient_w = {{DW-4 {1'b0}}, quotient_csa_out[DW-1 : DW-4 ]}; end
            6'b00_0101 : begin quotient_w = {{DW-5 {1'b0}}, quotient_csa_out[DW-1 : DW-5 ]}; end
            6'b00_0110 : begin quotient_w = {{DW-6 {1'b0}}, quotient_csa_out[DW-1 : DW-6 ]}; end
            6'b00_0111 : begin quotient_w = {{DW-7 {1'b0}}, quotient_csa_out[DW-1 : DW-7 ]}; end
            6'b00_1000 : begin quotient_w = {{DW-8 {1'b0}}, quotient_csa_out[DW-1 : DW-8 ]}; end
            6'b00_1001 : begin quotient_w = {{DW-9 {1'b0}}, quotient_csa_out[DW-1 : DW-9 ]}; end
            6'b00_1010 : begin quotient_w = {{DW-10{1'b0}}, quotient_csa_out[DW-1 : DW-10]}; end
            6'b00_1011 : begin quotient_w = {{DW-11{1'b0}}, quotient_csa_out[DW-1 : DW-11]}; end
            6'b00_1100 : begin quotient_w = {{DW-12{1'b0}}, quotient_csa_out[DW-1 : DW-12]}; end
            6'b00_1101 : begin quotient_w = {{DW-13{1'b0}}, quotient_csa_out[DW-1 : DW-13]}; end
            6'b00_1110 : begin quotient_w = {{DW-14{1'b0}}, quotient_csa_out[DW-1 : DW-14]}; end
            6'b00_1111 : begin quotient_w = {{DW-15{1'b0}}, quotient_csa_out[DW-1 : DW-15]}; end
            6'b01_0000 : begin quotient_w = {{DW-16{1'b0}}, quotient_csa_out[DW-1 : DW-16]}; end
            6'b01_0001 : begin quotient_w = {{DW-17{1'b0}}, quotient_csa_out[DW-1 : DW-17]}; end
            6'b01_0010 : begin quotient_w = {{DW-18{1'b0}}, quotient_csa_out[DW-1 : DW-18]}; end
            6'b01_0011 : begin quotient_w = {{DW-19{1'b0}}, quotient_csa_out[DW-1 : DW-19]}; end
            6'b01_0100 : begin quotient_w = {{DW-20{1'b0}}, quotient_csa_out[DW-1 : DW-20]}; end
            6'b01_0101 : begin quotient_w = {{DW-21{1'b0}}, quotient_csa_out[DW-1 : DW-21]}; end
            6'b01_0110 : begin quotient_w = {{DW-22{1'b0}}, quotient_csa_out[DW-1 : DW-22]}; end
            6'b01_0111 : begin quotient_w = {{DW-23{1'b0}}, quotient_csa_out[DW-1 : DW-23]}; end
            6'b01_1000 : begin quotient_w = {{DW-24{1'b0}}, quotient_csa_out[DW-1 : DW-24]}; end
            6'b01_1001 : begin quotient_w = {{DW-25{1'b0}}, quotient_csa_out[DW-1 : DW-25]}; end
            6'b01_1010 : begin quotient_w = {{DW-26{1'b0}}, quotient_csa_out[DW-1 : DW-26]}; end
            6'b01_1011 : begin quotient_w = {{DW-27{1'b0}}, quotient_csa_out[DW-1 : DW-27]}; end
            6'b01_1100 : begin quotient_w = {{DW-28{1'b0}}, quotient_csa_out[DW-1 : DW-28]}; end
            6'b01_1101 : begin quotient_w = {{DW-29{1'b0}}, quotient_csa_out[DW-1 : DW-29]}; end
            6'b01_1110 : begin quotient_w = {{DW-30{1'b0}}, quotient_csa_out[DW-1 : DW-30]}; end
            6'b01_1111 : begin quotient_w = {{DW-31{1'b0}}, quotient_csa_out[DW-1 : DW-31]}; end
            6'b10_0000 : begin quotient_w = {quotient_csa_out[DW-1 : DW-32]}; end
            default : begin quotient_w = {DW{1'b0}}; end
        endcase
        `else
        case(num_itr)
            7'b000_0001 : begin quotient_w = {{DW-1 {1'b0}}, quotient_csa_out[DW-1 ]}; end       
            7'b000_0010 : begin quotient_w = {{DW-2 {1'b0}}, quotient_csa_out[DW-1 : DW-2 ]}; end
            7'b000_0011 : begin quotient_w = {{DW-3 {1'b0}}, quotient_csa_out[DW-1 : DW-3 ]}; end
            7'b000_0100 : begin quotient_w = {{DW-4 {1'b0}}, quotient_csa_out[DW-1 : DW-4 ]}; end
            7'b000_0101 : begin quotient_w = {{DW-5 {1'b0}}, quotient_csa_out[DW-1 : DW-5 ]}; end
            7'b000_0110 : begin quotient_w = {{DW-6 {1'b0}}, quotient_csa_out[DW-1 : DW-6 ]}; end
            7'b000_0111 : begin quotient_w = {{DW-7 {1'b0}}, quotient_csa_out[DW-1 : DW-7 ]}; end
            7'b000_1000 : begin quotient_w = {{DW-8 {1'b0}}, quotient_csa_out[DW-1 : DW-8 ]}; end
            7'b000_1001 : begin quotient_w = {{DW-9 {1'b0}}, quotient_csa_out[DW-1 : DW-9 ]}; end
            7'b000_1010 : begin quotient_w = {{DW-10{1'b0}}, quotient_csa_out[DW-1 : DW-10]}; end
            7'b000_1011 : begin quotient_w = {{DW-11{1'b0}}, quotient_csa_out[DW-1 : DW-11]}; end
            7'b000_1100 : begin quotient_w = {{DW-12{1'b0}}, quotient_csa_out[DW-1 : DW-12]}; end
            7'b000_1101 : begin quotient_w = {{DW-13{1'b0}}, quotient_csa_out[DW-1 : DW-13]}; end
            7'b000_1110 : begin quotient_w = {{DW-14{1'b0}}, quotient_csa_out[DW-1 : DW-14]}; end
            7'b000_1111 : begin quotient_w = {{DW-15{1'b0}}, quotient_csa_out[DW-1 : DW-15]}; end
            7'b001_0000 : begin quotient_w = {{DW-16{1'b0}}, quotient_csa_out[DW-1 : DW-16]}; end
            7'b001_0001 : begin quotient_w = {{DW-17{1'b0}}, quotient_csa_out[DW-1 : DW-17]}; end
            7'b001_0010 : begin quotient_w = {{DW-18{1'b0}}, quotient_csa_out[DW-1 : DW-18]}; end
            7'b001_0011 : begin quotient_w = {{DW-19{1'b0}}, quotient_csa_out[DW-1 : DW-19]}; end
            7'b001_0100 : begin quotient_w = {{DW-20{1'b0}}, quotient_csa_out[DW-1 : DW-20]}; end
            7'b001_0101 : begin quotient_w = {{DW-21{1'b0}}, quotient_csa_out[DW-1 : DW-21]}; end
            7'b001_0110 : begin quotient_w = {{DW-22{1'b0}}, quotient_csa_out[DW-1 : DW-22]}; end
            7'b001_0111 : begin quotient_w = {{DW-23{1'b0}}, quotient_csa_out[DW-1 : DW-23]}; end
            7'b001_1000 : begin quotient_w = {{DW-24{1'b0}}, quotient_csa_out[DW-1 : DW-24]}; end
            7'b001_1001 : begin quotient_w = {{DW-25{1'b0}}, quotient_csa_out[DW-1 : DW-25]}; end
            7'b001_1010 : begin quotient_w = {{DW-26{1'b0}}, quotient_csa_out[DW-1 : DW-26]}; end
            7'b001_1011 : begin quotient_w = {{DW-27{1'b0}}, quotient_csa_out[DW-1 : DW-27]}; end
            7'b001_1100 : begin quotient_w = {{DW-28{1'b0}}, quotient_csa_out[DW-1 : DW-28]}; end
            7'b001_1101 : begin quotient_w = {{DW-29{1'b0}}, quotient_csa_out[DW-1 : DW-29]}; end
            7'b001_1110 : begin quotient_w = {{DW-30{1'b0}}, quotient_csa_out[DW-1 : DW-30]}; end
            7'b001_1111 : begin quotient_w = {{DW-31{1'b0}}, quotient_csa_out[DW-1 : DW-31]}; end

            7'b010_0000 : begin quotient_w = {{DW-32{1'b0}}, quotient_csa_out[DW-1 : DW-32]}; end       
            7'b010_0001 : begin quotient_w = {{DW-33{1'b0}}, quotient_csa_out[DW-1 : DW-33]}; end
            7'b010_0010 : begin quotient_w = {{DW-34{1'b0}}, quotient_csa_out[DW-1 : DW-34]}; end
            7'b010_0011 : begin quotient_w = {{DW-35{1'b0}}, quotient_csa_out[DW-1 : DW-35]}; end
            7'b010_0100 : begin quotient_w = {{DW-36{1'b0}}, quotient_csa_out[DW-1 : DW-36]}; end
            7'b010_0101 : begin quotient_w = {{DW-37{1'b0}}, quotient_csa_out[DW-1 : DW-37]}; end
            7'b010_0110 : begin quotient_w = {{DW-38{1'b0}}, quotient_csa_out[DW-1 : DW-38]}; end
            7'b010_0111 : begin quotient_w = {{DW-39{1'b0}}, quotient_csa_out[DW-1 : DW-39]}; end
            7'b010_1000 : begin quotient_w = {{DW-40{1'b0}}, quotient_csa_out[DW-1 : DW-40]}; end
            7'b010_1001 : begin quotient_w = {{DW-41{1'b0}}, quotient_csa_out[DW-1 : DW-41]}; end
            7'b010_1010 : begin quotient_w = {{DW-42{1'b0}}, quotient_csa_out[DW-1 : DW-42]}; end
            7'b010_1011 : begin quotient_w = {{DW-43{1'b0}}, quotient_csa_out[DW-1 : DW-43]}; end
            7'b010_1100 : begin quotient_w = {{DW-44{1'b0}}, quotient_csa_out[DW-1 : DW-44]}; end
            7'b010_1101 : begin quotient_w = {{DW-45{1'b0}}, quotient_csa_out[DW-1 : DW-45]}; end
            7'b010_1110 : begin quotient_w = {{DW-46{1'b0}}, quotient_csa_out[DW-1 : DW-46]}; end
            7'b010_1111 : begin quotient_w = {{DW-47{1'b0}}, quotient_csa_out[DW-1 : DW-47]}; end
            7'b011_0000 : begin quotient_w = {{DW-48{1'b0}}, quotient_csa_out[DW-1 : DW-48]}; end
            7'b011_0001 : begin quotient_w = {{DW-49{1'b0}}, quotient_csa_out[DW-1 : DW-49]}; end
            7'b011_0010 : begin quotient_w = {{DW-50{1'b0}}, quotient_csa_out[DW-1 : DW-50]}; end
            7'b011_0011 : begin quotient_w = {{DW-51{1'b0}}, quotient_csa_out[DW-1 : DW-51]}; end
            7'b011_0100 : begin quotient_w = {{DW-52{1'b0}}, quotient_csa_out[DW-1 : DW-52]}; end
            7'b011_0101 : begin quotient_w = {{DW-53{1'b0}}, quotient_csa_out[DW-1 : DW-53]}; end
            7'b011_0110 : begin quotient_w = {{DW-54{1'b0}}, quotient_csa_out[DW-1 : DW-54]}; end
            7'b011_0111 : begin quotient_w = {{DW-55{1'b0}}, quotient_csa_out[DW-1 : DW-55]}; end
            7'b011_1000 : begin quotient_w = {{DW-56{1'b0}}, quotient_csa_out[DW-1 : DW-56]}; end
            7'b011_1001 : begin quotient_w = {{DW-57{1'b0}}, quotient_csa_out[DW-1 : DW-57]}; end
            7'b011_1010 : begin quotient_w = {{DW-58{1'b0}}, quotient_csa_out[DW-1 : DW-58]}; end
            7'b011_1011 : begin quotient_w = {{DW-59{1'b0}}, quotient_csa_out[DW-1 : DW-59]}; end
            7'b011_1100 : begin quotient_w = {{DW-60{1'b0}}, quotient_csa_out[DW-1 : DW-60]}; end
            7'b011_1101 : begin quotient_w = {{DW-61{1'b0}}, quotient_csa_out[DW-1 : DW-61]}; end
            7'b011_1110 : begin quotient_w = {{DW-62{1'b0}}, quotient_csa_out[DW-1 : DW-62]}; end
            7'b011_1111 : begin quotient_w = {{DW-63{1'b0}}, quotient_csa_out[DW-1 : DW-63]}; end
            7'b100_0000 : begin quotient_w = {quotient_csa_out[DW-1 : DW-64]}; end
            default : begin quotient_w = {DW{1'b0}}; end
        endcase
        `endif

        end
    else
    begin 
        quotient_w = {DW{1'b0}}; 
    end
end

//connect quotient wire to output
assign quotient = quotient_w;


endmodule
