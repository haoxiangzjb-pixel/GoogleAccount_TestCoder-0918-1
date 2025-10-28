<?php
/**
 * PHP Script for Processing Form Data
 * This script handles form submissions, validates input, and saves data.
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
    
    // If no errors, save data
    if (empty($errors)) {
        // Prepare data for saving
        $form_data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Save to a file (in JSON format)
        $filename = 'form_submissions_' . date('Y-m-d') . '.json';
        $file_path = __DIR__ . '/' . $filename;
        
        // Read existing data if file exists
        $all_data = [];
        if (file_exists($file_path)) {
            $content = file_get_contents($file_path);
            $all_data = json_decode($content, true) ?: [];
        }
        
        // Add new submission
        $all_data[] = $form_data;
        
        // Save back to file
        file_put_contents($file_path, json_encode($all_data, JSON_PRETTY_PRINT));
        
        // Success response
        echo "<!DOCTYPE html>
        <html>
        <head>
            <title>Form Submission Result</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 40px; }
                .success { color: green; }
                .error { color: red; }
                .back-link { margin-top: 20px; }
            </style>
        </head>
        <body>
            <h2>Form Submission Result</h2>
            <p class='success'>Thank you for your submission, {$name}! Your message has been saved.</p>
            <div class='back-link'>
                <a href='javascript:history.back()'>Go back to form</a>
            </div>
        </body>
        </html>";
    } else {
        // Display errors
        echo "<!DOCTYPE html>
        <html>
        <head>
            <title>Form Submission Result</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 40px; }
                .success { color: green; }
                .error { color: red; }
                .back-link { margin-top: 20px; }
            </style>
        </head>
        <body>
            <h2>Form Submission Result</h2>
            <p class='error'>There were errors with your submission:</p>
            <ul>";
        foreach ($errors as $error) {
            echo "<li class='error'>" . $error . "</li>";
        }
        echo "    </ul>
            <div class='back-link'>
                <a href='javascript:history.back()'>Go back to form</a>
            </div>
        </body>
        </html>";
    }
} else {
    // If accessed directly without POST, show a simple form for testing
    echo "<!DOCTYPE html>
    <html>
    <head>
        <title>Test Form</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            form { max-width: 500px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea { width: 100%; padding: 8px; box-sizing: border-box; }
            input[type='submit'] { background-color: #4CAF50; color: white; border: none; cursor: pointer; padding: 12px 20px; }
            input[type='submit']:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <h2>Test Form</h2>
        <form method='post' action='" . htmlspecialchars($_SERVER['PHP_SELF']) . "'>
            <div class='form-group'>
                <label for='name'>Name:</label>
                <input type='text' id='name' name='name' required>
            </div>
            <div class='form-group'>
                <label for='email'>Email:</label>
                <input type='email' id='email' name='email' required>
            </div>
            <div class='form-group'>
                <label for='message'>Message:</label>
                <textarea id='message' name='message' rows='5' required></textarea>
            </div>
            <input type='submit' value='Submit'>
        </form>
    </body>
    </html>";
}
?>