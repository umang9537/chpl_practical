<?php
$servername = "localhost";  // Server address (in this case localhost)
$username = "root";         // MySQL username
$password = "";             // MySQL password (leave empty if no password for local setup)
$dbname = "chpl_practical"; // The name of your database

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
