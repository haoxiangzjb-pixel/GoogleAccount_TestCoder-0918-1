#!/usr/bin/perl
use strict;
use warnings;

# Пример текста с email'ами
my $text = 'Контакты: john@example.com, info@company.org, а также support@website.net';

# Регулярное выражение для поиска email
my @emails = $text =~ /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/g;

print "Найденные email'ы:\n";
foreach my $email (@emails) {
    print "$email\n";
}