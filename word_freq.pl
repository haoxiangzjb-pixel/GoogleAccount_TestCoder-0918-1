#!/usr/bin/perl
use strict;
use warnings;

# Check for correct number of arguments
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Hash to store word counts
my %word_count;

# Open and read the file
open my $fh, '<', $filename or die "Cannot open '$filename': $!";

while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and split into words (non-word characters act as delimiters)
    my @words = split /\W+/, lc($line);
    foreach my $word (@words) {
        # Skip empty strings resulting from split
        next if $word eq '';
        $word_count{$word}++;
    }
}

close $fh;

# Print the results
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}