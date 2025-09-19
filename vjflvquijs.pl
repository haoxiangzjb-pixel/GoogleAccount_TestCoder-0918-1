#!/usr/bin/perl
use strict;
use warnings;

# 假设日志文件名为 'application.log'
my $log_file = 'application.log';
my %error_counts = ();

# 打开日志文件
open(my $fh, '<', $log_file) or die "Could not open file '$log_file' $!";

# 逐行读取文件
while (my $line = <$fh>) {
    chomp $line;
    # 检查行中是否包含 "ERROR" 关键字
    if ($line =~ /\bERROR\b/) {
        # 如果找到，错误计数加一
        $error_counts{'ERROR'}++;
    }
}

close $fh;

# 打印结果到控制台
print "错误统计结果:\n";
foreach my $error (keys %error_counts) {
    print "$error: $error_counts{$error}\n";
}

# 将结果写入到一个输出文件 'error_report.txt'
open(my $out_fh, '>', 'error_report.txt') or die "Could not open file 'error_report.txt' $!";
print $out_fh "错误统计结果:\n";
foreach my $error (keys %error_counts) {
    print $out_fh "$error: $error_counts{$error}\n";
}
close $out_fh;

print "统计结果已保存到 error_report.txt\n";