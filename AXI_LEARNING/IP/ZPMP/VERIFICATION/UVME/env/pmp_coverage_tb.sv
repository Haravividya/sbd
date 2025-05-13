// Functional coverage_tb
// covergroup and cover points
// bins
// cross coverage
// command to enable coverage: xrun -coverage all
// to open Cadence IMC tool : imc & -> open UCDB file in IMC to read the coverage dump

class pmp_coverage_tb extends uvm_subscriber #(pmp_seq_item_tb); // uvm_subscriber is a standart uvm component to implemetn coverage : this will be anlysisi import 
    
  `uvm_component_utils(pmp_coverage_tb)
  
  pmp_seq_item_tb pkt;
  
    
   

  // Covergroup 
  covergroup covgroup_pmp;
  
    option.name         = "covgroup_pmp";
    option.comment      = "to check coverage ";
    RESET : coverpoint pkt.csr_rst
    {
            bins bin_0={0};
            bins bin_1={1};
    }

    WRITE_ADDRESS : coverpoint pkt.csr_write_addr // 12 bits
    { 
	  bins bin_value_0 = {928};
	  bins bin_value_1 = {929};
	  bins bin_value_2 = {930};
	  bins bin_value_3 = {931};
      
      bins bin_value_4 = {944};
      bins bin_value_5 = {945};
      bins bin_value_6 = {946};
      bins bin_value_7 = {947};
      bins bin_value_8 = {948};
      bins bin_value_9 = {949};
      bins bin_value_10 = {950};
      bins bin_value_11 = {951};
      bins bin_value_12 = {952};
      bins bin_value_13 = {953};
      bins bin_value_14 = {954};
      bins bin_value_15 = {955};
      bins bin_value_16 = {956};
      bins bin_value_17 = {957};
      bins bin_value_18 = {958};
      bins bin_value_19 = {959};




      
    }

    READ_ADDRESS : coverpoint pkt.csr_read_addr 
    { 	  
     bins bin_value_0 = {928};
	  bins bin_value_1 = {929};
	  bins bin_value_2 = {930};
	  bins bin_value_3 = {931};
      
      bins bin_value_4 = {944};
      bins bin_value_5 = {945};
      bins bin_value_6 = {946};
      bins bin_value_7 = {947};
      bins bin_value_8 = {948};
      bins bin_value_9 = {949};
      bins bin_value_10 = {950};
      bins bin_value_11 = {951};
      bins bin_value_12 = {952};
      bins bin_value_13 = {953};
      bins bin_value_14 = {954};
      bins bin_value_15 = {955};
      bins bin_value_16 = {956};
      bins bin_value_17 = {957};
      bins bin_value_18 = {958};
      bins bin_value_19 = {959};
 
    }

    MEMORY_WRITE_EN : coverpoint pkt.memory_access_write_en
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
      
    } 

    MEMORY_READ_EN : coverpoint pkt.memory_access_read_en
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
      
    }

   WRITE_EN : coverpoint pkt.csr_write_en
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
      
    } 
    
    PMP_EN : coverpoint pkt.pmp_en
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
      
    } 


    READ_EN : coverpoint pkt.csr_read_en
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
      
    } 
   MACHINE_SIGNAL: coverpoint pkt.machine_mode_valid 
   {
     bins bin_0 = {0};
     bins bin_1 = {1};
    
   }
   KERNEL_SIGNAL: coverpoint pkt.kernel_mode_signal 
   {
     bins bin_0 = {0};
     bins bin_1 = {1};
    
   }
  MEMORY_ACCESS_WRITE_DATA: coverpoint pkt.memory_access_write_address
  {
         option.auto_bin_max = 48;
  }

    MEMORY_ACCESS_READ_DATA: coverpoint pkt.memory_access_read_address
  {
         option.auto_bin_max = 48;
  }

   WRITE_DATA: coverpoint pkt.csr_write_data
  {
         option.auto_bin_max = 48;
  }

    
    READ_OUT: coverpoint pkt.csr_read_out
    {
             option.auto_bin_max = 48;
    }

    PMP_CONFIG0_EXECPTION: coverpoint pkt.pmpcfg0_exception 
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }

   
    PMP_CONFIG1_EXECPTION: coverpoint pkt.pmpcfg1_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }


    PMP_CONFIG2_EXECPTION: coverpoint pkt.pmpcfg2_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }


    PMP_CONFIG3_EXECPTION: coverpoint pkt.pmpcfg3_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }

    
    PMP_ADDR0_EXECPTION: coverpoint pkt.pmpaddr0_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
    PMP_ADDR1_EXECPTION: coverpoint pkt.pmpaddr1_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
    PMP_ADDR2_EXECPTION: coverpoint pkt.pmpaddr2_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
    PMP_ADDR3_EXECPTION: coverpoint pkt.pmpaddr3_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
   PMP_ADDR4_EXECPTION: coverpoint pkt.pmpaddr4_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
   PMP_ADDR5_EXECPTION: coverpoint pkt.pmpaddr5_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
   PMP_ADDR6_EXECPTION: coverpoint pkt.pmpaddr6_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
   PMP_ADDR7_EXECPTION: coverpoint pkt.pmpaddr7_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
   PMP_ADDR8_EXECPTION: coverpoint pkt.pmpaddr8_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
   PMP_ADDR9_EXECPTION: coverpoint pkt.pmpaddr9_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
   PMP_ADDR10_EXECPTION: coverpoint pkt.pmpaddr10_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
   PMP_ADDR11_EXECPTION: coverpoint pkt.pmpaddr11_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
  PMP_ADDR12_EXECPTION: coverpoint pkt.pmpaddr12_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
  PMP_ADDR13_EXECPTION: coverpoint pkt.pmpaddr13_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
  PMP_ADDR14_EXECPTION: coverpoint pkt.pmpaddr14_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }
  PMP_ADDR15_EXECPTION: coverpoint pkt.pmpaddr15_exception
    {
      bins bin_0 = {0};
      bins bin_1 = {1};
       
    }

REGION_EXCEPTION0: coverpoint pkt.region0_range_exception
    {
        bins bin_0 = {0};
          }


REGION_EXCEPTION1: coverpoint pkt.region1_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION2: coverpoint pkt.region2_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION3: coverpoint pkt.region3_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

REGION_EXCEPTION4: coverpoint pkt.region4_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

REGION_EXCEPTION5: coverpoint pkt.region5_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

REGION_EXCEPTION6: coverpoint pkt.region6_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

REGION_EXCEPTION7: coverpoint pkt.region7_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION8: coverpoint pkt.region8_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION9: coverpoint pkt.region9_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION10: coverpoint pkt.region10_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION11: coverpoint pkt.region11_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION12: coverpoint pkt.region12_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION13: coverpoint pkt.region13_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION14: coverpoint pkt.region14_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
REGION_EXCEPTION15: coverpoint pkt.region15_range_exception
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION0: coverpoint pkt.overlapping_region_exception0
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION1: coverpoint pkt.overlapping_region_exception1
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION2: coverpoint pkt.overlapping_region_exception2
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION3: coverpoint pkt.overlapping_region_exception3
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION4: coverpoint pkt.overlapping_region_exception4
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION5: coverpoint pkt.overlapping_region_exception5
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION6: coverpoint pkt.overlapping_region_exception6
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION7: coverpoint pkt.overlapping_region_exception7
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION8: coverpoint pkt.overlapping_region_exception8
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION9: coverpoint pkt.overlapping_region_exception9
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION10: coverpoint pkt.overlapping_region_exception10
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION11: coverpoint pkt.overlapping_region_exception11
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION12: coverpoint pkt.overlapping_region_exception12
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION13: coverpoint pkt.overlapping_region_exception13
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION14: coverpoint pkt.overlapping_region_exception14
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }

OVERLAP_EXCEPTION15: coverpoint pkt.overlapping_region_exception15
    {
        bins bin_0 = {0};
       bins bin_1 = {1};
   }
STORE_EXECPTION: coverpoint pkt.store_exception
{
   bins bin_0 = {0};
       bins bin_1 = {1};     
}

LOAD_EXECPTION: coverpoint pkt.load_exception
{
   bins bin_0 = {0};
       bins bin_1 = {1};     
}

VALID_WRITE_ACCESS: coverpoint pkt.valid_memory_access_write_address
{
   bins bin_0 = {0};
       bins bin_1 = {1};       
}

VALID_READ_ACCESS: coverpoint pkt.valid_memory_access_read_address
{
   bins bin_0 = {0};
       bins bin_1 = {1};       
}







/*
   CROSS1 : cross RESET,WRITE_ADDRESS,WRITE_EN,WRITE_DATA,PMP_CONFIG0_EXECPTION,PMP_CONFIG1_EXECPTION,PMP_CONFIG2_EXECPTION,PMP_CONFIG3_EXECPTION;//KERNEL_SIGNAL,MACHINE_SIGNAL,READ_OUT, PMP_CONFIG0_EXECPTION,PMP_CONFIG1_EXECPTION,PMP_CONFIG2_EXECPTION,PMP_CONFIG3_EXECPTION;
  PMP_ADDR0_EXECPTION,PMP_ADDR1_EXECPTION,PMP_ADDR2_EXECPTION,PMP_ADDR3_EXECPTION,PMP_ADDR4_EXECPTION,PMP_ADDR5_EXECPTION,PMP_ADDR6_EXECPTION,PMP_ADDR7_EXECPTION,PMP_ADDR8_EXECPTION,
  PMP_ADDR9_EXECPTION,PMP_ADDR10_EXECPTION,PMP_ADDR11_EXECPTION,PMP_ADDR12_EXECPTION,PMP_ADDR13_EXECPTION,PMP_ADDR14_EXECPTION,PMP_ADDR15_EXECPTION;


  CROSS2 : cross RESET,KERNEL_SIGNAL,MACHINE_SIGNAL, PMP_CONFIG0_EXECPTION,PMP_CONFIG1_EXECPTION,PMP_CONFIG2_EXECPTION,PMP_CONFIG3_EXECPTION;

  CROSS3 : cross  RESET,READ_ADDRESS,READ_EN,WRITE_DATA,PMP_CONFIG0_EXECPTION,PMP_CONFIG1_EXECPTION,PMP_CONFIG2_EXECPTION,PMP_CONFIG3_EXECPTION;
  
  CROSS4 : cross RESET,WRITE_ADDRESS,WRITE_EN,WRITE_DATA,PMP_ADDR1_EXECPTION,PMP_ADDR2_EXECPTION,PMP_ADDR3_EXECPTION,PMP_ADDR4_EXECPTION,PMP_ADDR5_EXECPTION,PMP_ADDR6_EXECPTION,PMP_ADDR7_EXECPTION;//,PMP_ADDR8_EXECPTION,
  //PMP_ADDR9_EXECPTION,PMP_ADDR10_EXECPTION,PMP_ADDR11_EXECPTION,PMP_ADDR12_EXECPTION,PMP_ADDR13_EXECPTION,PMP_ADDR14_EXECPTION,PMP_ADDR15_EXECPTION;

  CROSS5: cross RESET,KERNEL_SIGNAL,MACHINE_SIGNAL,WRITE_ADDRESS,WRITE_EN,WRITE_DATA,PMP_ADDR8_EXECPTION,
  PMP_ADDR9_EXECPTION,PMP_ADDR10_EXECPTION,PMP_ADDR11_EXECPTION,PMP_ADDR12_EXECPTION,PMP_ADDR13_EXECPTION,PMP_ADDR14_EXECPTION,PMP_ADDR15_EXECPTION;

 */


  endgroup

  function new(string name, uvm_component parent);
    super.new(name,parent);
    covgroup_pmp = new();
  endfunction 

  function void write(input pmp_seq_item_tb t);
      pkt = new();
      $cast(pkt,t); 
        covgroup_pmp.sample(); // cover group wil update bins onnly when cover group is sampled
      //end 
  endfunction

endclass


