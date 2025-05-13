# VERIFICATION

The WDT(Watch Dog Timer) IP is verified extensively based on the UVM - Universal Verification Methodology.

## Directory Structure:

```
WDT
          ├─.....
          ├─.....
          ├─VERIFICATION
               ├─UVME
                  ├──WDT_AGENT       # contains driver and monitor
                  ├──WDT_ENVIROMENT  # contains scoreboard and reference model
                  ├──WDT_SEQUENCES   # contains randomized the sequences,sequence item 
                  ├──WDT_TESTS       # contains test cases to drive randomized sequences
                  ├──WDT_TOP         # contains interfaces and top file
                  ├──WDT_PACKAGES    # contains env,seq and test packages
                  └──sim             # contains run scripts and supporting scripts

```

## Files in this Directory

#### [WDT_AGENT](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/UVME/WDT_AGENT)
This contains `WDT_AGENT` which drives and monitors the internal & external signals of design.

#### [WDT_ENVIRONMENT](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/UVME/WDT_ENVIROMENT)
This contains `scoreboard` for comparison of actual RTL output against the expected output.

#### [WDT_SEQUENCES](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/UVME/WDT_SEQUENCES)
It includes sequencer, sequence item and Randomized sequences are generated for RTL Design verification.

#### [WDT_TESTS](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/UVME/WDT_TESTS)
It includes testcases used to drive the randomized sequences.

#### [WDT_TOP](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/UVME/WDT_TOP)
It includes interface and the test_top.

#### [WDT_PACKAGES](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/UVME/WDT_PACKAGES)
It includes enviroment package, sequence package and test package. New sequence and tests need to be included here.

#### [sim](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/sim)
It includes runs script - `wdt_run.pl` for running the standalone simulation and `wdt_regression.pl` for running regressions.

#### wdt_comp_file.f
It Specifies the compilation sequence of UVM verification environment and RTL.

## Pre-Requisites

#### Cadence® Xcelium™ Logic Simulator

[Cadence® Xcelium™ Logic Simulation](https://www.cadence.com/ko_KR/home/tools/system-design-and-verification/simulation-and-testbench-verification/xcelium-simulator.html) provides best-in-class core engine performance for SystemVerilog, VHDL, SystemC®, e, UVM, mixed signal, low power, and X-propagation. It leverages single-core and multi-core simulation technology for best individual test performance and machine learning-optimized regression technology for best regression throughput.

#### Perl

## Steps to Run Standalone Tests

The `wdt_run.pl` script is used to run standalone test.

To run the standalone test execute the command 

    perl wdt_run.pl <test_type> <case number>
    
**_<test_type>_** can be found [here](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/UVME/WDT_TESTS).

   TESTS                  CASES

* WDT_test               (01-17)
* WDT_word_test          (18-23)
* WDT_wait_test          (24-32)
* WDT_stop_test          (33-41)
* WDT_debug_test         (42-49)
* WDT_modes_test         (50-56)
* WDT_interrupt16_test   (57-68)
* WDT_interrupt32_test   (69-79)
* WDT_interrupt64_test   (80-90) (to verify single operation)

**NOTE: Custom tests can be written inside [WDT_TESTS](https://github.com/djay039/zilla_ip_verif/edit/main/WDT/VERIFICATION/UVME/WDT_TESTS) and called.**

###### Example

## To Verify wdt_wait_test with case number 25, the command would be

    perl wdt_run.pl wdt_wait_test 25 
           
## Steps to Run Regressions

`wdt_regression.pl` :  perl script (in sim directory) to run regression by passing test_list. Add test_name and number of ittration of that test for regression in test_list.f.
   
To run regression without coverage : 
                      
    perl wdt_regression.pl test_list.f
                
To run regression with coverage :
                      
    perl wdt_regression.pl test_list.f 1

                
           
