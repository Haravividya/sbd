/*************************************************
File name:scoreboard.sv
Description:

**************************************************/

`uvm_analysis_imp_decl (_con1)
//`uvm_analysis_imp_decl (_con2)

class pmp_scoreboard_tb extends uvm_scoreboard;
  `uvm_component_utils(pmp_scoreboard_tb)
  
  static uvm_analysis_imp_con1 #(pmp_seq_item_tb,pmp_scoreboard_tb) sb_port_con1; // con1 is connection 1: any name can be given. this is needed only if there are two analysisi port coming to scoreboard. If only one this extention is nto needed
//  static uvm_analysis_imp_con2 #(seq_item_tb,scoreboard_tb) sb_port_con2;
  


  localparam PMP_CONFIGURATION0=12'h3A0;
  localparam PMP_CONFIGURATION1=12'h3A1;
  localparam PMP_CONFIGURATION2=12'h3A2;
  localparam PMP_CONFIGURATION3=12'h3A3;
  localparam PMP_ADDRESS0=12'h3B0;
  localparam PMP_ADDRESS1=12'h3B1;
  localparam PMP_ADDRESS2=12'h3B2;
  localparam PMP_ADDRESS3=12'h3B3;
  localparam PMP_ADDRESS4=12'h3B4;
  localparam PMP_ADDRESS5=12'h3B5;
  localparam PMP_ADDRESS6=12'h3B6;
  localparam PMP_ADDRESS7=12'h3B7;
  localparam PMP_ADDRESS8=12'h3B8;
  localparam PMP_ADDRESS9=12'h3B9;
  localparam PMP_ADDRESS10=12'h3BA;
  localparam PMP_ADDRESS11=12'h3BB;
  localparam PMP_ADDRESS12=12'h3BC;
  localparam PMP_ADDRESS13=12'h3BD;
  localparam PMP_ADDRESS14=12'h3BE;
  localparam PMP_ADDRESS15=12'h3BF;
  
  parameter DATA_WIDTH=32,
             RANGE_WIDTH=35,
             PMP_WIDTH = 34,
            ADDRESS=34;

   logic [34:0] zerobit_position0;
   logic [34:0] zerobit_position1;
   logic [34:0] zerobit_position2;
   logic [34:0] zerobit_position3;
   logic [34:0] zerobit_position4;
   logic [34:0] zerobit_position5;
   logic [34:0] zerobit_position6;
   logic [34:0] zerobit_position7;
   logic [34:0] zerobit_position8;
   logic [34:0] zerobit_position9;
   logic [34:0] zerobit_position10;
   logic [34:0] zerobit_position11;
   logic [34:0] zerobit_position12;
   logic [34:0] zerobit_position13;
   logic [34:0] zerobit_position14;
   logic [34:0] zerobit_position15;



  bit wr_addr_valid;
   bit wr_addr_valid1;
   bit wr_addr_valid2;
   bit wr_addr_valid3;

   //pmp adress
   bit wr_addr_valid4;
   bit wr_addr_valid5;
   bit wr_addr_valid6;
   bit wr_addr_valid7;
   bit wr_addr_valid8;
   bit wr_addr_valid9;
   bit wr_addr_valid10;
   bit wr_addr_valid11;
   bit wr_addr_valid12;
   bit wr_addr_valid13;
   bit wr_addr_valid14;
   bit wr_addr_valid15;
   bit wr_addr_valid16;
   bit wr_addr_valid17;
   bit wr_addr_valid18;
   bit wr_addr_valid19;



  bit rd_addr_valid;

  bit [DATA_WIDTH-1:0] pmpconfig0;
  bit [DATA_WIDTH-1:0] pmpconfig1;
  bit [DATA_WIDTH-1:0] pmpconfig2;
  bit [DATA_WIDTH-1:0] pmpconfig3;


  bit [ADDRESS-1:0] pmpaddr0;
  bit [ADDRESS-1:0] pmpaddr1;
  bit [ADDRESS-1:0] pmpaddr2;
  bit [ADDRESS-1:0] pmpaddr3;
  bit [ADDRESS-1:0] pmpaddr4;
  bit [ADDRESS-1:0] pmpaddr5;
  bit [ADDRESS-1:0] pmpaddr6;
  bit [ADDRESS-1:0] pmpaddr7;
  bit [ADDRESS-1:0] pmpaddr8;
  bit [ADDRESS-1:0] pmpaddr9;
  bit [ADDRESS-1:0] pmpaddr10;
  bit [ADDRESS-1:0] pmpaddr11;
  bit [ADDRESS-1:0] pmpaddr12;
  bit [ADDRESS-1:0] pmpaddr13;
  bit [ADDRESS-1:0] pmpaddr14;
  bit [ADDRESS-1:0] pmpaddr15;
 

 bit  [DATA_WIDTH-1:0] pmpconfig0_o;
 bit  [DATA_WIDTH-1:0] pmpconfig1_o;
 bit  [DATA_WIDTH-1:0] pmpconfig2_o;
 bit  [DATA_WIDTH-1:0] pmpconfig3_o;

 bit  [ADDRESS-1:0] pmpaddr0_o;
 bit  [ADDRESS-1:0] pmpaddr1_o;
 bit  [ADDRESS-1:0] pmpaddr2_o;
 bit  [ADDRESS-1:0] pmpaddr3_o;
 bit  [ADDRESS-1:0] pmpaddr4_o;
 bit  [ADDRESS-1:0] pmpaddr5_o;
 bit  [ADDRESS-1:0] pmpaddr6_o;
 bit  [ADDRESS-1:0] pmpaddr7_o;
 bit  [ADDRESS-1:0] pmpaddr8_o;
 bit  [ADDRESS-1:0] pmpaddr9_o;
 bit  [ADDRESS-1:0] pmpaddr10_o;
 bit  [ADDRESS-1:0] pmpaddr11_o;
 bit  [ADDRESS-1:0] pmpaddr12_o;
 bit  [ADDRESS-1:0] pmpaddr13_o;
 bit  [ADDRESS-1:0] pmpaddr14_o;
 bit  [ADDRESS-1:0] pmpaddr15_o;
 bit  [ADDRESS-1:0] pmpaddr1_i;


  reg  [DATA_WIDTH-1:0] pmpconfig0_r;
 reg  [DATA_WIDTH-1:0] pmpconfig1_r;
 reg  [DATA_WIDTH-1:0] pmpconfig2_r;
 reg  [DATA_WIDTH-1:0] pmpconfig3_r;

 reg  [ADDRESS-1:0] pmpaddr0_r;
 reg  [ADDRESS-1:0] pmpaddr1_r;
 reg  [ADDRESS-1:0] pmpaddr2_r;
 reg  [ADDRESS-1:0] pmpaddr3_r;
 reg  [ADDRESS-1:0] pmpaddr4_r;
 reg  [ADDRESS-1:0] pmpaddr5_r;
 reg  [ADDRESS-1:0] pmpaddr6_r;
 reg  [ADDRESS-1:0] pmpaddr7_r;
 reg  [ADDRESS-1:0] pmpaddr8_r;
 reg  [ADDRESS-1:0] pmpaddr9_r;
 reg  [ADDRESS-1:0] pmpaddr10_r;
 reg  [ADDRESS-1:0] pmpaddr11_r;
 reg  [ADDRESS-1:0] pmpaddr12_r;
 reg  [ADDRESS-1:0] pmpaddr13_r;
 reg  [ADDRESS-1:0] pmpaddr14_r;
 reg  [ADDRESS-1:0] pmpaddr15_r;
 

 

 reg [DATA_WIDTH-1:0] pmpcsr_read_data_r;
 
 
bit s_napot_valid0;
bit s_napot_valid1;
bit s_napot_valid2;
bit s_napot_valid3;
bit s_napot_valid4;
bit s_napot_valid5;
bit s_napot_valid6;
bit s_napot_valid7;
bit s_napot_valid8;
bit s_napot_valid9;
bit s_napot_valid10;
bit s_napot_valid11;
bit s_napot_valid12;
bit s_napot_valid13;
bit s_napot_valid14;
bit s_napot_valid15;


bit  s_tor_valid0;
bit  s_tor_valid1;
bit  s_tor_valid2;
bit  s_tor_valid3;
bit  s_tor_valid4;
bit  s_tor_valid5;
bit  s_tor_valid6;
bit  s_tor_valid7;
bit  s_tor_valid8;
bit  s_tor_valid9;
bit  s_tor_valid10;
bit  s_tor_valid11;
bit  s_tor_valid12;
bit  s_tor_valid13;
bit  s_tor_valid14;
bit  s_tor_valid15;


bit  s_na4_valid0;
bit  s_na4_valid1;
bit  s_na4_valid2;
bit  s_na4_valid3;
bit  s_na4_valid4;
bit  s_na4_valid5;
bit  s_na4_valid6;
bit  s_na4_valid7;
bit  s_na4_valid8;
bit  s_na4_valid9;
bit  s_na4_valid10;
bit  s_na4_valid11;
bit  s_na4_valid12;
bit  s_na4_valid13;
bit  s_na4_valid14;
bit  s_na4_valid15;

bit s_off_valid0;
bit s_off_valid1;
bit s_off_valid2;
bit s_off_valid3;
bit s_off_valid4;
bit s_off_valid5;
bit s_off_valid6;
bit s_off_valid7;

bit s_off_valid8;

bit s_off_valid9;
bit s_off_valid10;

bit s_off_valid11;

bit s_off_valid12;

bit s_off_valid13;

bit s_off_valid14;

bit s_off_valid15;


bit user_mode_s;
bit machine_mode_access_s;



bit range_check_write0_s ; 
bit range_check_write1_s ;
bit range_check_write2_s ;
bit range_check_write3_s ;
bit range_check_write4_s ;
bit range_check_write5_s ; 
bit range_check_write6_s ; 
bit range_check_write7_s ; 
bit range_check_write8_s ; 
bit range_check_write9_s ;
bit range_check_write10_s ;
bit range_check_write11_s ;
bit range_check_write12_s ;
bit range_check_write13_s ; 
bit range_check_write14_s ; 
bit range_check_write15_s ; 

bit range_check_read0_s ; 
bit range_check_read1_s ;
bit range_check_read2_s ;
bit range_check_read3_s ;
bit range_check_read4_s ;
bit range_check_read5_s ; 
bit range_check_read6_s ; 
bit range_check_read7_s ; 
bit range_check_read8_s ; 
bit range_check_read9_s ;
bit range_check_read10_s ;
bit range_check_read11_s;
bit range_check_read12_s ;
bit range_check_read13_s ; 
bit range_check_read14_s ; 
bit range_check_read15_s ; 


bit non_zero_region0_s;
bit non_zero_region1_s;
bit non_zero_region2_s;
bit non_zero_region3_s;
bit non_zero_region4_s;
bit non_zero_region5_s;
bit non_zero_region6_s;
bit non_zero_region7_s;
bit non_zero_region8_s;
bit non_zero_region9_s;
bit non_zero_region10_s;
bit non_zero_region11_s;
bit non_zero_region12_s;
bit non_zero_region13_s;
bit non_zero_region14_s;
bit non_zero_region15_s;



bit overlapping_region0_s;
bit overlapping_region1_s;
bit overlapping_region2_s;
bit overlapping_region3_s;
bit overlapping_region4_s;
bit overlapping_region5_s;
bit overlapping_region6_s;
bit overlapping_region7_s;
bit overlapping_region8_s;
bit overlapping_region9_s;
bit overlapping_region10_s;
bit overlapping_region11_s;
bit overlapping_region12_s;
bit overlapping_region13_s;
bit overlapping_region14_s;
bit overlapping_region15_s;

logic [34:0] sb_start_address0;
logic [34:0] sb_start_address1;
logic [34:0] sb_start_address2;
logic [34:0] sb_start_address3;
logic [34:0] sb_start_address4;
logic [34:0] sb_start_address5;
logic [34:0] sb_start_address6;
logic [34:0] sb_start_address7;
logic [34:0] sb_start_address8;
logic [34:0] sb_start_address9;
logic [34:0] sb_start_address10;
logic [34:0] sb_start_address11;
logic [34:0] sb_start_address12;
logic [34:0] sb_start_address13;
logic [34:0] sb_start_address14;
logic [34:0] sb_start_address15;

logic [34:0] sb_end_address0;
logic [34:0] sb_end_address1;
logic [34:0] sb_end_address2;
logic [34:0] sb_end_address3;
logic [34:0] sb_end_address4;
logic [34:0] sb_end_address5;
logic [34:0] sb_end_address6;
logic [34:0] sb_end_address7;
logic [34:0] sb_end_address8;
logic [34:0] sb_end_address9;
logic [34:0] sb_end_address10;
logic [34:0] sb_end_address11;
logic [34:0] sb_end_address12;
logic [34:0] sb_end_address13;
logic [34:0] sb_end_address14;
logic [34:0] sb_end_address15;




//`include "../top/pmp_assertion.sv"



  pmp_seq_item_tb sb;
  pmp_seq_item_tb seq_item_inst;

  pmp_seq_item_tb pkt_qu[$];

  

   function new (string name = "scoreboard", uvm_component parent = null);
    super.new (name, parent);
  endfunction
	
  function void build_phase (uvm_phase phase);
    sb_port_con1	 = new("sb_port_con1", this);
 //   sb_port_con2	 = new("sb_port_con2", this);
    sb   = pmp_seq_item_tb::type_id::create("sb");

  endfunction

    function void compare(logic [63:0] sb_data, logic [63:0] rtl_data, string label);
    if(sb_data === rtl_data)
      `uvm_info("SCOREBOARD PASS",$sformatf("signal : %0s, scoreboard : %0h, rtl : %0h", label, sb_data, rtl_data), UVM_MEDIUM)
    else
        `uvm_error("SCOREBOARD FAIL",$sformatf("signal : %0s, scoreboard : %0h, rtl : %0h", label, sb_data, rtl_data))
  endfunction

    
   




     
   virtual function void write_con1 (input pmp_seq_item_tb pkt);
    
    pkt_qu.push_back(pkt);

  endfunction
    task run_phase(uvm_phase phase);
     
    forever
    begin
    wait(pkt_qu.size() >0);
    seq_item_inst = pkt_qu.pop_front();
    

 // sb =seq_item_inst;
 // `uvm_info("Scoreboard",$sformatf("Recieved dat afrom monitor"), UVM_MEDIUM)
 // sb.print();

 /**********************************************************************************************************************/
     // Write Address Valid Calculation
/*********************************************************************************************************************/

  wr_addr_valid = ((seq_item_inst.csr_write_addr == PMP_CONFIGURATION0) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid1 = ((seq_item_inst.csr_write_addr == PMP_CONFIGURATION1) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid2 = ((seq_item_inst.csr_write_addr == PMP_CONFIGURATION2) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid3 = ((seq_item_inst.csr_write_addr == PMP_CONFIGURATION3) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid4=((seq_item_inst.csr_write_addr == PMP_ADDRESS0) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid5=((seq_item_inst.csr_write_addr == PMP_ADDRESS1) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid6=((seq_item_inst.csr_write_addr == PMP_ADDRESS2) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid7=((seq_item_inst.csr_write_addr == PMP_ADDRESS3) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid8=((seq_item_inst.csr_write_addr == PMP_ADDRESS4) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid9=((seq_item_inst.csr_write_addr == PMP_ADDRESS5) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid10=((seq_item_inst.csr_write_addr == PMP_ADDRESS6) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid11=((seq_item_inst.csr_write_addr == PMP_ADDRESS7) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid12=((seq_item_inst.csr_write_addr == PMP_ADDRESS8) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid13=((seq_item_inst.csr_write_addr == PMP_ADDRESS9) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid14=((seq_item_inst.csr_write_addr == PMP_ADDRESS10) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid15=((seq_item_inst.csr_write_addr == PMP_ADDRESS11) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid16=((seq_item_inst.csr_write_addr == PMP_ADDRESS12) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid17=((seq_item_inst.csr_write_addr == PMP_ADDRESS13) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid18=((seq_item_inst.csr_write_addr == PMP_ADDRESS14) && seq_item_inst.csr_write_en) ? 1:0;
  wr_addr_valid19=((seq_item_inst.csr_write_addr == PMP_ADDRESS15) && seq_item_inst.csr_write_en) ? 1:0;
  
  user_mode_s=(seq_item_inst.kernel_mode_signal)||(seq_item_inst.machine_mode_valid);
  machine_mode_access_s= (!seq_item_inst.kernel_mode_signal)&&(seq_item_inst.machine_mode_valid);


     if( !seq_item_inst.csr_rst )
       begin
        pmpconfig0 = 0;
        pmpconfig1 = 0;
        pmpconfig2 = 0;
        pmpconfig3 = 0;
        pmpaddr0 =0;
        pmpaddr1 =0;
        pmpaddr2 =0;
        pmpaddr3 =0;
        pmpaddr4 =0;
        pmpaddr5 =0;
        pmpaddr6 =0;
        pmpaddr7 =0;
        pmpaddr8 =0;
        pmpaddr9 =0;
        pmpaddr10 =0;
        pmpaddr11 =0;
        pmpaddr12 =0;
        pmpaddr13 =0;
        pmpaddr14 =0;
        pmpaddr15 =0;
        sb.pmpcfg0_exception = 1'b0;
        sb.pmpcfg1_exception = 1'b0;
        sb.pmpcfg2_exception = 1'b0;
        sb.pmpcfg3_exception = 1'b0;
        sb.pmpaddr0_exception = 1'b0;
        sb.pmpaddr1_exception = 1'b0;
        sb.pmpaddr2_exception = 1'b0;
        sb.pmpaddr3_exception = 1'b0;
        sb.pmpaddr4_exception = 1'b0;
        sb.pmpaddr5_exception = 1'b0;
        sb.pmpaddr6_exception = 1'b0;
        sb.pmpaddr7_exception = 1'b0;
        sb.pmpaddr8_exception = 1'b0;
        sb.pmpaddr9_exception = 1'b0;
        sb.pmpaddr10_exception = 1'b0;
        sb.pmpaddr11_exception = 1'b0;
        sb.pmpaddr12_exception = 1'b0;
        sb.pmpaddr13_exception = 1'b0;
        sb.pmpaddr14_exception = 1'b0;
        sb.pmpaddr15_exception = 1'b0;
        pmpconfig0_r <= {DATA_WIDTH{1'b0}};
        pmpconfig1_r <= {DATA_WIDTH{1'b0}};
        pmpconfig2_r <= {DATA_WIDTH{1'b0}};
        pmpconfig3_r <= {DATA_WIDTH{1'b0}};

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
         sb.overlapping_region_exception0 = 1'b0;
         sb.overlapping_region_exception1 = 1'b0;
         sb.overlapping_region_exception2 = 1'b0;
         sb.overlapping_region_exception3 = 1'b0;
         sb.overlapping_region_exception4 = 1'b0;
         sb.overlapping_region_exception5 = 1'b0;
         sb.overlapping_region_exception6 = 1'b0;
         sb.overlapping_region_exception7 = 1'b0;
         sb.overlapping_region_exception8 = 1'b0;
         sb.overlapping_region_exception9 = 1'b0;
         sb.overlapping_region_exception10 = 1'b0;
         sb.overlapping_region_exception11 = 1'b0;
         sb.overlapping_region_exception12 = 1'b0;
         sb.overlapping_region_exception13 = 1'b0;
         sb.overlapping_region_exception14 = 1'b0;
         sb.overlapping_region_exception15 = 1'b0;

        end
        
      else
          begin

           sb.pmpcfg0_exception <= (wr_addr_valid & seq_item_inst.kernel_mode_signal) ? 1:0;
            sb.pmpcfg1_exception <= (wr_addr_valid1 & seq_item_inst.kernel_mode_signal) ? 1:0;
            sb.pmpcfg2_exception <= (wr_addr_valid2 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpcfg3_exception <= (wr_addr_valid3 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr0_exception <= (wr_addr_valid4 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr1_exception <= (wr_addr_valid5 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr2_exception <= (wr_addr_valid6 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr3_exception <= (wr_addr_valid7 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr4_exception <= (wr_addr_valid8 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr5_exception <= (wr_addr_valid9 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr6_exception <= (wr_addr_valid10 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr7_exception <= (wr_addr_valid11 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr8_exception <= (wr_addr_valid12 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr9_exception <= (wr_addr_valid13 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr10_exception <= (wr_addr_valid14 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr11_exception <= (wr_addr_valid15 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr12_exception <= (wr_addr_valid16 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr13_exception <= (wr_addr_valid17 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr14_exception <= (wr_addr_valid18 & seq_item_inst.kernel_mode_signal) ? 1:0;
           sb.pmpaddr15_exception <= (wr_addr_valid19 & seq_item_inst.kernel_mode_signal) ? 1:0;
              pmpconfig0_r <= pmpconfig0_o;
              pmpconfig1_r <= pmpconfig1_o;
              pmpconfig2_r <= pmpconfig2_o;
              pmpconfig3_r <= pmpconfig3_o;
              pmpaddr0_r <= pmpaddr0_o;
              pmpaddr1_r <= pmpaddr1_o;
              pmpaddr2_r <= pmpaddr2_o;
              pmpaddr3_r <= pmpaddr3_o;
              pmpaddr4_r <= pmpaddr4_o;
              pmpaddr5_r <= pmpaddr5_o;
              pmpaddr6_r <= pmpaddr6_o;
              pmpaddr7_r <= pmpaddr7_o;
              pmpaddr8_r <= pmpaddr8_o;
              pmpaddr9_r <= pmpaddr9_o;
              pmpaddr10_r <=pmpaddr10_o;
              pmpaddr11_r <=pmpaddr11_o;
              pmpaddr12_r <=pmpaddr12_o;
              pmpaddr13_r <=pmpaddr13_o;
              pmpaddr14_r <=pmpaddr14_o;
              pmpaddr15_r <=pmpaddr15_o;
            
 

     end
    

          if(wr_addr_valid && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpconfig0 = seq_item_inst.csr_write_data;
          end
           
           
           if(wr_addr_valid1 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpconfig1 = seq_item_inst.csr_write_data;
        end
          
          if(wr_addr_valid2 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpconfig2 = seq_item_inst.csr_write_data;
        end

        if(wr_addr_valid3 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpconfig3 <= seq_item_inst.csr_write_data;
        end
           
         if(wr_addr_valid4 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
          begin
            pmpaddr0 = {seq_item_inst.csr_write_data,2'b00};
          end

        if(wr_addr_valid5 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr1 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid6 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr2 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid7 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr3 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid8 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr4 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid9 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr5 = {seq_item_inst.csr_write_data,2'b00};
        end
  
         if(wr_addr_valid10 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr6 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid11 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr7 = {seq_item_inst.csr_write_data,2'b00};
        end


        if(wr_addr_valid12 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr8 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid13 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr9 = {seq_item_inst.csr_write_data,2'b00};
        end


        if(wr_addr_valid14 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr10 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid15 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr11 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid16 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr12 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid17 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr13 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid18 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr14 = {seq_item_inst.csr_write_data,2'b00};
        end

         if(wr_addr_valid19 && seq_item_inst.machine_mode_valid && (!seq_item_inst.kernel_mode_signal))
        begin
            pmpaddr15 = {seq_item_inst.csr_write_data,2'b00};
        end  

                  

            


            pmpconfig0_o<= {pmpconfig0[DATA_WIDTH-1],2'b00,pmpconfig0[DATA_WIDTH-4:DATA_WIDTH-8],pmpconfig0[DATA_WIDTH-9],2'b00,pmpconfig0[DATA_WIDTH-12:DATA_WIDTH-16],pmpconfig0[DATA_WIDTH-17],2'b00,pmpconfig0[DATA_WIDTH-20:DATA_WIDTH-24],pmpconfig0[DATA_WIDTH-25],2'b00,pmpconfig0[DATA_WIDTH-28:DATA_WIDTH-32]};
            pmpconfig1_o<= {pmpconfig1[DATA_WIDTH-1],2'b00,pmpconfig1[DATA_WIDTH-4:DATA_WIDTH-8],pmpconfig1[DATA_WIDTH-9],2'b00,pmpconfig1[DATA_WIDTH-12:DATA_WIDTH-16],pmpconfig1[DATA_WIDTH-17],2'b00,pmpconfig1[DATA_WIDTH-20:DATA_WIDTH-24],pmpconfig1[DATA_WIDTH-25],2'b00,pmpconfig1[DATA_WIDTH-28:DATA_WIDTH-32]};
            pmpconfig2_o<= {pmpconfig2[DATA_WIDTH-1],2'b00,pmpconfig2[DATA_WIDTH-4:DATA_WIDTH-8],pmpconfig2[DATA_WIDTH-9],2'b00,pmpconfig2[DATA_WIDTH-12:DATA_WIDTH-16],pmpconfig2[DATA_WIDTH-17],2'b00,pmpconfig2[DATA_WIDTH-20:DATA_WIDTH-24],pmpconfig2[DATA_WIDTH-25],2'b00,pmpconfig2[DATA_WIDTH-28:DATA_WIDTH-32]}; 
            pmpconfig3_o<= {pmpconfig3[DATA_WIDTH-1],2'b00,pmpconfig3[DATA_WIDTH-4:DATA_WIDTH-8],pmpconfig3[DATA_WIDTH-9],2'b00,pmpconfig3[DATA_WIDTH-12:DATA_WIDTH-16],pmpconfig3[DATA_WIDTH-17],2'b00,pmpconfig3[DATA_WIDTH-20:DATA_WIDTH-24],pmpconfig3[DATA_WIDTH-25],2'b00,pmpconfig3[DATA_WIDTH-28:DATA_WIDTH-32]};
            pmpaddr0_o <= {2'b00,pmpaddr0[ADDRESS-1:2]};
            pmpaddr1_o <= {2'b00,pmpaddr1[ADDRESS-1:2]};
            pmpaddr2_o <= {2'b00,pmpaddr2[ADDRESS-1:2]};
            pmpaddr3_o <= {2'b00,pmpaddr3[ADDRESS-1:2]};
            pmpaddr4_o <= {2'b00,pmpaddr4[ADDRESS-1:2]};
            pmpaddr5_o <= {2'b00,pmpaddr5[ADDRESS-1:2]};
            pmpaddr6_o <= {2'b00,pmpaddr6[ADDRESS-1:2]};
            pmpaddr7_o <= {2'b00,pmpaddr7[ADDRESS-1:2]};
            pmpaddr8_o <= {2'b00,pmpaddr8[ADDRESS-1:2]};
            pmpaddr9_o <= {2'b00,pmpaddr9[ADDRESS-1:2]};
            pmpaddr10_o <= {2'b00,pmpaddr10[ADDRESS-1:2]};
            pmpaddr11_o <= {2'b00,pmpaddr11[ADDRESS-1:2]};
            pmpaddr12_o <= {2'b00,pmpaddr12[ADDRESS-1:2]};
            pmpaddr13_o <= {2'b00,pmpaddr13[ADDRESS-1:2]};
            pmpaddr14_o <= {2'b00,pmpaddr14[ADDRESS-1:2]};
            pmpaddr15_o <= {2'b00,pmpaddr15[ADDRESS-1:2]}; 


     
      compare(.sb_data(sb.pmpcfg0_exception), .rtl_data(seq_item_inst.pmpcfg0_exception), .label("EXECPTION0")); // ndmreset
      compare(.sb_data(sb.pmpcfg1_exception), .rtl_data(seq_item_inst.pmpcfg1_exception), .label("EXECPTION1")); // resumereq
      compare(.sb_data(sb.pmpcfg2_exception), .rtl_data(seq_item_inst.pmpcfg2_exception), .label("EXECPTION2"));
      compare(.sb_data(sb.pmpcfg3_exception), .rtl_data(seq_item_inst.pmpcfg3_exception), .label("EXECPTION3"));
      compare(.sb_data(sb.pmpaddr0_exception), .rtl_data(seq_item_inst.pmpaddr0_exception), .label("ADDR_EXECPTION0"));
      compare(.sb_data(sb.pmpaddr1_exception), .rtl_data(seq_item_inst.pmpaddr1_exception), .label("ADDR_EXECPTION1"));
      compare(.sb_data(sb.pmpaddr2_exception), .rtl_data(seq_item_inst.pmpaddr2_exception), .label("ADDR_EXECPTION2"));
      compare(.sb_data(sb.pmpaddr3_exception), .rtl_data(seq_item_inst.pmpaddr3_exception), .label("ADDR_EXECPTION3"));
      compare(.sb_data(sb.pmpaddr4_exception), .rtl_data(seq_item_inst.pmpaddr4_exception), .label("ADDR_EXECPTION4"));
      compare(.sb_data(sb.pmpaddr5_exception), .rtl_data(seq_item_inst.pmpaddr5_exception), .label("ADDR_EXECPTION5"));
      compare(.sb_data(sb.pmpaddr6_exception), .rtl_data(seq_item_inst.pmpaddr6_exception), .label("ADDR_EXECPTION6"));
      compare(.sb_data(sb.pmpaddr7_exception), .rtl_data(seq_item_inst.pmpaddr7_exception), .label("ADDR_EXECPTION7"));
      compare(.sb_data(sb.pmpaddr8_exception), .rtl_data(seq_item_inst.pmpaddr8_exception), .label("ADDR_EXECPTION8"));
      compare(.sb_data(sb.pmpaddr9_exception), .rtl_data(seq_item_inst.pmpaddr9_exception), .label("ADDR_EXECPTION9"));
      compare(.sb_data(sb.pmpaddr10_exception), .rtl_data(seq_item_inst.pmpaddr10_exception), .label("ADDR_EXECPTION10"));
      compare(.sb_data(sb.pmpaddr11_exception), .rtl_data(seq_item_inst.pmpaddr11_exception), .label("ADDR_EXECPTION11"));
      compare(.sb_data(sb.pmpaddr12_exception), .rtl_data(seq_item_inst.pmpaddr12_exception), .label("ADDR_EXECPTION12"));
      compare(.sb_data(sb.pmpaddr13_exception), .rtl_data(seq_item_inst.pmpaddr13_exception), .label("ADDR_EXECPTION13"));
      compare(.sb_data(sb.pmpaddr14_exception), .rtl_data(seq_item_inst.pmpaddr14_exception), .label("ADDR_EXECPTION14")); 
      compare(.sb_data(sb.pmpaddr15_exception), .rtl_data(seq_item_inst.pmpaddr15_exception), .label("ADDR_EXECPTION15"));

/*****************************************************************************************************************/
               // Read operation//
/*****************************************************************************************************************/
     if(seq_item_inst.csr_read_en)
     begin
         case(seq_item_inst.csr_read_addr)
             12'h3A0 :  pmpcsr_read_data_r = pmpconfig0_o;
             12'h3A1 :  pmpcsr_read_data_r = pmpconfig1_o;
             12'h3A2 :  pmpcsr_read_data_r = pmpconfig2_o;
             12'h3A3 :  pmpcsr_read_data_r = pmpconfig3_o;
             12'h3B0 :  pmpcsr_read_data_r = pmpaddr0_o;
             12'h3B1 :  pmpcsr_read_data_r = pmpaddr1_o;
             12'h3B2 :  pmpcsr_read_data_r = pmpaddr2_o;
             12'h3B3 :  pmpcsr_read_data_r = pmpaddr3_o;
             12'h3B4 :  pmpcsr_read_data_r = pmpaddr4_o;
             12'h3B5 :  pmpcsr_read_data_r = pmpaddr5_o;
             12'h3B6 :  pmpcsr_read_data_r = pmpaddr6_o;
             12'h3B7 :  pmpcsr_read_data_r = pmpaddr7_o;
             12'h3B8 :  pmpcsr_read_data_r = pmpaddr8_o;
             12'h3B9 :  pmpcsr_read_data_r = pmpaddr9_o;
             12'h3BA :  pmpcsr_read_data_r = pmpaddr10_o;
             12'h3BB :  pmpcsr_read_data_r = pmpaddr11_o;
             12'h3BC :  pmpcsr_read_data_r = pmpaddr12_o;
             12'h3BD :  pmpcsr_read_data_r = pmpaddr13_o;
             12'h3BE :  pmpcsr_read_data_r = pmpaddr14_o;
             12'h3BF :  pmpcsr_read_data_r = pmpaddr15_o;
             default :  pmpcsr_read_data_r = {DATA_WIDTH{1'b0}};
         endcase
     end
     else
     begin
          pmpcsr_read_data_r = {DATA_WIDTH{1'b0}};
     end

sb.csr_read_out=pmpcsr_read_data_r;

  
  	     compare(.sb_data(sb.csr_read_out), .rtl_data(seq_item_inst.csr_read_out), .label("CSR READOUT")); // haltreq
    



/***************************************************************************************************************/
                             // Zero BIT Position LOGIC//
/**************************************************************************************************************/
 
//s_off_valid0 = ((!pmpconfig0_o[4) && !pmpconfig0_o[4))  ? 1'b1 : 1'b0;
//s_tor_v
/*

case({pmpconfig0_o[4],pmpconfig0_o[3]})
2'b00 : begin
        s_off_valid0 = 1'b1;
         s_tor_valid0 = 1'b0;
         s_na4_valid0 = 1'b0;
         s_napot_valid0 = 1'b0;
        end
2'b01 : begin
        s_tor_valid0 = 1'b1;
        s_off_valid0 = 1'b0;
        s_na4_valid0 = 1'b0;
        s_napot_valid0 = 1'b0;
        end
2'b10 : begin
        s_na4_valid0 = 1'b1;
        s_off_valid0 = 1'b0;
        s_tor_valid0 = 1'b0;
           
        s_napot_valid0 = 1'b0;
        end
2'b11 : begin 
        s_napot_valid0 = 1'b1;
        s_off_valid0 = 1'b0;
        s_tor_valid0 = 1'b0;
        s_na4_valid0 = 1'b0;
        end
          
default : begin
          s_off_valid0 = 1'b0;
          s_tor_valid0 = 1'b0;
          s_na4_valid0 = 1'b0;
          s_napot_valid0 = 1'b0;
          end
endcase
*/
//////START_ADDRESS0 &END ADDRESS0 CALCULATION//////////

casex(pmpaddr0_o)
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0 : zerobit_position0 =35'h8;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01 : zerobit_position0 =35'h10;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011 : zerobit_position0 =35'h20;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111 : zerobit_position0 =35'h40;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111 : zerobit_position0 =35'h80;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111 : zerobit_position0 =35'h100;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x011_1111 : zerobit_position0 =35'h200;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_0111_1111 : zerobit_position0 =35'h400;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx0_1111_1111 : zerobit_position0 =35'h800;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx01_1111_1111 : zerobit_position0 =35'h1000;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_x011_1111_1111 : zerobit_position0 =35'h2000;
    32'bxxxx_xxxx_xxxx_xxxx_xxxx_0111_1111_1111 : zerobit_position0 =35'h4000;
    32'bxxxx_xxxx_xxxx_xxxx_xxx0_1111_1111_1111 : zerobit_position0 =35'h8000;
    32'bxxxx_xxxx_xxxx_xxxx_xx01_1111_1111_1111 : zerobit_position0 =35'h10000;
    32'bxxxx_xxxx_xxxx_xxxx_x011_1111_1111_1111 : zerobit_position0 =35'h20000;
    32'bxxxx_xxxx_xxxx_xxxx_0111_1111_1111_1111 : zerobit_position0 =35'h40000;
    32'bxxxx_xxxx_xxxx_xxx0_1111_1111_1111_1111 : zerobit_position0 =35'h80000;
    32'bxxxx_xxxx_xxxx_xx01_1111_1111_1111_1111 : zerobit_position0 =35'h100000;
    32'bxxxx_xxxx_xxxx_x011_1111_1111_1111_1111 : zerobit_position0 =35'h200000;
    32'bxxxx_xxxx_xxxx_0111_1111_1111_1111_1111 : zerobit_position0 =35'h400000;
    32'bxxxx_xxxx_xxx0_1111_1111_1111_1111_1111 : zerobit_position0 =35'h800000;
    32'bxxxx_xxxx_xx01_1111_1111_1111_1111_1111 : zerobit_position0 =35'h1000000;
    32'bxxxx_xxxx_x011_1111_1111_1111_1111_1111 : zerobit_position0 =35'h2000000;
    32'bxxxx_xxxx_0111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h4000000;
    32'bxxxx_xxx0_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h8000000;
    32'bxxxx_xx01_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h10000000;
    32'bxxxx_x011_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h20000000;
    32'bxxxx_0111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h40000000;
    32'bxxx0_1111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h80000000;
    32'bxx01_1111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h100000000 ;
    32'bx011_1111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h200000000;
    32'b0111_1111_1111_1111_1111_1111_1111_1111 : zerobit_position0 =35'h400000000;
    default : zerobit_position0 = 35'd0;


endcase

s_off_valid0=(!pmpconfig0_o[4] && !pmpconfig0_o[3]) ? 1:0;
s_tor_valid0=(!pmpconfig0_o[4] && pmpconfig0_o[3]) ? 1:0;
s_na4_valid0=(pmpconfig0_o[4] && !pmpconfig0_o[3]) ? 1:0;
s_napot_valid0=(pmpconfig0_o[4] && pmpconfig0_o[3]) ? 1:0;



 if (s_napot_valid0==1)
       begin
        if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address0=35'd0;
           sb_end_address0=35'd0;
           end

   else
       begin
  
                    `uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr0_o), UVM_MEDIUM)


        
             if(zerobit_position0==35'h8)
                           
                            begin
                              sb_start_address0 ={3'b000,pmpaddr0_o[33:1],1'b0};//{3'h0,pmpaddr0_o[33],pmpaddr0_o[32],pmpaddr0_o[31],pmpaddr0_o[30],pmpaddr0_o[29],pmpaddr0_o[28],pmpaddr0_o[27],pmpaddr0_o[26],pmpaddr0_o[25],pmpaddr0_o[24],
                                                // pmpaddr0_o[23],pmpaddr0_o[22],pmpaddr0_o[21],pmpaddr0_o[20],pmpaddr0_o[19],pmpaddr0_o[18],pmpaddr0_o[17],pmpaddr0_o[16],pmpaddr0_o[15],pmpaddr0_o[14],pmpaddr0_o[13],pmpaddr0_o[12],pmpaddr0_o[11],pmpaddr0_o[10],pmpaddr0_o[9],pmpaddr0_o[8],pmpaddr0_o[7],pmpaddr0_o[6],pmpaddr0_o[5],pmpaddr0_o[4],pmpaddr0_o[3],1'h0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:1],1'h0} +  35'h8;
                              end 
             else if(zerobit_position0==35'h10)
                              begin
                              sb_start_address0 = {3'h0,pmpaddr0_o[PMP_WIDTH-1:2],2'h0};
                              sb_end_address0 =  {3'h0,pmpaddr0_o[PMP_WIDTH-1:2],2'h0} +   35'h10 ;
                              end    
            else if(zerobit_position0==35'h20)
                             begin
                              sb_start_address0 = {3'h0,pmpaddr0_o[PMP_WIDTH-1:3],3'h0};
                              sb_end_address0 =  {3'h0,pmpaddr0_o[PMP_WIDTH-1:3],3'h0} +   35'h20 ;
                              end
             else if(zerobit_position0==35'h40)
                             begin
                              sb_start_address0 = {3'h0,pmpaddr0_o[PMP_WIDTH-1:4],4'h0};
                              sb_end_address0 =  {3'h0,pmpaddr0_o[PMP_WIDTH-1:4],4'd0} +   35'h40 ;
                              end
             else if(zerobit_position0==35'h80)
                             begin
                              sb_start_address0 = {3'h0,pmpaddr0_o[PMP_WIDTH-1:5],5'h0};
                              sb_end_address0 =  {3'h0,pmpaddr0_o[PMP_WIDTH-1:5],5'h0} +  35'h80;
                              end 
             else if(zerobit_position0==35'h100)
                            begin
                              sb_start_address0 = {3'h0,pmpaddr0_o[PMP_WIDTH-1:6],6'h0};
                              sb_end_address0 =  {3'h0,pmpaddr0_o[PMP_WIDTH-1:6],6'h0} +  35'h100;
                              end 
              else if(zerobit_position0==35'd512)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position0==35'd1024)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position0==35'd2048)
                             begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position0==35'd4096)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position0==35'd8192)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position0==35'd16384)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position0==35'd32768)
                             begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position0==35'd65536)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position0==35'd131072)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position0==35'd262144)
                             begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position0==35'd524288)
                               begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position0==35'd1048576)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position0==35'd2097152)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position0==35'd4194304)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position0==35'd8388608)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position0==35'd16777216)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position0==35'd33554432)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position0==35'd67108864)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position0==35'd134217728)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position0==35'd268435456)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position0==35'd536870912)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position0==35'd1073741824)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position0==35'd2147483648)
                             begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address0  =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position0==35'd4294967296)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position0==35'd8589934592)
                              begin
                              sb_start_address0 = {3'd0,pmpaddr0_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position0==35'd17179869184)
                              begin
                              sb_start_address0 = {RANGE_WIDTH {1'b0}};
                              sb_end_address0 =  {3'd0,pmpaddr0_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address0 = {RANGE_WIDTH {1'b0}};
                              sb_end_address0 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid0==1)
    begin
   sb_start_address0 = {RANGE_WIDTH {1'b0}};
   sb_end_address0 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid0==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address0=35'd0;
           sb_end_address0=35'd0;
           end
 else
    begin
     sb_start_address0 = {RANGE_WIDTH {1'b0}};
     sb_end_address0 = {3'd0,pmpaddr0_o};
     end
     end
else if (s_na4_valid0==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address0=35'd0;
           sb_end_address0=35'd0;
           end
    else
    begin
     sb_start_address0 = {3'd0,pmpaddr0_o};
     sb_end_address0 = {3'd0,pmpaddr0_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address0 = {RANGE_WIDTH {1'b0}};
    sb_end_address0 = {RANGE_WIDTH {1'b0}};
   end
  


  sb.region0_range_exception=(sb_start_address0 > sb_end_address0) ? 1:0;

 `uvm_info("ZERo0*****",$sformatf("Zero0_o : %0h", zerobit_position0), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr0_o), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address0), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address0), UVM_MEDIUM)


     //compare(.sb_data(sb_start_address0), .rtl_data(seq_item_inst.start_address0), .label("START_ADDRSS0"));
     //compare(.sb_data(sb_end_address0), .rtl_data(seq_item_inst.end_address0), .label("END_ADDRSS0"));
     compare(.sb_data(sb.region0_range_exception), .rtl_data(seq_item_inst.region0_range_exception), .label("Range_Execption0"));

 //////START_ADDRESS1 &END ADDRESS1 CALCULATION//////////


casex(pmpaddr1_o)
    
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

//////START_ADDRESS1 &END ADDRESS1 CALCULATION//////////

s_off_valid1=(!pmpconfig0_o[12] && !pmpconfig0_o[11]) ? 1:0;
s_tor_valid1=(!pmpconfig0_o[12] && pmpconfig0_o[11]) ? 1:0;
s_na4_valid1=(pmpconfig0_o[12] && !pmpconfig0_o[11]) ? 1:0;
s_napot_valid1=(pmpconfig0_o[12] && pmpconfig0_o[11]) ? 1:0;



 if (s_napot_valid1==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address1=35'd0;
           sb_end_address1=35'd0;
           end

   else

       begin
       
             if(zerobit_position1==35'd8)
                            begin
                              sb_start_address1 = {{3'd0},{pmpaddr1_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position1==35'd16)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position1==35'd32)
                             begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[33:3],3'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position1==35'd64)
                             begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position1==35'd128)
                             begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position1==35'd256)
                            begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position1==35'd512)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position1==35'd1024)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position1==35'd2048)
                             begin
                              sb_start_address1 ={3'd0,pmpaddr1_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position1==35'd4096)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position1==35'd8192)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position1==35'd16384)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position1==35'd32768)
                             begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position1==35'd65536)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position1==35'd131072)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position1==35'd262144)
                             begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position1==35'd524288)
                               begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position1==35'd1048576)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position1==35'd2097152)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position1==35'd4194304)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position1==35'd8388608)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position1==35'd16777216)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position1==35'd33554432)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position1==35'd67108864)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position1==35'd134217728)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position1==35'd268435456)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position1==35'd536870912)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position1==35'd1073741824)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position1==35'd2147483648)
                             begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position1==35'd4294967296)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position1==35'd8589934592)
                              begin
                              sb_start_address1 = {3'd0,pmpaddr1_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position1==35'd17179869184)
                              begin
                              sb_start_address1 = {RANGE_WIDTH {1'b0}};
                              sb_end_address1 =  {3'd0,pmpaddr1_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address1 = {RANGE_WIDTH {1'b0}};
                              sb_end_address1 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid1==1)
    begin
   sb_start_address1 = {RANGE_WIDTH {1'b0}};
   sb_end_address1 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid1==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address1=35'd0;
           sb_end_address1=35'd0;
           end
 else
     if(pmpaddr1_o!=0)
    begin
     sb_start_address1 = {3'd0, pmpaddr0_r} +35'd1;

     sb_end_address1 = {3'd0,pmpaddr1_o};
     end
     end
else if (s_na4_valid1==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address1=35'd0;
           sb_end_address1=35'd0;
           end
    else
    begin
     sb_start_address1 = {3'd0,pmpaddr1_o};
     sb_end_address1 = {3'd0,pmpaddr1_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address1 = {RANGE_WIDTH {1'b0}};
    sb_end_address1 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region1_range_exception=(sb_start_address1 > sb_end_address1) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr1_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position1), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address1), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address1), UVM_MEDIUM)


     //compare(.sb_data(sb_start_address1), .rtl_data(seq_item_inst.start_address1), .label("START_ADDRSS1"));
     //compare(.sb_data(sb_end_address1), .rtl_data(seq_item_inst.end_address1), .label("END_ADDRSS1"));
     compare(.sb_data(sb.region1_range_exception), .rtl_data(seq_item_inst.region1_range_exception), .label("Range_Execption1"));

//////START_ADDRESS2 &END ADDRESS2 CALCULATION//////////

casex(pmpaddr2_o)
   
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

s_off_valid2=(!pmpconfig0_o[20] && !pmpconfig0_o[19]) ? 1:0;
s_tor_valid2=(!pmpconfig0_o[20] && pmpconfig0_o[19]) ? 1:0;
s_na4_valid2=(pmpconfig0_o[20] && !pmpconfig0_o[19]) ? 1:0;
s_napot_valid2=(pmpconfig0_o[20] && pmpconfig0_o[19]) ? 1:0;


if (s_napot_valid2==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address2=35'd0;
           sb_end_address2=35'd0;
           end

   else

       begin
       
             if(zerobit_position2==35'd8)
                            begin
                              sb_start_address2 = {{3'd0},{pmpaddr2_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position2==35'd16)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position2==35'd32)
                             begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[33:3],3'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position2==35'd64)
                             begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position2==35'd128)
                             begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position2==35'd256)
                            begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position2==35'd512)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position2==35'd1024)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position2==35'd2048)
                             begin
                              sb_start_address2 ={3'd0,pmpaddr2_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position2==35'd4096)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position2==35'd8192)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position2==35'd16384)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position2==35'd32768)
                             begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position2==35'd65536)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position2==35'd131072)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position2==35'd262144)
                             begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position2==35'd524288)
                               begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position2==35'd1048576)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position2==35'd2097152)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position2==35'd4194304)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position2==35'd8388608)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position2==35'd16777216)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position2==35'd33554432)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position2==35'd67108864)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position2==35'd134217728)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position2==35'd268435456)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position2==35'd536870912)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position2==35'd1073741824)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position2==35'd2147483648)
                             begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position2==35'd4294967296)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position2==35'd8589934592)
                              begin
                              sb_start_address2 = {3'd0,pmpaddr2_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position2==35'd17179869184)
                              begin
                              sb_start_address2 = {RANGE_WIDTH {1'b0}};
                              sb_end_address2 =  {3'd0,pmpaddr2_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address2 = {RANGE_WIDTH {1'b0}};
                              sb_end_address2 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid2==1)
    begin
   sb_start_address2 = {RANGE_WIDTH {1'b0}};
   sb_end_address2 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid2==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address2=35'd0;
           sb_end_address2=35'd0;
           end
 else
      if(pmpaddr2_o!=0)
    begin
     sb_start_address2 = {3'd0, pmpaddr1_r} +35'd1;

     sb_end_address2 = {3'd0,pmpaddr2_o};
     end
     end
else if (s_na4_valid2==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address2=35'd0;
           sb_end_address2=35'd0;
           end
    else
    begin

     sb_start_address2 = {3'd0,pmpaddr2_o};
     sb_end_address2 = {3'd0,pmpaddr2_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address2 = {RANGE_WIDTH {1'b0}};
    sb_end_address2 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region2_range_exception=(sb_start_address2 > sb_end_address2) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr2_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position2), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address2), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address2), UVM_MEDIUM)


    //compare(.sb_data(sb_start_address2), .rtl_data(seq_item_inst.start_address2), .label("START_ADDRSS2"));
     //compare(.sb_data(sb_end_address2), .rtl_data(seq_item_inst.end_address2), .label("END_ADDRSS2"));
     compare(.sb_data(sb.region2_range_exception), .rtl_data(seq_item_inst.region2_range_exception), .label("Range_Execption2"));

//////START_ADDRESS3 &END ADDRESS3 CALCULATION//////////


casex(pmpaddr3_o)
  
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
s_off_valid3=(!pmpconfig0_o[28] && !pmpconfig0_o[27]) ? 1:0;
s_tor_valid3=(!pmpconfig0_o[28] && pmpconfig0_o[27]) ? 1:0;
s_na4_valid3=(pmpconfig0_o[28] && !pmpconfig0_o[27]) ? 1:0;
s_napot_valid3=(pmpconfig0_o[28] && pmpconfig0_o[27]) ? 1:0;


if (s_napot_valid3==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address3=35'd0;
           sb_end_address3=35'd0;
           end

   else

       begin
       
             if(zerobit_position3==35'd8)
                            begin
                              sb_start_address3 = {{3'd0},{pmpaddr3_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position3==35'd16)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position3==35'd32)
                             begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[33:3],3'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position3==35'd64)
                             begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position3==35'd128)
                             begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position3==35'd256)
                            begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position3==35'd512)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position3==35'd1024)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position3==35'd2048)
                             begin
                              sb_start_address3 ={3'd0,pmpaddr3_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position3==35'd4096)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position3==35'd8192)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position3==35'd16384)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position3==35'd32768)
                             begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position3==35'd65536)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position3==35'd131072)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position3==35'd262144)
                             begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position3==35'd524288)
                               begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position3==35'd1048576)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position3==35'd2097152)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position3==35'd4194304)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position3==35'd8388608)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position3==35'd16777216)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position3==35'd33554432)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position3==35'd67108864)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position3==35'd134217728)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position3==35'd268435456)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position3==35'd536870912)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position3==35'd1073741824)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position3==35'd2147483648)
                             begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position3==35'd4294967296)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position3==35'd8589934592)
                              begin
                              sb_start_address3 = {3'd0,pmpaddr3_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position3==35'd17179869184)
                              begin
                              sb_start_address3 = {RANGE_WIDTH {1'b0}};
                              sb_end_address3 =  {3'd0,pmpaddr3_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address3 = {RANGE_WIDTH {1'b0}};
                              sb_end_address3 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid3==1)
    begin
   sb_start_address3 = {RANGE_WIDTH {1'b0}};
   sb_end_address3 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid3==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address3=35'd0;
           sb_end_address3=35'd0;
           end
 else
      if(pmpaddr3_o!=0)
    begin
     sb_start_address3 = {3'd0, pmpaddr2_r} +35'd1;

     sb_end_address3 = {3'd0,pmpaddr3_o};
     end
     end
else if (s_na4_valid3==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address3=35'd0;
           sb_end_address3=35'd0;
           end
    else
    begin
     sb_start_address3 = {3'd0,pmpaddr3_o};
     sb_end_address3 = {3'd0,pmpaddr3_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address3 = {RANGE_WIDTH {1'b0}};
    sb_end_address3 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region3_range_exception=(sb_start_address3 > sb_end_address3) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr3_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position3), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address3), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address3), UVM_MEDIUM)


   // compare(.sb_data(sb_start_address3), .rtl_data(seq_item_inst.start_address3), .label("START_ADDRSS3"));
    // compare(.sb_data(sb_end_address3), .rtl_data(seq_item_inst.end_address3), .label("END_ADDRSS3"));
     compare(.sb_data(sb.region3_range_exception), .rtl_data(seq_item_inst.region3_range_exception), .label("Range_Execption3"));



casex(pmpaddr4_o)
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
s_off_valid4=(!pmpconfig1_o[4] && !pmpconfig1_o[3]) ? 1:0;
s_tor_valid4=(!pmpconfig1_o[4] && pmpconfig1_o[3]) ? 1:0;
s_na4_valid4=(pmpconfig1_o[4] && !pmpconfig1_o[3]) ? 1:0;
s_napot_valid4=(pmpconfig1_o[4] && pmpconfig1_o[3]) ? 1:0;


if (s_napot_valid4==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address4=35'd0;
           sb_end_address4=35'd0;
           end

   else

       begin
       
             if(zerobit_position4==35'd8)
                            begin
                              sb_start_address4 = {{3'd0},{pmpaddr4_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position4==35'd16)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position4==35'd32)
                             begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[33:3],3'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position4==35'd64)
                             begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position4==35'd128)
                             begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position4==35'd256)
                            begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position4==35'd512)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position4==35'd1024)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position4==35'd2048)
                             begin
                              sb_start_address4 ={3'd0,pmpaddr4_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position4==35'd4096)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position4==35'd8192)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position4==35'd16384)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position4==35'd32768)
                             begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position4==35'd65536)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position4==35'd131072)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position4==35'd262144)
                             begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position4==35'd524288)
                               begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position4==35'd1048576)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position4==35'd2097152)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position4==35'd4194304)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position4==35'd8388608)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position4==35'd16777216)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position4==35'd33554432)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position4==35'd67108864)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position4==35'd134217728)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position4==35'd268435456)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position4==35'd536870912)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position4==35'd1073741824)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position4==35'd2147483648)
                             begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position4==35'd4294967296)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position4==35'd8589934592)
                              begin
                              sb_start_address4 = {3'd0,pmpaddr4_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position4==35'd17179869184)
                              begin
                              sb_start_address4 = {RANGE_WIDTH {1'b0}};
                              sb_end_address4 =  {3'd0,pmpaddr4_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address4 = {RANGE_WIDTH {1'b0}};
                              sb_end_address4 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid4==1)
    begin
   sb_start_address4 = {RANGE_WIDTH {1'b0}};
   sb_end_address4 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid4==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address4=35'd0;
           sb_end_address4=35'd0;
           end
 else
      if(pmpaddr4_o!=0)
    begin
     sb_start_address4 = {3'd0, pmpaddr3_r} + 35'd1;

     sb_end_address4 = {3'd0,pmpaddr4_o};
     end
     end
else if (s_na4_valid4==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address4=35'd0;
           sb_end_address4=35'd0;
           end
    else
    begin
     sb_start_address4 = {3'd0,pmpaddr4_o};
     sb_end_address4 = {3'd0,pmpaddr4_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address4 = {RANGE_WIDTH {1'b0}};
    sb_end_address4 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region4_range_exception=(sb_start_address4 > sb_end_address4) ? 1:0;

`uvm_info("PMp Addr4*****",$sformatf("start0_o : %0h", pmpaddr4_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position4), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address4), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address4), UVM_MEDIUM)


   // compare(.sb_data(sb_start_address4), .rtl_data(seq_item_inst.start_address4), .label("START_ADDRSS4"));
    // compare(.sb_data(sb_end_address4), .rtl_data(seq_item_inst.end_address4), .label("END_ADDRSS4"));
     compare(.sb_data(sb.region4_range_exception), .rtl_data(seq_item_inst.region4_range_exception), .label("Range_Execption4"));



casex(pmpaddr5_o)
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
s_off_valid5=(!pmpconfig1_o[12] && !pmpconfig1_o[11]) ? 1:0;
s_tor_valid5=(!pmpconfig1_o[12] && pmpconfig1_o[11]) ? 1:0;
s_na4_valid5=(pmpconfig1_o[12] && !pmpconfig1_o[11]) ? 1:0;
s_napot_valid5=(pmpconfig1_o[12] && pmpconfig1_o[11]) ? 1:0;


if (s_napot_valid5==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address5=35'd0;
           sb_end_address5=35'd0;
           end

   else

       begin
       
             if(zerobit_position5==35'd8)
                            begin
                              sb_start_address5 = {{3'd0},{pmpaddr5_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position5==35'd16)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position5==35'd32)
                             begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[33:3],3'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position5==35'd64)
                             begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position5==35'd128)
                             begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position5==35'd256)
                            begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position5==35'd512)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position5==35'd1024)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position5==35'd2048)
                             begin
                              sb_start_address5 ={3'd0,pmpaddr5_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position5==35'd4096)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position5==35'd8192)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position5==35'd16384)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position5==35'd32768)
                             begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position5==35'd65536)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position5==35'd131072)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position5==35'd262144)
                             begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position5==35'd524288)
                               begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position5==35'd1048576)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position5==35'd2097152)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position5==35'd4194304)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position5==35'd8388608)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position5==35'd16777216)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position5==35'd33554432)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position5==35'd67108864)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position5==35'd134217728)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position5==35'd268435456)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position5==35'd536870912)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position5==35'd1073741824)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position5==35'd2147483648)
                             begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position5==35'd4294967296)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position5==35'd8589934592)
                              begin
                              sb_start_address5 = {3'd0,pmpaddr5_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position5==35'd17179869184)
                              begin
                              sb_start_address5 = {RANGE_WIDTH {1'b0}};
                              sb_end_address5 =  {3'd0,pmpaddr5_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address5 = {RANGE_WIDTH {1'b0}};
                              sb_end_address5 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid5==1)
    begin
   sb_start_address5 = {RANGE_WIDTH {1'b0}};
   sb_end_address5 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid5==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address5=35'd0;
           sb_end_address5=35'd0;
           end
 else
      if(pmpaddr5_o!=0)
    begin
     sb_start_address5 = {3'd0, pmpaddr4_r} + 35'd1;

     sb_end_address5 = {3'd0,pmpaddr5_o};
     end
     end
else if (s_na4_valid5==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address5=35'd0;
           sb_end_address5=35'd0;
           end
    else
    begin
     sb_start_address5 = {3'd0,pmpaddr5_o};
     sb_end_address5 = {3'd0,pmpaddr5_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address5 = {RANGE_WIDTH {1'b0}};
    sb_end_address5 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region5_range_exception=(sb_start_address5 > sb_end_address5) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr5_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position5), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address5), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address5), UVM_MEDIUM)


    //compare(.sb_data(sb_start_address5), .rtl_data(seq_item_inst.start_address5), .label("START_ADDRSS5"));
     //compare(.sb_data(sb_end_address5), .rtl_data(seq_item_inst.end_address5), .label("END_ADDRSS5"));
     compare(.sb_data(sb.region5_range_exception), .rtl_data(seq_item_inst.region5_range_exception), .label("Range_Execption5"));


casex(pmpaddr6_o)
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
s_off_valid6=(!pmpconfig1_o[20] && !pmpconfig1_o[19]) ? 1:0;
s_tor_valid6=(!pmpconfig1_o[20] && pmpconfig1_o[19]) ? 1:0;
s_na4_valid6=(pmpconfig1_o[20] && !pmpconfig1_o[19]) ? 1:0;
s_napot_valid6=(pmpconfig1_o[20] && pmpconfig1_o[19]) ? 1:0;

if (s_napot_valid6==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address6=35'd0;
           sb_end_address6=35'd0;
           end

   else

       begin
       
             if(zerobit_position6==35'd8)
                            begin
                              sb_start_address6 = {{3'd0},{pmpaddr6_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position6==35'd16)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position6==35'd32)
                             begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[33:3],3'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position6==35'd64)
                             begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position6==35'd128)
                             begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position6==35'd256)
                            begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position6==35'd512)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position6==35'd1024)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position6==35'd2048)
                             begin
                              sb_start_address6 ={3'd0,pmpaddr6_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position6==35'd4096)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position6==35'd8192)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position6==35'd16384)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position6==35'd32768)
                             begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position6==35'd65536)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position6==35'd131072)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position6==35'd262144)
                             begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position6==35'd524288)
                               begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position6==35'd1048576)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position6==35'd2097152)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position6==35'd4194304)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position6==35'd8388608)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position6==35'd16777216)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position6==35'd33554432)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position6==35'd67108864)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position6==35'd134217728)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position6==35'd268435456)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position6==35'd536870912)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position6==35'd1073741824)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position6==35'd2147483648)
                             begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position6==35'd4294967296)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position6==35'd8589934592)
                              begin
                              sb_start_address6 = {3'd0,pmpaddr6_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position6==35'd17179869184)
                              begin
                              sb_start_address6 = {RANGE_WIDTH {1'b0}};
                              sb_end_address6 =  {3'd0,pmpaddr6_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address6 = {RANGE_WIDTH {1'b0}};
                              sb_end_address6 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid6==1)
    begin
   sb_start_address6 = {RANGE_WIDTH {1'b0}};
   sb_end_address6 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid6==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address6=35'd0;
           sb_end_address6=35'd0;
           end
 else
      if(pmpaddr6_o!=0)
    begin
     sb_start_address6 = {3'd0, pmpaddr5_r} + 35'd1;

     sb_end_address6 = {3'd0,pmpaddr6_o};
     end
     end
else if (s_na4_valid6==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address6=35'd0;
           sb_end_address6=35'd0;
           end
    else
    begin
     sb_start_address6 = {3'd0,pmpaddr6_o};
     sb_end_address6 = {3'd0,pmpaddr6_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address6 = {RANGE_WIDTH {1'b0}};
    sb_end_address6 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region6_range_exception=(sb_start_address6 > sb_end_address6) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr6_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position6), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address6), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address6), UVM_MEDIUM)


  //  compare(.sb_data(sb_start_address6), .rtl_data(seq_item_inst.start_address6), .label("START_ADDRSS6"));
    // compare(.sb_data(sb_end_address6), .rtl_data(seq_item_inst.end_address6), .label("END_ADDRSS6"));
     compare(.sb_data(sb.region6_range_exception), .rtl_data(seq_item_inst.region6_range_exception), .label("Range_Execption6"));



casex(pmpaddr7_o)
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
s_off_valid7=(!pmpconfig1_o[28] && !pmpconfig1_o[27]) ? 1:0;
s_tor_valid7=(!pmpconfig1_o[28] && pmpconfig1_o[27]) ? 1:0;
s_na4_valid7=(pmpconfig1_o[28] && !pmpconfig1_o[27]) ? 1:0;
s_napot_valid7=(pmpconfig1_o[28] && pmpconfig1_o[27]) ? 1:0;

if (s_napot_valid7==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address7=35'd0;
           sb_end_address7=35'd0;
           end

   else

       begin
       
             if(zerobit_position7==35'd8)
                            begin
                              sb_start_address7 = {{3'd0},{pmpaddr7_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position7==35'd16)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position7==35'd32)
                             begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[33:3],3'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position7==35'd64)
                             begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position7==35'd128)
                             begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position7==35'd256)
                            begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position7==35'd512)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position7==35'd1024)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position7==35'd2048)
                             begin
                              sb_start_address7 ={3'd0,pmpaddr7_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position7==35'd4096)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position7==35'd8192)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position7==35'd16384)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position7==35'd32768)
                             begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position7==35'd65536)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position7==35'd131072)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position7==35'd262144)
                             begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position7==35'd524288)
                               begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position7==35'd1048576)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position7==35'd2097152)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position7==35'd4194304)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position7==35'd8388608)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position7==35'd16777216)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position7==35'd33554432)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position7==35'd67108864)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position7==35'd134217728)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position7==35'd268435456)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position7==35'd536870912)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position7==35'd1073741824)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position7==35'd2147483648)
                             begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position7==35'd4294967296)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position7==35'd8589934592)
                              begin
                              sb_start_address7 = {3'd0,pmpaddr7_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position7==35'd17179869184)
                              begin
                              sb_start_address7 = {RANGE_WIDTH {1'b0}};
                              sb_end_address7 =  {3'd0,pmpaddr7_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address7 = {RANGE_WIDTH {1'b0}};
                              sb_end_address7 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid7==1)
    begin
   sb_start_address7 = {RANGE_WIDTH {1'b0}};
   sb_end_address7 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid7==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address7=35'd0;
           sb_end_address7=35'd0;
           end
 else
     if(pmpaddr7_o!=0)
    begin
     sb_start_address7 = {3'd0, pmpaddr6_r} + 35'd1;

     sb_end_address7 = {3'd0,pmpaddr7_o};
     end
     end
else if (s_na4_valid7==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address7=35'd0;
           sb_end_address7=35'd0;
           end
    else
    begin
     sb_start_address7 = {3'd0,pmpaddr7_o};
     sb_end_address7 = {3'd0,pmpaddr7_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address7 = {RANGE_WIDTH {1'b0}};
    sb_end_address7 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region7_range_exception=(sb_start_address7 > sb_end_address7) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr7_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position7), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address7), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address7), UVM_MEDIUM)


   // compare(.sb_data(sb_start_address7), .rtl_data(seq_item_inst.start_address7), .label("START_ADDRSS7"));
    // compare(.sb_data(sb_end_address7), .rtl_data(seq_item_inst.end_address7), .label("END_ADDRSS7"));
     compare(.sb_data(sb.region7_range_exception), .rtl_data(seq_item_inst.region7_range_exception), .label("Range_Execption7"));




casex(pmpaddr8_o)
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
s_off_valid8=(!pmpconfig2_o[4] && !pmpconfig2_o[3]) ? 1:0;
s_tor_valid8=(!pmpconfig2_o[4] && pmpconfig2_o[3]) ? 1:0;
s_na4_valid8=(pmpconfig2_o[4] && !pmpconfig2_o[3]) ? 1:0;
s_napot_valid8=(pmpconfig2_o[4] && pmpconfig2_o[3]) ? 1:0;

if (s_napot_valid8==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address8=35'd0;
           sb_end_address8=35'd0;
           end

   else

       begin
       
             if(zerobit_position8==35'd8)
                            begin
                              sb_start_address8 = {{3'd0},{pmpaddr8_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position8==35'd16)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position8==35'd32)
                             begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[33:3],3'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position8==35'd64)
                             begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position8==35'd128)
                             begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position8==35'd256)
                            begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position8==35'd512)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position8==35'd1024)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position8==35'd2048)
                             begin
                              sb_start_address8 ={3'd0,pmpaddr8_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position8==35'd4096)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position8==35'd8192)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position8==35'd16384)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position8==35'd32768)
                             begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position8==35'd65536)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position8==35'd131072)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position8==35'd262144)
                             begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position8==35'd524288)
                               begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position8==35'd1048576)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position8==35'd2097152)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position8==35'd4194304)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position8==35'd8388608)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position8==35'd16777216)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position8==35'd33554432)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position8==35'd67108864)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position8==35'd134217728)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position8==35'd268435456)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position8==35'd536870912)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position8==35'd1073741824)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position8==35'd2147483648)
                             begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position8==35'd4294967296)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position8==35'd8589934592)
                              begin
                              sb_start_address8 = {3'd0,pmpaddr8_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position8==35'd17179869184)
                              begin
                              sb_start_address8 = {RANGE_WIDTH {1'b0}};
                              sb_end_address8 =  {3'd0,pmpaddr8_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address8 = {RANGE_WIDTH {1'b0}};
                              sb_end_address8 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid8==1)
    begin
   sb_start_address8 = {RANGE_WIDTH {1'b0}};
   sb_end_address8 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid8==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address8=35'd0;
           sb_end_address8=35'd0;
           end
 else
    if(pmpaddr8_o!=0)
    begin
     sb_start_address8 = {3'd0, pmpaddr7_r} + 35'd1;

     sb_end_address8 = {3'd0,pmpaddr8_o};
     end
     end
else if (s_na4_valid8==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address8=35'd0;
           sb_end_address8=35'd0;
           end
    else
    begin
     sb_start_address8 = {3'd0,pmpaddr8_o};
     sb_end_address8 = {3'd0,pmpaddr8_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address8 = {RANGE_WIDTH {1'b0}};
    sb_end_address8 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region8_range_exception=(sb_start_address8 > sb_end_address8) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr8_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position8), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address8), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address8), UVM_MEDIUM)


    //compare(.sb_data(sb_start_address8), .rtl_data(seq_item_inst.start_address8), .label("START_ADDRSS8"));
     //compare(.sb_data(sb_end_address8), .rtl_data(seq_item_inst.end_address8), .label("END_ADDRSS8"));
     compare(.sb_data(sb.region8_range_exception), .rtl_data(seq_item_inst.region8_range_exception), .label("Range_Execption8"));



casex(pmpaddr9_o)
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
s_off_valid9=(!pmpconfig2_o[12] && !pmpconfig2_o[11]) ? 1:0;
s_tor_valid9=(!pmpconfig2_o[12] && pmpconfig2_o[11]) ? 1:0;
s_na4_valid9=(pmpconfig2_o[12] && !pmpconfig2_o[11]) ? 1:0;
s_napot_valid9=(pmpconfig2_o[12] && pmpconfig2_o[11]) ? 1:0;

if (s_napot_valid9==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address9=35'd0;
           sb_end_address9=35'd0;
           end

   else

       begin
       
             if(zerobit_position9==35'd8)
                            begin
                              sb_start_address9 = {{3'd0},{pmpaddr9_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position9==35'd16)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position9==35'd32)
                             begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[33:3],3'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position9==35'd64)
                             begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position9==35'd128)
                             begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position9==35'd256)
                            begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position9==35'd512)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position9==35'd1024)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position9==35'd2048)
                             begin
                              sb_start_address9 ={3'd0,pmpaddr9_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position9==35'd4096)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position9==35'd8192)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position9==35'd16384)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position9==35'd32768)
                             begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position9==35'd65536)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position9==35'd131072)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position9==35'd262144)
                             begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position9==35'd524288)
                               begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position9==35'd1048576)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position9==35'd2097152)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position9==35'd4194304)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position9==35'd8388608)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position9==35'd16777216)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position9==35'd33554432)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position9==35'd67108864)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position9==35'd134217728)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position9==35'd268435456)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position9==35'd536870912)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position9==35'd1073741824)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position9==35'd2147483648)
                             begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position9==35'd4294967296)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position9==35'd8589934592)
                              begin
                              sb_start_address9 = {3'd0,pmpaddr9_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position9==35'd17179869184)
                              begin
                              sb_start_address9 = {RANGE_WIDTH {1'b0}};
                              sb_end_address9 =  {3'd0,pmpaddr9_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address9 = {RANGE_WIDTH {1'b0}};
                              sb_end_address9 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid9==1)
    begin
   sb_start_address9 = {RANGE_WIDTH {1'b0}};
   sb_end_address9 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid9==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address9=35'd0;
           sb_end_address9=35'd0;
           end
 else
      if(pmpaddr9_o!=0)
    begin
     sb_start_address9 = {3'd0, pmpaddr8_r} + 35'd1;

     sb_end_address9 = {3'd0,pmpaddr9_o};
     end
     end
else if (s_na4_valid9==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address9=35'd0;
           sb_end_address9=35'd0;
           end
    else
    begin
     sb_start_address9 = {3'd0,pmpaddr9_o};
     sb_end_address9 = {3'd0,pmpaddr9_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address9 = {RANGE_WIDTH {1'b0}};
    sb_end_address9 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region9_range_exception=(sb_start_address9 > sb_end_address9) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr9_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position9), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address9), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address9), UVM_MEDIUM)


    //compare(.sb_data(sb_start_address9), .rtl_data(seq_item_inst.start_address9), .label("START_ADDRSS9"));
    // compare(.sb_data(sb_end_address9), .rtl_data(seq_item_inst.end_address9), .label("END_ADDRSS9"));
     compare(.sb_data(sb.region9_range_exception), .rtl_data(seq_item_inst.region9_range_exception), .label("Range_Execption9"));



casex(pmpaddr10_o)
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
s_off_valid10=(!pmpconfig2_o[20] && !pmpconfig2_o[19]) ? 1:0;
s_tor_valid10=(!pmpconfig2_o[20] && pmpconfig2_o[19]) ? 1:0;
s_na4_valid10=(pmpconfig2_o[20] && !pmpconfig2_o[19]) ? 1:0;
s_napot_valid10=(pmpconfig2_o[20] && pmpconfig2_o[19]) ? 1:0;

if (s_napot_valid10==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address10=35'd0;
           sb_end_address10=35'd0;
           end

   else

       begin
       
             if(zerobit_position10==35'd8)
                            begin
                              sb_start_address10 = {{3'd0},{pmpaddr10_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position10==35'd16)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position10==35'd32)
                             begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[33:3],3'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position10==35'd64)
                             begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position10==35'd128)
                             begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position10==35'd256)
                            begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position10==35'd512)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position10==35'd1024)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position10==35'd2048)
                             begin
                              sb_start_address10 ={3'd0,pmpaddr10_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position10==35'd4096)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position10==35'd8192)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position10==35'd16384)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position10==35'd32768)
                             begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position10==35'd65536)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position10==35'd131072)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position10==35'd262144)
                             begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position10==35'd524288)
                               begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position10==35'd1048576)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position10==35'd2097152)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position10==35'd4194304)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position10==35'd8388608)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position10==35'd16777216)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position10==35'd33554432)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position10==35'd67108864)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position10==35'd134217728)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position10==35'd268435456)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position10==35'd536870912)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position10==35'd1073741824)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position10==35'd2147483648)
                             begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position10==35'd4294967296)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position10==35'd8589934592)
                              begin
                              sb_start_address10 = {3'd0,pmpaddr10_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position10==35'd17179869184)
                              begin
                              sb_start_address10 = {RANGE_WIDTH {1'b0}};
                              sb_end_address10 =  {3'd0,pmpaddr10_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address10 = {RANGE_WIDTH {1'b0}};
                              sb_end_address10 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid10==1)
    begin
   sb_start_address10 = {RANGE_WIDTH {1'b0}};
   sb_end_address10 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid10==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address10=35'd0;
           sb_end_address10=35'd0;
           end
 else
    if(pmpaddr10_o!=0)
    begin
     sb_start_address10 = {3'd0, pmpaddr9_r} + 35'd1;

     sb_end_address10 = {3'd0,pmpaddr10_o};
     end
     end
else if (s_na4_valid10==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address10=35'd0;
           sb_end_address10=35'd0;
           end
    else
    begin
     sb_start_address10 = {3'd0,pmpaddr10_o};
     sb_end_address10 = {3'd0,pmpaddr10_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address10 = {RANGE_WIDTH {1'b0}};
    sb_end_address10 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region10_range_exception=(sb_start_address10 > sb_end_address10) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr10_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position10), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address10), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address10), UVM_MEDIUM)


    //compare(.sb_data(sb_start_address10), .rtl_data(seq_item_inst.start_address10), .label("START_ADDRSS10"));
     //compare(.sb_data(sb_end_address10), .rtl_data(seq_item_inst.end_address10), .label("END_ADDRSS10"));
     compare(.sb_data(sb.region10_range_exception), .rtl_data(seq_item_inst.region10_range_exception), .label("Range_Execption10"));




casex(pmpaddr11_o)
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
s_off_valid11=(!pmpconfig2_o[28] && !pmpconfig2_o[27]) ? 1:0;
s_tor_valid11=(!pmpconfig2_o[28] && pmpconfig2_o[27]) ? 1:0;
s_na4_valid11=(pmpconfig2_o[28] && !pmpconfig2_o[27]) ? 1:0;
s_napot_valid11=(pmpconfig2_o[28] && pmpconfig2_o[27]) ? 1:0;
if (s_napot_valid11==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address11=35'd0;
           sb_end_address11=35'd0;
           end

   else

       begin
       
             if(zerobit_position11==35'd8)
                            begin
                              sb_start_address11 = {{3'd0},{pmpaddr11_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position11==35'd16)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position11==35'd32)
                             begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[33:3],3'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position11==35'd64)
                             begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position11==35'd128)
                             begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position11==35'd256)
                            begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position11==35'd512)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position11==35'd1024)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position11==35'd2048)
                             begin
                              sb_start_address11 ={3'd0,pmpaddr11_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position11==35'd4096)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position11==35'd8192)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position11==35'd16384)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position11==35'd32768)
                             begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position11==35'd65536)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position11==35'd131072)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position11==35'd262144)
                             begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position11==35'd524288)
                               begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position11==35'd1048576)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position11==35'd2097152)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position11==35'd4194304)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position11==35'd8388608)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position11==35'd16777216)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position11==35'd33554432)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position11==35'd67108864)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position11==35'd134217728)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position11==35'd268435456)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position11==35'd536870912)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position11==35'd1073741824)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position11==35'd2147483648)
                             begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position11==35'd4294967296)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position11==35'd8589934592)
                              begin
                              sb_start_address11 = {3'd0,pmpaddr11_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position11==35'd17179869184)
                              begin
                              sb_start_address11 = {RANGE_WIDTH {1'b0}};
                              sb_end_address11 =  {3'd0,pmpaddr11_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address11 = {RANGE_WIDTH {1'b0}};
                              sb_end_address11 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid11==1)
    begin
   sb_start_address11 = {RANGE_WIDTH {1'b0}};
   sb_end_address11 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid11==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address11=35'd0;
           sb_end_address11=35'd0;
           end
 else
    if(pmpaddr11_o!=0)
    begin
     sb_start_address11 = {3'd0, pmpaddr10_r} + 35'd1;

     sb_end_address11 = {3'd0,pmpaddr11_o};
     end
     end
else if (s_na4_valid11==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address11=35'd0;
           sb_end_address11=35'd0;
           end
    else
    begin
     sb_start_address11 = {3'd0,pmpaddr11_o};
     sb_end_address11 = {3'd0,pmpaddr11_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address11 = {RANGE_WIDTH {1'b0}};
    sb_end_address11 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region11_range_exception=(sb_start_address11 > sb_end_address11) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr11_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position11), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address11), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address11), UVM_MEDIUM)


    //compare(.sb_data(sb_start_address11), .rtl_data(seq_item_inst.start_address11), .label("START_ADDRSS11"));
     //compare(.sb_data(sb_end_address11), .rtl_data(seq_item_inst.end_address11), .label("END_ADDRSS11"));
     compare(.sb_data(sb.region11_range_exception), .rtl_data(seq_item_inst.region11_range_exception), .label("Range_Execption11"));





casex(pmpaddr12_o)
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
s_off_valid12=(!pmpconfig3_o[4] && !pmpconfig3_o[3]) ? 1:0;
s_tor_valid12=(!pmpconfig3_o[4] && pmpconfig3_o[3]) ? 1:0;
s_na4_valid12=(pmpconfig3_o[4] && !pmpconfig3_o[3]) ? 1:0;
s_napot_valid12=(pmpconfig3_o[4] && pmpconfig3_o[3]) ? 1:0;
if (s_napot_valid12==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address12=35'd0;
           sb_end_address12=35'd0;
           end

   else

       begin
       
             if(zerobit_position12==35'd8)
                            begin
                              sb_start_address12 = {{3'd0},{pmpaddr12_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position12==35'd16)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position12==35'd32)
                             begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[33:3],3'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position12==35'd64)
                             begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position12==35'd128)
                             begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position12==35'd256)
                            begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position12==35'd512)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position12==35'd1024)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position12==35'd2048)
                             begin
                              sb_start_address12 ={3'd0,pmpaddr12_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position12==35'd4096)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position12==35'd8192)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position12==35'd16384)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position12==35'd32768)
                             begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position12==35'd65536)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position12==35'd131072)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position12==35'd262144)
                             begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position12==35'd524288)
                               begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position12==35'd1048576)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position12==35'd2097152)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position12==35'd4194304)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position12==35'd8388608)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position12==35'd16777216)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position12==35'd33554432)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position12==35'd67108864)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position12==35'd134217728)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position12==35'd268435456)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position12==35'd536870912)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position12==35'd1073741824)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position12==35'd2147483648)
                             begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position12==35'd4294967296)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position12==35'd8589934592)
                              begin
                              sb_start_address12 = {3'd0,pmpaddr12_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position12==35'd17179869184)
                              begin
                              sb_start_address12 = {RANGE_WIDTH {1'b0}};
                              sb_end_address12 =  {3'd0,pmpaddr12_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address12 = {RANGE_WIDTH {1'b0}};
                              sb_end_address12 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid12==1)
    begin
   sb_start_address12 = {RANGE_WIDTH {1'b0}};
   sb_end_address12 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid12==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address12=35'd0;
           sb_end_address12=35'd0;
           end
 else
    begin
      if(pmpaddr12_o!=0)
     sb_start_address12 = {3'd0, pmpaddr11_r} + 35'd1;

     sb_end_address12 = {3'd0,pmpaddr12_o};
     end
     end
else if (s_na4_valid12==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address12=35'd0;
           sb_end_address12=35'd0;
           end
    else
    begin
     sb_start_address12 = {3'd0,pmpaddr12_o};
     sb_end_address12 = {3'd0,pmpaddr12_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address12 = {RANGE_WIDTH {1'b0}};
    sb_end_address12 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region12_range_exception=(sb_start_address12 > sb_end_address12) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr12_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position12), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address12), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address12), UVM_MEDIUM)


    //compare(.sb_data(sb_start_address12), .rtl_data(seq_item_inst.start_address12), .label("START_ADDRSS10"));
     //compare(.sb_data(sb_end_address12), .rtl_data(seq_item_inst.end_address12), .label("END_ADDRSS10"));
     compare(.sb_data(sb.region12_range_exception), .rtl_data(seq_item_inst.region12_range_exception), .label("Range_Execption12"));


casex(pmpaddr13_o)
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
s_off_valid13=(!pmpconfig3_o[12] && !pmpconfig3_o[11]) ? 1:0;
s_tor_valid13=(!pmpconfig3_o[12] && pmpconfig3_o[11]) ? 1:0;
s_na4_valid13=(pmpconfig3_o[12] && !pmpconfig3_o[11]) ? 1:0;
s_napot_valid13=(pmpconfig3_o[12] && pmpconfig3_o[11]) ? 1:0;


if (s_napot_valid13==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address13=35'd0;
           sb_end_address13=35'd0;
           end

   else

       begin
       
             if(zerobit_position13==35'd8)
                            begin
                              sb_start_address13 = {{3'd0},{pmpaddr13_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position13==35'd16)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position13==35'd32)
                             begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[33:3],3'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position13==35'd64)
                             begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position13==35'd128)
                             begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position13==35'd256)
                            begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position13==35'd512)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position13==35'd1024)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position13==35'd2048)
                             begin
                              sb_start_address13 ={3'd0,pmpaddr13_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position13==35'd4096)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position13==35'd8192)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position13==35'd16384)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position13==35'd32768)
                             begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position13==35'd65536)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position13==35'd131072)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position13==35'd262144)
                             begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position13==35'd524288)
                               begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position13==35'd1048576)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position13==35'd2097152)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position13==35'd4194304)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position13==35'd8388608)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position13==35'd16777216)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position13==35'd33554432)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position13==35'd67108864)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position13==35'd134217728)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position13==35'd268435456)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position13==35'd536870912)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position13==35'd1073741824)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position13==35'd2147483648)
                             begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position13==35'd4294967296)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position13==35'd8589934592)
                              begin
                              sb_start_address13 = {3'd0,pmpaddr13_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position13==35'd17179869184)
                              begin
                              sb_start_address13 = {RANGE_WIDTH {1'b0}};
                              sb_end_address13 =  {3'd0,pmpaddr13_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address13 = {RANGE_WIDTH {1'b0}};
                              sb_end_address13 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid13==1)
    begin
   sb_start_address13 = {RANGE_WIDTH {1'b0}};
   sb_end_address13 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid13==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address13=35'd0;
           sb_end_address13=35'd0;
           end
 else
    if(pmpaddr13_o!=0)
    begin
     sb_start_address13 = {3'd0, pmpaddr12_r} + 35'd1;

     sb_end_address13 = {3'd0,pmpaddr13_o};
     end
     end
else if (s_na4_valid13==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address13=35'd0;
           sb_end_address13=35'd0;
           end
    else
    begin
     sb_start_address13 = {3'd0,pmpaddr13_o};
     sb_end_address13 = {3'd0,pmpaddr13_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address13 = {RANGE_WIDTH {1'b0}};
    sb_end_address13 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region13_range_exception=(sb_start_address13 > sb_end_address13) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr13_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position13), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address13), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address13), UVM_MEDIUM)


   // compare(.sb_data(sb_start_address13), .rtl_data(seq_item_inst.start_address13), .label("START_ADDRSS13"));
    // compare(.sb_data(sb_end_address13), .rtl_data(seq_item_inst.end_address13), .label("END_ADDRSS13"));
     compare(.sb_data(sb.region13_range_exception), .rtl_data(seq_item_inst.region13_range_exception), .label("Range_Execption13"));



casex(pmpaddr14_o)
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
s_off_valid14=(!pmpconfig3_o[20] && !pmpconfig3_o[19]) ? 1:0;
s_tor_valid14=(!pmpconfig3_o[20] && pmpconfig3_o[19]) ? 1:0;
s_na4_valid14=(pmpconfig3_o[20] && !pmpconfig3_o[19]) ? 1:0;
s_napot_valid14=(pmpconfig3_o[20] && pmpconfig3_o[19]) ? 1:0;

if (s_napot_valid14==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address14=35'd0;
           sb_end_address14=35'd0;
           end

   else

       begin
       
             if(zerobit_position14==35'd8)
                            begin
                              sb_start_address14 = {{3'd0},{pmpaddr14_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position14==35'd16)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position14==35'd32)
                             begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[33:3],3'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position14==35'd64)
                             begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position14==35'd128)
                             begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position14==35'd256)
                            begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position14==35'd512)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position14==35'd1024)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position14==35'd2048)
                             begin
                              sb_start_address14 ={3'd0,pmpaddr14_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position14==35'd4096)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position14==35'd8192)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position14==35'd16384)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position14==35'd32768)
                             begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position14==35'd65536)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position14==35'd131072)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position14==35'd262144)
                             begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position14==35'd524288)
                               begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position14==35'd1048576)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position14==35'd2097152)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position14==35'd4194304)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position14==35'd8388608)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position14==35'd16777216)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position14==35'd33554432)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position14==35'd67108864)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position14==35'd134217728)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position14==35'd268435456)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position14==35'd536870912)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position14==35'd1073741824)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position14==35'd2147483648)
                             begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position14==35'd4294967296)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position14==35'd8589934592)
                              begin
                              sb_start_address14 = {3'd0,pmpaddr14_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position14==35'd17179869184)
                              begin
                              sb_start_address14 = {RANGE_WIDTH {1'b0}};
                              sb_end_address14 =  {3'd0,pmpaddr14_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address14 = {RANGE_WIDTH {1'b0}};
                              sb_end_address14 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid14==1)
    begin
   sb_start_address14 = {RANGE_WIDTH {1'b0}};
   sb_end_address14 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid14==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address14=35'd0;
           sb_end_address14=35'd0;
           end
 else
    if(pmpaddr14_o!=0)
    begin
     sb_start_address14 = {3'd0, pmpaddr13_r} + 35'd1;

     sb_end_address14 = {3'd0,pmpaddr14_o};
     end
     end
else if (s_na4_valid14==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address14=35'd0;
           sb_end_address14=35'd0;
           end
    else
    begin
     sb_start_address14 = {3'd0,pmpaddr14_o};
     sb_end_address14 = {3'd0,pmpaddr14_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address14 = {RANGE_WIDTH {1'b0}};
    sb_end_address14 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region14_range_exception=(sb_start_address14 > sb_end_address14) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr14_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position14), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address14), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address14), UVM_MEDIUM)


   // compare(.sb_data(sb_start_address14), .rtl_data(seq_item_inst.start_address14), .label("START_ADDRSS14"));
    // compare(.sb_data(sb_end_address14), .rtl_data(seq_item_inst.end_address14), .label("END_ADDRSS14"));
     compare(.sb_data(sb.region14_range_exception), .rtl_data(seq_item_inst.region14_range_exception), .label("Range_Execption14"));



casex(pmpaddr15_o)
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

s_off_valid15=(!pmpconfig3_o[28] && !pmpconfig3_o[27]) ? 1:0;
s_tor_valid15=(!pmpconfig3_o[28] && pmpconfig3_o[27]) ? 1:0;
s_na4_valid15=(pmpconfig3_o[28] && !pmpconfig3_o[27]) ? 1:0;
s_napot_valid15=(pmpconfig3_o[28] && pmpconfig3_o[27]) ? 1:0;

if (s_napot_valid15==1)
       begin
        if(!seq_item_inst.csr_rst)
           begin
           sb_start_address15=35'd0;
           sb_end_address15=35'd0;
           end

   else

       begin
       
             if(zerobit_position15==35'd8)
                            begin
                              sb_start_address15 = {{3'd0},{pmpaddr15_o[PMP_WIDTH-1:1]},1'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:1],1'd0} +  35'd8;
                              end 
             else if(zerobit_position15==35'd16)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:2],2'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:2],2'd0} +   35'd16 ;
                              end    
            else if(zerobit_position15==35'd32)
                             begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[33:3],3'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:3],3'd0} +   35'd32 ;
                              end
             else if(zerobit_position15==35'd64)
                             begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:4],4'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:4],4'd0} +   35'd64 ;
                              end
             else if(zerobit_position15==35'd128)
                             begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:5],5'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:5],5'd0} +  35'd128;
                              end 
             else if(zerobit_position15==35'd256)
                            begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:6],6'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:6],6'd0} +  35'd256;
                              end 
              else if(zerobit_position15==35'd512)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:7],7'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:7],7'd0} +  35'd512;
                              end  
               else if(zerobit_position15==35'd1024)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:8],8'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:8],8'd0} +   35'd1024 ;
                              end 
               else if(zerobit_position15==35'd2048)
                             begin
                              sb_start_address15 ={3'd0,pmpaddr15_o[PMP_WIDTH-1:9],9'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:9],9'd0} +   35'd2048 ;
                              end
                else if(zerobit_position15==35'd4096)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:10],10'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:10],10'd0} +   35'd4096;
                              end  
                else if(zerobit_position15==35'd8192)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:11],11'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:11],11'd0} +  35'd8192 ;
                              end
                 else if(zerobit_position15==35'd16384)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:12],12'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:12],12'd0} +  35'd16384;
                              end
                  else if(zerobit_position15==35'd32768)
                             begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:13],13'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:13],13'd0} +   35'd32768;
                              end 
                    else if(zerobit_position15==35'd65536)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:14],14'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:14],14'd0} +  35'd65536;
                              end      
                    else if(zerobit_position15==35'd131072)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:15],15'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:15],15'd0} +  35'd131072;
                              end     
                   else if(zerobit_position15==35'd262144)
                             begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:16],16'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:16],16'd0} +  35'd262144;
                              end
                    else if(zerobit_position15==35'd524288)
                               begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:17],17'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:17],17'd0} +  35'd524288;
                              end
                    else if(zerobit_position15==35'd1048576)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:18],18'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:18],18'd0} +  35'd1048576;
                              end    
                    else if(zerobit_position15==35'd2097152)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:19],19'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:19],19'd0} +  35'd2097152;
                              end
                    else if(zerobit_position15==35'd4194304)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:20],20'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:20],20'd0} +  35'd4194304;
                              end 
                   else if(zerobit_position15==35'd8388608)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:21],21'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:21],21'd0} +  35'd8388608;
                              end
                    else if(zerobit_position15==35'd16777216)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:22],22'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:22],22'd0} +  35'd16777216;
                              end  
                     else if(zerobit_position15==35'd33554432)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:23],23'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:23],23'd0} +  35'd33554432;
                              end 
                     else if(zerobit_position15==35'd67108864)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:24],24'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:24],24'd0} +  35'd67108864;
                              end  
                     else if(zerobit_position15==35'd134217728)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:25],25'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:25],25'd0} +  35'd134217728;
                              end 
                     else if(zerobit_position15==35'd268435456)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:26],26'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:26],26'd0} + 35'd268435456;
                              end 
                    else if(zerobit_position15==35'd536870912)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:27],27'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:27],27'd0} +  35'd536870912;
                              end  
                    else if(zerobit_position15==35'd1073741824)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:28],28'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:28],28'd0} +   35'd1073741824;
                              end    
                    else if(zerobit_position15==35'd2147483648)
                             begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:29],29'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:29],29'd0} +  35'd2147483648;
                              end  
                    else if(zerobit_position15==35'd4294967296)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:30],30'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:30],30'd0} +  35'd4294967296;
                              end  
                    else if(zerobit_position15==35'd8589934592)
                              begin
                              sb_start_address15 = {3'd0,pmpaddr15_o[PMP_WIDTH-1:31],31'd0};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1:31],31'd0} +  35'd8589934592;
                              end
                    else if(zerobit_position15==35'd17179869184)
                              begin
                              sb_start_address15 = {RANGE_WIDTH {1'b0}};
                              sb_end_address15 =  {3'd0,pmpaddr15_o[PMP_WIDTH-1],32'd0} +   35'd17179869184;
                              end
                              else
                             begin
                              sb_start_address15 = {RANGE_WIDTH {1'b0}};
                              sb_end_address15 = {RANGE_WIDTH {1'b0}};
                             end
                                          //end of inner case

                
             end
             end
             


else if(s_off_valid15==1)
    begin
   sb_start_address15 = {RANGE_WIDTH {1'b0}};
   sb_end_address15 = {RANGE_WIDTH {1'b0}};
   end
else if (s_tor_valid15==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address15=35'd0;
           sb_end_address15=35'd0;
           end
 else
      if(pmpaddr15_o!=0)
    begin
     sb_start_address15 = {3'd0, pmpaddr14_r} +35'd1;

     sb_end_address15 = {3'd0,pmpaddr15_o};
     end
     end
else if (s_na4_valid15==1)
    begin
     if(seq_item_inst.csr_rst==0)
           begin
           sb_start_address15=35'd0;
           sb_end_address15=35'd0;
           end
    else
    begin
     sb_start_address15 = {3'd0,pmpaddr15_o};
     sb_end_address15 = {3'd0,pmpaddr15_o} + 35'd4;
    end
end
    else
    begin
    sb_start_address15 = {RANGE_WIDTH {1'b0}};
    sb_end_address15 = {RANGE_WIDTH {1'b0}};

end
  


  sb.region15_range_exception=(sb_start_address15 > sb_end_address15) ? 1:0;

`uvm_info("PMp Addr0*****",$sformatf("start0_o : %0h", pmpaddr15_o), UVM_MEDIUM)

  `uvm_info("PMp Addr0*****",$sformatf("zero : %0h", zerobit_position15), UVM_MEDIUM)

  `uvm_info("Start*****",$sformatf("start0_o : %0h", sb_start_address15), UVM_MEDIUM)
`uvm_info("END_o*****",$sformatf("end0_o : %0h", sb_end_address15), UVM_MEDIUM)


   // compare(.sb_data(sb_start_address15), .rtl_data(seq_item_inst.start_address15), .label("START_ADDRSS15"));
   //  compare(.sb_data(sb_end_address15), .rtl_data(seq_item_inst.end_address15), .label("END_ADDRSS15"));
     compare(.sb_data(sb.region15_range_exception), .rtl_data(seq_item_inst.region15_range_exception), .label("Range_Execption15"));
                               




if(sb_end_address0 !=0)
    begin
  non_zero_region0_s=1'b1;
  end
  else
      begin
      non_zero_region0_s=1'b0;
      end
if( (sb_start_address1!=0) && (sb_end_address1!=0)) 
      begin
  non_zero_region1_s=1'b1;
  end
  else
      begin
      non_zero_region1_s=1'b0;
      end
if( (sb_start_address2!=0) && (sb_end_address2!=0)) 
      begin
  non_zero_region2_s=1'b1;
  end
  else
      begin
      non_zero_region2_s=1'b0;
      end

if( (sb_start_address3!=0) && (sb_end_address3!=0)) 
      begin
  non_zero_region3_s=1'b1;
  end
  else
      begin
      non_zero_region3_s=1'b0;
      end

if( (sb_start_address4!=0) && (sb_end_address4!=0)) 
      begin
  non_zero_region4_s=1'b1;
  end
  else
      begin
      non_zero_region4_s=1'b0;
      end

if( (sb_start_address5!=0) && (sb_end_address5!=0)) 
      begin
  non_zero_region5_s=1'b1;
  end
  else
      begin
      non_zero_region5_s=1'b0;
      end

if( (sb_start_address6!=0) && (sb_end_address6!=0)) 
      begin
  non_zero_region6_s=1'b1;
  end
  else
      begin
      non_zero_region6_s=1'b0;
      end

if( (sb_start_address7!=0) && (sb_end_address7!=0)) 
      begin
  non_zero_region7_s=1'b1;
  end
  else
      begin
      non_zero_region7_s=1'b0;
      end

if( (sb_start_address8!=0) && (sb_end_address8!=0)) 
      begin
  non_zero_region8_s=1'b1;
  end
  else
      begin
      non_zero_region8_s=1'b0;
      end

if( (sb_start_address9!=0) && (sb_end_address9!=0)) 
      begin
  non_zero_region9_s=1'b1;
  end
  else
      begin
      non_zero_region9_s=1'b0;
      end

if( (sb_start_address10!=0) && (sb_end_address10!=0)) 
      begin
  non_zero_region10_s=1'b1;
  end
  else
      begin
      non_zero_region10_s=1'b0;
      end

if( (sb_start_address11!=0) && (sb_end_address11!=0)) 
      begin
  non_zero_region11_s=1'b1;
  end
  else
      begin
      non_zero_region11_s=1'b0;
      end

if( (sb_start_address12!=0) && (sb_end_address12!=0)) 
      begin
  non_zero_region12_s=1'b1;
  end
  else
      begin
      non_zero_region12_s=1'b0;
      end

if( (sb_start_address13!=0) && (sb_end_address13!=0)) 
      begin
  non_zero_region13_s=1'b1;
  end
  else
      begin
      non_zero_region13_s=1'b0;
      end

if( (sb_start_address14!=0) && (sb_end_address14!=0)) 
      begin
  non_zero_region14_s=1'b1;
  end
  else
      begin
      non_zero_region14_s=1'b0;
      end

if( (sb_start_address15!=0) && (sb_end_address15!=0)) 
      begin
  non_zero_region15_s=1'b1;
  end
  else
      begin
      non_zero_region15_s=1'b0;
      end






`uvm_info("ZR0*****",$sformatf("start0_o : %0h", non_zero_region0_s), UVM_MEDIUM)
`uvm_info("ZR1*****",$sformatf("end0_o : %0h", non_zero_region1_s), UVM_MEDIUM)

`uvm_info("ZR2*****",$sformatf("start0_o : %0h", non_zero_region2_s), UVM_MEDIUM)
`uvm_info("ZR3*****",$sformatf("end0_o : %0h", non_zero_region3_s), UVM_MEDIUM)
`uvm_info("ZR4*****",$sformatf("start0_o : %0h", non_zero_region4_s), UVM_MEDIUM)
`uvm_info("ZR5*****",$sformatf("end0_o : %0h", non_zero_region5_s), UVM_MEDIUM)
`uvm_info("ZR6*****",$sformatf("start0_o : %0h", non_zero_region6_s), UVM_MEDIUM)
`uvm_info("ZR7*****",$sformatf("end0_o : %0h", non_zero_region7_s), UVM_MEDIUM)
`uvm_info("ZR8*****",$sformatf("start0_o : %0h", non_zero_region8_s), UVM_MEDIUM)
`uvm_info("ZR9*****",$sformatf("end0_o : %0h", non_zero_region9_s), UVM_MEDIUM)
`uvm_info("ZR10*****",$sformatf("start0_o : %0h", non_zero_region10_s), UVM_MEDIUM)
`uvm_info("ZR11*****",$sformatf("end0_o : %0h", non_zero_region11_s), UVM_MEDIUM)

`uvm_info("ZR12*****",$sformatf("start0_o : %0h", non_zero_region12_s), UVM_MEDIUM)
`uvm_info("ZR13*****",$sformatf("end0_o : %0h", non_zero_region13_s), UVM_MEDIUM)

`uvm_info("ZR14*****",$sformatf("start0_o : %0h", non_zero_region14_s), UVM_MEDIUM)
`uvm_info("ZR15*****",$sformatf("end0_o : %0h", non_zero_region15_s), UVM_MEDIUM)




//overwrite calculation

if((sb_start_address1 <= sb_start_address0  && sb_start_address0 <= sb_end_address1 ) || 
      (sb_start_address2 <= sb_start_address0  && sb_start_address0 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address0  && sb_start_address0 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address0  && sb_start_address0 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address0  && sb_start_address0 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address0  && sb_start_address0 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address0  && sb_start_address0 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address0  && sb_start_address0 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address0  && sb_start_address0 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address0 &&  sb_start_address0 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address0 &&  sb_start_address0 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address0 &&  sb_start_address0 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address0 &&  sb_start_address0 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address0 &&  sb_start_address0 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address0 &&  sb_start_address0 <= sb_end_address15) ||
       (sb_start_address1 <= sb_end_address0  && sb_end_address0 <= sb_end_address1 ) || 
      (sb_start_address2 <= sb_end_address0  && sb_end_address0 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address0  && sb_end_address0 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address0  && sb_end_address0 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address0  && sb_end_address0 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address0  && sb_end_address0 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address0  && sb_end_address0 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address0  && sb_end_address0 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_end_address0  && sb_end_address0 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address0 &&  sb_end_address0 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address0 &&  sb_end_address0 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address0 &&  sb_end_address0 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address0 &&  sb_end_address0 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address0 &&  sb_end_address0 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address0 &&  sb_end_address0 <= sb_end_address15))

begin
overlapping_region0_s=1'b1;
end
else
    begin
    overlapping_region0_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address1  && sb_start_address1 <= sb_end_address0 ) || 
      (sb_start_address2 <= sb_start_address1  && sb_start_address1 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address1  && sb_start_address1 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address1  && sb_start_address1 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address1  && sb_start_address1 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address1  && sb_start_address1 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address1  && sb_start_address1 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address1  && sb_start_address1 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address1  && sb_start_address1 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address1 &&  sb_start_address1 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address1 &&  sb_start_address1 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address1 &&  sb_start_address1 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address1 &&  sb_start_address1 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address1 &&  sb_start_address1 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address1 &&  sb_start_address1 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address1  && sb_end_address1 <= sb_end_address0 ) || 
      (sb_start_address2 <= sb_end_address1  && sb_end_address1 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address1  && sb_end_address1 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address1  && sb_end_address1 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address1  && sb_end_address1 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address1  && sb_end_address1 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address1  && sb_end_address1 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address1  && sb_end_address1 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_end_address1  && sb_end_address1 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address1 &&  sb_end_address1 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address1 &&  sb_end_address1 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address1 &&  sb_end_address1 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address1 &&  sb_end_address1 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address1 &&  sb_end_address1 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address1 &&  sb_end_address1 <= sb_end_address15))

begin
overlapping_region1_s=1'b1;
end
else
    begin
    overlapping_region1_s=1'b0;
    end


if((sb_start_address0 <= sb_start_address2  && sb_start_address2 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address2  && sb_start_address2 <= sb_end_address1 ) ||
      (sb_start_address3 <= sb_start_address2  && sb_start_address2 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address2  && sb_start_address2 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address2  && sb_start_address2 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address2  && sb_start_address2 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address2  && sb_start_address2 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address2  && sb_start_address2 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address2  && sb_start_address2 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address2 &&  sb_start_address2 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address2 &&  sb_start_address2 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address2 &&  sb_start_address2 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address2 &&  sb_start_address2 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address2 &&  sb_start_address2 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address2 &&  sb_start_address2 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address2  && sb_end_address2 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address2  && sb_end_address2 <= sb_end_address1 ) ||
      (sb_start_address3 <= sb_end_address2  && sb_end_address2 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address2  && sb_end_address2 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address2  && sb_end_address2 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address2  && sb_end_address2 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address2  && sb_end_address2 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address2  && sb_end_address2 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_end_address2  && sb_end_address2 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address2 &&  sb_end_address2 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address2 &&  sb_end_address2 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address2 &&  sb_end_address2 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address2 &&  sb_end_address2 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address2 &&  sb_end_address2 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address2 &&  sb_end_address2 <= sb_end_address15))

begin
overlapping_region2_s=1'b1;
end
else
    begin
    overlapping_region2_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address3  && sb_start_address3 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address3  && sb_start_address3 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address3  && sb_start_address3 <= sb_end_address2 ) ||
      (sb_start_address4 <= sb_start_address3  && sb_start_address3 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address3  && sb_start_address3 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address3  && sb_start_address3 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address3  && sb_start_address3 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address3  && sb_start_address3 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address3  && sb_start_address3 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address3 &&  sb_start_address3 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address3 &&  sb_start_address3 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address3 &&  sb_start_address3 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address3 &&  sb_start_address3 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address3 &&  sb_start_address3 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address3 &&  sb_start_address3 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address3  && sb_end_address3 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address3  && sb_end_address3 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address3  && sb_end_address3 <= sb_end_address2 ) ||
      (sb_start_address4 <= sb_end_address3  && sb_end_address3 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address3  && sb_end_address3 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address3  && sb_end_address3 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address3  && sb_end_address3 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address3  && sb_end_address3 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_end_address3  && sb_end_address3 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address3 &&  sb_end_address3 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address3 &&  sb_end_address3 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address3 &&  sb_end_address3 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address3 &&  sb_end_address3 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address3 &&  sb_end_address3 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address3 &&  sb_end_address3 <= sb_end_address15))

begin
overlapping_region3_s=1'b1;
end
else
    begin
    overlapping_region3_s=1'b0;
    end

`uvm_info("over0*****",$sformatf("over0_o : %0h", overlapping_region0_s), UVM_MEDIUM)
`uvm_info("over1*****",$sformatf("over1_o : %0h", overlapping_region1_s), UVM_MEDIUM)

`uvm_info("over2*****",$sformatf("over2_o : %0h", overlapping_region2_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over3_o : %0h", overlapping_region3_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over4_o : %0h", overlapping_region4_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over5_o : %0h", overlapping_region5_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over6_o : %0h", overlapping_region6_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over7_o : %0h", overlapping_region7_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over8_o : %0h", overlapping_region8_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over9_o : %0h", overlapping_region9_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over10_o : %0h", overlapping_region10_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over11_o : %0h", overlapping_region11_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over12_o : %0h", overlapping_region12_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over13_o : %0h", overlapping_region13_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over14_o : %0h", overlapping_region14_s), UVM_MEDIUM)
`uvm_info("over3*****",$sformatf("over15_o : %0h", overlapping_region15_s), UVM_MEDIUM)




if((sb_start_address0 <= sb_start_address4 && sb_start_address4 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address4  && sb_start_address4 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address4  && sb_start_address4 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address4  && sb_start_address4 <= sb_end_address3 ) ||
      (sb_start_address5 <= sb_start_address4  && sb_start_address4 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address4  && sb_start_address4 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address4  && sb_start_address4 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address4  && sb_start_address4 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address4  && sb_start_address4 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address4 &&  sb_start_address4 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address4 &&  sb_start_address4 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address4 &&  sb_start_address4 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address4 &&  sb_start_address4 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address4 &&  sb_start_address4 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address4 &&  sb_start_address4 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address4  && sb_end_address4 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address4  && sb_end_address4 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address4  && sb_end_address4 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address4  && sb_end_address4 <= sb_end_address3 ) ||
      (sb_start_address5 <= sb_end_address4  && sb_end_address4 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address4  && sb_end_address4 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address4  && sb_end_address4 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address4  && sb_end_address4 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_end_address4  && sb_end_address4 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address4 &&  sb_end_address4 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address4 &&  sb_end_address4 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address4 &&  sb_end_address4 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address4 &&  sb_end_address4 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address4 &&  sb_end_address4 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address4 &&  sb_end_address4 <= sb_end_address15))

begin
overlapping_region4_s=1'b1;
end
else
    begin
    overlapping_region4_s=1'b0;
    end


if((sb_start_address0 <= sb_start_address5  && sb_start_address5 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address5  && sb_start_address5 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address5  && sb_start_address5 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address5  && sb_start_address5 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address5  && sb_start_address5 <= sb_end_address4 ) ||
      (sb_start_address6 <= sb_start_address5 && sb_start_address5 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address5  && sb_start_address5 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address5  && sb_start_address5 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address5  && sb_start_address5 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address5 &&  sb_start_address5 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address5 &&  sb_start_address5 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address5 &&  sb_start_address5 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address5 &&  sb_start_address5 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address5 &&  sb_start_address5 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address5 &&  sb_start_address5 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address5  && sb_end_address5 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address5  && sb_end_address5 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address5  && sb_end_address5 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address5  && sb_end_address5 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address5  && sb_end_address5 <= sb_end_address4 ) ||
      (sb_start_address6 <= sb_end_address5  && sb_end_address5 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address5  && sb_end_address5 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address5  && sb_end_address5 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_end_address5  && sb_end_address5 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address5 &&  sb_end_address5 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address5 &&  sb_end_address5 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address5 &&  sb_end_address5 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address5 &&  sb_end_address5 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address5 &&  sb_end_address5 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address5 &&  sb_end_address5 <= sb_end_address15))

begin
overlapping_region5_s=1'b1;
end
else
    begin
    overlapping_region5_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address6  && sb_start_address6 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address6  && sb_start_address6 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address6  && sb_start_address6 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address6  && sb_start_address6 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address6  && sb_start_address6 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address6  && sb_start_address6 <= sb_end_address5 ) ||
      (sb_start_address7 <= sb_start_address6  && sb_start_address6 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address6  && sb_start_address6 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address6  && sb_start_address6 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address6 &&  sb_start_address6 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address6 &&  sb_start_address6 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address6 &&  sb_start_address6 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address6 &&  sb_start_address6 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address6 &&  sb_start_address6 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address6 &&  sb_start_address6 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address6  && sb_end_address6 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address6  && sb_end_address6 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address6  && sb_end_address6 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address6  && sb_end_address6 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address6  && sb_end_address6 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address6  && sb_end_address6 <= sb_end_address5 ) ||
      (sb_start_address7 <= sb_end_address6  && sb_end_address6 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address6  && sb_end_address6 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_end_address6  && sb_end_address6 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address6 &&  sb_end_address6 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address6 &&  sb_end_address6 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address6 &&  sb_end_address6 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address6 &&  sb_end_address6 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address6 &&  sb_end_address6 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address6 &&  sb_end_address6 <= sb_end_address15))

begin
overlapping_region6_s=1'b1;
end
else
    begin
    overlapping_region6_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address7  && sb_start_address7 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address7  && sb_start_address7 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address7  && sb_start_address7 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address7  && sb_start_address7 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address7  && sb_start_address7 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address7  && sb_start_address7 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address7  && sb_start_address7 <= sb_end_address6 ) ||
      (sb_start_address8 <= sb_start_address7  && sb_start_address7 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address7  && sb_start_address7 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address7 &&  sb_start_address7 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address7 &&  sb_start_address7 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address7 &&  sb_start_address7 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address7 &&  sb_start_address7 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address7 &&  sb_start_address7 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address7 &&  sb_start_address7 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address7  && sb_end_address7 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address7  && sb_end_address7 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address7  && sb_end_address7 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address7  && sb_end_address7 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address7  && sb_end_address7 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address7  && sb_end_address7 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address7  && sb_end_address7 <= sb_end_address6 ) ||
      (sb_start_address8 <= sb_end_address7  && sb_end_address7 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_end_address7  && sb_end_address7 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address7 &&  sb_end_address7 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address7 &&  sb_end_address7 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address7 &&  sb_end_address7 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address7 &&  sb_end_address7 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address7 &&  sb_end_address7 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address7 &&  sb_end_address7 <= sb_end_address15))

begin
overlapping_region7_s=1'b1;
end
else
    begin
    overlapping_region7_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address8  && sb_start_address8 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address8  && sb_start_address8 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address8  && sb_start_address8 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address8  && sb_start_address8 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address8  && sb_start_address8 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address8  && sb_start_address8 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address8  && sb_start_address8 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address8  && sb_start_address8 <= sb_end_address7 ) ||
      (sb_start_address9 <= sb_start_address8  && sb_start_address8 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_start_address8 &&  sb_start_address8 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address8 &&  sb_start_address8 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address8 &&  sb_start_address8 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address8 &&  sb_start_address8 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address8 &&  sb_start_address8 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address8 &&  sb_start_address8 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address8  && sb_end_address8 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address8  && sb_end_address8 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address8  && sb_end_address8 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address8  && sb_end_address8 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address8  && sb_end_address8 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address8  && sb_end_address8 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address8  && sb_end_address8 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address8  && sb_end_address8 <= sb_end_address7 ) ||
      (sb_start_address9 <= sb_end_address8  && sb_end_address8 <= sb_end_address9 ) ||
      (sb_start_address10<= sb_end_address8 &&  sb_end_address8 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address8 &&  sb_end_address8 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address8 &&  sb_end_address8 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address8 &&  sb_end_address8 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address8 &&  sb_end_address8 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address8 &&  sb_end_address8 <= sb_end_address15))

begin
overlapping_region8_s=1'b1;
end
else
    begin
    overlapping_region8_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address9  && sb_start_address9 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address9  && sb_start_address9 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address9  && sb_start_address9 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address9  && sb_start_address9 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address9  && sb_start_address9 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address9  && sb_start_address9 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address9  && sb_start_address9 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address9  && sb_start_address9 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address9  && sb_start_address9 <= sb_end_address8 ) ||
      (sb_start_address10<= sb_start_address9 &&  sb_start_address9 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address9 &&  sb_start_address9 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address9 &&  sb_start_address9 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address9 &&  sb_start_address9 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address9 &&  sb_start_address9 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address9 &&  sb_start_address9 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address9  && sb_end_address9 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address9  && sb_end_address9<= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address9  && sb_end_address9 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address9  && sb_end_address9 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address9  && sb_end_address9 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address9  && sb_end_address9 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address9  && sb_end_address9 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address9  && sb_end_address9 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address9  && sb_end_address9 <= sb_end_address8 ) ||
      (sb_start_address10<= sb_end_address9 &&  sb_end_address9 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address9 &&  sb_end_address9 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address9 &&  sb_end_address9 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address9 &&  sb_end_address9 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address9 &&  sb_end_address9 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address9 &&  sb_end_address9 <= sb_end_address15))

begin
overlapping_region9_s=1'b1;
end
else
    begin
    overlapping_region9_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address10  && sb_start_address10 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address10  && sb_start_address10 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address10  && sb_start_address10 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address10  && sb_start_address10 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address10  && sb_start_address10 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address10  && sb_start_address10 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address10  && sb_start_address10 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address10  && sb_start_address10 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address10  && sb_start_address10 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_start_address10 &&  sb_start_address10 <= sb_end_address9) ||
      (sb_start_address11<= sb_start_address10 &&  sb_start_address10 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address10 &&  sb_start_address10 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address10 &&  sb_start_address10 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address10 &&  sb_start_address10 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address10 &&  sb_start_address10 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address10  && sb_end_address10 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address10  && sb_end_address10 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address10 && sb_end_address10 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address10  && sb_end_address10 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address10  && sb_end_address10 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address10  && sb_end_address10 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address10  && sb_end_address10 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address10  && sb_end_address10 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address10  && sb_end_address10 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_end_address10 &&  sb_end_address10 <= sb_end_address9) ||
      (sb_start_address11<= sb_end_address10 &&  sb_end_address10 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address10 &&  sb_end_address10 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address10 &&  sb_end_address10 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address10 &&  sb_end_address10 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address10 &&  sb_end_address10 <= sb_end_address15))

begin
overlapping_region10_s=1'b1;
end
else
    begin
    overlapping_region10_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address11  && sb_start_address11 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address11  && sb_start_address11 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address11  && sb_start_address11 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address11  && sb_start_address11 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address11  && sb_start_address11 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address11  && sb_start_address11 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address11  && sb_start_address11 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address11 && sb_start_address11 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address11  && sb_start_address11 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_start_address11 &&  sb_start_address11 <= sb_end_address9) ||
      (sb_start_address10<= sb_start_address11 &&  sb_start_address11 <= sb_end_address10) ||
      (sb_start_address12<= sb_start_address11 &&  sb_start_address11 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address11 &&  sb_start_address11 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address11 &&  sb_start_address11 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address11 &&  sb_start_address11 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address11  && sb_end_address11 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address11  && sb_end_address11 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address11  && sb_end_address11 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address11  && sb_end_address11 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address11  && sb_end_address11 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address11  && sb_end_address11 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address11  && sb_end_address11 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address11  && sb_end_address11 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address11  && sb_end_address11 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_end_address11 &&  sb_end_address11 <= sb_end_address9) ||
      (sb_start_address10<= sb_end_address11 &&  sb_end_address11 <= sb_end_address10) ||
      (sb_start_address12<= sb_end_address11 &&  sb_end_address11 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address11 &&  sb_end_address11 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address11 &&  sb_end_address11 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address11 &&  sb_end_address11 <= sb_end_address15))

begin
overlapping_region11_s=1'b1;
end
else
    begin
    overlapping_region11_s=1'b0;
    end


if((sb_start_address0 <= sb_start_address12  && sb_start_address12 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address12  && sb_start_address12 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address12  && sb_start_address12 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address12  && sb_start_address12 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address12  && sb_start_address12 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address12  && sb_start_address12 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address12  && sb_start_address12 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address12  && sb_start_address12 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address12  && sb_start_address12 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address12 &&  sb_start_address12 <= sb_end_address9) ||
      (sb_start_address10 <= sb_start_address12 &&  sb_start_address12 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address12 &&  sb_start_address12 <= sb_end_address11) ||
      (sb_start_address13<= sb_start_address12 &&  sb_start_address12 <= sb_end_address13) ||
      (sb_start_address14<= sb_start_address12 &&  sb_start_address12 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address12 &&  sb_start_address12 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address12  && sb_end_address12 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address12  && sb_end_address12 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address12  && sb_end_address12 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address12  && sb_end_address12 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address12  && sb_end_address12 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address12  && sb_end_address12 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address12  && sb_end_address12 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address12  && sb_end_address12 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address12  && sb_end_address12 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_end_address12 &&  sb_end_address12 <= sb_end_address9) ||
      (sb_start_address10<= sb_end_address12 &&  sb_end_address12 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address12 &&  sb_end_address12 <= sb_end_address11) ||
      (sb_start_address13<= sb_end_address12 &&  sb_end_address12 <= sb_end_address13) ||
      (sb_start_address14<= sb_end_address12 &&  sb_end_address12 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address12 &&  sb_end_address12 <= sb_end_address15))

begin
overlapping_region12_s=1'b1;
end
else
    begin
    overlapping_region12_s=1'b0;
    end
if((sb_start_address0 <= sb_start_address13  && sb_start_address13 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address13  && sb_start_address13 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address13  && sb_start_address13 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address13  && sb_start_address13 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address13  && sb_start_address13 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address13  && sb_start_address13 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address13  && sb_start_address13 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address13  && sb_start_address13 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address13  && sb_start_address13 <= sb_end_address8 ) ||
      (sb_start_address9 <= sb_start_address13 &&  sb_start_address13 <= sb_end_address9) ||
      (sb_start_address10<= sb_start_address13 &&  sb_start_address13 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address13 &&  sb_start_address13 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address13 &&  sb_start_address13 <= sb_end_address12) ||
      (sb_start_address14<= sb_start_address13 &&  sb_start_address13 <= sb_end_address14) ||
       (sb_start_address15<= sb_start_address13 &&  sb_start_address13 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address13  && sb_end_address13 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address13  && sb_end_address13 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address13  && sb_end_address13 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address13  && sb_end_address13 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address13  && sb_end_address13 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address13  && sb_end_address13 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address13  && sb_end_address13 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address13  && sb_end_address13 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address13  && sb_end_address13 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_end_address13 &&  sb_end_address13 <= sb_end_address9) ||
      (sb_start_address10<= sb_end_address13 &&  sb_end_address13 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address13 &&  sb_end_address13 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address13 &&  sb_end_address13 <= sb_end_address12) ||
      (sb_start_address14<= sb_end_address13 &&  sb_end_address13 <= sb_end_address14) ||
       (sb_start_address15<= sb_end_address13 &&  sb_end_address13 <= sb_end_address15))

begin
overlapping_region13_s=1'b1;
end
else
    begin
    overlapping_region13_s=1'b0;
    end

if((sb_start_address0 <= sb_start_address14  && sb_start_address14 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address14  && sb_start_address14 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address14  && sb_start_address14 <= sb_end_address2 ) ||
      (sb_start_address3<= sb_start_address14  && sb_start_address14 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_start_address14  && sb_start_address14 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address14 && sb_start_address14 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address14  && sb_start_address14 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address14  && sb_start_address14 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address14  && sb_start_address14 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_start_address14 &&  sb_start_address14 <= sb_end_address9) ||
      (sb_start_address10<= sb_start_address14 &&  sb_start_address14 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address14 &&  sb_start_address14 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address14 &&  sb_start_address14 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address14 &&  sb_start_address14 <= sb_end_address13) ||
       (sb_start_address15<= sb_start_address14 &&  sb_start_address14 <= sb_end_address15) ||
       (sb_start_address0 <= sb_end_address14  && sb_end_address14 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address14  && sb_end_address14 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address14  && sb_end_address14 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address14  && sb_end_address14 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address14  && sb_end_address14 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address14  && sb_end_address14 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address14  && sb_end_address14 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address14  && sb_end_address14 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address14  && sb_end_address14 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_end_address14 &&  sb_end_address14 <= sb_end_address9) ||
      (sb_start_address10<= sb_end_address14 &&  sb_end_address14 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address14 &&  sb_end_address14 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address14 &&  sb_end_address14 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address14 &&  sb_end_address14 <= sb_end_address13) ||
       (sb_start_address15<= sb_end_address14 &&  sb_end_address14 <= sb_end_address15))

begin
overlapping_region14_s=1'b1;
end

else
    begin
    overlapping_region14_s=1'b0;
    end


if((sb_start_address0 <= sb_start_address15  && sb_start_address15 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_start_address15  && sb_start_address15 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_start_address15  && sb_start_address15 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_start_address15  && sb_start_address15 <= sb_end_address3) ||
      (sb_start_address4 <= sb_start_address15  && sb_start_address15 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_start_address15  && sb_start_address15 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_start_address15  && sb_start_address15 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_start_address15  && sb_start_address15 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_start_address15  && sb_start_address15 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_start_address15 &&  sb_start_address15 <= sb_end_address9) ||
      (sb_start_address10<= sb_start_address15 &&  sb_start_address15 <= sb_end_address10) ||
      (sb_start_address11<= sb_start_address15 &&  sb_start_address15 <= sb_end_address11) ||
      (sb_start_address12<= sb_start_address15 &&  sb_start_address15 <= sb_end_address12) ||
      (sb_start_address13<= sb_start_address15 &&  sb_start_address15 <= sb_end_address13) ||
       (sb_start_address14<= sb_start_address15 &&  sb_start_address15 <= sb_end_address14) ||
       (sb_start_address0 <= sb_end_address15  && sb_end_address15 <= sb_end_address0 ) || 
      (sb_start_address1 <= sb_end_address15  && sb_end_address15 <= sb_end_address1 ) ||
      (sb_start_address2 <= sb_end_address15  && sb_end_address15 <= sb_end_address2 ) ||
      (sb_start_address3 <= sb_end_address15  && sb_end_address15 <= sb_end_address3 ) ||
      (sb_start_address4 <= sb_end_address15  && sb_end_address15 <= sb_end_address4 ) ||
      (sb_start_address5 <= sb_end_address15  && sb_end_address15 <= sb_end_address5 ) ||
      (sb_start_address6 <= sb_end_address15  && sb_end_address15 <= sb_end_address6 ) ||
      (sb_start_address7 <= sb_end_address15  && sb_end_address15 <= sb_end_address7 ) ||
      (sb_start_address8 <= sb_end_address15  && sb_end_address15 <= sb_end_address8 ) ||
      (sb_start_address9<= sb_end_address15 &&  sb_end_address15 <= sb_end_address9) ||
      (sb_start_address10<= sb_end_address15 &&  sb_end_address15 <= sb_end_address10) ||
      (sb_start_address11<= sb_end_address15 &&  sb_end_address15 <= sb_end_address11) ||
      (sb_start_address12<= sb_end_address15 &&  sb_end_address15 <= sb_end_address12) ||
      (sb_start_address13<= sb_end_address15 &&  sb_end_address15 <= sb_end_address13) ||
       (sb_start_address14<= sb_end_address15 &&  sb_end_address15 <= sb_end_address14))

begin
overlapping_region15_s=1'b1;
end
else
    begin
    overlapping_region15_s=1'b0;
    end



            sb.overlapping_region_exception0<=(seq_item_inst.pmp_en && non_zero_region0_s && overlapping_region0_s) ? 1:0;
            sb.overlapping_region_exception1<=(seq_item_inst.pmp_en && non_zero_region1_s && overlapping_region1_s) ? 1:0;
            sb.overlapping_region_exception2<=(seq_item_inst.pmp_en && non_zero_region2_s && overlapping_region2_s) ? 1:0;
            sb.overlapping_region_exception3<=(seq_item_inst.pmp_en && non_zero_region3_s && overlapping_region3_s) ? 1:0;
            sb.overlapping_region_exception4<=(seq_item_inst.pmp_en && non_zero_region4_s && overlapping_region4_s) ? 1:0;
            sb.overlapping_region_exception5<=(seq_item_inst.pmp_en && non_zero_region5_s && overlapping_region5_s) ? 1:0;
            sb.overlapping_region_exception6<=(seq_item_inst.pmp_en && non_zero_region6_s && overlapping_region6_s) ? 1:0;
            sb.overlapping_region_exception7<=(seq_item_inst.pmp_en && non_zero_region7_s && overlapping_region7_s) ? 1:0;
            sb.overlapping_region_exception8<=(seq_item_inst.pmp_en && non_zero_region8_s && overlapping_region8_s) ? 1:0;
            sb.overlapping_region_exception9<=(seq_item_inst.pmp_en && non_zero_region9_s && overlapping_region9_s) ? 1:0;
            sb.overlapping_region_exception10<=(seq_item_inst.pmp_en && non_zero_region10_s && overlapping_region10_s) ? 1:0;
            sb.overlapping_region_exception11<=(seq_item_inst.pmp_en && non_zero_region11_s && overlapping_region11_s) ? 1:0;
            sb.overlapping_region_exception12<=(seq_item_inst.pmp_en && non_zero_region12_s && overlapping_region12_s) ? 1:0;
            sb.overlapping_region_exception13<=(seq_item_inst.pmp_en && non_zero_region13_s && overlapping_region13_s) ? 1:0;
            sb.overlapping_region_exception14<=(seq_item_inst.pmp_en && non_zero_region14_s && overlapping_region14_s) ? 1:0;
            sb.overlapping_region_exception15<=(seq_item_inst.pmp_en && non_zero_region15_s && overlapping_region15_s) ? 1:0;


/*
if( sb_start_address0 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address0)
    begin 
range_check_write0_s=1'b1;
    end
    else
        begin
range_check_write0_s=1'b0;

end

if( sb_start_address1 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address1)
    begin 
range_check_write1_s=1'b1;
    end
    else
        begin
range_check_write1_s=1'b0;

end
if( sb_start_address2 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address2)
    begin 
range_check_write2_s=1'b1;
    end
    else
        begin
range_check_write2_s=1'b0;

end
if( sb_start_address3 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address3)
    begin 
range_check_write3_s=1'b1;
    end
    else
        begin
range_check_write3_s=1'b0;

end
if( sb_start_address4 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address4)
    begin 
range_check_write4_s=1'b1;
    end
    else
        begin
range_check_write4_s=1'b0;

end
if( sb_start_address5 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address5)
    begin 
range_check_write5_s=1'b1;
    end
    else
        begin
range_check_write5_s=1'b0;

end
if( sb_start_address6 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address6)
    begin 
range_check_write6_s=1'b1;
    end
    else
        begin
range_check_write6_s=1'b0;

end
if( sb_start_address7 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address7)
    begin 
range_check_write7_s<=1'b1;
    end
    else
        begin
range_check_write7_s=1'b0;

end
if( sb_start_address8 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address8)
    begin 
range_check_write8_s=1'b1;
    end
    else
        begin
range_check_write8_s=1'b0;

end
if( sb_start_address9 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address9)
    begin 
range_check_write9_s=1'b1;
    end
    else
        begin
range_check_write9_s=1'b0;

end
if( sb_start_address10 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address10)
    begin 
range_check_write10_s=1'b1;
    end
    else
        begin
range_check_write10_s=1'b0;

end
if( sb_start_address11 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address11)
    begin 
range_check_write11_s=1'b1;
    end
    else
        begin
range_check_write11_s=1'b0;

end
if( sb_start_address12 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address12)
    begin 
range_check_write12_s=1'b1;
    end
    else
        begin
range_check_write12_s=1'b0;

end
if( sb_start_address13 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address13)
    begin 
range_check_write13_s=1'b1;
    end
    else
        begin
range_check_write13_s=1'b0;

end
if( sb_start_address14 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address14)
    begin 
range_check_write14_s<=1'b1;
    end
    else
        begin
range_check_write14_s=1'b0;

end
if( sb_start_address15 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address15)
    begin 
range_check_write15_s=1'b1;
    end
    else
        begin
range_check_write15_s=1'b0;

end
*/

range_check_write0_s=(sb_start_address0 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address0) ? 1:0;
range_check_write1_s=(sb_start_address1 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address1) ? 1:0;
range_check_write2_s=(sb_start_address2 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address2) ? 1:0;
range_check_write3_s=(sb_start_address3 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address3) ? 1:0;
range_check_write4_s=(sb_start_address4 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address4) ? 1:0;
range_check_write5_s=(sb_start_address5 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address5) ? 1:0;
range_check_write6_s=(sb_start_address6 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address6) ? 1:0;
range_check_write7_s=(sb_start_address7 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address7) ? 1:0;
range_check_write8_s=(sb_start_address8 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address8) ? 1:0;
range_check_write9_s=(sb_start_address9 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address9) ? 1:0;
range_check_write10_s=(sb_start_address10 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address10) ? 1:0;
range_check_write11_s=(sb_start_address11 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address11) ? 1:0;
range_check_write12_s=(sb_start_address12 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address12) ? 1:0;
range_check_write13_s=(sb_start_address13 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address13) ? 1:0;
range_check_write14_s=(sb_start_address14 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address14) ? 1:0;
range_check_write15_s=(sb_start_address15 <= seq_item_inst.memory_access_write_address && seq_item_inst.memory_access_write_address <= sb_end_address15) ? 1:0;

`uvm_info("user*****",$sformatf("usermode_o : %0h", user_mode_s), UVM_MEDIUM)


`uvm_info("RC00*****",$sformatf("start0_o : %0h", range_check_write0_s), UVM_MEDIUM)
`uvm_info("RC10*****",$sformatf("end0_o : %0h", range_check_write1_s), UVM_MEDIUM)

`uvm_info("RC2*****",$sformatf("start0_o : %0h", range_check_write2_s), UVM_MEDIUM)
`uvm_info("RC3*****",$sformatf("end0_o : %0h", range_check_write3_s), UVM_MEDIUM)
`uvm_info("RC4*****",$sformatf("start0_o : %0h", range_check_write4_s), UVM_MEDIUM)
`uvm_info("RC5*****",$sformatf("end0_o : %0h", range_check_write5_s), UVM_MEDIUM)
`uvm_info("RC6*****",$sformatf("start0_o : %0h", range_check_write6_s), UVM_MEDIUM)
`uvm_info("RC7*****",$sformatf("end0_o : %0h", range_check_write7_s), UVM_MEDIUM)
`uvm_info("RC8*****",$sformatf("start0_o : %0h", range_check_write8_s), UVM_MEDIUM)
`uvm_info("RC9*****",$sformatf("end0_o : %0h", range_check_write9_s), UVM_MEDIUM)
`uvm_info("RC10*****",$sformatf("start0_o : %0h", range_check_write10_s), UVM_MEDIUM)
`uvm_info("RC11*****",$sformatf("end0_o : %0h", range_check_write11_s), UVM_MEDIUM)

`uvm_info("RC12*****",$sformatf("start0_o : %0h", range_check_write12_s), UVM_MEDIUM)
`uvm_info("RC13*****",$sformatf("end0_o : %0h", range_check_write13_s), UVM_MEDIUM)

`uvm_info("RC14*****",$sformatf("start0_o : %0h", range_check_write14_s), UVM_MEDIUM)
`uvm_info("RC15*****",$sformatf("end0_o : %0h", range_check_write15_s), UVM_MEDIUM)



////READ CHECK 1-15
/*

if( sb_start_address0 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address0)
    begin 
range_check_read0_s=1'b1;
    end
    else
        begin
range_check_read0_s=1'b0;

end

if( sb_start_address1 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address1)
    begin 
range_check_read1_s=1'b1;
    end
    else
        begin
range_check_read1_s=1'b0;

end
if( sb_start_address2 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address2)
    begin 
range_check_read2_s=1'b1;
    end
    else
        begin
range_check_read2_s=1'b0;

end
if( sb_start_address3 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address3)
    begin 
range_check_read3_s=1'b1;
    end
    else
        begin
range_check_read3_s=1'b0;

end
if( sb_start_address4 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address4)
    begin 
range_check_read4_s=1'b1;
    end
    else
        begin
range_check_read4_s=1'b0;

end
if( sb_start_address5 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address5)
    begin 
range_check_read5_s=1'b1;
    end
    else
        begin
range_check_read5_s=1'b0;

end
if( sb_start_address6 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address6)
    begin 
range_check_read6_s=1'b1;
    end
    else
        begin
range_check_read6_s=1'b0;

end
if( sb_start_address7 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address7)
    begin 
range_check_read7_s=1'b1;
    end
    else
        begin
range_check_read7_s=1'b0;

end
if( sb_start_address8 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address8)
    begin 
range_check_read8_s=1'b1;
    end
    else
        begin
range_check_read8_s=1'b0;

end
if( sb_start_address9 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address9)
    begin 
range_check_read9_s=1'b1;
    end
    else
        begin
range_check_read9_s=1'b0;

end
if( sb_start_address10 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address10)
    begin 
range_check_read10_s=1'b1;
    end
    else
        begin
range_check_read10_s=1'b0;

end
if( sb_start_address11 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address11)
    begin 
range_check_read11_s=1'b1;
    end
    else
        begin
range_check_read11_s=1'b0;

end
if( sb_start_address12 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address12)
    begin 
range_check_read12_s=1'b1;
    end
    else
        begin
range_check_read12_s=1'b0;

end
if( sb_start_address13 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address13)
    begin 
range_check_read13_s=1'b1;
    end
    else
        begin
range_check_read13_s=1'b0;

end
if( sb_start_address14 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address14)
    begin 
range_check_read14_s=1'b1;
    end
    else
        begin
range_check_read14_s=1'b0;

end

if( sb_start_address15 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address15)
    begin 
range_check_read15_s=1'b1;
    end
    else
        begin
range_check_read15_s=1'b0;

end

*/


range_check_read0_s=(sb_start_address0 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address0) ? 1:0;
range_check_read1_s=(sb_start_address1 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address1) ? 1:0;
range_check_read2_s=(sb_start_address2 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address2) ? 1:0;
range_check_read3_s=(sb_start_address3 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address3) ? 1:0;
range_check_read4_s=(sb_start_address4 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address4) ? 1:0;
range_check_read5_s=(sb_start_address5 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address5) ? 1:0;
range_check_read6_s=(sb_start_address6 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address6) ? 1:0;
range_check_read7_s=(sb_start_address7 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address7) ? 1:0;
range_check_read8_s=(sb_start_address8 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address8) ? 1:0;
range_check_read9_s=(sb_start_address9 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address9) ? 1:0;
range_check_read10_s=(sb_start_address10 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address10) ? 1:0;
range_check_read11_s=(sb_start_address11 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address11) ? 1:0;
range_check_read12_s=(sb_start_address12 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address12) ? 1:0;
range_check_read13_s=(sb_start_address13 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address13) ? 1:0;
range_check_read14_s=(sb_start_address14 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address14) ? 1:0;
range_check_read15_s=(sb_start_address15 <= seq_item_inst.memory_access_read_address && seq_item_inst.memory_access_read_address <= sb_end_address15) ? 1:0;


`uvm_info("RCR0*****",$sformatf("start0_o : %0h", range_check_read0_s), UVM_MEDIUM)
`uvm_info("RCR1*****",$sformatf("end0_o : %0h", range_check_read1_s), UVM_MEDIUM)

`uvm_info("RCR2*****",$sformatf("start0_o : %0h", range_check_read2_s), UVM_MEDIUM)
`uvm_info("RCR3*****",$sformatf("end0_o : %0h", range_check_read3_s), UVM_MEDIUM)
`uvm_info("RCR4*****",$sformatf("start0_o : %0h", range_check_read4_s), UVM_MEDIUM)
`uvm_info("RCR5*****",$sformatf("end0_o : %0h", range_check_read5_s), UVM_MEDIUM)
`uvm_info("RCR6*****",$sformatf("start0_o : %0h", range_check_read6_s), UVM_MEDIUM)
`uvm_info("RCR7*****",$sformatf("end0_o : %0h", range_check_read7_s), UVM_MEDIUM)
`uvm_info("RCR8*****",$sformatf("start0_o : %0h", range_check_read8_s), UVM_MEDIUM)
`uvm_info("RCR9*****",$sformatf("end0_o : %0h", range_check_read9_s), UVM_MEDIUM)
`uvm_info("RCR10*****",$sformatf("start0_o : %0h", range_check_read10_s), UVM_MEDIUM)
`uvm_info("RCR11*****",$sformatf("end0_o : %0h", range_check_read11_s), UVM_MEDIUM)

`uvm_info("RCR12*****",$sformatf("start0_o : %0h", range_check_read12_s), UVM_MEDIUM)
`uvm_info("RCR13*****",$sformatf("end0_o : %0h", range_check_read13_s), UVM_MEDIUM)

`uvm_info("RCR14*****",$sformatf("start0_o : %0h", range_check_read14_s), UVM_MEDIUM)
`uvm_info("RCR15*****",$sformatf("start0_o : %0h", range_check_read15_s), UVM_MEDIUM)

`uvm_info("pmpcfg0*****",$sformatf("pmpcfg0 : %0h", pmpconfig0_o), UVM_MEDIUM)
`uvm_info("End0*****",$sformatf("pmpcfg1 : %0h", pmpconfig1_o), UVM_MEDIUM)
`uvm_info("End0*****",$sformatf("pmpcfg2 : %0h", pmpconfig2_o), UVM_MEDIUM)
`uvm_info("End0*****",$sformatf("pmpcfg3 : %0h", pmpconfig3_o), UVM_MEDIUM)



if(seq_item_inst.pmp_en && user_mode_s && range_check_write0_s)
    begin

if((pmpconfig0_o[2] && pmpconfig0_o[1] && pmpconfig0_o[0]) ||(!pmpconfig0_o[2] && pmpconfig0_o[1] && pmpconfig0_o[0]))
begin
sb.valid_memory_access_write_address=1;
end

else
    begin
    sb.valid_memory_access_write_address=0;
    end
    end


else if(seq_item_inst.pmp_en && user_mode_s && range_check_write1_s)
    begin
 if((pmpconfig0_o[10] && pmpconfig0_o[9] && pmpconfig0_o[8])||(!pmpconfig0_o[10] && pmpconfig0_o[9] && pmpconfig0_o[8]))
     begin
     sb.valid_memory_access_write_address=1;
     end
 
else
    begin
    sb.valid_memory_access_write_address=0;
    end

    end


else if(seq_item_inst.pmp_en && user_mode_s && range_check_write2_s)
    begin
if((pmpconfig0_o[18] && pmpconfig0_o[17] && pmpconfig0_o[16]) ||(!pmpconfig0_o[18] && pmpconfig0_o[17] && pmpconfig0_o[16]))

     begin
     sb.valid_memory_access_write_address=1;
     end
else
    begin
    sb.valid_memory_access_write_address=0;
    end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_write3_s)
    begin
if((pmpconfig0_o[26] && pmpconfig0_o[25] && pmpconfig0_o[24]) ||(!pmpconfig0_o[26] && pmpconfig0_o[25] && pmpconfig0_o[24]))
 begin
     sb.valid_memory_access_write_address=1;
     end
else
    begin
    sb.valid_memory_access_write_address=0;
    end
   end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_write4_s)
    begin
if((pmpconfig1_o[2] && pmpconfig1_o[1] && pmpconfig1_o[0])||(!pmpconfig1_o[2] && pmpconfig1_o[1] && pmpconfig1_o[0]))
     begin
     sb.valid_memory_access_write_address=1;
     end

else
    begin
    sb.valid_memory_access_write_address=0;
    end
   end
else if(seq_item_inst.pmp_en && user_mode_s && range_check_write5_s)
    begin
if((pmpconfig1_o[10] && pmpconfig1_o[9] && pmpconfig1_o[8]) ||(!pmpconfig1_o[10] && pmpconfig1_o[9] && pmpconfig1_o[8]))  
    begin
     sb.valid_memory_access_write_address=1;
     end
 else
    begin
    sb.valid_memory_access_write_address=0;
    end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_write6_s)
    begin
if((pmpconfig1_o[18] && pmpconfig1_o[17] && pmpconfig1_o[16])||(!pmpconfig1_o[18] && pmpconfig1_o[17] && pmpconfig1_o[16]))

     begin
     sb.valid_memory_access_write_address=1;
     end

else
    begin
    sb.valid_memory_access_write_address=0;
    end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_write7_s)
    begin
if((pmpconfig1_o[26] && pmpconfig1_o[25] && pmpconfig1_o[24])||(!pmpconfig1_o[26] && pmpconfig1_o[25] && pmpconfig1_o[24]))
    begin

     sb.valid_memory_access_write_address=1;
     end
   else
    begin
    sb.valid_memory_access_write_address=0;
    end

  end


else if(seq_item_inst.pmp_en && user_mode_s && range_check_write8_s)
    begin
   if((pmpconfig2_o[2] && pmpconfig2_o[1] && pmpconfig2_o[0])||(!pmpconfig2_o[2] && pmpconfig2_o[1] && pmpconfig2_o[0]))

       begin
     sb.valid_memory_access_write_address=1;
     end

    

    else
        begin
       sb.valid_memory_access_write_address=0;
        end
    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_write9_s)
    begin
  if((pmpconfig2_o[10] && pmpconfig2_o[9] && pmpconfig2_o[8])||(!pmpconfig2_o[10] && pmpconfig2_o[9] && pmpconfig2_o[8]))
       begin
       sb.valid_memory_access_write_address=1;
       end
     
    else
        begin
        sb.valid_memory_access_write_address=0;
        end
    end


else if(seq_item_inst.pmp_en && user_mode_s && range_check_write10_s)
    begin
 if((pmpconfig2_o[18] && pmpconfig2_o[17] && pmpconfig2_o[16])||(!pmpconfig2_o[18] && pmpconfig2_o[17] && pmpconfig2_o[16]))
   begin
     sb.valid_memory_access_write_address=1;
     end  
     else
      begin
     sb.valid_memory_access_write_address=0;
     end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_write11_s)
    begin
if((pmpconfig2_o[26] && pmpconfig2_o[25] && pmpconfig2_o[24])||(!pmpconfig2_o[26] && pmpconfig2_o[25] && pmpconfig2_o[24]))
    begin
     sb.valid_memory_access_write_address=1;
     end
    
       else
        begin
         sb.valid_memory_access_write_address=0;
        end
    end


 else if(seq_item_inst.pmp_en && user_mode_s && range_check_write12_s)
     begin
if((pmpconfig3_o[2] && pmpconfig3_o[1] && pmpconfig3_o[0])||(!pmpconfig3_o[2] && pmpconfig3_o[1] && pmpconfig3_o[0]))
    begin
     sb.valid_memory_access_write_address=1;
     end
     else 
     begin
     sb.valid_memory_access_write_address=0;
     end
     end


else if(seq_item_inst.pmp_en && user_mode_s && range_check_write13_s)
    begin
  if((pmpconfig3_o[10] && pmpconfig3_o[9] && pmpconfig3_o[8])||(!pmpconfig3_o[10] && pmpconfig3_o[9] && pmpconfig3_o[8]))

      begin
     sb.valid_memory_access_write_address=1;
     end
     else
         begin
         sb.valid_memory_access_write_address=0;
        end
     end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_write14_s)
    begin
if((pmpconfig3_o[18] && pmpconfig3_o[17] && pmpconfig3_o[16])||(!pmpconfig3_o[18] && pmpconfig3_o[17] && pmpconfig3_o[16]))
    begin
     sb.valid_memory_access_write_address=1;
     end
    
     else
         begin
     sb.valid_memory_access_write_address=0;
     end
    end
else if(seq_item_inst.pmp_en && user_mode_s && range_check_write15_s)
    begin
if((pmpconfig3_o[26] && pmpconfig3_o[25] && pmpconfig3_o[24])||(!pmpconfig3_o[26] && pmpconfig3_o[25] && pmpconfig3_o[24]))
    begin
     sb.valid_memory_access_write_address=1;
     end
  
   else
       begin
     sb.valid_memory_access_write_address=0;
     end
    end
else
sb.valid_memory_access_write_address=1'b0;



compare(.sb_data(sb.valid_memory_access_write_address), .rtl_data(seq_item_inst.valid_memory_access_write_address), .label("WRITE VALID"));



// READ VALID CALCULATION

if(seq_item_inst.pmp_en && user_mode_s && range_check_read0_s )
    begin

if ((!pmpconfig0_o[2] && !pmpconfig0_o[1] && pmpconfig0_o[0])||(pmpconfig0_o[2] && pmpconfig0_o[1] && pmpconfig0_o[0])
    || (pmpconfig0_o[2] && !pmpconfig0_o[1] && pmpconfig0_o[0])||(!pmpconfig0_o[2] && pmpconfig0_o[1] && pmpconfig0_o[0]))  
    begin
   sb.valid_memory_access_read_address= 1;
    end

    else
        begin
        sb.valid_memory_access_read_address=0;
        end
    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read1_s) 
    begin

if ((!pmpconfig0_o[10] && !pmpconfig0_o[9] && pmpconfig0_o[8]) ||(pmpconfig0_o[10] && pmpconfig0_o[9] && pmpconfig0_o[8])
    ||(pmpconfig0_o[10] && !pmpconfig0_o[9] && pmpconfig0_o[8])||(!pmpconfig0_o[10] && pmpconfig0_o[9] && pmpconfig0_o[8]))   
    begin
sb.valid_memory_access_read_address=1;
    end

  
 else
     begin
     sb.valid_memory_access_read_address=0;
     end
     
end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read2_s)
    begin
   if((!pmpconfig0_o[18] && !pmpconfig0_o[17] && pmpconfig0_o[16]) || (pmpconfig0_o[18] && pmpconfig0_o[17] && pmpconfig0_o[16])
       ||(pmpconfig0_o[18] && !pmpconfig0_o[17] && pmpconfig0_o[16])||(!pmpconfig0_o[18] && pmpconfig0_o[17] && pmpconfig0_o[16]))
    begin
    sb.valid_memory_access_read_address=1;
    end
        
    else
        begin
        sb.valid_memory_access_read_address=0;
    end
    
end


else if(seq_item_inst.pmp_en && user_mode_s && range_check_read3_s)
    begin

if ((!pmpconfig0_o[26] && !pmpconfig0_o[25] && pmpconfig0_o[24])||(pmpconfig0_o[26] && pmpconfig0_o[25] && pmpconfig0_o[24])
    ||(pmpconfig0_o[26] && !pmpconfig0_o[25] && pmpconfig0_o[24])||(!pmpconfig0_o[26] && pmpconfig0_o[25] && pmpconfig0_o[24]))
begin
  sb.valid_memory_access_read_address=1;
  end
  
   else
      begin
  sb.valid_memory_access_read_address=0;
    end
  end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read4_s)
    begin
if ((!pmpconfig1_o[2] && !pmpconfig1_o[1] && pmpconfig1_o[0])||(pmpconfig1_o[2] && pmpconfig1_o[1] && pmpconfig1_o[0])
    ||(pmpconfig1_o[2] && !pmpconfig1_o[1] && pmpconfig1_o[0])||(!pmpconfig1_o[2] && pmpconfig1_o[1] && pmpconfig1_o[0])) 
      begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end
    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read5_s)
    begin
if ((!pmpconfig1_o[10] && !pmpconfig1_o[9] && pmpconfig1_o[8])||(pmpconfig1_o[10] && pmpconfig1_o[9] && pmpconfig1_o[8])
    ||(pmpconfig1_o[10] && !pmpconfig1_o[9] && pmpconfig1_o[8])||(!pmpconfig1_o[10] && pmpconfig1_o[9] && pmpconfig1_o[8])) 
    begin
      sb.valid_memory_access_read_address=1;
      end
     
      else
          begin
          sb.valid_memory_access_read_address=0;
          
    end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read6_s )
    begin
if((!pmpconfig1_o[18] && !pmpconfig1_o[17] && pmpconfig1_o[16])||(pmpconfig1_o[18] && pmpconfig1_o[17] && pmpconfig1_o[16])
    ||(pmpconfig1_o[18] && !pmpconfig1_o[17] && pmpconfig1_o[16])||(!pmpconfig1_o[18] && pmpconfig1_o[17] && pmpconfig1_o[16])) 
begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end
    end

    
 
else if(seq_item_inst.pmp_en && user_mode_s && range_check_read7_s)
 begin
if ((!pmpconfig1_o[26] && !pmpconfig1_o[25] && pmpconfig1_o[24])||(pmpconfig1_o[26] && pmpconfig1_o[25] && pmpconfig1_o[24])
    ||(pmpconfig1_o[26] && !pmpconfig1_o[25] && pmpconfig1_o[24])||(!pmpconfig1_o[26] && pmpconfig1_o[25] && pmpconfig1_o[24])) 
    begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

 end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read8_s )
    begin
if((!pmpconfig2_o[2] && !pmpconfig2_o[1] && pmpconfig2_o[0])||(pmpconfig2_o[2] && pmpconfig2_o[1] && pmpconfig2_o[0])
    ||(pmpconfig2_o[2] && !pmpconfig2_o[1] && pmpconfig2_o[0])||(!pmpconfig2_o[2] && pmpconfig2_o[1] && pmpconfig2_o[0])) 
    begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read9_s)
    begin
if((!pmpconfig2_o[10] && !pmpconfig2_o[9] && pmpconfig2_o[8])||(pmpconfig2_o[10] && pmpconfig2_o[9] && pmpconfig2_o[8])
    ||(pmpconfig2_o[10] && !pmpconfig2_o[9] && pmpconfig2_o[8])||(!pmpconfig2_o[10] && pmpconfig2_o[9] && pmpconfig2_o[8])
)
    begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read10_s)
    begin
if((!pmpconfig2_o[18] && !pmpconfig2_o[17] && pmpconfig2_o[16])||(pmpconfig2_o[18] && pmpconfig2_o[17] && pmpconfig2_o[16])
    ||(pmpconfig2_o[18] && !pmpconfig2_o[17] && pmpconfig2_o[16])||(!pmpconfig2_o[18] && pmpconfig2_o[17] && pmpconfig2_o[16])) 
    begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read11_s)
    begin
if((!pmpconfig2_o[26] && !pmpconfig2_o[25] && pmpconfig2_o[24])||(pmpconfig2_o[26] && pmpconfig2_o[25] && pmpconfig2_o[24])
    ||(pmpconfig2_o[26] && !pmpconfig2_o[25] && pmpconfig2_o[24])||(!pmpconfig2_o[26] && pmpconfig2_o[25] && pmpconfig2_o[24])) 

 begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

    end


else if(seq_item_inst.pmp_en && user_mode_s && range_check_read12_s)
    begin
if((!pmpconfig3_o[2] && !pmpconfig3_o[1] && pmpconfig3_o[0])||(pmpconfig3_o[2] && pmpconfig3_o[1] && pmpconfig3_o[0])
    ||(pmpconfig3_o[2] && !pmpconfig3_o[1] && pmpconfig3_o[0])||(!pmpconfig3_o[2] && pmpconfig3_o[1] && pmpconfig3_o[0]))
    begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read13_s)
    begin
if((!pmpconfig3_o[10] && !pmpconfig3_o[9] && pmpconfig3_o[8])||(pmpconfig3_o[10] && pmpconfig3_o[9] && pmpconfig3_o[8])
    ||(pmpconfig3_o[10] && !pmpconfig3_o[9] && pmpconfig3_o[8])||(!pmpconfig3_o[10] && pmpconfig3_o[9] && pmpconfig3_o[8])) 
    begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

    end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read14_s)
   begin
if((!pmpconfig3_o[18] && !pmpconfig3_o[17] && pmpconfig3_o[16])||(pmpconfig3_o[18] && pmpconfig3_o[17] && pmpconfig3_o[16])||
    (pmpconfig3_o[18] && !pmpconfig3_o[17] && pmpconfig3_o[16])||(!pmpconfig3_o[18] && pmpconfig3_o[17] && pmpconfig3_o[16]))
    begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

   end

else if(seq_item_inst.pmp_en && user_mode_s && range_check_read15_s)
    begin
if((!pmpconfig3_o[26] && !pmpconfig3_o[25] && pmpconfig3_o[24])||(pmpconfig3_o[26] && pmpconfig3_o[25] && pmpconfig3_o[24])
    ||(pmpconfig3_o[26] && !pmpconfig3_o[25] && pmpconfig3_o[24])||(!pmpconfig3_o[26] && pmpconfig3_o[25] && pmpconfig3_o[24])) 
    begin
      sb.valid_memory_access_read_address=1;
      end
      else
          begin
          sb.valid_memory_access_read_address=0;
          end

    end
else
    
sb.valid_memory_access_read_address=0;
    
compare(.sb_data(sb.valid_memory_access_read_address), .rtl_data(seq_item_inst.valid_memory_access_read_address), .label("read VALID"));


if(seq_item_inst.pmp_en && sb.valid_memory_access_read_address && sb.valid_memory_access_write_address)
    begin
    sb.store_exception=1'b0;
    sb.load_exception=1'b0;
    end
   else
       begin

sb.store_exception=(seq_item_inst.pmp_en && sb.valid_memory_access_read_address && seq_item_inst.memory_access_write_en) ? 1:0;
sb.load_exception =(seq_item_inst.pmp_en && sb.valid_memory_access_write_address && seq_item_inst.memory_access_read_en) ? 1:0;
       end

compare(.sb_data(sb.store_exception), .rtl_data(seq_item_inst.store_exception), .label("STORE  EXECPTION"));
compare(.sb_data(sb.load_exception), .rtl_data(seq_item_inst.load_exception), .label("LOAD EXECPTION"));

compare(.sb_data(sb.overlapping_region_exception0), .rtl_data(seq_item_inst.overlapping_region_exception0), .label("OVERLAPPING EXECPTION0"));
compare(.sb_data(sb.overlapping_region_exception1), .rtl_data(seq_item_inst.overlapping_region_exception1), .label("OVERLAPPING EXECPTION1"));
compare(.sb_data(sb.overlapping_region_exception2), .rtl_data(seq_item_inst.overlapping_region_exception2), .label("OVERLAPPING EXECPTION2"));
compare(.sb_data(sb.overlapping_region_exception3), .rtl_data(seq_item_inst.overlapping_region_exception3), .label("OVERLAPPING EXECPTION3"));
compare(.sb_data(sb.overlapping_region_exception4), .rtl_data(seq_item_inst.overlapping_region_exception4), .label("OVERLAPPING EXECPTION4"));
compare(.sb_data(sb.overlapping_region_exception5), .rtl_data(seq_item_inst.overlapping_region_exception5), .label("OVERLAPPING EXECPTION5"));
compare(.sb_data(sb.overlapping_region_exception6), .rtl_data(seq_item_inst.overlapping_region_exception6), .label("OVERLAPPING EXECPTION6"));
compare(.sb_data(sb.overlapping_region_exception7), .rtl_data(seq_item_inst.overlapping_region_exception7), .label("OVERLAPPING EXECPTION7"));
compare(.sb_data(sb.overlapping_region_exception8), .rtl_data(seq_item_inst.overlapping_region_exception8), .label("OVERLAPPING EXECPTION8"));
compare(.sb_data(sb.overlapping_region_exception9), .rtl_data(seq_item_inst.overlapping_region_exception9), .label("OVERLAPPING EXECPTION9"));
compare(.sb_data(sb.overlapping_region_exception10), .rtl_data(seq_item_inst.overlapping_region_exception10), .label("OVERLAPPING EXECPTION10"));
compare(.sb_data(sb.overlapping_region_exception11), .rtl_data(seq_item_inst.overlapping_region_exception11), .label("OVERLAPPING EXECPTION11"));
compare(.sb_data(sb.overlapping_region_exception12), .rtl_data(seq_item_inst.overlapping_region_exception12), .label("OVERLAPPING EXECPTION12"));
compare(.sb_data(sb.overlapping_region_exception13), .rtl_data(seq_item_inst.overlapping_region_exception13), .label("OVERLAPPING EXECPTION13"));
compare(.sb_data(sb.overlapping_region_exception14), .rtl_data(seq_item_inst.overlapping_region_exception14), .label("OVERLAPPING EXECPTION14"));
compare(.sb_data(sb.overlapping_region_exception15), .rtl_data(seq_item_inst.overlapping_region_exception15), .label("OVERLAPPING EXECPTION15"));


end
endtask 
 
endclass

