#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach admin\@test.net";

# Regular expression to find email addresses
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(\.[\w\-]+)/g;

# For full email matches (without just the extension), we can use:
my @full_emails = $text =~ /[\w\.\-]+@[\w\-]+\.[\w\-]+/g;

# Print found email addresses
print "Found email extensions: @emails\n";
print "Found full emails: @full_emails\n";

# Optional: Print each full email on a separate line
print "List of full emails:\n";
foreach my $email (@full_emails) {
    print "  $email\n";
}