check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_top.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_reg_file.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_op_mux.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_ctrl.sv} ;
elaborate -top {zic_mmr_top}
get_clock_info -gui
clock zic_clk -factor 1 -phase 1
reset -expression {!(zic_rst)};
check_superlint -extract  -task  .
