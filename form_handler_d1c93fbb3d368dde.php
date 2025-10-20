<?php
/**
 * Form Processing Script
 * Handles form submission, validates input, and saves data
 */

// Set content type
header('Content-Type: text/html; charset=utf-8');

// Define allowed form fields
$allowed_fields = ['name', 'email', 'message', 'subject'];

// Function to sanitize input
function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Function to validate email
function validate_email($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

// Function to log form data to file
function log_form_data($data) {
    $log_file = 'form_submissions.log';
    $timestamp = date('Y-m-d H:i:s');
    $entry = "[$timestamp] " . json_encode($data) . "\n";
    file_put_contents($log_file, $entry, FILE_APPEND | LOCK_EX);
}

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $form_data = array();
    $errors = array();
    
    // Process each allowed field
    foreach ($allowed_fields as $field) {
        if (isset($_POST[$field])) {
            $sanitized_value = sanitize_input($_POST[$field]);
            
            // Special validation for email
            if ($field === 'email' && !empty($sanitized_value) && !validate_email($sanitized_value)) {
                $errors[] = "Invalid email format";
            } else {
                $form_data[$field] = $sanitized_value;
            }
        }
    }
    
    // Check for required fields (example: name and email are required)
    if (empty($form_data['name'])) {
        $errors[] = "Name is required";
    }
    
    if (empty($form_data['email'])) {
        $errors[] = "Email is required";
    }
    
    // If no errors, process the form
    if (empty($errors)) {
        // Log the form data
        log_form_data($form_data);
        
        // Success response
        $success_message = "Form submitted successfully!";
    } else {
        // Error occurred
        $error_messages = $errors;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Handler</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        textarea { height: 120px; resize: vertical; }
        button { background-color: #4CAF50; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        .success { color: green; padding: 10px; background-color: #dff0d8; border: 1px solid #d6e9c6; border-radius: 4px; margin: 10px 0; }
        .error { color: red; padding: 10px; background-color: #f2dede; border: 1px solid #ebccd1; border-radius: 4px; margin: 10px 0; }
        .form-example { margin-top: 30px; padding: 20px; background-color: #f9f9f9; border-left: 4px solid #007cba; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Form Processing Example</h1>
        
        <?php if (isset($success_message)): ?>
            <div class="success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        
        <?php if (isset($error_messages)): ?>
            <div class="error">
                <strong>Errors occurred:</strong>
                <ul>
                    <?php foreach ($error_messages as $error): ?>
                        <li><?php echo $error; ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
        <?php endif; ?>
        
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <div class="form-group">
                <label for="name">Name *</label>
                <input type="text" id="name" name="name" value="<?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email *</label>
                <input type="email" id="email" name="email" value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>" required>
            </div>
            
            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" value="<?php echo isset($_POST['subject']) ? htmlspecialchars($_POST['subject']) : ''; ?>">
            </div>
            
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message"><?php echo isset($_POST['message']) ? htmlspecialchars($_POST['message']) : ''; ?></textarea>
            </div>
            
            <button type="submit">Submit Form</button>
        </form>
        
        <div class="form-example">
            <h3>About this script</h3>
            <p>This PHP script handles form submissions with the following features:</p>
            <ul>
                <li>Input sanitization to prevent XSS attacks</li>
                <li>Email validation</li>
                <li>Required field validation</li>
                <li>Data logging to a file</li>
                <li>Secure processing of form data</li>
            </ul>
        </div>
    </div>
</body>
</html>