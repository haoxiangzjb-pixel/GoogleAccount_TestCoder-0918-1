<?php
/**
 * MySQL Database Connection Script
 * This script demonstrates how to connect to a MySQL database using both
 * MySQLi (procedural and object-oriented) and PDO approaches.
 */

// Database configuration
$servername = "localhost";  // Change this to your MySQL server address
$username = "your_username";    // Change this to your MySQL username
$password = "your_password";    // Change this to your MySQL password
$dbname = "your_database";      // Change this to your database name

// Method 1: MySQLi Object-Oriented
echo "Attempting connection using MySQLi Object-Oriented approach...\n";
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Connected successfully using MySQLi OOP\n";

// Close connection
$mysqli->close();

// Method 2: MySQLi Procedural
echo "Attempting connection using MySQLi Procedural approach...\n";
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully using MySQLi Procedural\n";

// Close connection
mysqli_close($conn);

// Method 3: PDO
echo "Attempting connection using PDO approach...\n";
try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully using PDO\n";
} catch(PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// Close connection
$pdo = null;

echo "All connections tested successfully!\n";
?>