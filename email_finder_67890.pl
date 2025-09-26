#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given string using a regular expression.

my $text = 'Please contact us at support@example.com or sales@company.org for more information. Invalid: @.com or user@.com';

# Regular expression to match a basic email address
# It looks for:
# - One or more word characters, dots, hyphens, or underscores (\w+[-.\w]*)
# - An '@' symbol
# - One or more word characters, dots, or hyphens ([a-zA-Z0-9.-]+)
# - A dot followed by two or more letters (\.[a-zA-Z]{2,})
my $email_regex = qr/[\w\.\-]+@[\w\.\-]+\.\w+/;

my @emails = $text =~ /($email_regex)/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "- $email\n";
}