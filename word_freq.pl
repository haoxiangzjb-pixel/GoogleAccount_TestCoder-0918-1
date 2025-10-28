#!/usr/bin/perl
use strict;
use warnings;

# Check if filename is provided
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

# Open the file
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

# Hash to store word frequencies
my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words (alphanumeric characters)
    $line = lc($line);
    while ($line =~ /(\w+)/g) {
        $word_count{$1}++;
    }
}

close($fh);

# Print word frequencies in descending order
print "Word frequencies in '$filename':\n";
for my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    print "$word: $word_count{$word}\n";
}