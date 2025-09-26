#!/usr/bin/perl
use strict;
use warnings;

# Регулярное выражение для поиска email
# Этот паттерн упрощён и не охватывает все возможные случаи RFC 5322,
# но подходит для большинства распространённых адресов.
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/;

# Пример строки для поиска
my $text = "Контактная информация: john.doe\@example.com, support\@my-site.org, или посетите сайт example.com для связи.";

# Поиск и вывод найденных email
print "Найденные email адреса:\n";
while ($text =~ /$email_regex/g) {
    print "- $&\n";
}

# Сохранение найденных адресов в файл со случайным именем
my $random_filename = "found_emails_" . int(rand(10000)) . ".txt";
open my $fh, '>', $random_filename or die "Не удалось открыть файл '$random_filename' для записи: $!";

# Повторный поиск для записи в файл
my @emails = $text =~ /$email_regex/g;
foreach my $email (@emails) {
    print $fh "$email\n";
}

close $fh;
print "\nРезультаты сохранены в файл '$random_filename'.\n";