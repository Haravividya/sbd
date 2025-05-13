check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/AXI4_FULL/RTL/AXI_MASTER/axi_master.sv} ; 
elaborate -top {axi_master}
get_clock_info -gui
clock axi_aclk -factor 1 -phase 1
reset -expression {!(axi_areset_n)};
check_superlint -extract  -task  .
