#!/usr/bin/perl
# 统计结果生成于 Fri Oct 17 05:28:12 2025
# 来源日志文件: /workspace/sample.log
# 错误模式: error|Error|ERROR|failed|Failed|FAILED
# 错误总数: 4

# 错误详情数组
my @error_details = (
    "2023-10-17 10:00:02 ERROR Failed to connect to database",
    "2023-10-17 10:00:04 ERROR Connection timeout",
    "2023-10-17 10:00:06 ERROR Failed to process request",
    "2023-10-17 10:00:08 ERROR Invalid configuration",
);

# 打印错误详情
print "日志分析结果:\n";
print "日志文件: /workspace/sample.log\n";
print "错误总数: 4\n";
print "\n错误详情:\n";
foreach my $error (@error_details) {
    print "$error\n";
}
