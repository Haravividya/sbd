module pmpcsr_top
#
(
parameter CSR_ADDR_WIDTH    = 12,
parameter DATA_WIDTH        = 32,
parameter PMP_WIDTH         = 34,
parameter RANGE_WIDTH=35 




)
(
input logic                          csr_clk ,
input logic                          csr_rst ,
input logic                          pmp_en,
input logic [DATA_WIDTH-1:0]         memory_access_write_address,
input logic                          memory_access_write_en,
input logic [DATA_WIDTH-1:0]         memory_access_read_address,
input logic                          memory_access_read_en,
input logic [DATA_WIDTH-1:0]	       csr_write_data,
input logic [CSR_ADDR_WIDTH-1:0]	   csr_write_addr,
input logic                          csr_write_en,

input logic                          kernal_mode_signal,       //signal from software
input logic                          machine_mode_valid,  
//machine_mode_signal
input logic  [CSR_ADDR_WIDTH-1:0]	   csr_read_addr,
input logic                          csr_read_en,

output logic                         pmpcfg0_exception_o,      //when user(kernal_mode_signal = 1) tries to write into the config reg 
output logic                         pmpcfg1_exception_o,       
output logic                         pmpcfg2_exception_o,      
output logic                         pmpcfg3_exception_o,         
output logic                         pmpaddr0_exception_o,       
output logic                         pmpaddr1_exception_o,       
output logic                         pmpaddr2_exception_o,       
output logic                         pmpaddr3_exception_o,       
output logic                         pmpaddr4_exception_o,       
output logic                         pmpaddr5_exception_o,       
output logic                         pmpaddr6_exception_o,       
output logic                         pmpaddr7_exception_o,       

output logic                         pmpaddr8_exception_o,       
output logic                         pmpaddr9_exception_o,       
output logic                         pmpaddr10_exception_o,      
output logic                         pmpaddr11_exception_o,      
   
output logic                         pmpaddr12_exception_o,      
output logic                         pmpaddr13_exception_o,      
output logic                         pmpaddr14_exception_o,      
output logic                         pmpaddr15_exception_o,      



output logic [DATA_WIDTH-1:0]        pmpcsr_read_data_o,

output logic                         overlapping_region_exception0,//if there is overlapping between two regions then this
output logic                         overlapping_region_exception1,//exception is raised
output logic                         overlapping_region_exception2,
output logic                         overlapping_region_exception3,
output logic                         overlapping_region_exception4,
output logic                         overlapping_region_exception5,
output logic                         overlapping_region_exception6,
output logic                         overlapping_region_exception7,
output logic                         overlapping_region_exception8,
output logic                         overlapping_region_exception9,
output logic                         overlapping_region_exception10,
output logic                         overlapping_region_exception11,
output logic                         overlapping_region_exception12,
output logic                         overlapping_region_exception13,
output logic                         overlapping_region_exception14,
output logic                         overlapping_region_exception15,
output logic                         valid_memory_access_write_address,
output logic                         valid_memory_access_read_address,

output logic                         region0_range_exception,  // if start_address > end_address then this exception will raise.
output logic                         region1_range_exception,
output logic                         region2_range_exception,
output logic                         region3_range_exception,
output logic                         region4_range_exception,
output logic                         region5_range_exception,
output logic                         region6_range_exception,
output logic                         region7_range_exception,
output logic                         region8_range_exception,
output logic                         region9_range_exception,
output logic                         region10_range_exception,
output logic                         region11_range_exception,
output logic                         region12_range_exception,
output logic                         region13_range_exception,
output logic                         region14_range_exception,
output logic                         region15_range_exception,

output logic                        load_exception,
output logic                        store_exception


);

 timeunit 1ns;
 timeprecision 1ps;
 
  logic [DATA_WIDTH-1:0]       pmpcfg0_wire;
  logic [DATA_WIDTH-1:0]       pmpcfg1_wire;
  logic [DATA_WIDTH-1:0]       pmpcfg2_wire;
  logic [DATA_WIDTH-1:0]       pmpcfg3_wire;

  logic [PMP_WIDTH-1:2]        pmpaddr0_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr1_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr2_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr3_wire;

  logic [PMP_WIDTH-1:2]        pmpaddr4_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr5_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr6_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr7_wire;


  logic [PMP_WIDTH-1:2]        pmpaddr8_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr9_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr10_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr11_wire;


  logic [PMP_WIDTH-1:2]        pmpaddr12_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr13_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr14_wire;
  logic [PMP_WIDTH-1:2]        pmpaddr15_wire;
 logic [RANGE_WIDTH-1:0] start_address0;
 logic [RANGE_WIDTH-1:0] start_address1;
 logic [RANGE_WIDTH-1:0] start_address2;
 logic [RANGE_WIDTH-1:0] start_address3;
 logic [RANGE_WIDTH-1:0] start_address4;
 logic [RANGE_WIDTH-1:0] start_address5;
 logic [RANGE_WIDTH-1:0] start_address6;
 logic [RANGE_WIDTH-1:0] start_address7;
 logic [RANGE_WIDTH-1:0] start_address8;
 logic [RANGE_WIDTH-1:0] start_address9;
 logic [RANGE_WIDTH-1:0] start_address10;
 logic [RANGE_WIDTH-1:0] start_address11;
 logic [RANGE_WIDTH-1:0] start_address12;
 logic [RANGE_WIDTH-1:0] start_address13;
 logic [RANGE_WIDTH-1:0] start_address14;
 logic [RANGE_WIDTH-1:0] start_address15;
 logic [RANGE_WIDTH-1:0] end_address0;
 logic [RANGE_WIDTH-1:0] end_address1;
 logic [RANGE_WIDTH-1:0] end_address2;
 logic [RANGE_WIDTH-1:0] end_address3;
 logic [RANGE_WIDTH-1:0] end_address4;
 logic [RANGE_WIDTH-1:0] end_address5;
 logic [RANGE_WIDTH-1:0] end_address6;
 logic [RANGE_WIDTH-1:0] end_address7;
 logic [RANGE_WIDTH-1:0] end_address8;
 logic [RANGE_WIDTH-1:0] end_address9;
 logic [RANGE_WIDTH-1:0] end_address10;
 logic [RANGE_WIDTH-1:0] end_address11;
 logic [RANGE_WIDTH-1:0] end_address12;
 logic [RANGE_WIDTH-1:0] end_address13;
 logic [RANGE_WIDTH-1:0] end_address14;
 logic [RANGE_WIDTH-1:0] end_address15;


 //pmpcsr write module instantiation
 
 pmpcfg_csr_write pmpcfg_csr_write_inst
 (
 .*,
 /*
.csr_clk		         (csr_clk		        ),
.csr_rst		         (csr_rst		        ),
.csr_write_data		     (csr_write_data		),
.csr_write_en	         (csr_write_en	        ),
.csr_write_addr		     (csr_write_addr	    ),
.kernal_mode_signal      (kernal_mode_signal    ),
.machine_mode_valid      (machine_mode_valid    ),
.pmpcfg0_exception_o     (pmpcfg0_exception_o   ),
.pmpcfg1_exception_o     (pmpcfg1_exception_o   ),
.pmpcfg2_exception_o     (pmpcfg2_exception_o   ),
.pmpcfg3_exception_o     (pmpcfg3_exception_o   ),
*/
.pmpcfg0_o               (pmpcfg0_wire             ),
.pmpcfg1_o               (pmpcfg1_wire             ),
.pmpcfg2_o               (pmpcfg2_wire             ),
.pmpcfg3_o               (pmpcfg3_wire             )

     
 );

 pmpaddr_csr_write pmpaddr_csr_write_inst
(
.*,
/*
.csr_clk		          (csr_clk		        ),
.csr_rst		          (csr_rst		        ),
.csr_write_data		      (csr_write_data		),
.csr_write_en	          (csr_write_en	        ),
.csr_write_addr		      (csr_write_addr        ),
.kernal_mode_signal       (kernal_mode_signal    ),
.machine_mode_valid       (machine_mode_valid    ),
.pmpaddr0_exception_o     (pmpaddr0_exception_o   ),
.pmpaddr1_exception_o     (pmpaddr1_exception_o   ),
.pmpaddr2_exception_o     (pmpaddr2_exception_o   ),
.pmpaddr3_exception_o     (pmpaddr3_exception_o   ),
.pmpaddr4_exception_o     (pmpaddr4_exception_o   ),
.pmpaddr5_exception_o     (pmpaddr5_exception_o   ),
.pmpaddr6_exception_o     (pmpaddr6_exception_o   ),
.pmpaddr7_exception_o     (pmpaddr7_exception_o   ),
.pmpaddr8_exception_o     (pmpaddr8_exception_o   ),
.pmpaddr9_exception_o     (pmpaddr9_exception_o   ),
.pmpaddr10_exception_o    (pmpaddr10_exception_o   ),
.pmpaddr11_exception_o    (pmpaddr11_exception_o   ),
.pmpaddr12_exception_o    (pmpaddr12_exception_o   ),
.pmpaddr13_exception_o    (pmpaddr13_exception_o   ),
.pmpaddr14_exception_o    (pmpaddr14_exception_o   ),
.pmpaddr15_exception_o    (pmpaddr15_exception_o   ),
*/
.pmpaddr0_o               (pmpaddr0_wire             ),
.pmpaddr1_o               (pmpaddr1_wire             ),
.pmpaddr2_o               (pmpaddr2_wire             ),
.pmpaddr3_o               (pmpaddr3_wire             ),
.pmpaddr4_o               (pmpaddr4_wire             ),
.pmpaddr5_o               (pmpaddr5_wire             ),
.pmpaddr6_o               (pmpaddr6_wire             ),
.pmpaddr7_o               (pmpaddr7_wire             ),
.pmpaddr8_o               (pmpaddr8_wire             ),
.pmpaddr9_o               (pmpaddr9_wire             ),
.pmpaddr10_o              (pmpaddr10_wire             ),
.pmpaddr11_o              (pmpaddr11_wire             ),
.pmpaddr12_o              (pmpaddr12_wire             ),
.pmpaddr13_o              (pmpaddr13_wire             ),
.pmpaddr14_o              (pmpaddr14_wire             ),
.pmpaddr15_o              (pmpaddr15_wire             )


    
);

pmpcsr_read pmpcsr_read_inst
(
.*,
/*
.csr_read_en	          (csr_read_en	        ),
.csr_read_addr		      (csr_read_addr        ),
*/
.pmpcfg0_i               (pmpcfg0_wire             ),
.pmpcfg1_i               (pmpcfg1_wire             ),
.pmpcfg2_i               (pmpcfg2_wire             ),
.pmpcfg3_i               (pmpcfg3_wire             ),
.pmpaddr0_i               (pmpaddr0_wire             ),
.pmpaddr1_i               (pmpaddr1_wire             ),
.pmpaddr2_i               (pmpaddr2_wire             ),
.pmpaddr3_i               (pmpaddr3_wire             ),
.pmpaddr4_i               (pmpaddr4_wire             ),
.pmpaddr5_i               (pmpaddr5_wire             ),
.pmpaddr6_i               (pmpaddr6_wire             ),
.pmpaddr7_i               (pmpaddr7_wire             ),
.pmpaddr8_i               (pmpaddr8_wire             ),
.pmpaddr9_i               (pmpaddr9_wire             ),
.pmpaddr10_i              (pmpaddr10_wire             ),
.pmpaddr11_i              (pmpaddr11_wire             ),
.pmpaddr12_i              (pmpaddr12_wire             ),
.pmpaddr13_i              (pmpaddr13_wire             ),
.pmpaddr14_i              (pmpaddr14_wire             ),
.pmpaddr15_i              (pmpaddr15_wire             )
//.pmpcsr_read_data_o       (pmpcsr_read_data_o         )



 
)
;


pmp_address_matching pmp_address_matching_inst
(
.*,
/*
    .csr_clk		          (csr_clk		        ),
.csr_rst		          (csr_rst		        ),
*/
.pmpcfg0_i               (pmpcfg0_wire             ),
.pmpcfg1_i               (pmpcfg1_wire             ),
.pmpcfg2_i               (pmpcfg2_wire             ),
.pmpcfg3_i               (pmpcfg3_wire             ),
.pmpaddr0_i               (pmpaddr0_wire             ),
.pmpaddr1_i               (pmpaddr1_wire             ),
.pmpaddr2_i               (pmpaddr2_wire             ),
.pmpaddr3_i               (pmpaddr3_wire             ),
.pmpaddr4_i               (pmpaddr4_wire             ),
.pmpaddr5_i               (pmpaddr5_wire             ),
.pmpaddr6_i               (pmpaddr6_wire             ),
.pmpaddr7_i               (pmpaddr7_wire             ),
.pmpaddr8_i               (pmpaddr8_wire             ),
.pmpaddr9_i               (pmpaddr9_wire             ),
.pmpaddr10_i              (pmpaddr10_wire             ),
.pmpaddr11_i              (pmpaddr11_wire             ),
.pmpaddr12_i              (pmpaddr12_wire             ),
.pmpaddr13_i              (pmpaddr13_wire             ),
.pmpaddr14_i              (pmpaddr14_wire             ),
.pmpaddr15_i              (pmpaddr15_wire             )
/*
 .start_address0       (  start_address0),
 .start_address1       (  start_address1),
 .start_address2       (  start_address2),
 .start_address3       ( start_address3 ),
 .start_address4       (  start_address4    ),
 .start_address5       ( start_address5   ),
 .start_address6       ( start_address6     ),
 .start_address7       (  start_address7    ),
 .start_address8       ( start_address8     ),
 .start_address9       ( start_address9     ),
 .start_address10      ( start_address10   ),
 .start_address11      ( start_address11   ),
 .start_address12      ( start_address12   ),
 .start_address13      ( start_address13   ),
 .start_address14      ( start_address14   ),
 .start_address15      ( start_address15   ),
 .end_address0          ( end_address0  ),
 .end_address1          ( end_address1  ),
 .end_address2          ( end_address2  ),
 .end_address3          ( end_address3  ),
 .end_address4          ( end_address4  ),
 .end_address5          ( end_address5  ),
 .end_address6          ( end_address6  ),
 .end_address7          ( end_address7  ),
 .end_address8          ( end_address8  ),
 .end_address9          ( end_address9  ),
 .end_address10         ( end_address10  ),
 .end_address11         ( end_address11  ),
 .end_address12         ( end_address12  ),
 .end_address13         ( end_address13  ),
 .end_address14         ( end_address14  ),
 .end_address15         ( end_address15  ),
 .region0_range_exception (region0_range_exception),
 .region1_range_exception (region1_range_exception),
 .region2_range_exception (region2_range_exception),
 .region3_range_exception (region3_range_exception),
 .region4_range_exception (region4_range_exception),
 .region5_range_exception (region5_range_exception),
 .region6_range_exception (region6_range_exception),
 .region7_range_exception (region7_range_exception),
 .region8_range_exception (region8_range_exception),
 .region9_range_exception (region9_range_exception),
 .region10_range_exception(region10_range_exception),
 .region11_range_exception(region11_range_exception),
 .region12_range_exception(region12_range_exception),
 .region13_range_exception(region13_range_exception),
 .region14_range_exception(region14_range_exception),
 .region15_range_exception(region15_range_exception)
*/
);

pmp_access_check pmp_access_check_inst(
.*,
/*
.csr_clk		          (csr_clk		        ),
.csr_rst		          (csr_rst		        ),
.pmp_en                   (pmp_en               ),
.kernal_mode_signal       (kernal_mode_signal    ),
.machine_mode_valid       (machine_mode_valid    ),

.memory_access_write_address (memory_access_write_address), 
.memory_access_write_en(memory_access_write_en),
.memory_access_read_address(memory_access_read_address),
.memory_access_read_en(memory_access_read_en),
*/
.pmpcfg0_i               (pmpcfg0_wire             ),
.pmpcfg1_i               (pmpcfg1_wire             ),
.pmpcfg2_i               (pmpcfg2_wire             ),
.pmpcfg3_i               (pmpcfg3_wire             )
/*
 .start_address0       (  start_address0),
 .start_address1       (  start_address1),
 .start_address2       (  start_address2),
 .start_address3       ( start_address3 ),
 .start_address4       (  start_address4    ),
 .start_address5       ( start_address5   ),
 .start_address6       ( start_address6     ),
 .start_address7       (  start_address7    ),
 .start_address8       ( start_address8     ),
 .start_address9       ( start_address9     ),
 .start_address10      ( start_address10   ),
 .start_address11      ( start_address11   ),
 .start_address12      ( start_address12   ),
 .start_address13      ( start_address13   ),
 .start_address14      ( start_address14   ),
 .start_address15      ( start_address15   ),
 .end_address0          ( end_address0  ),
 .end_address1          ( end_address1  ),
 .end_address2          ( end_address2  ),
 .end_address3          ( end_address3  ),
 .end_address4          ( end_address4  ),
 .end_address5          ( end_address5  ),
 .end_address6          ( end_address6  ),
 .end_address7          ( end_address7  ),
 .end_address8          ( end_address8  ),
 .end_address9          ( end_address9  ),
 .end_address10         ( end_address10  ),
 .end_address11         ( end_address11  ),
 .end_address12         ( end_address12  ),
 .end_address13         ( end_address13  ),
 .end_address14         ( end_address14  ),
 .end_address15         ( end_address15  ),

.overlapping_region_exception0    (overlapping_region_exception0),
.overlapping_region_exception1  (overlapping_region_exception1),
.overlapping_region_exception2  (overlapping_region_exception2),  
.overlapping_region_exception3  (overlapping_region_exception3),  
.overlapping_region_exception4  (overlapping_region_exception4),
.overlapping_region_exception5  (overlapping_region_exception5),
.overlapping_region_exception6  (overlapping_region_exception6),   
.overlapping_region_exception7  (overlapping_region_exception7),   
.overlapping_region_exception8  (overlapping_region_exception8),   
.overlapping_region_exception9  (overlapping_region_exception9),   
.overlapping_region_exception10  (overlapping_region_exception10),   
.overlapping_region_exception11  (overlapping_region_exception11),   
.overlapping_region_exception12  (overlapping_region_exception12),   
.overlapping_region_exception13  (overlapping_region_exception13),
.overlapping_region_exception14  (overlapping_region_exception14),   
.overlapping_region_exception15  (overlapping_region_exception15), 
.valid_memory_access_write_address(valid_memory_access_write_address),
.valid_memory_access_read_address (valid_memory_access_read_address),
.load_exception                   (load_exception),
.store_exception                  (store_exception)
*/
);

endmodule



