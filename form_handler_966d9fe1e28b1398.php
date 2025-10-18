<?php
/**
 * Form Processing Script
 * This script handles form submissions and processes the data
 */

// Set content type to HTML
header('Content-Type: text/html; charset=utf-8');

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process form data
    $name = isset($_POST['name']) ? sanitizeInput($_POST['name']) : '';
    $email = isset($_POST['email']) ? sanitizeInput($_POST['email']) : '';
    $message = isset($_POST['message']) ? sanitizeInput($_POST['message']) : '';
    
    // Validation
    $errors = [];
    
    if (empty($name)) {
        $errors[] = "Name is required";
    }
    
    if (empty($email)) {
        $errors[] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format";
    }
    
    if (empty($message)) {
        $errors[] = "Message is required";
    }
    
    // If no errors, process the data
    if (empty($errors)) {
        // Here you could save to database, send email, etc.
        
        // For demonstration, we'll save to a file
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Save to a log file
        $logFile = 'form_submissions.json';
        $existingData = [];
        
        if (file_exists($logFile)) {
            $existingData = json_decode(file_get_contents($logFile), true) ?: [];
        }
        
        $existingData[] = $data;
        file_put_contents($logFile, json_encode($existingData, JSON_PRETTY_PRINT));
        
        // Success response
        echo "<!DOCTYPE html>
        <html lang='en'>
        <head>
            <meta charset='UTF-8'>
            <meta name='viewport' content='width=device-width, initial-scale=1.0'>
            <title>Form Submission Success</title>
            <style>
                body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
                .success { background-color: #d4edda; color: #155724; padding: 15px; border-radius: 5px; }
            </style>
        </head>
        <body>
            <div class='success'>
                <h2>Form Submitted Successfully!</h2>
                <p>Thank you, <strong>" . $name . "</strong>, for your message. We'll get back to you soon.</p>
                <p><a href=''>Submit another form</a></p>
            </div>
        </body>
        </html>";
    } else {
        // Display errors
        echo "<!DOCTYPE html>
        <html lang='en'>
        <head>
            <meta charset='UTF-8'>
            <meta name='viewport' content='width=device-width, initial-scale=1.0'>
            <title>Form Errors</title>
            <style>
                body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
                .error { background-color: #f8d7da; color: #721c24; padding: 15px; border-radius: 5px; margin-bottom: 20px; }
                .form-group { margin-bottom: 15px; }
                label { display: block; margin-bottom: 5px; font-weight: bold; }
                input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
                button { background-color: #007cba; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
                button:hover { background-color: #005a87; }
            </style>
        </head>
        <body>
            <div class='error'>
                <h2>Please fix the following errors:</h2>
                <ul>";
        foreach ($errors as $error) {
            echo "<li>" . $error . "</li>";
        }
        echo "      </ul>
            </div>
            <p><a href=''>Go back to form</a></p>
        </body>
        </html>";
    }
} else {
    // Display the form
    echo "<!DOCTYPE html>
    <html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>Contact Form</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
            button { background-color: #007cba; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
            button:hover { background-color: #005a87; }
        </style>
    </head>
    <body>
        <h1>Contact Form</h1>
        <form method='post' action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "'>
            <div class='form-group'>
                <label for='name'>Name *</label>
                <input type='text' id='name' name='name' required>
            </div>
            <div class='form-group'>
                <label for='email'>Email *</label>
                <input type='email' id='email' name='email' required>
            </div>
            <div class='form-group'>
                <label for='message'>Message *</label>
                <textarea id='message' name='message' rows='5' required></textarea>
            </div>
            <button type='submit'>Submit</button>
        </form>
    </body>
    </html>";
}
?>