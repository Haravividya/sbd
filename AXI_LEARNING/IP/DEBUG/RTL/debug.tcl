clear -all
check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING}
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DEBUG/RTL/apb_slave_dmreg_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DEBUG/RTL/debug_module_fsm.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DEBUG/RTL/dm_register_file.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DEBUG/RTL/dm_register_mux.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DEBUG/RTL/dtm_to_dm.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/DEBUG/RTL/jtag_apb_master_interface.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_top.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_tap_controller.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_instruction_register.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_data_register.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jtag_tdo_mux.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/APB/RTL_SOURCE_FILES/APB_Master.sv} ;
elaborate -top {dtm_to_dm}
get_clock_info -gui
clock TCK -both_edges -factor 1 -phase 1
get_clock_info -gui
clock pclock -factor 1 -phase 1
reset -expression {!(presetn)};
check_superlint -extract  -task  . 
