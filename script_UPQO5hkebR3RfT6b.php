<?php

// Database configuration
$servername = "localhost"; // Or your MySQL server address
$username = "your_username"; // Your MySQL username
$password = "your_password"; // Your MySQL password
$dbname = "your_database_name"; // The name of the database you want to connect to

try {
    // Create a new PDO connection
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Connected successfully";

    // You can perform database operations here
    // For example, fetching data:
    /*
    $stmt = $pdo->query("SELECT * FROM your_table_name");
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        print_r($row);
    }
    */

} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection (optional, as it's done automatically at the end of the script)
$pdo = null;

?>