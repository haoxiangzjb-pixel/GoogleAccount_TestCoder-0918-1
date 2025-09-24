#!/usr/bin/perl
use strict;
use warnings;

# Текст для поиска
my $text = 'Please contact us at support@example.com or sales@company.org for more information. Invalid: @. Also valid: admin@sub.domain.co.uk';

# Регулярное выражение для поиска email
my @emails = $text =~ m/\b[\w\.\-]+@[\w\.\-]+\.\w{2,}\b/g;

# Вывод найденных email
print "Found emails: @emails\n";

# Сохраняем результат в файл со случайным именем
my $filename = "found_emails_" . int(rand(10000)) . ".txt";
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh "Found emails: @emails\n";
close $fh;

print "Results saved to $filename\n";