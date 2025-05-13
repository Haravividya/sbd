merge -out cov_merged_output test*
load -run ./cov_work/scope/cov_merged_output/

exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr0_inst -toggle {pmpcfg0_o[29-30]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr0_inst -toggle {pmpcfg0_o[21-22]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr0_inst -toggle {pmpcfg0_o[13-14]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr0_inst -toggle {pmpcfg0_o[5-6]}

exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr1_inst -toggle {pmpcfg1_o[29-30]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr1_inst -toggle {pmpcfg1_o[21-22]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr1_inst -toggle {pmpcfg1_o[13-14]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr1_inst -toggle {pmpcfg1_o[5-6]}

exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr2_inst -toggle {pmpcfg2_o[29-30]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr2_inst -toggle {pmpcfg2_o[21-22]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr2_inst -toggle {pmpcfg2_o[13-14]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr2_inst -toggle {pmpcfg2_o[5-6]}

exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr3_inst -toggle {pmpcfg1_o[29-30]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr3_inst -toggle {pmpcfg1_o[21-22]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr3_inst -toggle {pmpcfg1_o[13-14]}
exclude -inst pmpcsr_top.pmpcfg_csr_write_inst.pmpcfg_csr3_inst -toggle {pmpcfg1_o[5-6]}

exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr0_inst -toggle {pmpaddr0[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr1_inst -toggle {pmpaddr1[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr2_inst -toggle {pmpaddr2[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr3_inst -toggle {pmpaddr3[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr4_inst -toggle {pmpaddr4[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr5_inst -toggle {pmpaddr5[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr6_inst -toggle {pmpaddr6[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr7_inst -toggle {pmpaddr7[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr8_inst -toggle {pmpaddr8[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr9_inst -toggle {pmpaddr9[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr10_inst -toggle {pmpaddr10[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr11_inst -toggle {pmpaddr11[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr12_inst -toggle {pmpaddr12[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr13_inst -toggle {pmpaddr13[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr14_inst -toggle {pmpaddr14[0-1]}
exclude -inst pmpcsr_top.pmpaddr_csr_write_inst.pmpaddr_csr15_inst -toggle {pmpaddr15[0-1]}


exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg0_o[29-30]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg0_o[21-22]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg0_o[13-14]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg0_o[5-6]}

exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg1_o[29-30]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg1_o[21-22]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg1_o[13-14]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg1_o[5-6]}

exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg2_o[29-30]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg2_o[21-22]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg2_o[13-14]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg2_o[5-6]}

exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg3_o[29-30]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg3_o[21-22]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg3_o[13-14]}
exclude -inst pmpcsr_top.pmpcsr_read_inst -toggle {pmpcfg3_o[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -block 10
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 18
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 26
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 42
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 50
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 58
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 66
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 74
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 82
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 90
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 98
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 106
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 114
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 122
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 130
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 165
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 199
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 233
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 267
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 301
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 335
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 369
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 403
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 437
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 471
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 505
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 539
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 573
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 607
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 641
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 675
exclude -inst pmpcsr_top.pmp_address_matching_inst -block 1333

exclude -inst pmpcsr_top.pmp_address_matching_inst -expression 34.1



exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg0_o[29-30]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg0_o[21-22]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg0_o[13-14]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg0_o[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg1_o[29-30]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg1_o[21-22]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg1_o[13-14]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg1_o[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg2_o[29-30]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg2_o[21-22]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg2_o[13-14]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg2_o[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg3_o[29-30]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg3_o[21-22]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg3_o[13-14]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg3_o[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address0[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address1[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address2[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address3[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address4[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address5[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address6[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address7[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address8[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address9[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address10[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address11[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address12[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address13[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address14[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {start_address15[32-34]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle region0_range_exception

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg0_r[29-30]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg0_r[21-22]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg0_r[13-14]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg0_r[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg1_r[29-30]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg1_r[21-22]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg1_r[13-14]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg1_r[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg2_r[29-30]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg2_r[21-22]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg2_r[13-14]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg2_r[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg3_r[29-30]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg3_r[21-22]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg3_r[13-14]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {pmpcfg3_r[5-6]}

exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position0[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position1[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position2[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position3[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position4[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position5[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position6[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position7[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position8[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position9[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position8[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position9[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position10[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position11[0-2]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position12[0-2]} 
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position13[0-2]}  
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position14[0-2]}
exclude -inst pmpcsr_top.pmp_address_matching_inst -toggle {zerobit_position15[0-2]}  
report -detail -all -text -out cov_report.txt
report -detail -text -out cov_uncovered_report.txt
report -detail -html -out ./cov_report_html
