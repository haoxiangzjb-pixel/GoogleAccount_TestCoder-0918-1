<?php
/**
 * Form Processing Script
 * Handles form submission, validates input, and saves data
 */

// Function to generate a random string for filename
function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}

// Process form data when form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect and sanitize form data
    $name = isset($_POST['name']) ? htmlspecialchars(trim($_POST['name'])) : '';
    $email = isset($_POST['email']) ? htmlspecialchars(trim($_POST['email'])) : '';
    $message = isset($_POST['message']) ? htmlspecialchars(trim($_POST['message'])) : '';
    
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
    
    // If no errors, save the data
    if (empty($errors)) {
        // Create a unique filename
        $randomFileName = 'form_data_' . generateRandomString() . '.txt';
        $filePath = __DIR__ . '/' . $randomFileName;
        
        // Prepare data to save
        $data = "Form Submission Data\n";
        $data .= "------------------\n";
        $data .= "Name: " . $name . "\n";
        $data .= "Email: " . $email . "\n";
        $data .= "Message: " . $message . "\n";
        $data .= "Submitted on: " . date('Y-m-d H:i:s') . "\n";
        $data .= "------------------\n\n";
        
        // Save data to file
        if (file_put_contents($filePath, $data, FILE_APPEND | LOCK_EX)) {
            echo "<h2>Form Submitted Successfully!</h2>";
            echo "<p>Data saved to file: {$randomFileName}</p>";
            echo "<p>Thank you for your submission, {$name}!</p>";
        } else {
            echo "<h2>Error</h2>";
            echo "<p>There was an error saving your data.</p>";
        }
    } else {
        // Display errors
        echo "<h2>Form Errors:</h2><ul>";
        foreach ($errors as $error) {
            echo "<li>" . htmlspecialchars($error) . "</li>";
        }
        echo "</ul>";
        echo '<p><a href="javascript:history.back()">Go back to form</a></p>';
    }
} else {
    // Display the form if accessed directly via GET request
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
            input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
            button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
            button:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <h1>Contact Form</h1>
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
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>
    <?php
}
?>