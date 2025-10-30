<?php
/**
 * Form Processing Script
 * Handles form submission with validation and sanitization
 */

// Set content type
header('Content-Type: text/html; charset=utf-8');

// Define allowed methods
$allowed_methods = ['GET', 'POST'];

// Check request method
if (!in_array($_SERVER['REQUEST_METHOD'], $allowed_methods)) {
    http_response_code(405);
    die('Method not allowed');
}

// Function to sanitize input data
function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Process form if submitted via POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Define expected form fields
    $expected_fields = ['name', 'email', 'message'];
    
    // Initialize form data array
    $form_data = [];
    $errors = [];
    
    // Process each expected field
    foreach ($expected_fields as $field) {
        if (isset($_POST[$field])) {
            $form_data[$field] = sanitize_input($_POST[$field]);
            
            // Basic validation
            switch ($field) {
                case 'name':
                    if (empty($form_data[$field])) {
                        $errors[] = 'Name is required';
                    } elseif (strlen($form_data[$field]) > 100) {
                        $errors[] = 'Name is too long (max 100 characters)';
                    }
                    break;
                    
                case 'email':
                    if (empty($form_data[$field])) {
                        $errors[] = 'Email is required';
                    } elseif (!filter_var($form_data[$field], FILTER_VALIDATE_EMAIL)) {
                        $errors[] = 'Invalid email format';
                    }
                    break;
                    
                case 'message':
                    if (empty($form_data[$field])) {
                        $errors[] = 'Message is required';
                    } elseif (strlen($form_data[$field]) > 1000) {
                        $errors[] = 'Message is too long (max 1000 characters)';
                    }
                    break;
            }
        } else {
            $errors[] = "Field '{$field}' is missing";
        }
    }
    
    // Check for additional fields that weren't expected
    $all_post_fields = array_keys($_POST);
    $unexpected_fields = array_diff($all_post_fields, $expected_fields);
    if (!empty($unexpected_fields)) {
        foreach ($unexpected_fields as $field) {
            $errors[] = "Unexpected field: {$field}";
        }
    }
    
    // Handle errors or process valid form
    if (!empty($errors)) {
        // Display errors
        echo "<h2>Form Errors:</h2>";
        echo "<ul>";
        foreach ($errors as $error) {
            echo "<li>" . sanitize_input($error) . "</li>";
        }
        echo "</ul>";
        echo '<a href="#" onclick="history.back()">Go back</a>';
    } else {
        // Form is valid, process the data
        echo "<h2>Form Submitted Successfully!</h2>";
        echo "<p>Thank you, <strong>" . $form_data['name'] . "</strong>, for your message.</p>";
        echo "<p>We received your email: <em>" . $form_data['email'] . "</em></p>";
        echo "<p>Your message: <em>" . $form_data['message'] . "</em></p>";
        
        // In a real application, you might save to database or send an email here
        // Example: save to file
        $log_entry = date('Y-m-d H:i:s') . " - Name: " . $form_data['name'] . 
                    ", Email: " . $form_data['email'] . ", Message: " . $form_data['message'] . "\n";
        file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);
        
        echo "<p>Your submission has been recorded.</p>";
    }
} else {
    // Display the form (GET request)
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Form Handler</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            input, textarea {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            textarea {
                height: 100px;
                resize: vertical;
            }
            button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
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
                <textarea id="message" name="message" required></textarea>
            </div>
            
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>
    <?php
}
?>