class axi_m_seq_item#(int ADDR_WIDTH=64, DATA_WIDTH=64, STRB_WIDTH=8) extends uvm_sequence_item;

  rand logic        axi4_lite_rstn;  
// WRITE ADDRESS CHANNEL //
       logic [ADDR_WIDTH-1:0] M_AW_ADDR_OUT;  
       logic                  M_AW_VALID_OUT; 
       logic  	              M_AW_READY_IN;  
			
//WRITE DATA CHANNEL//
       logic [DATA_WIDTH-1:0]  M_W_DATA_OUT;  
       logic [STRB_WIDTH-1:0]  M_W_STRB_OUT;   
       logic                   M_W_VALID_OUT; 
       logic 	               M_W_READY_IN;  

//WRITE RESPONSE CHANNEL//
  rand logic [1:0]             M_B_RESP_IN;    
       logic      	           M_B_VALID_IN; 
       logic 		           M_B_READY_OUT;

//READ ADDRESS CHANNEL//
       logic [ADDR_WIDTH-1:0]  M_AR_ADDR_OUT;  
       logic 		           M_AR_VALID_OUT; 
       logic     	           M_AR_READY_IN;  
							
//READ DATA CHANNEL//
 rand  logic [DATA_WIDTH-1:0]  M_R_DATA_IN;     
 rand  logic [1:0]             M_R_RESP_IN;  
       logic 		           M_R_VALID_IN; 
       logic     	           M_R_READY_OUT;


//CONTROL SIGNALS//
  rand logic                   wr_en_in;   
  rand logic                   rd_en_in;  
  rand logic [1:0]             byte_en;   
  rand logic [ADDR_WIDTH-1:0]  wr_addr_in;
  rand logic [ADDR_WIDTH-1:0]  rd_addr_in;
  rand logic [DATA_WIDTH-1:0]  m_data_in; 
       logic [DATA_WIDTH-1:0]  m_data_out;


// MACROS DEFNITION //

    `uvm_object_utils_begin(axi_m_seq_item)

// field macros //
    `uvm_field_int(M_AW_ADDR_OUT, UVM_ALL_ON) 
    `uvm_field_int(M_AW_VALID_OUT,UVM_ALL_ON)
    `uvm_field_int(M_AW_READY_IN,UVM_ALL_ON)
    `uvm_field_int(M_W_DATA_OUT,UVM_ALL_ON)
    `uvm_field_int(M_W_STRB_OUT,UVM_ALL_ON)
    `uvm_field_int(M_W_VALID_OUT,UVM_ALL_ON)
    `uvm_field_int(M_W_READY_IN,UVM_ALL_ON)
    `uvm_field_int(M_B_RESP_IN,UVM_ALL_ON)
    `uvm_field_int(M_B_VALID_IN,UVM_ALL_ON)
    `uvm_field_int(M_B_READY_OUT,UVM_ALL_ON)
    `uvm_field_int(M_AR_ADDR_OUT,UVM_ALL_ON)
    `uvm_field_int(M_AR_VALID_OUT,UVM_ALL_ON)
    `uvm_field_int(M_AR_READY_IN, UVM_ALL_ON)
    `uvm_field_int(M_R_DATA_IN,UVM_ALL_ON)
    `uvm_field_int(M_R_RESP_IN,UVM_ALL_ON)
    `uvm_field_int(M_R_VALID_IN,UVM_ALL_ON)
    `uvm_field_int(M_R_READY_OUT,UVM_ALL_ON)
    `uvm_field_int(wr_en_in,UVM_ALL_ON)
    `uvm_field_int(rd_en_in,UVM_ALL_ON)
    `uvm_field_int(byte_en,UVM_ALL_ON)
    `uvm_field_int(wr_addr_in,UVM_ALL_ON)
    `uvm_field_int(rd_addr_in,UVM_ALL_ON)
    `uvm_field_int(m_data_in,UVM_ALL_ON)
    `uvm_field_int(m_data_out,UVM_ALL_ON)
    `uvm_field_int(axi4_lite_rstn,UVM_ALL_ON)

    `uvm_object_utils_end

  function new (string name = "axi_m_seq_item");
    super.new(name);
  endfunction

     constraint c1{wr_en_in!= rd_en_in;}
     constraint c2{soft axi4_lite_rstn == 1'b1;}
     constraint c3{soft M_B_RESP_IN == 2'b00;}
     constraint c4{soft M_R_RESP_IN == 2'b00;}

endclass
      
