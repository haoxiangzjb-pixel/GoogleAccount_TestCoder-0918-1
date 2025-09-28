#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
die "Usage: $0 <filename>\n" unless @ARGV;

my $filename = $ARGV[0];

# Check if the file exists
die "File '$filename' does not exist.\n" unless -e $filename;

# Hash to store word frequencies
my %word_count;

# Open the file for reading
open my $fh, '<', $filename or die "Cannot open file '$filename': $!\n";

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (removing punctuation)
    for my $word (split /\W+/, lc $line) {
        # Skip empty strings that might result from splitting
        next if $word eq '';
        # Increment the count for the word
        $word_count{$word}++;
    }
}

# Close the file handle
close $fh;

# Print the word frequencies
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}