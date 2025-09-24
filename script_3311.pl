#!/usr/bin/perl

my $log_file = '/workspace/error.log';
my $count = 0;
open my $fh, '<', $log_file or die "Cannot open $log_file: $!";
while (my $line = <$fh>) {
    if ($line =~ /ERROR/) {
        $count++;
    }
}
close $fh;
print "Total errors found: $count\n";

