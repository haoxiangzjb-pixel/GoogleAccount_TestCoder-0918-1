#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Please reach out to john.doe\@company.com or admin\@site.net. You can also contact info\@example.org for general inquiries.";

# Regular expression to find email addresses
# Explanation:
# [\w\.\-]+ : matches one or more word characters (letters, digits, underscore), dots, or hyphens (for the local part)
# \@       : matches the literal '@' symbol
# [\w\.\-]+ : matches one or more word characters, dots, or hyphens (for the domain name)
# \.       : matches the literal dot before the TLD
# \w+      : matches one or more word characters (for the TLD, like com, org, net)
my @emails = $text =~ /[\w\.\-]+\@[\w\.\-]+\.\w+/g;

# Print the found email addresses
if (@emails) {
    print "Found the following email addresses:\n";
    foreach my $email (@emails) {
        print "  - $email\n";
    }
} else {
    print "No email addresses found in the text.\n";
}
