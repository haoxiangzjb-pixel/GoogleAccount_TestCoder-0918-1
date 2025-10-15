#!/usr/bin/perl
use strict;
use warnings;

# 这是一个生成的Perl脚本，用于统计日志文件中的错误
# 由 log_error_counter.pl 脚本生成

sub count_errors_in_log {
    my ($log_file, $pattern) = @_;
    $pattern ||= "ERROR";
    
    unless (-e $log_file) {
        print "错误: 日志文件 '$log_file' 不存在!\n";
        return -1;
    }
    
    open(my $fh, '<', $log_file) or die "无法打开文件 '$log_file': $!";
    
    my $count = 0;
    while (my $line = <$fh>) {
        chomp $line;
        if ($line =~ /$pattern/i) {
            $count++;
        }
    }
    
    close($fh);
    return $count;
}

# 使用示例
if (@ARGV < 1) {
    print "用法: $0 <日志文件路径> [错误模式]\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_pattern = $ARGV[1] || "ERROR";

my $error_count = count_errors_in_log($log_file, $error_pattern);
if ($error_count >= 0) {
    print "在文件 '$log_file' 中找到 $error_count 个匹配 '$error_pattern' 的错误\n";
}

