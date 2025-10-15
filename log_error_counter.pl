#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# 生成随机文件名的子程序
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return $random_name . ".pl";
}

# 检查命令行参数
if (@ARGV < 1) {
    print "用法: $0 <日志文件路径> [错误模式]\n";
    print "例如: $0 /var/log/app.log\n";
    print "      $0 /var/log/app.log \"ERROR|FATAL\"\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_pattern = $ARGV[1] || "ERROR";  # 默认错误模式

# 检查日志文件是否存在
unless (-e $log_file) {
    print "错误: 日志文件 '$log_file' 不存在!\n";
    exit 1;
}

# 打开日志文件
open(my $fh, '<', $log_file) or die "无法打开文件 '$log_file': $!";

my $error_count = 0;
my @error_lines = ();

# 逐行读取日志文件
while (my $line = <$fh>) {
    chomp $line;
    # 检查是否包含错误模式（不区分大小写）
    if ($line =~ /$error_pattern/i) {
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

# 输出统计结果
print "日志文件: $log_file\n";
print "错误模式: $error_pattern\n";
print "错误总数: $error_count\n";

if (@error_lines) {
    print "\n错误详情:\n";
    for my $i (0..$#error_lines) {
        print (($i+1) . ": " . $error_lines[$i] . "\n");
    }
}

# 生成随机命名的输出文件
my $output_file = generate_random_filename();
print "\n正在将脚本保存到: $output_file\n";

# 创建包含错误统计逻辑的Perl脚本
open(my $out_fh, '>', $output_file) or die "无法创建输出文件 '$output_file': $!";

print $out_fh <<'EOF';
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

EOF

close($out_fh);

print "脚本已成功保存到: $output_file\n";