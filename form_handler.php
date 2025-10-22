<?php
// Form processing script
if ($_POST) {
    // Sanitize input data
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $message = htmlspecialchars($_POST['message'] ?? '');
    
    // Validate required fields
    if (empty($name) || empty($email)) {
        die("Name and email are required fields.");
    }
    
    // Create data string to save
    $data = "Name: $name\nEmail: $email\nMessage: $message\n---\n";
    
    // Generate random filename
    $random_filename = 'form_data_' . uniqid() . '.txt';
    
    // Save to file
    if (file_put_contents($random_filename, $data, FILE_APPEND | LOCK_EX)) {
        echo "Form data saved successfully to: $random_filename";
    } else {
        echo "Error saving form data.";
    }
} else {
    // Display form if no POST data
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Form Processing Example</title>
    </head>
    <body>
        <h2>Form Processing Example</h2>
        <form method="post" action="">
            <p>
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" required>
            </p>
            <p>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" required>
            </p>
            <p>
                <label for="message">Message:</label><br>
                <textarea id="message" name="message"></textarea>
            </p>
            <p>
                <input type="submit" value="Submit">
            </p>
        </form>
    </body>
    </html>
    <?php
}
?>