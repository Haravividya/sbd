clear -all
check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING}
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DIVIDER/RTL_SOURCE_FILES/zilla_divider.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DIVIDER/RTL_SOURCE_FILES/zilla_reminder.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DIVIDER/RTL_SOURCE_FILES/riscv_divider_32bit.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DIVIDER/RTL_SOURCE_FILES/riscv_divider_64bit.sv} ; 
elaborate -top {zilla_divider}
elaborate -top {zilla_reminder}
get_clock_info -gui
clock z_clk -factor 1 -phase 1
reset -expression {!(z_rst)};
check_superlint -extract  -task  . 
