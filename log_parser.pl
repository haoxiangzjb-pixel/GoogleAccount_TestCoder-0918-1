#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate a random filename
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_string = '';
    for (1..$length) {
        $random_string .= $chars[rand @chars];
    }
    return "log_stats_$random_string.pl";
}

# Function to parse log file and count errors
sub parse_log_file {
    my ($log_file) = @_;
    my %error_counts = ();
    
    open(my $fh, '<', $log_file) or die "Cannot open log file '$log_file': $!";
    
    while (my $line = <$fh>) {
        chomp $line;
        
        # Look for common error patterns in the log line
        if ($line =~ /error|Error|ERROR|exception|Exception|EXCEPTION|critical|Critical|CRITICAL|fatal|Fatal|FATAL/i) {
            # Extract the specific error type
            if ($line =~ /(error|exception|critical|fatal)[\s:]*([a-z]+)/i) {
                my $error_type = lc($1);
                $error_counts{$error_type}++;
            } else {
                $error_counts{general_error}++;
            }
        }
    }
    
    close($fh);
    return %error_counts;
}

# Function to save the statistics to a file
sub save_statistics {
    my ($stats_ref, $output_file) = @_;
    
    open(my $fh, '>', $output_file) or die "Cannot create output file '$output_file': $!";
    
    print $fh "#!/usr/bin/perl\n";
    print $fh "# Generated log statistics\n";
    print $fh "use strict;\n";
    print $fh "use warnings;\n\n";
    
    print $fh "# Error statistics from log file\n";
    print $fh "my \%error_counts = (\n";
    
    for my $error_type (sort keys %$stats_ref) {
        print $fh "    '$error_type' => $stats_ref->{$error_type},\n";
    }
    
    print $fh ");\n\n";
    
    print $fh "# Print the statistics\n";
    print $fh "print \"Error Statistics:\\n\";\n";
    print $fh "for my \$error_type (sort keys \%error_counts) {\n";
    print $fh "    print \"\$error_type: \$error_counts{\$error_type}\\n\";\n";
    print $fh "}\n";
    
    close($fh);
    
    print "Statistics saved to: $output_file\n";
}

# Main program
sub main {
    # Check if log file is provided as argument
    if (@ARGV < 1) {
        print "Usage: $0 <log_file> [output_file]\n";
        print "If output file is not specified, a random name will be generated.\n";
        exit(1);
    }
    
    my $log_file = $ARGV[0];
    my $output_file;
    
    # Generate output file name
    if (@ARGV >= 2) {
        $output_file = $ARGV[1];
    } else {
        $output_file = generate_random_filename();
    }
    
    # Check if log file exists
    unless (-e $log_file) {
        die "Log file '$log_file' does not exist!\n";
    }
    
    print "Parsing log file: $log_file\n";
    
    # Parse the log file
    my %error_counts = parse_log_file($log_file);
    
    # If no errors found, add a message
    if (keys %error_counts == 0) {
        print "No errors found in the log file.\n";
        %error_counts = (no_errors_found => 1);
    } else {
        print "Found " . scalar(keys %error_counts) . " different error types.\n";
    }
    
    # Save statistics to output file
    save_statistics(\%error_counts, $output_file);
}

# Run the main program
main();