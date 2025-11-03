<?php
/**
 * Form Processing Script
 * Handles form submission and saves data
 */

// Function to generate a random filename
function generateRandomFilename($extension = 'php') {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < 10; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString . '.' . $extension;
}

// Process form data if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect form data
    $formData = [];
    
    foreach ($_POST as $key => $value) {
        // Sanitize input data
        $formData[$key] = htmlspecialchars(trim($value), ENT_QUOTES, 'UTF-8');
    }
    
    // Example: Save form data to a text file
    $timestamp = date('Y-m-d H:i:s');
    $logData = "Form submission at {$timestamp}:\n";
    
    foreach ($formData as $field => $value) {
        $logData .= "{$field}: {$value}\n";
    }
    
    $logData .= "---\n\n";
    
    // Save to log file
    file_put_contents('form_submissions.log', $logData, FILE_APPEND | LOCK_EX);
    
    // Prepare success message
    $successMessage = "Form submitted successfully!";
} else {
    // Display form if not submitted
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Form Processing Example</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea, select { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
            button { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
            button:hover { background-color: #45a049; }
            .success { color: green; padding: 10px; background-color: #dff0d8; border: 1px solid #d6e9c6; border-radius: 4px; }
        </style>
    </head>
    <body>
        <h1>Contact Form</h1>
        
        <?php if (isset($successMessage)): ?>
            <div class="success"><?php echo $successMessage; ?></div>
        <?php endif; ?>
        
        <form method="POST" action="">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required>
            </div>
            
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            
            <button type="submit">Submit Form</button>
        </form>
    </body>
    </html>
    <?php
}
?>