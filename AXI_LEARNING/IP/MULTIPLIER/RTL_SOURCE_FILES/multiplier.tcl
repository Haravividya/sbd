clear -all
check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING}
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/multiplier_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/carry_skip_4bit.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/carry_skip_48bit.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/cla_adder_4bit.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/cla_adder_6bit.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/cla_adder_12bit.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/cla_adder_8bit.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/cla_adder_16bit.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/cla_adder_24bit.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/csa_48bit.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/csa_96bit.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/full_adder.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/half_adder.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/vedic_2x2.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/vedic_4x4.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/vedic_8x8.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/vedic_16x16.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/vedic_32x32.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/MULTIPLIER/RTL_SOURCE_FILES/vedic_64x64.sv} ; 
elaborate -top {z_multiplier}
get_clock_info -gui
clock z_clk -factor 1 -phase 1
reset -expression {!(z_rst)};
check_superlint -extract  -task  . 
