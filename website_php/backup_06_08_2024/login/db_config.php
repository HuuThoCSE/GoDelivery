<?php
// Kết nối tới cơ sở dữ liệu
$servername = "localhost"; // Địa chỉ server
$username = "huuthocs_godelivery"; // Tên đăng nhập MySQL
$password = "T26052k3h@"; // Mật khẩu MySQL
$dbname = "huuthocs_godelivery"; // Tên cơ sở dữ liệu

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Thiết lập kết nối để sử dụng UTF-8
$conn->set_charset("utf8mb4");

?>