check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING}
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/APB/RTL_SOURCE_FILES/APB_Master.sv} ; 
elaborate -top {apb_master}
get_clock_info -gui
clock pclock -factor 1 -phase 1
reset -expression {!(presetn)};
check_superlint -extract 
