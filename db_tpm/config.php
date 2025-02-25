<?php
$host = "localhost";
$user = "root"; // Default XAMPP user
$password = ""; // No password by default
$database = "db_tpm";

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
