<?php
// Form processing script
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize and validate input data
    $name = isset($_POST['name']) ? htmlspecialchars(trim($_POST['name'])) : '';
    $email = isset($_POST['email']) ? filter_var(trim($_POST['email']), FILTER_VALIDATE_EMAIL) : false;
    $message = isset($_POST['message']) ? htmlspecialchars(trim($_POST['message'])) : '';
    
    // Basic validation
    if (empty($name) || !$email || empty($message)) {
        $error = "All fields are required and must be valid.";
    } else {
        // Process the form data (save to file, database, send email, etc.)
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Save to a log file
        $log_entry = json_encode($data) . "\n";
        file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);
        
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
    <title>Form Handler</title>
</head>
<body>
    <h1>Contact Form</h1>
    
    <?php if (isset($error)): ?>
        <div style="color: red;"><?php echo $error; ?></div>
    <?php endif; ?>
    
    <?php if (isset($success)): ?>
        <div style="color: green;"><?php echo $success; ?></div>
    <?php endif; ?>
    
    <form method="POST" action="">
        <div>
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" value="<?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>" required>
        </div>
        
        <div>
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>" required>
        </div>
        
        <div>
            <label for="message">Message:</label><br>
            <textarea id="message" name="message" required><?php echo isset($_POST['message']) ? htmlspecialchars($_POST['message']) : ''; ?></textarea>
        </div>
        
        <button type="submit">Submit</button>
    </form>
    
    <p>Random filename for this script: <?php echo $random_filename; ?></p>
</body>
</html>