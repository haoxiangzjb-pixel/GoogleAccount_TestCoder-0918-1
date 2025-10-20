<?php
/**
 * Form Processing Script
 * Handles form submission with validation and sanitization
 */

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Function to validate email
function validateEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

// Function to validate required fields
function validateRequired($field, $fieldName) {
    if (empty($field)) {
        return "$fieldName is required.";
    }
    return null;
}

// Process form only if it's a POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Initialize error array
    $errors = array();
    
    // Process name
    $name = sanitizeInput($_POST["name"] ?? "");
    $nameError = validateRequired($name, "Name");
    if ($nameError) {
        $errors[] = $nameError;
    }
    
    // Process email
    $email = sanitizeInput($_POST["email"] ?? "");
    $emailError = validateRequired($email, "Email");
    if ($emailError) {
        $errors[] = $emailError;
    } elseif (!validateEmail($email)) {
        $errors[] = "Invalid email format.";
    }
    
    // Process message
    $message = sanitizeInput($_POST["message"] ?? "");
    $messageError = validateRequired($message, "Message");
    if ($messageError) {
        $errors[] = $messageError;
    }
    
    // If no errors, process the form data
    if (empty($errors)) {
        // In a real application, you might save to database, send email, etc.
        // For demonstration, we'll save to a file
        $data = array(
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        );
        
        // Save to file
        $logFile = 'form_submissions.txt';
        file_put_contents($logFile, json_encode($data) . "\n", FILE_APPEND | LOCK_EX);
        
        // Success response
        $success = "Form submitted successfully!";
    }
}

// Generate a random filename
$random_filename = 'form_handler_' . bin2hex(random_bytes(8)) . '.php';

// Copy the current script to the random filename
copy('form_handler.php', $random_filename);

echo "<h2>Form Processing Script</h2>";
echo "<p>Script saved with random filename: <strong>$random_filename</strong></p>";

if (isset($success)) {
    echo "<div style='color: green;'>" . $success . "</div>";
}

if (!empty($errors)) {
    echo "<div style='color: red;'>";
    foreach ($errors as $error) {
        echo "<p>$error</p>";
    }
    echo "</div>";
}

// Show the form if it hasn't been submitted or if there were errors
if ($_SERVER["REQUEST_METHOD"] != "POST" || !empty($errors)) {
    ?>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <div>
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" value="<?php echo isset($name) ? $name : ''; ?>" required>
        </div>
        <div>
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" value="<?php echo isset($email) ? $email : ''; ?>" required>
        </div>
        <div>
            <label for="message">Message:</label><br>
            <textarea id="message" name="message" required><?php echo isset($message) ? $message : ''; ?></textarea>
        </div>
        <div>
            <input type="submit" value="Submit">
        </div>
    </form>
    <?php
}
?>