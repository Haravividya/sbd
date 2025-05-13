module pmpcfg_csr_write
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32
)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                      pmpcfg0_exception_o,      //exception 
output logic                      pmpcfg1_exception_o,      //exception 
output logic                     pmpcfg2_exception_o,      //exception 
output logic                     pmpcfg3_exception_o,        //exception 

//output logic [DATA_WIDTH-1:0]	       csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [DATA_WIDTH-1:0]        pmpcfg0_o,
output logic [DATA_WIDTH-1:0]        pmpcfg1_o,
output logic [DATA_WIDTH-1:0]        pmpcfg2_o,
output logic [DATA_WIDTH-1:0]        pmpcfg3_o


        
);

 timeunit 1ns;
 timeprecision 1ps;

//pmpcfg_csr0 module instantiation

pmpcfg_csr0 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        )
)
pmpcfg_csr0_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	     (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr		        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpcfg0_exception_o     (pmpcfg0_exception_o   ),
.pmpcfg0_o               (pmpcfg0_o             )
*/
    
);



//pmpcfg_csr1 module instantiation

pmpcfg_csr1 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        )
)
pmpcfg_csr1_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	     (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr		        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpcfg1_exception_o     (pmpcfg1_exception_o   ),
.pmpcfg1_o               (pmpcfg1_o             )
*/
    
);



//pmpcfg_csr2 module instantiation

pmpcfg_csr2 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        )
)
pmpcfg_csr2_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr		),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpcfg2_exception_o     (pmpcfg2_exception_o   ),
.pmpcfg2_o               (pmpcfg2_o             )
*/ 
);


//pmpcfg_csr3 module instantiation

pmpcfg_csr3 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        )
)
pmpcfg_csr3_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr	    ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpcfg3_exception_o     (pmpcfg3_exception_o   ),
.pmpcfg3_o               (pmpcfg3_o             )
*/    
);

endmodule

////////////////////seperate pmpcfgi csr modules////////////////////////////////


//this module represents pmpcfg0 csr a 32 bit or 64 bit wide
//within this csr software signal need to write four 8bit csr i.e pmp0cfg,pmp1cfg,pmp2cfg,pmp3cfg simultaneously because we dont have byte addresses

module pmpcfg_csr0
#(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32
)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpcfg0_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	       csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [DATA_WIDTH-1:0]        pmpcfg0_o
);
//localparam reset_val = 0;
localparam  PMPCONFIGURATION0 = 12'b0011_1010_0000;
 logic    [DATA_WIDTH-1:0]        pmpcfg0;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPCONFIGURATION0) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpcfg0 <= {DATA_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpcfg0 <= csr_write_data;
        end
       /* else
        begin
             pmpcfg0 <= {DATA_WIDTH{1'b0}};
        end*/
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpcfg0_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpcfg0_exception_o <= 1'b1;
        end
        else
        begin
            pmpcfg0_exception_o <= 1'b0;
        end
    end

end




assign pmpcfg0_o = {pmpcfg0[DATA_WIDTH-1],2'b00,pmpcfg0[DATA_WIDTH-4:DATA_WIDTH-8],pmpcfg0[DATA_WIDTH-9],2'b00,pmpcfg0[DATA_WIDTH-12:DATA_WIDTH-16],pmpcfg0[DATA_WIDTH-17],2'b00,pmpcfg0[DATA_WIDTH-20:DATA_WIDTH-24],pmpcfg0[DATA_WIDTH-25],2'b00,pmpcfg0[DATA_WIDTH-28:DATA_WIDTH-32]};

endmodule

//this module represents pmpcfg1 csr a 32 bit or 64 bit wide
//within this csr software signal need to write four 8bit csr i.e pmp4cfg,pmp5cfg,pmp6cfg,pmp7cfg simultaneously because we dont have byte addresses
module pmpcfg_csr1
#(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32
)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpcfg1_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	       csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [DATA_WIDTH-1:0]        pmpcfg1_o
);
//localparam reset_val = 0;
localparam  PMPCONFIGURATION1 = 12'b0011_1010_0001;
 logic    [DATA_WIDTH-1:0]        pmpcfg1;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPCONFIGURATION1) && csr_write_en);

always_ff @(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpcfg1 <= {DATA_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpcfg1 <= csr_write_data;
        end
      /*  else
        begin
             pmpcfg1 <= {DATA_WIDTH{1'b0}};
        end */
     end
end

always_ff @(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpcfg1_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpcfg1_exception_o <= 1'b1;
        end
        else
        begin
            pmpcfg1_exception_o <= 1'b0;
        end
    end

end



assign pmpcfg1_o = {pmpcfg1[DATA_WIDTH-1],2'b00,pmpcfg1[DATA_WIDTH-4:DATA_WIDTH-8],pmpcfg1[DATA_WIDTH-9],2'b00,pmpcfg1[DATA_WIDTH-12:DATA_WIDTH-16],pmpcfg1[DATA_WIDTH-17],2'b00,pmpcfg1[DATA_WIDTH-20:DATA_WIDTH-24],pmpcfg1[DATA_WIDTH-25],2'b00,pmpcfg1[DATA_WIDTH-28:DATA_WIDTH-32]};

endmodule



//this module represents pmpcfg2 csr a 32 bit or 64 bit wide
//within this csr software signal need to write four 8bit csr i.e pmp8cfg,pmp9cfg,pmp10cfg,pmp11cfg simultaneously because we dont have byte addresses
module pmpcfg_csr2
#(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32
)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpcfg2_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	       csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [DATA_WIDTH-1:0]        pmpcfg2_o
);
//localparam reset_val = 0;
localparam  PMPCONFIGURATION2 = 12'b0011_1010_0010;
 logic    [DATA_WIDTH-1:0]        pmpcfg2;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPCONFIGURATION2) && csr_write_en);

always_ff @(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpcfg2 <= {DATA_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpcfg2 <= csr_write_data;
        end
      /*  else
        begin
             pmpcfg2 <= {DATA_WIDTH{1'b0}};
        end */
     end
end

always_ff @(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpcfg2_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpcfg2_exception_o <= 1'b1;
        end
        else
        begin
            pmpcfg2_exception_o <= 1'b0;
        end
    end

end



assign pmpcfg2_o = {pmpcfg2[DATA_WIDTH-1],2'b00,pmpcfg2[DATA_WIDTH-4:DATA_WIDTH-8],pmpcfg2[DATA_WIDTH-9],2'b00,pmpcfg2[DATA_WIDTH-12:DATA_WIDTH-16],pmpcfg2[DATA_WIDTH-17],2'b00,pmpcfg2[DATA_WIDTH-20:DATA_WIDTH-24],pmpcfg2[DATA_WIDTH-25],2'b00,pmpcfg2[DATA_WIDTH-28:DATA_WIDTH-32]};

endmodule


//this module represents pmpcfg3 csr a 32 bit or 64 bit wide
//within this csr software signal need to write four 8bit csr i.e pmp12cfg,pmp13cfg,pmp14cfg,pmp15cfg simultaneously because we dont have byte addresses
module pmpcfg_csr3
#(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32
)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                      pmpcfg3_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	       csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [DATA_WIDTH-1:0]        pmpcfg3_o
);
//localparam reset_val = 0;
localparam  PMPCONFIGURATION3 = 12'b0011_1010_0011;
 logic    [DATA_WIDTH-1:0]        pmpcfg3;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPCONFIGURATION3) && csr_write_en);

always_ff @(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpcfg3 <= {DATA_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpcfg3 <= csr_write_data;
        end
      /*  else
        begin
             pmpcfg3 <= {DATA_WIDTH{1'b0}};
        end */
     end
end

always_ff @(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpcfg3_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpcfg3_exception_o <= 1'b1;
        end
        else
        begin
            pmpcfg3_exception_o <= 1'b0;
        end 
    end

end



assign pmpcfg3_o = {pmpcfg3[DATA_WIDTH-1],2'b00,pmpcfg3[DATA_WIDTH-4:DATA_WIDTH-8],pmpcfg3[DATA_WIDTH-9],2'b00,pmpcfg3[DATA_WIDTH-12:DATA_WIDTH-16],pmpcfg3[DATA_WIDTH-17],2'b00,pmpcfg3[DATA_WIDTH-20:DATA_WIDTH-24],pmpcfg3[DATA_WIDTH-25],2'b00,pmpcfg3[DATA_WIDTH-28:DATA_WIDTH-32]};

endmodule


