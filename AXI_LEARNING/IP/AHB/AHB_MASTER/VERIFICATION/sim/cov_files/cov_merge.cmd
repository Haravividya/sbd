merge -overwrite -out cov_merged_output1 test*
load -run ./cov_work/scope/cov_merged_output1/
exclude -inst ahb_master1 -block 78
exclude -inst ahb_master1 -block 104
report -detail -all -text -out cov_report.txt
report -detail -text -out cov_uncovered_report.txt
report -detail -html -out ./cov_report_html
