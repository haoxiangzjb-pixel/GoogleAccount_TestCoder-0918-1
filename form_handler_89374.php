<?php
/**
 * Form Processing Script
 * Handles form submission, validates input, and processes data
 */

// Set content type to HTML
header('Content-Type: text/html; charset=utf-8');

// Define an array to store errors
$errors = [];
$data = [];

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $name = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $message = trim($_POST['message'] ?? '');
    $age = $_POST['age'] ?? '';

    // Validate name
    if (empty($name)) {
        $errors[] = 'Name is required.';
    } elseif (strlen($name) < 2) {
        $errors[] = 'Name must be at least 2 characters long.';
    } elseif (!preg_match('/^[a-zA-Z\s\-\'\.]+$/', $name)) {
        $errors[] = 'Name contains invalid characters.';
    } else {
        $data['name'] = htmlspecialchars($name, ENT_QUOTES, 'UTF-8');
    }

    // Validate email
    if (empty($email)) {
        $errors[] = 'Email is required.';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Invalid email format.';
    } else {
        $data['email'] = htmlspecialchars($email, ENT_QUOTES, 'UTF-8');
    }

    // Validate age (optional field)
    if (!empty($age)) {
        if (!is_numeric($age) || $age < 1 || $age > 120) {
            $errors[] = 'Age must be a number between 1 and 120.';
        } else {
            $data['age'] = (int)$age;
        }
    }

    // Validate message
    if (empty($message)) {
        $errors[] = 'Message is required.';
    } elseif (strlen($message) < 10) {
        $errors[] = 'Message must be at least 10 characters long.';
    } else {
        $data['message'] = htmlspecialchars($message, ENT_QUOTES, 'UTF-8');
    }

    // If no errors, process the data
    if (empty($errors)) {
        // Save data to file or database
        $log_entry = date('Y-m-d H:i:s') . " - Name: {$data['name']}, Email: {$data['email']}, Age: {$data['age']}, Message: {$data['message']}\n";
        file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);
        
        // Success message
        $success = "Thank you, {$data['name']}! Your form has been submitted successfully.";
    }
} else {
    // If not POST, initialize variables
    $name = $email = $message = $age = '';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Handler</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        textarea { height: 100px; resize: vertical; }
        button { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        .error { color: red; margin-bottom: 10px; }
        .success { color: green; margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>Contact Form</h1>
    
    <?php if (isset($success)): ?>
        <div class="success"><?php echo $success; ?></div>
    <?php endif; ?>
    
    <?php if (!empty($errors)): ?>
        <div class="error">
            <p>Please correct the following errors:</p>
            <ul>
                <?php foreach ($errors as $error): ?>
                    <li><?php echo htmlspecialchars($error, ENT_QUOTES, 'UTF-8'); ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>
    
    <form method="POST" action="">
        <div class="form-group">
            <label for="name">Name *</label>
            <input type="text" id="name" name="name" value="<?php echo isset($data['name']) ? $data['name'] : htmlspecialchars($name ?? '', ENT_QUOTES, 'UTF-8'); ?>" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" value="<?php echo isset($data['email']) ? $data['email'] : htmlspecialchars($email ?? '', ENT_QUOTES, 'UTF-8'); ?>" required>
        </div>
        
        <div class="form-group">
            <label for="age">Age</label>
            <input type="number" id="age" name="age" value="<?php echo isset($data['age']) ? $data['age'] : htmlspecialchars($age ?? '', ENT_QUOTES, 'UTF-8'); ?>" min="1" max="120">
        </div>
        
        <div class="form-group">
            <label for="message">Message *</label>
            <textarea id="message" name="message" placeholder="Please enter your message here..." required><?php echo isset($data['message']) ? $data['message'] : htmlspecialchars($message ?? '', ENT_QUOTES, 'UTF-8'); ?></textarea>
        </div>
        
        <button type="submit">Submit</button>
    </form>
</body>
</html>