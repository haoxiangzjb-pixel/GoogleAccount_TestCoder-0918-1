<?php
/**
 * Form Processing Script
 * Handles form submission and processes the data
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

// Process form data if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get form data
    $formData = [];
    
    // Process all POST data
    foreach ($_POST as $key => $value) {
        if (is_array($value)) {
            $formData[$key] = array_map('htmlspecialchars', $value);
        } else {
            $formData[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
        }
    }
    
    // Example validation - check if required fields exist
    $errors = [];
    if (empty($formData['name'])) {
        $errors[] = 'Name is required';
    }
    if (empty($formData['email']) || !filter_var($formData['email'], FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Valid email is required';
    }
    
    if (empty($errors)) {
        // Process the form data (save to file, database, etc.)
        
        // Generate a random filename
        $randomFilename = 'form_data_' . generateRandomString() . '.txt';
        $filePath = __DIR__ . '/' . $randomFilename;
        
        // Save form data to file
        $dataToSave = "Form Submission Data:\n";
        $dataToSave .= "Submitted at: " . date('Y-m-d H:i:s') . "\n";
        $dataToSave .= "------------------------\n";
        
        foreach ($formData as $field => $value) {
            if (is_array($value)) {
                $dataToSave .= $field . ": " . implode(', ', $value) . "\n";
            } else {
                $dataToSave .= $field . ": " . $value . "\n";
            }
        }
        
        $dataToSave .= "\n";
        
        // Write to file
        if (file_put_contents($filePath, $dataToSave)) {
            $successMessage = "Form submitted successfully! Data saved to: " . $randomFilename;
        } else {
            $errorMessage = "Error saving form data to file.";
        }
    }
} else {
    // Display form if not submitted
    $displayForm = true;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Processing Example</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, textarea, select { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        button { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        .error { color: red; margin-bottom: 10px; }
        .success { color: green; margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>Form Processing Example</h1>
    
    <?php if (isset($errorMessage)): ?>
        <div class="error"><?php echo $errorMessage; ?></div>
    <?php endif; ?>
    
    <?php if (isset($successMessage)): ?>
        <div class="success"><?php echo $successMessage; ?></div>
    <?php endif; ?>
    
    <?php if (isset($errors) && !empty($errors)): ?>
        <div class="error">
            <ul>
            <?php foreach ($errors as $error): ?>
                <li><?php echo $error; ?></li>
            <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>
    
    <?php if (!isset($successMessage)): ?>
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
            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject">
        </div>
        
        <div class="form-group">
            <label for="message">Message</label>
            <textarea id="message" name="message" rows="5"></textarea>
        </div>
        
        <div class="form-group">
            <label>Interests</label>
            <div>
                <input type="checkbox" id="interest1" name="interests[]" value="Technology">
                <label for="interest1" style="display: inline;">Technology</label>
            </div>
            <div>
                <input type="checkbox" id="interest2" name="interests[]" value="Sports">
                <label for="interest2" style="display: inline;">Sports</label>
            </div>
            <div>
                <input type="checkbox" id="interest3" name="interests[]" value="Arts">
                <label for="interest3" style="display: inline;">Arts</label>
            </div>
        </div>
        
        <button type="submit">Submit Form</button>
    </form>
    <?php endif; ?>
</body>
</html>