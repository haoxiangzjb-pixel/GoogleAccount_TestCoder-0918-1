#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Generate a random filename for the output script
my $random_name = "log_stats_" . int(rand(10000)) . ".pl";

print "Generating log parsing script: $random_name\n";

# Create the log parsing script content
my $script_content = <<'EOF';
#!/usr/bin/perl
use strict;
use warnings;

# Function to parse log file and count errors
sub parse_log_file {
    my ($log_file) = @_;
    
    # Check if log file exists
    unless (-e $log_file) {
        die "Error: Log file '$log_file' does not exist!\n";
    }
    
    my %error_counts = (
        'ERROR' => 0,
        'FATAL' => 0,
        'WARN' => 0,
        'CRITICAL' => 0
    );
    
    open(my $fh, '<', $log_file) or die "Cannot open log file '$log_file': $!";
    
    while (my $line = <$fh>) {
        chomp $line;
        
        # Count different types of errors
        if ($line =~ /\b(ERROR|FATAL|WARN|CRITICAL)\b/i) {
            my $type = uc($1);
            $error_counts{$type}++ if exists $error_counts{$type};
        }
    }
    
    close($fh);
    
    # Print results
    print "Log file: $log_file\n";
    print "Error Statistics:\n";
    print "-" x 20 . "\n";
    for my $type (sort keys %error_counts) {
        print "$type: $error_counts{$type}\n";
    }
    
    return %error_counts;
}

# Main execution
if (@ARGV < 1) {
    print "Usage: $0 <log_file_path>\n";
    print "Example: $0 /path/to/application.log\n";
    exit 1;
}

my $log_file = $ARGV[0];
my %results = parse_log_file($log_file);

# Save results to a file
my $output_file = $log_file . "_stats.txt";
open(my $out_fh, '>', $output_file) or die "Cannot create output file '$output_file': $!";
print $out_fh "Error Statistics for $log_file\n";
print $out_fh "-" x 30 . "\n";
for my $type (sort keys %results) {
    print $out_fh "$type: $results{$type}\n";
}
close($out_fh);

print "\nResults saved to: $output_file\n";
EOF

# Write the script to the randomly named file
open(my $fh, '>', $random_name) or die "Cannot create file '$random_name': $!";
print $fh $script_content;
close($fh);

# Make the script executable
chmod 0755, $random_name;

print "Log parsing script has been created: $random_name\n";
print "To use it, run: perl $random_name /path/to/your/logfile.log\n";