#!/usr/bin/perl
use strict;
use warnings;

# Check for input file argument
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

my $filename = $ARGV[0];

# Try to open the file
open(my $fh, '<', $filename) or die "Cannot open file '$filename': $!\n";

my %word_freq;

# Read file line by line
while (my $line = <$fh>) {
    # Extract words (alphanumeric sequences)
    while ($line =~ /(\w+)/g) {
        my $word = lc($1);  # Convert to lowercase for case-insensitive counting
        $word_freq{$word}++;
    }
}

close($fh);

# Print word frequencies in descending order
print "Word Frequency Count:\n";
print "---------------------\n";

foreach my $word (sort { $word_freq{$b} <=> $word_freq{$a} } keys %word_freq) {
    print "$word: $word_freq{$word}\n";
}
