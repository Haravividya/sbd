# VERIFICATION (slave2)

The APB (Advanced Peripheral Bus) IP is verified extensively based on the UVM - Universal Verification Methodology.



Directory Structure:
```
APB
          ├─.....
          ├─.....
          ├─VERIFICATION
             ├─.....
             ├─APB_SLAVE2
                ├─UVME
                  ├──APB_SLAVE2_AGENTS      # contains driver and monitor
                  ├──APB_SLAVE2_ENVIROMENT  # contains scoreboard and reference model
                  ├──APB_SLAVE2_SEQUENCES   # contains randomized the sequences,sequence item 
                  ├──APB_SLAVE2_TESTS       # contains test cases to drive randomized sequences
                  ├──APB_SLAVE2_TOP         # contains interfaces and top file
                  ├──APB_SLAVE2_PACKAGES    # contains env,seq and test packages
		  └──comp_file.f 
                └──sim                      # contains run scripts and supporting scripts

                    

```

Files in this Directory

APB_SLAVE2_AGENTS

This contains APB_SLAVE2_AGENTS which drives and monitors the internal & external signals of design.

APB_SLAVE2_ENVIRONMENT

This contains scoreboard for comparison of actual RTL output against the expected output.

APB_SLAVE2_PACKAGES

It includes enviroment package, sequence package and test package. New sequence and tests need to be included here.

APB_SLAVE2_SEQUENCES

It includes sequencer, sequence item and Randomized sequences are generated for RTL Design verification.

APB_SLAVE2_TESTS

It includes testcases used to drive the randomized sequences.

APB_SLAVE2_TOP

It includes interface and the test_top.

sim

It includes runs script - apb_slave2_run.pl for running the standalone simulation and apb_slave2_regression.pl for running regressions.

comp_file.f

It Specifies the compilation sequence of UVM verification environment and RTL.

Pre-Requisites
Cadence® Xcelium™ Logic Simulator
Cadence® Xcelium™ Logic Simulation provides best-in-class core engine performance for SystemVerilog, VHDL, SystemC®, e, UVM, mixed signal, low power, and X-propagation. It leverages single-core and multi-core simulation technology for best individual test performance and machine learning-optimized regression technology for best regression throughput.

Perl
Steps to Run Standalone Tests
The apb_slave2_run.pl script is used to run standalone test.

To run the standalone test execute the command

perl apb_slave2_run.pl <test_type>
<test_type> can be found here.

TESTS

apb_slave2_test

apb_slave2_64_test

apb_slave2_rand_test

NOTE: Custom tests can be written inside APB_SLAVE2_TESTS and called.


Example
To Verify apb_slave2_test, the command would be
perl apb_slave2_run.pl apb_slave2_test  

Steps to Run Regressions
apb_slave2_regression.pl : perl script (in sim directory) to run regression by passing test_file. Add test_name and number of ittration of that test for regression in test_file.f.

To run regression without coverage :

perl apb_slave2_regression.pl test_file.f
To run regression with coverage :

perl apb_slave2_regression.pl test_file.f 1
```
## Files in this Directory

#### [APB_SLAVE2] (https://github.com/chandanhp/Zilla_IP_Verif/edit/main/APB/VERIFICATION/APB_SLAVE2)
   This contains `APB_SLAVE2` which contains uvm codes for apb slave2.


                
           


