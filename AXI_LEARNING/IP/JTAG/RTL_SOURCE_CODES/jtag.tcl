check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 

analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_top.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_tap_controller.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_instruction_register.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_data_register.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_tdo_mux.sv} ;
elaborate -top {jtag_top}
get_clock_info -gui
clock TCK -factor 1 -phase 1
reset -expression {!(TRST)};
check_superlint -extract  -task  .
