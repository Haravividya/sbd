# ----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2019.12
# platform  : Linux 3.10.0-1160.66.1.el7.x86_64
# version   : 2019.12p002 64 bits
# build date: 2020.02.27 18:30:54 PST
# ----------------------------------------
# started   : 2023-04-10 12:22:38 IST
# hostname  : compute-srv3.eda.atme.in.eda.atme.in
# pid       : 30377
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:34082' '-style' 'windows' '-data' 'AQAAADx/////AAAAAAAAA3oBAAAAEABMAE0AUgBFAE0ATwBWAEUAAAAAAAAB4A==' '-proj' '/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/sgeuser56/Pictures/Working_SV_LINT/IP/JTAG/RTL_SOURCE_CODES/jgproject/.tmp/.initCmds.tcl'
check_superlint -init
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
clock TCK -both_edges -factor 1 -phase 1
check_superlint -extract  -task  .
clear -all



check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zilla_interrupt_control.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_irg.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/priority_resolve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/interrupt_recieve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_mmr_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_mmr_reg_file.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_mmr_op_mux.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_mmr_ctrl.sv} ; 
elaborate -top {zilla_interrupt_control}
get_clock_info -gui
clock zic_clk -factor 1 -phase 1
reset -expression {!(zic_rst)};
clear -all











check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zilla_interrupt_control.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_irg.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/priority_resolve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/interrupt_recieve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_top.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_reg_file.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_op_mux.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_ctrl.sv} ;
elaborate -top {zilla_interrupt_control}
get_clock_info -gui
clock zic_clk -factor 1 -phase 1
reset -expression {!(zic_rst)};
check_superlint -extract  -task  .
clear -all
check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zilla_interrupt_control.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_irg.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/priority_resolve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/interrupt_recieve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_top.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_reg_file.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_op_mux.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_ctrl.sv} ;
elaborate -top {zilla_interrupt_control}
get_clock_info -gui
clock zic_clk -factor 1 -phase 1
reset -expression {!(zic_rst)};
check_superlint -extract  -task  .
clear -all
check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zilla_interrupt_control.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_irg.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/priority_resolve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/interrupt_recieve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_top.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_reg_file.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_op_mux.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_ctrl.sv} ;
elaborate -top {zilla_interrupt_control}
get_clock_info -gui
clock zic_clk -factor 1 -phase 1
reset -expression {!(zic_rst)};
check_superlint -extract  -task  .
clear -all
check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zilla_interrupt_control.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_irg.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/priority_resolve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/interrupt_recieve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_top.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_reg_file.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_op_mux.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_ctrl.sv} ;
elaborate -top {zilla_interrupt_control}
get_clock_info -gui
clock zic_clk -factor 1 -phase 1
reset -expression {!(zic_rst)};
check_superlint -extract  -task  .
clear -all
check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zilla_interrupt_control.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_top.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/zic_irg.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/priority_resolve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/INTERRUPT_CONTROL/RTL_SOURCE_FILES/interrupt_recieve.sv} ; 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_top.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_reg_file.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_op_mux.sv} ;
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/ZIC_MEM_MAP/RTL_SOURCE_FILES/zic_mmr_ctrl.sv} ;
elaborate -top {zilla_interrupt_control}
get_clock_info -gui
clock zic_clk -factor 1 -phase 1
reset -expression {!(zic_rst)};
check_superlint -extract  -task  .
clear -all
check_superlint -init
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
config_rtlds -rule  -disable -category {AUTO_FORMAL_ARITHMETIC_OVERFLOW AUTO_FORMAL_BUS AUTO_FORMAL_CASE AUTO_FORMAL_DEAD_CODE AUTO_FORMAL_OUT_OF_BOUND_INDEXING} 
config_rtlds -rule  -enable -category {STRUCTURAL RACES BLACKBOX CODINGSTYLE SIM_SYNTH SYNTHESIS} 
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/WDT/RTL_SOURCE_FILES/WDT_TOP.sv} ; analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/WDT/RTL_SOURCE_FILES/WDT_REG_FILE.sv} ; analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/WDT/RTL_SOURCE_FILES/WDT_COUNTER.sv} ; 
elaborate -top {wdt_top}
get_clock_info -gui
clear -all
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
clear -all
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
clear -all
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
clear -all
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
clear -all





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
clock clk_i -factor 1 -phase 1
check_superlint -extract  -task  . 
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
elaborate -top {dtm_to_dm}
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
analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/APB/RTL_SOURCE_FILES/apb_slave_dmreg_top.sv} ;

analyze -sv12 {/home/sgeuser56/Pictures/Working_SV_LINT/IP/APB/RTL_SOURCE_FILES/APB_Master.sv} ;
elaborate -top {dtm_to_dm}
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
