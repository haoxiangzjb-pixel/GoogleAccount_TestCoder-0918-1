#!/usr/bin/perl
use strict;
use warnings;

# Текст для поиска email-адресов
my $text = "Свяжитесь с нами по адресу support\@example.com или admin\@test.org для получения дополнительной информации. Также можете писать на feedback\@company.net.";

# Регулярное выражение для поиска email-адресов
my @emails = ($text =~ /[\w\.-]+@[\w\.-]+\.\w+/g);

# Вывод найденных email-адресов
print "Найденные email-адреса:\n";
foreach my $email (@emails) {
    print "$email\n";
}