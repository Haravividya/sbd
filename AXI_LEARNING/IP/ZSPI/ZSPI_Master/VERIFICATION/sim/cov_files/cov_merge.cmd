merge -overwrite -out cov_merged_output test*
load -run ./cov_work/scope/cov_merged_output

exclude -inst spi_top.DUT -toggle {cpol[0-0]}
exclude -inst spi_top.DUT -toggle {cpha[0-0]}
exclude -inst spi_top.DUT -expression 3
exclude -inst spi_top.DUT -expression 4

report -detail -all -text -out cov_report.txt
report -detail -text -out cov_uncovered_report.txt
report -detail -html -out ./cov_report_html

