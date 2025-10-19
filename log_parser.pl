#!/usr/bin/perl
use strict;
use warnings;

# Function to count errors in a log file
sub count_errors {
    my ($log_file) = @_;
    
    # Check if log file exists
    unless (-e $log_file) {
        print "Error: Log file '$log_file' does not exist.\n";
        return;
    }
    
    my $error_count = 0;
    my @error_lines = ();
    
    # Open and read the log file
    open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";
    
    while (my $line = <$fh>) {
        chomp $line;
        # Look for lines containing "ERROR" (case-insensitive)
        if ($line =~ /ERROR/i) {
            $error_count++;
            push @error_lines, $line;
        }
    }
    
    close($fh);
    
    # Print the results
    print "Total errors found: $error_count\n";
    
    if (@error_lines) {
        print "\nError entries:\n";
        foreach my $error (@error_lines) {
            print "$error\n";
        }
    } else {
        print "No errors found in the log file.\n";
    }
    
    return $error_count;
}

# Function to generate a random filename
sub generate_random_filename {
    my $length = 10;
    my $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    my $random_string = '';
    
    for (1..$length) {
        $random_string .= substr($chars, rand(length($chars)), 1);
    }
    
    return $random_string . ".pl";
}

# Main execution
if (@ARGV < 1) {
    print "Usage: $0 <log_file_path>\n";
    print "Example: $0 /path/to/your/logfile.log\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_count = count_errors($log_file);

# Generate a random filename for the output script
my $random_filename = generate_random_filename();

# Write the results to a new Perl script with random name
open(my $out_fh, '>', $random_filename) or die "Could not create file '$random_filename': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Generated script with error count: $error_count\n";
print $out_fh "# From log file: $log_file\n";
print $out_fh "\nuse strict;\nuse warnings;\n\n";
print $out_fh "# This script was generated to store log analysis results\n";
print $out_fh "my \$error_count = $error_count;\n";
print $out_fh "my \$source_log = '$log_file';\n\n";
print $out_fh "print \"Log file: \$source_log\\n\";\n";
print $out_fh "print \"Total errors: \$error_count\\n\";\n";
print $out_fh "\n# End of generated script\n";

close($out_fh);

print "\nResults saved to: $random_filename\n";
print "The script contains the error count and source log information.\n";