module pmpaddr_csr_write
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34
)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,        //signal from software
output logic                         pmpaddr0_exception_o,      //exception 
output logic                         pmpaddr1_exception_o,      //exception 
output logic                         pmpaddr2_exception_o,      //exception 
output logic                         pmpaddr3_exception_o,      //exception 
output logic                         pmpaddr4_exception_o,      //exception 
output logic                         pmpaddr5_exception_o,      //exception 
output logic                         pmpaddr6_exception_o,      //exception 
output logic                         pmpaddr7_exception_o,      //exception 

output logic                         pmpaddr8_exception_o,      //exception 
output logic                         pmpaddr9_exception_o,      //exception 
output logic                         pmpaddr10_exception_o,     //exception 
output logic                         pmpaddr11_exception_o,     //exception 
   
output logic                         pmpaddr12_exception_o,     //exception 
output logic                         pmpaddr13_exception_o,     //exception 
output logic                         pmpaddr14_exception_o,     //exception 
output logic                         pmpaddr15_exception_o,     //exception 



//output logic [DATA_WIDTH-1:0]	       csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                         machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr0_o,
output logic [PMP_WIDTH-1:2]        pmpaddr1_o,
output logic [PMP_WIDTH-1:2]        pmpaddr2_o,
output logic [PMP_WIDTH-1:2]        pmpaddr3_o,

output logic [PMP_WIDTH-1:2]        pmpaddr4_o,
output logic [PMP_WIDTH-1:2]        pmpaddr5_o,
output logic [PMP_WIDTH-1:2]        pmpaddr6_o,
output logic [PMP_WIDTH-1:2]        pmpaddr7_o,


output logic [PMP_WIDTH-1:2]        pmpaddr8_o,
output logic [PMP_WIDTH-1:2]        pmpaddr9_o,
output logic [PMP_WIDTH-1:2]        pmpaddr10_o,
output logic [PMP_WIDTH-1:2]        pmpaddr11_o,


output logic [PMP_WIDTH-1:2]        pmpaddr12_o,
output logic [PMP_WIDTH-1:2]        pmpaddr13_o,
output logic [PMP_WIDTH-1:2]        pmpaddr14_o,
output logic [PMP_WIDTH-1:2]        pmpaddr15_o

);

 timeunit 1ns;
 timeprecision 1ps;
 
//MODULE INSTANTIATION
//


//pmpaddr_csr0 module instantiation

pmpaddr_csr0 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr0_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr0_exception_o     (pmpaddr0_exception_o   ),
.pmpaddr0_o               (pmpaddr0_o             )
*/
    
);

//pmpaddr_csr0 module instantiation

pmpaddr_csr1 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr1_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr1_exception_o     (pmpaddr1_exception_o   ),
.pmpaddr1_o               (pmpaddr1_o             )
*/
    
);

//pmpaddr_csr0 module instantiation

pmpaddr_csr2 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr2_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr2_exception_o     (pmpaddr2_exception_o   ),
.pmpaddr2_o               (pmpaddr2_o             )
*/
    
);

//pmpaddr_csr3 module instantiation

pmpaddr_csr3 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr3_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr3_exception_o     (pmpaddr3_exception_o   ),
.pmpaddr3_o               (pmpaddr3_o             )

*/    
);

//pmpaddr_csr0 module instantiation

pmpaddr_csr4 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr4_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr4_exception_o     (pmpaddr4_exception_o   ),
.pmpaddr4_o               (pmpaddr4_o             )
*/
    
);

//pmpaddr_csr5 module instantiation

pmpaddr_csr5 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr5_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr5_exception_o     (pmpaddr5_exception_o   ),
.pmpaddr5_o               (pmpaddr5_o             )
*/
    
);

//pmpaddr_csr6 module instantiation

pmpaddr_csr6 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr6_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr6_exception_o     (pmpaddr6_exception_o   ),
.pmpaddr6_o               (pmpaddr6_o             )
*/
    
);

//pmpaddr_csr7 module instantiation

pmpaddr_csr7 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr7_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr7_exception_o     (pmpaddr7_exception_o   ),
.pmpaddr7_o               (pmpaddr7_o             )

 */   
);

//pmpaddr_csr8 module instantiation

pmpaddr_csr8 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr8_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr8_exception_o     (pmpaddr8_exception_o   ),
.pmpaddr8_o               (pmpaddr8_o             )
*/
    
);

//pmpaddr_csr9 module instantiation

pmpaddr_csr9 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr9_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr9_exception_o     (pmpaddr9_exception_o   ),
.pmpaddr9_o               (pmpaddr9_o             )
*/
    
);

//pmpaddr_csr0 module instantiation

pmpaddr_csr10 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr10_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr10_exception_o     (pmpaddr10_exception_o   ),
.pmpaddr10_o               (pmpaddr10_o             )
*/
    
);

//pmpaddr_csr0 module instantiation

pmpaddr_csr11 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr11_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr11_exception_o     (pmpaddr11_exception_o   ),
.pmpaddr11_o               (pmpaddr11_o             )
*/
    
);

//pmpaddr_csr12 module instantiation

pmpaddr_csr12 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr12_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr12_exception_o     (pmpaddr12_exception_o   ),
.pmpaddr12_o               (pmpaddr12_o             )
*/
    
);

//pmpaddr_csr13 module instantiation

pmpaddr_csr13 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr13_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr13_exception_o     (pmpaddr13_exception_o   ),
.pmpaddr13_o               (pmpaddr13_o             )
*/
    
);

//pmpaddr_csr14 module instantiation

pmpaddr_csr14 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr14_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr14_exception_o     (pmpaddr14_exception_o   ),
.pmpaddr14_o               (pmpaddr14_o             )
*/
    
);

//pmpaddr_csr15 module instantiation

pmpaddr_csr15 #(
.CSR_ADDR_WIDTH    (CSR_ADDR_WIDTH    ),
.DATA_WIDTH        (DATA_WIDTH        ),
.PMP_WIDTH         (PMP_WIDTH         )
)
pmpaddr_csr15_inst
(
.*
/*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr        ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpaddr15_exception_o     (pmpaddr15_exception_o   ),
.pmpaddr15_o               (pmpaddr15_o             )
*/
    
);



endmodule






//this module is implementation of pmpaddr0 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr0
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                      pmpaddr0_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr0_o

    
);
localparam  PMPADDRESS0 = 12'b0011_1011_0000;
 logic    [PMP_WIDTH-1:0]        pmpaddr0;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS0) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr0 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr0 <= {csr_write_data,2'b00};
        end
        /*else
        begin
             pmpaddr0 <= {PMP_WIDTH{1'b0}};
        end*/
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr0_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr0_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr0_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr0_o = pmpaddr0[PMP_WIDTH-1:2];
endmodule




//this module is implementation of pmpaddr0 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr1
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr1_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr1_o

    
);
localparam  PMPADDRESS1 = 12'b0011_1011_0001;
 logic    [PMP_WIDTH-1:0]        pmpaddr1;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS1) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr1 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr1 <= {csr_write_data,2'b00};
        end
       /* else
        begin
             pmpaddr1 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr1_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr1_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr1_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr1_o = pmpaddr1[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr2 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr2
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr2_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr2_o

    
);
localparam  PMPADDRESS2 = 12'b0011_1011_0010;
 logic    [PMP_WIDTH-1:0]        pmpaddr2;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS2) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr2 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr2 <= {csr_write_data,2'b00};
        end
        /*else
        begin
             pmpaddr2 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr2_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr2_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr2_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr2_o = pmpaddr2[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr3 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr3
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr3_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr3_o

    
);
localparam  PMPADDRESS3 = 12'b0011_1011_0011;
 logic    [PMP_WIDTH-1:0]        pmpaddr3;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS3) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr3 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr3 <= {csr_write_data,2'b00};
        end
      /*  else
        begin
             pmpaddr3 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr3_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr3_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr3_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr3_o = pmpaddr3[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr0 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr4
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr4_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr4_o

    
);
localparam  PMPADDRESS4 = 12'b0011_1011_0100;
 logic    [PMP_WIDTH-1:0]        pmpaddr4;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS4) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr4 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr4 <= {csr_write_data,2'b00};
        end
      /*  else
        begin
             pmpaddr4 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr4_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr4_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr4_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr4_o = pmpaddr4[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr5 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr5
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr5_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr5_o

    
);
localparam  PMPADDRESS5 = 12'b0011_1011_0101;
 logic    [PMP_WIDTH-1:0]        pmpaddr5;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS5) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr5 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr5 <= {csr_write_data,2'b00};
        end
      /*  else
        begin
             pmpaddr5 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr5_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr5_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr5_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr5_o = pmpaddr5[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr6 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr6
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr6_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr6_o

    
);
localparam  PMPADDRESS6 = 12'b0011_1011_0110;
 logic    [PMP_WIDTH-1:0]        pmpaddr6;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS6) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr6 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr6 <= {csr_write_data,2'b00};
        end
       /* else
        begin
             pmpaddr6 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr6_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr6_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr6_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr6_o = pmpaddr6[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr7 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr7
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr7_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr7_o

    
);
localparam  PMPADDRESS7 = 12'b0011_1011_0111;
 logic    [PMP_WIDTH-1:0]        pmpaddr7;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS7) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr7 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr7 <= {csr_write_data,2'b00};
        end
      /*  else
        begin
             pmpaddr7 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr7_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr7_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr7_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr7_o = pmpaddr7[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr8 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr8
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr8_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr8_o

    
);
localparam  PMPADDRESS8 = 12'b0011_1011_1000;
 logic    [PMP_WIDTH-1:0]        pmpaddr8;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS8) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr8 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr8 <= {csr_write_data,2'b00};
        end
     /*   else
        begin
             pmpaddr8 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr8_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr8_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr8_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr8_o = pmpaddr8[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr9 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr9
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr9_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr9_o

   
);
localparam  PMPADDRESS9 = 12'b0011_1011_1001;
 logic    [PMP_WIDTH-1:0]        pmpaddr9;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS9) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr9 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr9 <= {csr_write_data,2'b00};
        end
       /* else
        begin
             pmpaddr9 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr9_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr9_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr9_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr9_o = pmpaddr9[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr10 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr10
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr10_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr10_o

    
);
localparam  PMPADDRESS10 = 12'b0011_1011_1010;
 logic    [PMP_WIDTH-1:0]        pmpaddr10;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS10) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr10 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr10 <= {csr_write_data,2'b00};
        end
       /* else
        begin
             pmpaddr10 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr10_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr10_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr10_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr10_o = pmpaddr10[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr11 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr11
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr11_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr11_o

    
);
localparam  PMPADDRESS11 = 12'b0011_1011_1011;
 logic    [PMP_WIDTH-1:0]        pmpaddr11;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS11) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr11 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr11 <= {csr_write_data,2'b00};
        end
      /*  else
        begin
             pmpaddr11 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr11_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr11_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr11_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr11_o = pmpaddr11[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr12 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr12
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr12_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr12_o

    
);
localparam  PMPADDRESS12 = 12'b0011_1011_1100;
 logic    [PMP_WIDTH-1:0]        pmpaddr12;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS12) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr12 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr12 <= {csr_write_data,2'b00};
        end
       /* else
        begin
             pmpaddr12 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr12_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr12_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr12_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr12_o = pmpaddr12[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr13 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr13
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr13_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr13_o

    
);
localparam  PMPADDRESS13 = 12'b0011_1011_1101;
 logic    [PMP_WIDTH-1:0]        pmpaddr13;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS13) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr13 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr13 <= {csr_write_data,2'b00};
        end
      /*  else
        begin
             pmpaddr13 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr13_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr13_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr13_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr13_o = pmpaddr13[PMP_WIDTH-1:2];
endmodule

//this module is implementation of pmpaddr14 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr14
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr14_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr14_o

    
);
localparam  PMPADDRESS14 = 12'b0011_1011_1110;
 logic    [PMP_WIDTH-1:0]        pmpaddr14;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS14) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr14 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr14 <= {csr_write_data,2'b00};
        end
       /* else
        begin
             pmpaddr14 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr14_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr14_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr14_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr14_o = pmpaddr14[PMP_WIDTH-1:2];
endmodule




//this module is implementation of pmpaddr15 register which is 34 bit .
//LSB 2 bits hardwired to zero
module pmpaddr_csr15
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34

)

(
input logic                          csr_clk ,
input logic                          csr_rst ,

input logic  [DATA_WIDTH-1:0]	       csr_write_data,
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,
input logic                          kernal_mode_signal,       //signal from software
output logic                       pmpaddr15_exception_o, //exception 
//output logic [DATA_WIDTH-1:0]	     csr_read_data,
//input logic  [CSR_ADDR_WIDTH-1:0]    csr_read_addr,
//input logic                          csr_read_en,

input logic                          machine_mode_valid,       //machine_mode_signal

output logic [PMP_WIDTH-1:2]        pmpaddr15_o

    
);
localparam  PMPADDRESS15 = 12'b0011_1011_1111;
 logic    [PMP_WIDTH-1:0]        pmpaddr15;
 logic                           wr_addr_valid;

//valid address signal generation
assign wr_addr_valid = ((csr_write_addr == PMPADDRESS15) && csr_write_en);

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr15 <= {PMP_WIDTH{1'b0}};
    end
    else 
    begin
        if(wr_addr_valid && machine_mode_valid && (!kernal_mode_signal))
        begin
            pmpaddr15 <= {csr_write_data,2'b00};
        end
       /* else
        begin
             pmpaddr15 <= {PMP_WIDTH{1'b0}};
        end */
     end
end

always_ff@(posedge csr_clk or negedge csr_rst)
begin
    if(!csr_rst)
    begin
        pmpaddr15_exception_o <= 1'b0;
    end
    else
    begin
        if(wr_addr_valid & kernal_mode_signal)
        begin
            pmpaddr15_exception_o <= 1'b1;
        end
        else
        begin
            pmpaddr15_exception_o <= 1'b0;
        end
    end

end

assign pmpaddr15_o = pmpaddr15[PMP_WIDTH-1:2];
endmodule

