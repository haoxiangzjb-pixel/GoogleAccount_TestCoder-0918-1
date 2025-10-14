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
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Open the file for reading
open my $fh, '<', $filename or die "Cannot open '$filename': $!";

my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    # Split the line into words (separated by whitespace)
    my @words = split /\s+/, $line;

    foreach my $word (@words) {
        # Remove non-word characters (punctuation) and convert to lowercase
        $word =~ s/[^\w]//g;
        $word = lc($word);
        # Increment the count if the word is not empty
        $word_count{$word}++ if $word;
    }
}

# Close the file handle
close $fh;

# Print the word counts, sorted alphabetically
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}