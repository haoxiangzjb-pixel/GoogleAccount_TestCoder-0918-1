#!/usr/bin/perl
use strict;
use warnings;

# Regular expression for matching email addresses
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Sample text to search for emails
my $text = '
Contact us at support@example.com or sales@company.org.
You can also reach John at john.doe+newsletter@gmail.com
or Jane at jane_doe123@sub.domain.co.uk for more information.
Invalid emails like @invalid.com or user@.com should not match.
';

# Find all email addresses in the text
my @emails = $text =~ /$email_regex/g;

print "Found email addresses:\n";
foreach my $email (@emails) {
    print "$email\n";
}