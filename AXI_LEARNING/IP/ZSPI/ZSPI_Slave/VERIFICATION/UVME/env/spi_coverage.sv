/*************************************************
Project:Spi_slave
Author: B Bhagavantu
File name:spi_coverage.sv
Description: 
// Functional coverage_tb
// covergroup and cover points
// bins
// cross coverage
// command to enable coverage: xrun -coverage all
// to open Cadence IMC tool : imc & -> open UCDB file in IMC to read the coverage dump
**************************************************/


class spi_coverage extends uvm_subscriber #(spi_seq_item); 
// uvm_subscriber is a standard uvm component to implement coverage : this will be analysis import 
    
  //factory registration
  `uvm_component_utils(spi_coverage)
  
  spi_seq_item txn;      // sequence item handle
     
  // Covergroup 
  covergroup covgroup_spi_slave;
     

    RESET : coverpoint txn.reset // 1 bit
    { bins bin_value_0 = {0};
      bins bin_value_1 = {1};
    }

    LOAD : coverpoint txn.load // 1 bit
    { bins bin_value_0 = {0};
      bins bin_value_1 = {1};
    }

    RX_E : coverpoint txn.rx_e // 1 bit
    { bins bin_value_0 = {0};
      bins bin_value_1 = {1};
    }

    MOSI : coverpoint txn.mosi // 1 bit
    { bins bin_value_0 = {0};
      bins bin_value_1 = {1};
    }

    
   DATA_IN : coverpoint txn.data_in // 8bit
    {
      bins bin_0 = {[0:15]};
      bins bin_1 = {[16:31]};
      bins bin_2 = {[32:47]};
      bins bin_3 = {[33:63]};
      bins bin_4 = {[64:79],[80:111]};
      bins bin_5 = {[112:150],[151:181]};
      bins bin_6 = {[182:220],[221:255]};

    } 

    DATA_OUT : coverpoint txn.data_out // 8bit
    {
      //option.auto_bin_max = 4;
      bins bin_0 = {[0:15]};
      ignore_bins bin_1 = {[16:31]};
      ignore_bins bin_2 = {[32:47]};
      ignore_bins bin_3 = {[33:63]};
      ignore_bins bin_4 = {[64:79],[80:181]};  
      bins bin_5 = {[182:220],[221:255]};

    } 
    
    MISO : coverpoint txn.miso // 1 bit
    { 	  
      bins bin_value_0 = {0};
      bins bin_value_1 = {1};
    }

    SS : coverpoint txn.ss // 1 bit
    { 	  
      bins bin_value_0 = {0};
      bins bin_value_1 = {1};
    }

    
    TX_DONE : coverpoint txn.tx_done // 1 bit
    { 	  
      bins bin_value_0 = {0};
      bins bin_value_1 = {1};
    }

    RX_DONE : coverpoint txn.rx_done // 1 bit
    { 	  
      bins bin_value_0 = {0};
      bins bin_value_1 = {1};
    }



    CROSS_COVERAGE: cross SS,RESET,LOAD,DATA_IN;    //cross coverage

  endgroup
  
  //constructor
  function new(string name, uvm_component parent);
    super.new(name,parent);
    covgroup_spi_slave = new();
  endfunction 

  //write function
  virtual function void write(input spi_seq_item t);
    txn = new();
    $cast(txn, t);    
    covgroup_spi_slave.sample(); 
    //cover group will update bins only when cover group is sampled
  endfunction

endclass
