check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/CSR/RTL_SOURCE_FILES/csr_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/CSR/RTL_SOURCE_FILES/csr_register_file.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/CSR/RTL_SOURCE_FILES/mhpm_counter_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/CSR/RTL_SOURCE_FILES/csr_read_mux.sv} ; 
elaborate -top {csr_top}
get_clock_info -gui
clock csr_clk -factor 1 -phase 1
reset -expression {!(csr_rst)};
check_superlint -extract  -task  .
