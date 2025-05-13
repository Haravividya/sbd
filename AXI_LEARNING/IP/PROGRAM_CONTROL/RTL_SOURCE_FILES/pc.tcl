check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/PROGRAM_CONTROL/RTL_SOURCE_FILES/zpc_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/PROGRAM_CONTROL/RTL_SOURCE_FILES/zilla_program_control_fsm.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/PROGRAM_CONTROL/RTL_SOURCE_FILES/zilla_pc_update.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/PROGRAM_CONTROL/RTL_SOURCE_FILES/zilla_instruction_buffer.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/PROGRAM_CONTROL/RTL_SOURCE_FILES/z_exception_detect.sv} ; 
elaborate -top {zpc_top}
get_clock_info -gui
clock z_clk -factor 1 -phase 1
reset -expression {!(z_rst)};
check_superlint -extract  -task  .
