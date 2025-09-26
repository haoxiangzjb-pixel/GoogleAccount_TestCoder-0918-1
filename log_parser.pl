#!/usr/bin/perl
use strict;
use warnings;

my $log_file = $ARGV[0] || "/workspace/error.log";

my $count = 0;
open(my $fh, "<", $log_file) or die "Could not open file '$log_file' $!";
while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /^\[ERROR\]/) {
        $count++;
    }
}
close($fh);

my $random_num = int(rand(10000));
my $script_file = "/workspace/stats_script_$random_num.pl";

open(my $out_fh, ">", $script_file) or die "Could not create script file '$script_file' $!";
print $out_fh "#!/usr/bin/perl\n";
print $out_fh "use strict;\n";
print $out_fh "use warnings;\n";
print $out_fh "\n";
print $out_fh "my \$log_file = '$log_file';\n";
print $out_fh "my \$error_count = $count;\n";
print $out_fh "\n";
print $out_fh "print \"Total errors found in log file: \$error_count\\n\";\n";

close($out_fh);

print "Script created: $script_file\n";
print "Total errors found: $count\n";