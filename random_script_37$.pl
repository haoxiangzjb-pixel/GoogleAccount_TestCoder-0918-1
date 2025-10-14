#!/usr/bin/perl
use strict;
use warnings;

# Пример текста с email
my $text = 'Contact us at support@example.com or sales@company.org for more info. Invalid: @.com or valid.person@domain.co.uk';

# Регулярное выражение для поиска email
# Простая версия: \b[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,}\b
my $email_regex = qr/\b[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,}\b/;

# Поиск и вывод всех найденных email
while ($text =~ /$email_regex/g) {
    print "Найден email: $&\n";
}
