#!/usr/bin/perl
use strict;
use warnings;

# Регулярное выражение для поиска email адресов
# Этот паттерн простой и подходит для базовых адресов
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/;

# Пример строки для поиска
my $text = "Контактные данные: john.doe\@example.com, jane_smith\@test.org и admin\@localhost.";

# Поиск всех совпадений
my @emails = $text =~ /$email_regex/g;

print "Найденные email адреса:\n";
foreach my $email (@emails) {
    print "- $email\n";
}