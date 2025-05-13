##  INTERRUPT_CONTROL_RTL folder has the RTL source files related to interrupt controller (zic + mmr )
#  Structure :
#  INTERRUPT_CONTROL_RTL  

    |----zic rtl files
    |----zilla_interrupt_control.v
    |----zilla_interrupt_control_compile_list.f
     
 `interrupt control` folder has source files related to stand-alone interrupt controller (without memory mapped register)
 
 `zic_mmr` has source files related to stand-alone memory mapped register(without zic)
 
 `zic_interrupt_control.v` is top module for zic+zic_mmr (interrupt controller along with memory mapped register)
 
 `zilla_interrupt_control_compile_list.f` is the compile list for zic+zic_mmr combination
 
 To verify the standlone zic use zic_top.v as top module
 
