#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing emails
my $text = "Contact us at support\@example.com or sales\@company.org for more information. Invalid: @.com";

# Regular expression to match emails
my @emails = $text =~ /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "$email\n";
}