<?php
// PHP script to handle form processing
// This script demonstrates processing form data with validation and sanitization

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Initialize variables to store form data
    $name = $email = $message = "";
    $nameErr = $emailErr = $messageErr = "";
    $isValid = true;

    // Process name field
    if (empty($_POST["name"])) {
        $nameErr = "Name is required";
        $isValid = false;
    } else {
        $name = sanitizeInput($_POST["name"]);
        // Check if name only contains letters and whitespace
        if (!preg_match("/^[a-zA-Z-' ]*$/", $name)) {
            $nameErr = "Only letters and white space allowed";
            $isValid = false;
        }
    }

    // Process email field
    if (empty($_POST["email"])) {
        $emailErr = "Email is required";
        $isValid = false;
    } else {
        $email = sanitizeInput($_POST["email"]);
        // Check if email address is well-formed
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format";
            $isValid = false;
        }
    }

    // Process message field
    if (empty($_POST["message"])) {
        $messageErr = "Message is required";
        $isValid = false;
    } else {
        $message = sanitizeInput($_POST["message"]);
    }

    // If all data is valid, save to file or database
    if ($isValid) {
        // In this example, we'll save the data to a text file
        $data = "Name: " . $name . "\n";
        $data .= "Email: " . $email . "\n";
        $data .= "Message: " . $message . "\n";
        $data .= "Date: " . date("Y-m-d H:i:s") . "\n";
        $data .= "------------------------\n";

        // Save to a file
        $filename = "form_submissions.txt";
        file_put_contents($filename, $data, FILE_APPEND | LOCK_EX);

        // Success message
        echo "<h2>Form Submitted Successfully!</h2>";
        echo "<p>Thank you for your submission, " . $name . ".</p>";
        echo "<p>We will contact you at " . $email . " if needed.</p>";
        
        // Optionally, you could redirect to a thank you page
        // header("Location: thank_you.html");
        // exit();
    } else {
        // Display errors
        echo "<h2>Form Submission Error</h2>";
        echo "<p>Please correct the following errors:</p>";
        if (!empty($nameErr)) echo "<p><strong>Name:</strong> " . $nameErr . "</p>";
        if (!empty($emailErr)) echo "<p><strong>Email:</strong> " . $emailErr . "</p>";
        if (!empty($messageErr)) echo "<p><strong>Message:</strong> " . $messageErr . "</p>";
        
        // Show a link to go back to the form
        echo '<p><a href="javascript:history.back()">Go back to form</a></p>';
    }
} else {
    // If the script is accessed directly without POST data
    echo "<h2>Access Denied</h2>";
    echo "<p>Please submit the form to access this page.</p>";
}
?>