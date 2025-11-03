#!/usr/bin/perl
use strict;
use warnings;

# Regular expression to match email addresses
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Sample text to search for emails
my $text = 'Contact us at support@example.com or sales@company.org. You can also reach john.doe+newsletter@gmail.com for more information.';

# Find all email addresses in the text
my @emails = $text =~ /($email_regex)/g;

print "Found " . scalar(@emails) . " email addresses:\n";
foreach my $email (@emails) {
    print "- $email\n";
}

# Example of reading from a file and finding emails
print "\nSearching in file content:\n";
if (@ARGV) {
    my $filename = $ARGV[0];
    if (open(my $fh, '<', $filename)) {
        while (my $line = <$fh>) {
            chomp $line;
            my @line_emails = $line =~ /($email_regex)/g;
            foreach my $email (@line_emails) {
                print "Found in file: $email\n";
            }
        }
        close($fh);
    } else {
        print "Could not open file: $!\n";
    }
}