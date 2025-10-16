<?php
// Database configuration
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database";
    
    // Example: Perform a simple query
    $stmt = $pdo->query("SELECT 1");
    $result = $stmt->fetch();
    
    // Close connection
    $pdo = null;
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Alternative using mysqli
/*
$connection = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}
echo "Connected successfully using MySQLi";

// Close connection
$connection->close();
*/
?>