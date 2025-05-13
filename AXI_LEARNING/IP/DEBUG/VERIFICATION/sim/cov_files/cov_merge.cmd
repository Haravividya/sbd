merge -out cov_merged_output test*
load -run ./cov_work/scope/cov_merged_output/
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -block 10
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -block 11
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -block 17
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -block 18
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -block 20
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_instruction_register_inst -block 21
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tdo_mux_inst -block 8
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.apb_master_inst -block 11
exclude -inst dtm_to_dm.debug_module_fsm_instnc -block 35
exclude -inst dtm_to_dm.debug_module_fsm_instnc -block 43
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 5.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 7.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 8.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 9.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 10.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 11.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 12.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 14.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 15.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 16.1
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -expression 17.1
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.data_reg01_instnc -expression 12.1
exclude -inst dtm_to_dm.debug_module_fsm_instnc -expression 7.1
exclude -inst dtm_to_dm.debug_module_fsm_instnc -expression 7.3
exclude -inst dtm_to_dm.debug_module_fsm_instnc -expression 8.1
exclude -inst dtm_to_dm.debug_module_fsm_instnc -expression 10.1
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.abstractcs_instnc -expression 13.2
exclude -inst dtm_to_dm -toggle {cmdtype[7-2],cmdtype[0]}

exclude -inst dtm_to_dm -toggle {command_reg[31-26]}
exclude -inst dtm_to_dm -toggle {command_reg[23-24],command_reg[18], postexec}
exclude -inst dtm_to_dm -toggle {paddr[7-31]}
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance -toggle {paddr[7-31]	, jtag_to_apb_addr[7-31]}
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst -toggle {dmi_address_out[7-31]	,  Reset_Out_In }
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -toggle {Reset }
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_instruction_register_inst -toggle { Reset }
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_data_register_inst -toggle {dmi_address_out[7-31] , jtag_idcode[31-0] , jtag_dtmcsr[31-0], jtag_dmiaccess[40-34], jtag_dmiaccess[1-0] , dtm_csr_dmi_hard_reset, dtm_csr_dmi_reset , dtm_csr_idle[2-0],dtm_csr_abits[5-0] , dtm_csr_dmi_stat[1-0], dtm_csr_version[3-0], dtm_csr_reg_out[15-10],dmi_address[6-0], dmi_op[1-0] , op_field[1-0] , Reset, dtm_csr_reg_out[9-7]}
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.apb_master_inst -toggle {apb_paddr[31-7] , paddr[31-7]}
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc -toggle {paddr[31-7] , postexec, command_reg[31-26] , command_reg[23-24] , command_reg[18] , cmdtype[7-2] , cmdtype[0], dmstatus_reg[31-25] , dmstatus_reg[23-20] , dmstatus_reg[15-14] , dmstatus_reg[7-2] , hartinfo_reg[31-0] , abstractcs_reg[31-13] , abstractcs_reg[11] , abstractcs_reg[7-0] , dmcontrol_reg[26-4]}
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc -toggle {paddr[31-7] , postexec, command_reg[31-26] , command_reg[23-24] , command_reg[18] , cmdtype[7-2] , cmdtype[0], dmstatus_reg[31-25] , dmstatus_reg[23-20] , dmstatus_reg[15-14] , dmstatus_reg[7-2] , hartinfo_reg[31-0] , abstractcs_reg[31-13] , abstractcs_reg[11] , abstractcs_reg[7-0] , dmcontrol_reg[26-4]}
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.abstractcs_instnc -toggle {addr[31-7] , command_reg[31-26] , command_reg[23-24] , command_reg[18] , cmdtype[7-2] , cmdtype[0] ,abstractcs_reg[31-13] , abstractcs_reg[11] , abstractcs_reg[7-0] , abstractcs_reg[31-13] , abstractcs_reg[11] , abstractcs_reg_a[20-2] , abstractcs_reg_a[0], abstractcs_reg_b[7-0]  }
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.command_instnc -toggle {addr[31-7] , command_reg[31-26] ,command_reg[31-26], command_reg[23-24] , command_reg[18]  }
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.hartinfo_instnc -toggle {hartinfo_reg[31-0]}
exclude -inst  dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.dmstatus_instnc -toggle {dmstatus_reg[31-20] , dmstatus_reg[15-14] , dmstatus_reg[7-2], dmstatus_reserved_a[6-0] , impebreak  , dmstatus_reserved_b[1-0], allnonexistent , anynonexistent, authenticated , authbusy, confstrptrvalid, version[3-2]}
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_mux_instnc -toggle {addr[31-7] , dmstatus_reg[31-25] , dmstatus_reg[23-20] , dmstatus_reg[15-14] , dmstatus_reg[7-2] , hartinfo_reg[31-0], command_reg[31-26] , command_reg[23-24] , command_reg[18], abstractcs_reg[31-13] , abstractcs_reg[11] , abstractcs_reg[7-0] , dmcontrol_reg[26-4]}
exclude -inst dtm_to_dm.debug_module_fsm_instnc -toggle {command[31-26] , command[23-24] , command[18] , postexec , present_state[3]  , next_state[3]}
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.data_reg01_instnc -toggle {cmdtype_r[7-2] , cmdtype_r[0], addr[32-7] , cmdtype[7-2] , cmdtype[0]}
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.dmcontrol_instnc -toggle {addr[32-7] , dmcontrol_reg[26-4]}
exclude -inst dtm_to_dm.apb_slave_dmreg_top_instnc.dm_register_file_instnc.dmstatus_instnc -toggle {hasresethaltreq, stickyunavail}
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.apb_master_inst -transition  present_state.ACCESS.SETUP
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.CAPTURE_DR.EXIT1_DR 
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.PAUSE_DR.EXIT2_DR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.EXIT1_DR.PAUSE_DR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.EXIT2_DR.UPDATE_DR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.EXIT2_DR.SHIFT_DR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.UPDATE_DR.SELECT_DR_SCAN
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.SELECT_IR_SCAN.TEST_LOGIC_RESET 
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.CAPTURE_IR.EXIT1_IR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.EXIT1_IR.PAUSE_IR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.PAUSE_IR.EXIT2_IR 
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.EXIT2_IR.UPDATE_IR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.EXIT2_IR.SHIFT_IR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -transition  TAP_state.UPDATE_IR.SELECT_DR_SCAN
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -state  TAP_state.PAUSE_DR 
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -state  TAP_state.EXIT2_DR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -state  TAP_state.PAUSE_IR
exclude -inst dtm_to_dm.jtag_apb_master_interface_instance.jtag_top_inst.jtag_tap_controller_instance -state  TAP_state.EXIT2_IR
report -detail -all -text -out cov_report.txt
report -detail -text -out cov_uncovered_report.txt
report -detail -html -out ./cov_report_html
