#!/usr/bin/perl
use strict;
use warnings;

# Пример текста с email'ами
my $text = "Contact us at support\@example.com or sales\@company.org for more info. Also reachable at admin\@test.net.";

# Регулярное выражение для поиска email'ов
# [\w\.\-]+     : имя пользователя (буквы, цифры, точки, дефисы)
# @             : символ @
# [\w\-]+       : доменное имя (буквы, цифры, дефисы)
# \.[\w\-]+     : группа ".домен" (например, .com, .co.uk)
# (\.[\w\-]+)*  : ноль или более групп ".домен" (например, .co.uk)
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)+/g;

print "Found emails: @emails\n";
