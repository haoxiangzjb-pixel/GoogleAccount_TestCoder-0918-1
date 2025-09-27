#!/usr/bin/env perl
use strict;
use warnings;
use Getopt::Long;

my $input_file;
my $help = 0;

GetOptions(
    'file|f=s' => \$input_file,
    'help|h'   => \$help,
) or die "Error in command line arguments\n";

if ($help || !$input_file) {
    print "Usage: $0 --file <input_file.txt>\n";
    print "Reads a text file and prints word frequency.\n";
    exit 0;
}

open(my $fh, '<', $input_file) or die "Cannot open file '$input_file': $!";

my %word_count;
while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and split on non-alphabetic characters
    my @words = split /[^\p{L}]+/, lc($line);
    foreach my $word (@words) {
        next if $word eq ''; # Skip empty strings
        $word_count{$word}++;
    }
}

close($fh);

# Sort keys by frequency (descending) and then alphabetically
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    print "$word: $word_count{$word}\n";
}
