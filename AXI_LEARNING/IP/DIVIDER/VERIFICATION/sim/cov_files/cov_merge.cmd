merge -out cov_merged_output test*
load -run ./cov_work/scope/cov_merged_output/

exclude -inst div_top.DUT -toggle {opcode_i[31]}  
exclude -inst div_top.DUT -toggle {opcode_i[30]} 
exclude -inst div_top.DUT -toggle {opcode_i[29]}
exclude -inst div_top.DUT -toggle {opcode_i[29]}
exclude -inst div_top.DUT -toggle {opcode_i[28]}
exclude -inst div_top.DUT -toggle {opcode_i[27]}
exclude -inst div_top.DUT -toggle {opcode_i[26]}
exclude -inst div_top.DUT -toggle {opcode_i[25]}
exclude -inst div_top.DUT -toggle {opcode_i[24]}
exclude -inst div_top.DUT -toggle {opcode_i[23]}
exclude -inst div_top.DUT -toggle {opcode_i[22]}
exclude -inst div_top.DUT -toggle {opcode_i[21]}
exclude -inst div_top.DUT -toggle {opcode_i[20]}
exclude -inst div_top.DUT -toggle {opcode_i[19]}
exclude -inst div_top.DUT -toggle {opcode_i[18]}
exclude -inst div_top.DUT -toggle {opcode_i[17]}
exclude -inst div_top.DUT -toggle {opcode_i[16]}
exclude -inst div_top.DUT -toggle {opcode_i[15]}
exclude -inst div_top.DUT -toggle {opcode_i[14]}
exclude -inst div_top.DUT -toggle {opcode_i[11]}
exclude -inst div_top.DUT -toggle {opcode_i[10]}
exclude -inst div_top.DUT -toggle {opcode_i[9]}
exclude -inst div_top.DUT -toggle {opcode_i[8]}
exclude -inst div_top.DUT -toggle {opcode_i[7]}
exclude -inst div_top.DUT -toggle {opcode_i[6]}
exclude -inst div_top.DUT -toggle {opcode_i[5]}
exclude -inst div_top.DUT -toggle {opcode_i[4]}
exclude -inst div_top.DUT -toggle {opcode_i[3]}
exclude -inst div_top.DUT -toggle {opcode_i[2]}
exclude -inst div_top.DUT -toggle {opcode_i[1]}
exclude -inst div_top.DUT -toggle {opcode_i[0]}

exclude -inst div_top.DUT -toggle {opcode[31]}  
exclude -inst div_top.DUT -toggle {opcode[30]} 
exclude -inst div_top.DUT -toggle {opcode[29]}
exclude -inst div_top.DUT -toggle {opcode[29]}
exclude -inst div_top.DUT -toggle {opcode[28]}
exclude -inst div_top.DUT -toggle {opcode[27]}
exclude -inst div_top.DUT -toggle {opcode[26]}
exclude -inst div_top.DUT -toggle {opcode[25]}
exclude -inst div_top.DUT -toggle {opcode[24]}
exclude -inst div_top.DUT -toggle {opcode[23]}
exclude -inst div_top.DUT -toggle {opcode[22]}
exclude -inst div_top.DUT -toggle {opcode[21]}
exclude -inst div_top.DUT -toggle {opcode[20]}
exclude -inst div_top.DUT -toggle {opcode[19]}
exclude -inst div_top.DUT -toggle {opcode[18]}
exclude -inst div_top.DUT -toggle {opcode[17]}
exclude -inst div_top.DUT -toggle {opcode[16]}
exclude -inst div_top.DUT -toggle {opcode[15]}
exclude -inst div_top.DUT -toggle {opcode[14]}
exclude -inst div_top.DUT -toggle {opcode[11]}
exclude -inst div_top.DUT -toggle {opcode[10]}
exclude -inst div_top.DUT -toggle {opcode[9]}
exclude -inst div_top.DUT -toggle {opcode[8]}
exclude -inst div_top.DUT -toggle {opcode[7]}
exclude -inst div_top.DUT -toggle {opcode[6]}
exclude -inst div_top.DUT -toggle {opcode[5]}
exclude -inst div_top.DUT -toggle {opcode[4]}
exclude -inst div_top.DUT -toggle {opcode[3]}
exclude -inst div_top.DUT -toggle {opcode[2]}
exclude -inst div_top.DUT -toggle {opcode[1]}
exclude -inst div_top.DUT -toggle {opcode[0]}

exclude -inst div_top.DUT -toggle {div_rem_valid}

exclude -inst div_top.DUT -expression 1.1
exclude -inst div_top.DUT -expression 1.3
exclude -inst div_top.DUT -expression 1.5
exclude -inst div_top.DUT -expression 1.7
exclude -inst div_top.DUT -expression 1.9
exclude -inst div_top.DUT -expression 2.3
exclude -inst div_top.DUT -expression 2.5
exclude -inst div_top.DUT -expression 3.3
exclude -inst div_top.DUT -expression 3.5
exclude -inst div_top.DUT -expression 4.1
exclude -inst div_top.DUT -expression 8.1
exclude -inst div_top.DUT -expression 10.1
exclude -inst div_top.DUT -expression 11.3
exclude -inst div_top.DUT -expression 11.7
exclude -inst div_top.DUT -expression 13.1
exclude -inst div_top.DUT -expression 15.1

exclude -inst div_top.vif -toggle {opcode[31]}
exclude -inst div_top.vif -toggle {opcode[30]}
exclude -inst div_top.vif -toggle {opcode[29]}
exclude -inst div_top.vif -toggle {opcode[28]}
exclude -inst div_top.vif -toggle {opcode[27]}
exclude -inst div_top.vif -toggle {opcode[26]}
exclude -inst div_top.vif -toggle {opcode[25]}
exclude -inst div_top.vif -toggle {opcode[24]}
exclude -inst div_top.vif -toggle {opcode[23]}
exclude -inst div_top.vif -toggle {opcode[22]}
exclude -inst div_top.vif -toggle {opcode[21]}
exclude -inst div_top.vif -toggle {opcode[20]}
exclude -inst div_top.vif -toggle {opcode[19]}
exclude -inst div_top.vif -toggle {opcode[18]}
exclude -inst div_top.vif -toggle {opcode[17]}
exclude -inst div_top.vif -toggle {opcode[16]}
exclude -inst div_top.vif -toggle {opcode[15]}
exclude -inst div_top.vif -toggle {opcode[14]}
exclude -inst div_top.vif -toggle {opcode[11]}
exclude -inst div_top.vif -toggle {opcode[10]}
exclude -inst div_top.vif -toggle {opcode[9]}
exclude -inst div_top.vif -toggle {opcode[8]}
exclude -inst div_top.vif -toggle {opcode[7]}
exclude -inst div_top.vif -toggle {opcode[6]}
exclude -inst div_top.vif -toggle {opcode[5]}
exclude -inst div_top.vif -toggle {opcode[4]}
exclude -inst div_top.vif -toggle {opcode[3]}
exclude -inst div_top.vif -toggle {opcode[2]}
exclude -inst div_top.vif -toggle {opcode[1]}
exclude -inst div_top.vif -toggle {opcode[0]}





report -detail -all -text -out cov_report.txt
report -detail -text -out cov_uncovered_report.txt
report -detail -html -out ./cov_report_html
