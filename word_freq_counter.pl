#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if the file exists
unless (-e $filename) {
    print "File '$filename' does not exist.\n";
    exit 1;
}

# Hash to store word frequencies
my %word_count;

# Open and read the file
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

while (my $line = <$fh>) {
    chomp $line;
    # Split the line into words based on non-word characters
    my @words = split(/\W+/, $line);
    foreach my $word (@words) {
        # Convert to lowercase for case-insensitive counting
        $word = lc($word);
        # Skip empty strings resulting from split
        if ($word ne '') {
            $word_count{$word}++;
        }
    }
}

close($fh);

# Print the word frequencies
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}