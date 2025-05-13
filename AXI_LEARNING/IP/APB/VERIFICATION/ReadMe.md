# VERIFICATION (slave)

The APB (Advanced Peripheral Bus) IP is verified extensively based on the UVM - Universal Verification Methodology.

## Directory Structure:

```
APB
          ├─.....
          ├─.....
          ├─VERIFICATION
               ├─UVME
                   ├─.....
                   ├─APB_SLAVE
                         ├──apb_slave1.sv                   # contains RTL
                         ├──apb_slave1_agent.sv             # contains AGENT
                         ├──apb_slave1_driver.sv            # contains DRIVER 
                         ├──apb_slave1_env.sv               # contains ENVIRONMENT
                         ├──apb_slave1_interface.sv         # contains INTERFACE
                         ├──apb_slave1_monitor.sv           # contains MONITOR
                         ├──apb_slave1_pkg.sv               # contains PACKAGE FILE
                         ├──apb_slave1_scoreboard.sv        # contains SCOREBOARD
                         ├──apb_slave1_seq_item.sv          # contains SEQUENCE ITEM
                         ├──apb_slave1_sequence.sv          # contains SEQUENCE
                         ├──apb_slave1_sequencer.sv         # contains SEQUENCER
                         ├──apb_slave1_tb_top.sv            # contains TOP FILE
                         ├──apb_slave1_test.sv              # contains TEST CASES to drive randomized sequences
                         └───comp_file.f                    # contains COMP_FILE
                    ├─.....
                └──sim                                      # contains run scripts and supporting scripts
                    

```
## Files in this Directory

#### [APB_SLAVE] (https://github.com/chandanhp/Zilla_IP_Verif/tree/main/APB/VERIFICATION/UVME/APB_SLAVE)
   This contains `APB_SLAVE` which contains uvm codes for apb slave.


                
           

