#!/usr/bin/perl
use strict;
use warnings;

open my $fh, '<', '/workspace/error.log' or die "Cannot open log file: $!";
my $count = 0;
while (<$fh>) {
    $count++ if /ERROR/;
}
close $fh;

my $random_name = int(rand(10000)) . '.pl';
open my $out_fh, '>', $random_name or die "Cannot create output script: $!";
print $out_fh "#!/usr/bin/perl\nprint 'Total errors found: $count\\n';\n";
close $out_fh;

print "New script created: $random_name\n";