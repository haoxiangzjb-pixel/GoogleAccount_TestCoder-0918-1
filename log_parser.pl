#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# 检查命令行参数
if (@ARGV < 1) {
    print "用法: $0 <日志文件路径> [输出文件路径]\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $output_file = $ARGV[1] || generate_random_filename();

# 检查日志文件是否存在
unless (-e $log_file) {
    print "错误: 日志文件 '$log_file' 不存在\n";
    exit 1;
}

# 打开日志文件
open(my $fh, '<', $log_file) or die "无法打开日志文件 '$log_file': $!";

# 初始化错误计数器
my %error_counts = (
    'ERROR' => 0,
    'FATAL' => 0,
    'WARNING' => 0,
    'CRITICAL' => 0
);

# 统计错误数量
while (my $line = <$fh>) {
    chomp $line;
    
    # 检查各种错误类型
    $error_counts{'ERROR'}++ if $line =~ /\b(ERROR|Error|error)\b/;
    $error_counts{'FATAL'}++ if $line =~ /\b(FATAL|Fatal|fatal)\b/;
    $error_counts{'WARNING'}++ if $line =~ /\b(WARNING|Warning|warning)\b/;
    $error_counts{'CRITICAL'}++ if $line =~ /\b(CRITICAL|Critical|critical)\b/;
}

close($fh);

# 输出结果
print "错误统计结果:\n";
print "-------------\n";
my $total_errors = 0;
foreach my $error_type (sort keys %error_counts) {
    print "$error_type: $error_counts{$error_type}\n";
    $total_errors += $error_counts{$error_type};
}
print "-------------\n";
print "总错误数: $total_errors\n";

# 保存结果到输出文件
open(my $out_fh, '>', $output_file) or die "无法创建输出文件 '$output_file': $!";
print $out_fh "#!/usr/bin/perl\n";
print $out_fh "use strict;\n";
print $out_fh "use warnings;\n\n";
print $out_fh "# 错误统计结果\n";
print $out_fh "my \%error_counts = (\n";
foreach my $error_type (sort keys %error_counts) {
    print $out_fh "    '$error_type' => $error_counts{$error_type},\n";
}
print $out_fh ");\n\n";
print $out_fh "# 总错误数\n";
print $out_fh "my \$total_errors = $total_errors;\n\n";
print $out_fh "# 输出结果\n";
print $out_fh "print \"错误统计结果:\\n\";\n";
print $out_fh "foreach my \$error_type (sort keys \%error_counts) {\n";
print $out_fh "    print \"\$error_type: \$error_counts{\$error_type}\\n\";\n";
print $out_fh "}\n";
print $out_fh "print \"总错误数: \$total_errors\\n\";\n";

close($out_fh);

print "\n结果已保存到: $output_file\n";

# 生成随机文件名的函数
sub generate_random_filename {
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_string = '';
    for (1..12) {
        $random_string .= $chars[rand @chars];
    }
    return $random_string . ".pl";
}