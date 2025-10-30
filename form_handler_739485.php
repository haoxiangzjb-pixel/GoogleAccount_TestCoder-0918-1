<?php
// PHP script to handle form processing
// This script processes form data and saves it to a file

// Function to generate a random string
function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Collect form data
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message']) : '';
    
    // Validate required fields
    if (!empty($name) && !empty($email)) {
        // Create data string to save
        $data = "Name: " . $name . "\n";
        $data .= "Email: " . $email . "\n";
        $data .= "Message: " . $message . "\n";
        $data .= "Submitted at: " . date('Y-m-d H:i:s') . "\n";
        $data .= "------------------------\n";
        
        // Save to a file with a random name
        $randomFileName = "form_data_" . generateRandomString(8) . ".txt";
        $filePath = "submissions/" . $randomFileName;
        
        // Create directory if it doesn't exist
        if (!file_exists('submissions')) {
            mkdir('submissions', 0777, true);
        }
        
        // Write data to file
        if (file_put_contents($filePath, $data, FILE_APPEND | LOCK_EX)) {
            echo "<h2>Form submitted successfully!</h2>";
            echo "<p>Thank you, <strong>" . $name . "</strong>, for your submission.</p>";
            echo "<p>Your data has been saved to: " . $randomFileName . "</p>";
        } else {
            echo "<h2>Error saving form data!</h2>";
            echo "<p>Please try again later.</p>";
        }
    } else {
        echo "<h2>Error: Missing required fields!</h2>";
        echo "<p>Please fill in both name and email.</p>";
    }
} else {
    // Display the form if no POST request
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
                margin: 0 auto;
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
        <form method="POST" action="">
            <div class="form-group">
                <label for="name">Name *</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email *</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" rows="5"></textarea>
            </div>
            
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>
    <?php
}
?>