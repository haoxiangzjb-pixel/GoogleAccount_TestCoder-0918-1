<?php
// Simple form handler script

$name = $email = $message = '';
$nameErr = $emailErr = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Validate name
    if (empty($_POST['name'])) {
        $nameErr = 'Name is required';
    } else {
        $name = trim($_POST['name']);
        // Add more validation if needed
    }

    // Validate email
    if (empty($_POST['email'])) {
        $emailErr = 'Email is required';
    } else {
        $email = trim($_POST['email']);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = 'Invalid email format';
        }
    }

    // Process message if provided
    if (isset($_POST['message'])) {
        $message = trim($_POST['message']);
        // Add more validation if needed
    }

    // If no errors, process the data (e.g., save to file, send email, etc.)
    if (empty($nameErr) && empty($emailErr)) {
        $data = 'Name: ' . $name . "\n" . 'Email: ' . $email . "\n" . 'Message: ' . $message . "\n---\n";
        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);
        echo 'Form submitted successfully!';
    }
}
?>
<!DOCTYPE html>

<html>
<head>
    <title>Form Handler Example</title>
</head>
<body>
    <h2>Contact Form</h2>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<?php echo htmlspecialchars($name); ?>">
        <span style="color: red;"><?php echo $nameErr; ?></span>
        <br><br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<?php echo htmlspecialchars($email); ?>">
        <span style="color: red;"><?php echo $emailErr; ?></span>
        <br><br>

        <label for="message">Message:</label>
        <textarea id="message" name="message"><?php echo htmlspecialchars($message); ?></textarea>
        <br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
