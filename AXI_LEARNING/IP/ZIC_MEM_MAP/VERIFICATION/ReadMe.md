# VERIFICATION

The ZIC MEM MAP(Interrupt controller memory mapped registers) IP is verified extensively based on the UVM - Universal Verification Methodology.

## Directory Structure:

```
ZIC MEM MAP
           ├─.....
           ├─.....
           ├─VERIFICATION
               ├─UVME
                  ├──ZIC_MEM_AGENTS      # contains driver and monitor
                  ├──ZIC_MEM_ENVIROMENT  # contains scoreboard and reference model
                  ├──ZIC_MEM_SEQUENCES   # contains randomized the sequences,sequence item 
                  ├──ZIC_MEM_TESTS       # contains test cases to drive randomized sequences
                  ├──ZIC_MEM_TOP         # contains interfaces and top file
                  ├──ZIC_MEM_PACKAGES    # contains env,seq and test packages
                  └──sim                 # contains run scripts and supporting scripts

```

## Files in this Directory

#### [ZIC_MEM_AGENTS](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/UVME/ZIC_MEM_AGENTS)
This contains `ZIC_MEM_AGENTS` which drives and monitors the internal & external signals of design.

#### [ZIC_MEM_ENVIRONMENT](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/UVME/ZIC_MEM_ENVIRONMENT)
This contains `scoreboard` for comparison of actual RTL output against the expected output.

#### [ZIC_MEM_SEQUENCES](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/UVME/ZIC_MEM_SEQUENCES)
It includes sequencer, sequence item and Randomized sequences are generated for RTL Design verification.

#### [ZIC_MEM_TESTS](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/UVME/ZIC_MEM_TESTS)
It includes testcases used to drive the randomized sequences.

#### [ZIC_MEM_TOP](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/UVME/ZIC_MEM_TOP)
It includes interface and the test_top.

#### [ZIC_MEM_PACKAGES](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/UVME/ZIC_MEM_PACKAGES)
It includes enviroment package, sequence package and test package. New sequence and tests need to be included here.

#### [sim](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/SIM)
It includes runs script - `csr_run.pl` for running the standalone simulation and `csr_regression.pl` for running regressions.

#### ZIC_MEM_comp_file.f
It Specifies the compilation sequence of UVM verification environment and RTL.

## Pre-Requisites

#### Cadence® Xcelium™ Logic Simulator

[Cadence® Xcelium™ Logic Simulation](https://www.cadence.com/ko_KR/home/tools/system-design-and-verification/simulation-and-testbench-verification/xcelium-simulator.html) provides best-in-class core engine performance for SystemVerilog, VHDL, SystemC®, e, UVM, mixed signal, low power, and X-propagation. It leverages single-core and multi-core simulation technology for best individual test performance and machine learning-optimized regression technology for best regression throughput.

#### Perl

## Steps to Run Standalone Tests

The `zic_mem_run.pl` script is used to run standalone test.

To run the standalone test execute the command 

    perl zic_mem_run.pl <test_type> 
    
**_<test_type>_** can be found [here](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/UVME/ZIC_MEM_TESTS).

   TESTS

* zic_mem_test
* zic_mem_rand_test 

**NOTE: Custom tests can be written inside [ZIC_MEM_TESTS](https://github.com/chandanhp/Zilla_IP_Verif/tree/main/ZIC_MEM_MAP/VERIFICATION/UVME/ZIC_MEM_TESTS) and called.**

###### Example

## To Verify csr_test the command would be

    perl zic_mem_run.pl zic_mem_test 
           
## Steps to Run Regressions

`zic_mem_regression.pl` :  perl script (in sim directory) to run regression by passing test_list. Add test_name and number of ittration of that test for regression in test_list.f.
   
To run regression without coverage : 
                      
    perl zic_mem_regression.pl test_list.f
                
To run regression with coverage :
                      
    perl zic_mem_regression.pl test_list.f 1

                
           
  
