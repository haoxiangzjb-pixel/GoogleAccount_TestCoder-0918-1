#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was provided
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

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

# Hash to store word frequencies
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words
    # This regex considers words as sequences of alphanumeric characters and apostrophes
    my @words = map { s/^\W+|\W+$//gr } split /\s+/,$line;
    
    # Count each word
    foreach my $word (@words) {
        # Remove leading/trailing punctuation and convert to lowercase
        $word = lc($word);
        $word =~ s/^\W+|\W+$//g;
        
        # Skip empty strings
        next if $word eq '';
        
        $word_count{$word}++;
    }
}

close($fh);

# Print the word frequencies, sorted by count (descending)
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";

# Sort by frequency (descending) then alphabetically for ties
for my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}