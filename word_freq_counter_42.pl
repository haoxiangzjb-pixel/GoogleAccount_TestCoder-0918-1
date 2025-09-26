#!/usr/bin/perl
use strict;
use warnings;

die "Usage: $0 <filename>\n" unless @ARGV == 1;

my $filename = $ARGV[0];
open my $fh, '<', $filename or die "Cannot open file '$filename': $!";

my %word_count;
while (my $line = <$fh>) {
    chomp $line;
    my @words = split /\s+/, $line;
    foreach my $word (@words) {
        $word =~ s/[^\w]//g; # Remove punctuation
        $word = lc $word;    # Convert to lowercase
        $word_count{$word}++ if $word; # Increment count if word is not empty
    }
}

close $fh;

# Print the results
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}