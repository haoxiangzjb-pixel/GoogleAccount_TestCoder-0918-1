#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Contact us at support\@example.com or sales\@company.org for more information. 
You can also reach John at john.doe\@mail.com or Mary at mary123\@email.net";

# Regular expression to match email addresses
my $email_regex = qr/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/;

# Find all email addresses in the text
while ($text =~ /($email_regex)/g) {
    print "Found email: $1\n";
}