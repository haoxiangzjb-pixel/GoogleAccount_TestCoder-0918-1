<?php
// Simple form processor script

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
    // Collect form data
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message']) : '';
    
    // Basic validation
    $errors = [];
    if (empty($name)) {
        $errors[] = "Name is required";
    }
    if (empty($email)) {
        $errors[] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Email is not valid";
    }
    if (empty($message)) {
        $errors[] = "Message is required";
    }
    
    if (empty($errors)) {
        // In a real application, you would save to database or send an email
        // For this example, we'll just save to a text file
        
        $data = "Name: $name\n";
        $data .= "Email: $email\n";
        $data .= "Message: $message\n";
        $data .= "Date: " . date('Y-m-d H:i:s') . "\n";
        $data .= "------------------------\n";
        
        // Save to file
        file_put_contents('form_submissions.txt', $data, FILE_APPEND | LOCK_EX);
        
        $success = "Form submitted successfully!";
    }
}

// Generate a random filename
$random_filename = 'form_handler_' . bin2hex(random_bytes(8)) . '.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form Processor</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        .error { color: red; margin-bottom: 10px; }
        .success { color: green; margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>Contact Form</h1>
    
    <?php if (isset($errors) && !empty($errors)): ?>
        <div class="error">
            <ul>
            <?php foreach ($errors as $error): ?>
                <li><?php echo $error; ?></li>
            <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>
    
    <?php if (isset($success)): ?>
        <div class="success"><?php echo $success; ?></div>
    <?php endif; ?>
    
    <form method="post" action="">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>">
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>">
        </div>
        
        <div class="form-group">
            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="5"><?php echo isset($_POST['message']) ? htmlspecialchars($_POST['message']) : ''; ?></textarea>
        </div>
        
        <button type="submit">Submit</button>
    </form>
    
    <p><strong>Random filename generated: <?php echo $random_filename; ?></strong></p>
</body>
</html>