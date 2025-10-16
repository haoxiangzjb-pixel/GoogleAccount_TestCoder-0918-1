#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing an email
my $text = "Please contact us at support\@example.com for more information.";

# Regular expression to find email
my ($email) = $text =~ /(\S+@\S+\.\S+)/;

if ($email) {
    print "Found email: $email\n";
} else {
    print "No email found.\n";
}