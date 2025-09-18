<?php
// Simple PHP Form Processor
// This script processes form data and saves it to a file

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect and sanitize input data
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $message = htmlspecialchars($_POST['message']);
    
    // Create a formatted string with the data
    $data = "Name: " . $name . "\n";
    $data .= "Email: " . $email . "\n";
    $data .= "Message: " . $message . "\n";
    $data .= "Submitted on: " . date("Y-m-d H:i:s") . "\n";
    $data .= str_repeat("-", 30) . "\n";
    
    // Define the file to save data
    $filename = "form_submissions.txt";
    
    // Save data to file (append mode)
    if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
        echo "<h2>Thank you!</h2>";
        echo "<p>Your form has been submitted successfully.</p>";
        echo "<p><a href='form.html'>Return to form</a></p>";
    } else {
        echo "<h2>Error</h2>";
        echo "<p>Sorry, there was an error saving your data.</p>";
    }
} else {
    // If not a POST request, redirect to form or show error
    echo "<h2>Invalid Request</h2>";
    echo "<p>This script only processes form submissions.</p>";
}
?>