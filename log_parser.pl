#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# 函数：生成随机文件名
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return $random_name . '.pl';
}

# 检查命令行参数
if (@ARGV < 1) {
    print "用法: $0 <日志文件路径> [错误模式]\n";
    print "例如: $0 /path/to/logfile.txt\n";
    print "      $0 /path/to/logfile.txt 'ERROR'\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_pattern = $ARGV[1] || 'error|Error|ERROR|failed|Failed|FAILED';

# 检查日志文件是否存在
unless (-e $log_file) {
    print "错误: 日志文件 '$log_file' 不存在!\n";
    exit 1;
}

# 打开日志文件
open(my $fh, '<', $log_file) or die "无法打开文件 '$log_file': $!";

# 统计错误
my $error_count = 0;
my @error_lines = ();

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /$error_pattern/i) {
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

# 显示统计结果
print "日志文件: $log_file\n";
print "错误模式: $error_pattern\n";
print "错误总数: $error_count\n";
print "\n错误详情:\n";
foreach my $error_line (@error_lines) {
    print "$error_line\n";
}

# 生成随机文件名
my $output_file = generate_random_filename();
print "\n将结果保存到随机命名的文件: $output_file\n";

# 创建包含结果的Perl脚本
open(my $out_fh, '>', $output_file) or die "无法创建输出文件 '$output_file': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# 统计结果生成于 " . localtime() . "\n";
print $out_fh "# 来源日志文件: $log_file\n";
print $out_fh "# 错误模式: $error_pattern\n";
print $out_fh "# 错误总数: $error_count\n\n";

print $out_fh "# 错误详情数组\n";
print $out_fh "my \@error_details = (\n";
foreach my $error_line (@error_lines) {
    # 转义引号和反斜杠
    $error_line =~ s/\\/\\\\/g;
    $error_line =~ s/"/\\"/g;
    print $out_fh "    \"$error_line\",\n";
}
print $out_fh ");\n\n";

print $out_fh "# 打印错误详情\n";
print $out_fh "print \"日志分析结果:\\n\";\n";
print $out_fh "print \"日志文件: $log_file\\n\";\n";
print $out_fh "print \"错误总数: $error_count\\n\";\n";
print $out_fh "print \"\\n错误详情:\\n\";\n";
print $out_fh 'foreach my $error (@error_details) {' . "\n";
print $out_fh "    print \"\$error\\n\";\n";
print $out_fh "}\n";

close($out_fh);

print "脚本已成功创建: $output_file\n";