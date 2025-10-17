<?php
// Database configuration
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";

try {
    // Create connection using MySQLi
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    // Check connection
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }
    echo "Connected successfully using MySQLi";

    // Alternative: PDO connection
    /*
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully using PDO";
    */
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
} catch(Exception $e) {
    echo "Error: " . $e->getMessage();
}

// Close connection
$conn->close();
?>