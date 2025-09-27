#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
die "Usage: $0 <filename>\n" unless @ARGV;

my $filename = $ARGV[0];
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

my %word_count;

while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and split into words (sequences of letters/digits)
    for my $word (split /\W+/, lc $line) {
        next if $word eq ''; # Skip empty strings
        $word_count{$word}++;
    }
}

close($fh);

# Print the word counts
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}