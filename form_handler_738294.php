<?php
/**
 * Form Processing Script
 * Handles form submission and processes the data
 */

// Set content type to HTML
header('Content-Type: text/html; charset=utf-8');

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name'], ENT_QUOTES, 'UTF-8') : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email'], ENT_QUOTES, 'UTF-8') : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message'], ENT_QUOTES, 'UTF-8') : '';
    
    // Validation
    $errors = [];
    
    if (empty($name)) {
        $errors[] = 'Name is required';
    }
    
    if (empty($email)) {
        $errors[] = 'Email is required';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Invalid email format';
    }
    
    if (empty($message)) {
        $errors[] = 'Message is required';
    }
    
    // If no errors, process the form
    if (empty($errors)) {
        // Here you could save to database, send email, etc.
        $timestamp = date('Y-m-d H:i:s');
        $log_data = "Name: $name | Email: $email | Message: $message | Time: $timestamp\n";
        
        // Save form data to a log file
        file_put_contents('form_submissions.log', $log_data, FILE_APPEND | LOCK_EX);
        
        // Success response
        echo "<!DOCTYPE html>
        <html lang=\"en\">
        <head>
            <meta charset=\"UTF-8\">
            <title>Form Submitted</title>
            <style>
                body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
                .success { background-color: #d4edda; color: #155724; padding: 15px; border-radius: 5px; }
            </style>
        </head>
        <body>
            <div class=\"success\">
                <h2>Form Submitted Successfully!</h2>
                <p><strong>Name:</strong> {$name}</p>
                <p><strong>Email:</strong> {$email}</p>
                <p><strong>Message:</strong> {$message}</p>
                <p><a href=\"\">Submit another form</a></p>
            </div>
        </body>
        </html>";
    } else {
        // Display errors
        displayForm($errors, $name, $email, $message);
    }
} else {
    // Display the form if it's a GET request
    displayForm();
}

/**
 * Function to display the form
 * @param array $errors Array of error messages
 * @param string $name Pre-filled name value
 * @param string $email Pre-filled email value
 * @param string $message Pre-filled message value
 */
function displayForm($errors = [], $name = '', $email = '', $message = '') {
    $error_html = '';
    if (!empty($errors)) {
        $error_html = '<div class="errors" style="background-color: #f8d7da; color: #721c24; padding: 15px; border-radius: 5px; margin-bottom: 20px;">';
        $error_html .= '<ul style="margin: 0; padding-left: 20px;">';
        foreach ($errors as $error) {
            $error_html .= '<li>' . htmlspecialchars($error, ENT_QUOTES, 'UTF-8') . '</li>';
        }
        $error_html .= '</ul></div>';
    }
    
    echo "<!DOCTYPE html>
    <html lang=\"en\">
    <head>
        <meta charset=\"UTF-8\">
        <title>Contact Form</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
            textarea { height: 100px; }
            input[type=\"submit\"] { background-color: #007cba; color: white; border: none; cursor: pointer; font-size: 16px; }
            input[type=\"submit\"]:hover { background-color: #005a87; }
        </style>
    </head>
    <body>
        <h1>Contact Form</h1>
        {$error_html}
        <form method=\"post\" action=\"{$_SERVER['PHP_SELF']}\">
            <div class=\"form-group\">
                <label for=\"name\">Name *</label>
                <input type=\"text\" id=\"name\" name=\"name\" value=\"" . htmlspecialchars($name, ENT_QUOTES, 'UTF-8') . "\" required>
            </div>
            
            <div class=\"form-group\">
                <label for=\"email\">Email *</label>
                <input type=\"email\" id=\"email\" name=\"email\" value=\"" . htmlspecialchars($email, ENT_QUOTES, 'UTF-8') . "\" required>
            </div>
            
            <div class=\"form-group\">
                <label for=\"message\">Message *</label>
                <textarea id=\"message\" name=\"message\" required>" . htmlspecialchars($message, ENT_QUOTES, 'UTF-8') . "</textarea>
            </div>
            
            <input type=\"submit\" value=\"Submit\">
        </form>
    </body>
    </html>";
}
?>