#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach john.doe+newsletter\@test.co.uk";

# Regular expression to find email addresses
my @emails = $text =~ /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "  $email\n";
}

# Example of finding emails in a file or user input could go here