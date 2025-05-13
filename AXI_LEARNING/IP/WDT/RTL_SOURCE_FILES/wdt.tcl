check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/WDT/RTL_SOURCE_FILES/WDT_TOP.sv} ; analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/WDT/RTL_SOURCE_FILES/WDT_REG_FILE.sv} ; analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/WDT/RTL_SOURCE_FILES/WDT_COUNTER.sv} ; 
elaborate -top {wdt_top}
get_clock_info -gui
clock wdt_clk_i -factor 1 -phase 1
reset -expression {!(wdt_rst_i)};
check_superlint -extract  -task  . 
