merge -overwrite -out cov_merged_output test*
load -run ./cov_work/scope/cov_merged_output

exclude -inst ahb_slave -block 26
exclude -inst ahb_slave -block 43
exclude -inst ahb_slave -block 60
exclude -inst ahb_slave -block 84
exclude -inst ahb_slave -block 108

report -detail -all -text -out cov_report.txt
report -detail -text -out cov_uncovered_report.txt
report -detail -html -out ./cov_report_html
