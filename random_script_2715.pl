#!/usr/bin/perl
# Script to count errors in a log file
my $log_file = $ARGV[0];
my $count = 0;
open(my $fh, "<", $log_file) or die "Cannot open $log_file: $!";
while (<$fh>) {
    $count++ if /\[ERROR\]/;
}
close($fh);
print "Total ERROR entries: $count\n";
