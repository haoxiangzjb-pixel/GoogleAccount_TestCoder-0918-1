<?php
/**
 * PHP script to handle form processing
 * This script processes form data, validates it, sanitizes it, and performs basic operations
 */

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if the form was submitted
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

    // If all validations pass, process the form
    if ($isValid) {
        // In a real application, you would save to database or file here
        // For demonstration, we'll just show a success message
        echo "<h2>Form Submission Successful!</h2>";
        echo "<p><strong>Name:</strong> " . $name . "</p>";
        echo "<p><strong>Email:</strong> " . $email . "</p>";
        echo "<p><strong>Message:</strong> " . $message . "</p>";
        
        // Optional: Save to a file
        $data = "Name: $name\nEmail: $email\nMessage: $message\n---\n";
        file_put_contents("form_submissions.txt", $data, FILE_APPEND | LOCK_EX);
        
        echo "<p>Form data has been saved.</p>";
    } else {
        // Display errors
        echo "<div style='color: red;'>";
        echo "<p>Error(s) occurred while processing your form:</p>";
        if (!empty($nameErr)) echo "<p>Name: " . $nameErr . "</p>";
        if (!empty($emailErr)) echo "<p>Email: " . $emailErr . "</p>";
        if (!empty($messageErr)) echo "<p>Message: " . $messageErr . "</p>";
        echo "</div>";
        
        // Provide a link back to the form
        echo "<p><a href='javascript:history.back()'>Go back to form</a></p>";
    }
} else {
    // If the form wasn't submitted via POST, show an example form
    echo "
    <h2>Sample Form</h2>
    <form method='post' action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "'>
        <p><label for='name'>Name:</label><br>
        <input type='text' id='name' name='name' required>
        <span style='color: red;'>*</span></p>
        
        <p><label for='email'>Email:</label><br>
        <input type='email' id='email' name='email' required>
        <span style='color: red;'>*</span></p>
        
        <p><label for='message'>Message:</label><br>
        <textarea id='message' name='message' required></textarea>
        <span style='color: red;'>*</span></p>
        
        <p><input type='submit' value='Submit'></p>
    </form>
    <p><span style='color: red;'>*</span> indicates required field</p>";
}
?>