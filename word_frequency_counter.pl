#!/usr/bin/perl
use strict;
use warnings;

# Check if filename is provided as command line argument
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    die "Error: File '$filename' does not exist.\n";
}

# Open the file for reading
open(my $fh, '<', $filename) or die "Error opening file '$filename': $!\n";

# Hash to store word frequencies
my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase for case-insensitive counting
    $line = lc($line);
    
    # Remove punctuation and split into words
    $line =~ s/[^\w\s]//g;
    
    # Split line into words
    my @words = split(/\s+/, $line);
    
    # Count each word
    foreach my $word (@words) {
        # Skip empty strings
        next if $word eq '';
        
        # Increment count for this word
        $word_count{$word}++;
    }
}

# Close the file
close($fh);

# Print word frequencies sorted by frequency (descending)
print "Word Frequencies (sorted by count):\n";
print "=" x 35 . "\n";
for my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    printf "%-15s: %d\n", $word, $word_count{$word};
}

print "\n";

# Print word frequencies sorted alphabetically
print "Word Frequencies (sorted alphabetically):\n";
print "=" x 35 . "\n";
for my $word (sort keys %word_count) {
    printf "%-15s: %d\n", $word, $word_count{$word};
}