<?php
include "config.php"; // Database connection

header("Content-Type: application/json");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    header("Access-Control-Allow-Origin: *");

    $email = $_POST['email'];
    $password = $_POST['password'];

    // Check if the user exists
    $stmt = $conn->prepare("SELECT id, name, email, password FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $user["password"])) {
            echo json_encode(["success" => true, "message" => "Login successful!", "user" => $user]);
        } else {
            echo json_encode(["success" => false, "message" => "Invalid password"]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "User not found"]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["success" => false, "message" => "Invalid request"]);
}
?>