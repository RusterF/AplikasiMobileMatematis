<?php
include "config.php"; // Include database connection

header("Content-Type: application/json"); // Set response type to JSON

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    header("Access-Control-Allow-Origin: *");
    $name = isset($_POST['name']) ? trim($_POST['name']) : "";
    $email = isset($_POST['email']) ? trim($_POST['email']) : "";
    $password = isset($_POST['password']) ? $_POST['password'] : "";

    // Validate input
    if (empty($name) || empty($email) || empty($password)) {
        echo json_encode(["status" => "error", "message" => "All fields are required", "name" => empty($name), "email" => empty($email), "password" => empty($password)]);
        exit;
    }

    // Check if email already exists
    $checkStmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $checkStmt->bind_param("s", $email);
    $checkStmt->execute();
    $checkStmt->store_result();

    if ($checkStmt->num_rows > 0) {
        echo json_encode(["status" => "error", "message" => "Email already registered"]);
        $checkStmt->close();
        exit;
    }
    $checkStmt->close();

    // Hash the password before storing
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Insert into database
    $stmt = $conn->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $name, $email, $hashedPassword);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "User added successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error: " . $stmt->error]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request method"]);
}
?>