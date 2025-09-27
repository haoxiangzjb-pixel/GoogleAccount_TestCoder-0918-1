#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach john.doe+newsletter\@personal.net";

# Regular expression to match email addresses
# This regex looks for:
# - One or more word characters, dots, or hyphens (\w\.\-)+)
# - Followed by an @ symbol
# - Followed by one or more word characters or hyphens (\w\-)+
# - Followed by one or more groups of a dot and one or more word characters or hyphens (\.[\w\-]+)+
my @emails = $text =~ /[\w\.\-]+\@[\w\-]+(\.[\w\-]+)+/g;

print "Found the following email addresses:\n";
foreach my $email (@emails) {
    print " - $email\n";
}
