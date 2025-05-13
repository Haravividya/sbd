################# JTAG RUN SCRIPT FOR INDIVIDUAL TEST ###############################

##Command to run this scrpit with coverage : "perl jtag_run.pl <test name> <1>"
# test name : this is the name of the test that you want to run
# 1 : This argument is given if you want coverage report of that test run 
#
##Command to run this scrpit without coverage : "perl jtag_run.pl <test name>"
# test name : this is the name of the test that you want to run

#####################################################################################

#!/usr/bin/perl -w
use strict;
use FileHandle;
use Cwd qw(cwd);
use File::Path;
use List::Util qw(shuffle);
system("figlet -c Project-Z");

my $simulateFlag  = 1;
my ($day,$mon)    = (localtime)[3..5];
my $date          = sprintf("%02d_%02d",$day,$mon+1);
my $pwd           = cwd;
my $outdir        = "$pwd/${date}_report";
my $test          = $ARGV[0];
my $cov_en        = $ARGV[1];
my @pass_tests    = ();
my @fail_tests    = ();
my $in_count      = 0;
my $out_count     = 0;

#system("mkdir ../CSR_RTL");
#system("cp ../../RTL_SOURCE_FILES/* ../CSR_RTL");

if($simulateFlag) 
{
    simulate_test();
}

sub simulate_test 
{
  my $pass = 0;
  my $seed = int (rand(100000));
  
  if(defined $cov_en)
    {
      system("xrun -access +rwc -f ./comp_file.f -svseed $seed +UVM_TESTNAME=$test  +define+UVM_REPORT_DISABLE_FILE_LINE -coverage all -covdut csr_top -covworkdir /cov_work -covoverwrite -covfile ./cov_files/cov_cmd.cf -uvmhome CDNS-1.1d"); 
    }
    else
    {  
      system("xrun -access +rwc -f ./comp_file.f -svseed $seed +UVM_TESTNAME=$test  +define+UVM_REPORT_DISABLE_FILE_LINE -uvmhome CDNS-1.1d"); 
    }

  if(open(FILE, "<", "xrun.log")) 
  {
    my $f = do {local $/;<FILE>};
    $pass = ($f =~ /UVM_ERROR\s*:\s*0\s*.*UVM_FATAL\s*:\s*0\s*/);
    my $simdir = "${outdir}/${test}_${seed}";
    mkpath($simdir) unless (-d $simdir);
    if(open (FILE1,'>',"${simdir}/${test}_${seed}.log"))
    {   
        print FILE1 $f;
    }
    close (FILE1);  
     
    system("mv ./wave.shm ${simdir}/");
  
    if(defined $cov_en)
  {
       system("imc -exec ./cov_files/cov_merge.cmd");   
       system("mv cov_report.txt ${outdir}/");
       system("mv cov_report_html ${outdir}/");
       system("mv cov_uncovered_report.txt  ${outdir}/");
       system("rm imc.log");
       system("rm mdv.log");
       system("rm imc.key"); 
       system("rm -r cov_work");

  }

  }
  open(FILE2, ">>", "${outdir}/${date}_report.log") or die $!;
  if($pass)
  {
     print FILE2 "test_name:${test}  case :ALL  seed:${seed}  status:PASS\n"; 
  }
  else 
  {
     print FILE2 "test_name : ${test}     case : ALL     seed : ${seed}     status : FAIL\n";
  }
    
  close(FILE2);
  print "\n";
  system("cat ${outdir}/${date}_report.log");
  close (FILE);
}              

system("rm -rf x*");
#system("rm -r ../CSR_RTL");

exit 0; 
