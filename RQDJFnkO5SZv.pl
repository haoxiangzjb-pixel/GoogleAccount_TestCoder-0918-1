#!/usr/bin/perl
use strict;
use warnings;

# 错误统计结果
my %error_counts = (
    'CRITICAL' => 1,
    'ERROR' => 3,
    'FATAL' => 1,
    'WARNING' => 2,
);

# 总错误数
my $total_errors = 7;

# 输出结果
print "错误统计结果:\n";
foreach my $error_type (sort keys %error_counts) {
    print "$error_type: $error_counts{$error_type}\n";
}
print "总错误数: $total_errors\n";
