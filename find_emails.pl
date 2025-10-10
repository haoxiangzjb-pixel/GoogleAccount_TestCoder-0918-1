#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach john.doe+newsletter\@sub.domain.co.uk.";

# Regular expression to find email addresses
# This regex looks for:
# - One or more word characters, dots, or hyphens ([\w\.\-]+)
# - An @ symbol
# - One or more word characters, dots, or hyphens ([\w\.\-]+)
# - A literal dot (\.)
# - One or more word characters (\w+)
my @emails = $text =~ /[\w\.\-]+\@[\w\.\-]+\.\w+/g;

print "Found the following email addresses:\n";
foreach my $email (@emails) {
    print "  - $email\n";
}