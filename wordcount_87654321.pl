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
    die "File '$filename' not found.\n";
}

# Open the file for reading
open(my $fh, '<', $filename) or die "Cannot open file '$filename': $!\n";

# Hash to store word frequencies
my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and remove punctuation
    $line =~ s/[^\w\s]//g;
    $line = lc($line);
    
    # Split line into words and count them
    my @words = split /\s+/, $line;
    foreach my $word (@words) {
        # Skip empty strings
        next if $word eq '';
        $word_count{$word}++;
    }
}

# Close the file
close($fh);

# Print word frequencies sorted by frequency (descending)
print "Word frequencies:\n";
for my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    print "$word: $word_count{$word}\n";
}