<?php
// PHP script to handle form processing
// This script processes form data, validates it, and saves to a file

// Set content type for response
header('Content-Type: text/html; charset=utf-8');

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Process form data
    $name = isset($_POST['name']) ? sanitizeInput($_POST['name']) : '';
    $email = isset($_POST['email']) ? sanitizeInput($_POST['email']) : '';
    $message = isset($_POST['message']) ? sanitizeInput($_POST['message']) : '';
    
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
    
    // If no errors, save the data
    if (empty($errors)) {
        // Prepare data to save
        $form_data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Convert to JSON string
        $json_data = json_encode($form_data, JSON_PRETTY_PRINT);
        
        // Save to a file with timestamp
        $filename = 'form_submission_' . date('Y-m-d_H-i-s') . '.json';
        $file_path = __DIR__ . '/' . $filename;
        
        if (file_put_contents($file_path, $json_data)) {
            echo '<h2>Form Submitted Successfully!</h2>';
            echo '<p>Thank you for your submission, ' . $name . '.</p>';
            echo '<p>Your data has been saved to: ' . $filename . '</p>';
        } else {
            echo '<h2>Error!</h2>';
            echo '<p>There was an error saving your data.</p>';
        }
    } else {
        // Display errors
        echo '<h2>Form Submission Failed</h2>';
        echo '<ul>';
        foreach ($errors as $error) {
            echo '<li>' . $error . '</li>';
        }
        echo '</ul>';
        echo '<a href="#" onclick="window.history.back();">Go back to form</a>';
    }
} else {
    // Display a simple form if accessed directly via GET
    echo '
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sample Form</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
            button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
            button:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <h1>Contact Form</h1>
        <form method="post" action="">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>';
}
?>