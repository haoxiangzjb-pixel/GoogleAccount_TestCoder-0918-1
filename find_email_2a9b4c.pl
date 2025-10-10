#!/usr/bin/perl
use strict;
use warnings;

# Регулярное выражение для поиска email адресов
# Этот паттерн упрощён и подходит для базовых адресов
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Пример строки для поиска (используем q// для избежания интерполяции)
my $text = q{Пожалуйста, свяжитесь с нами по адресу support@example.com или на backup.email@sub.domain.org для получения дополнительной информации.};

# Поиск всех email адресов в строке
my @emails = $text =~ /($email_regex)/g;

print "Найденные email адреса:\n";
foreach my $email (@emails) {
    print "- $email\n";
}
