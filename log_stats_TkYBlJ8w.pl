#!/usr/bin/perl
# Generated log statistics
use strict;
use warnings;

# Error statistics from log file
my %error_counts = (
    'critical' => 1,
    'error' => 3,
    'fatal' => 1,
);

# Print the statistics
print "Error Statistics:\n";
for my $error_type (sort keys %error_counts) {
    print "$error_type: $error_counts{$error_type}\n";
}
