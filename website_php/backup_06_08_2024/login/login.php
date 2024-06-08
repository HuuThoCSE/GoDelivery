<?php
session_start(); // Khởi động session

include 'db_config.php'; // File cấu hình kết nối cơ sở dữ liệu

$phone = $_POST['phone'];
$pwd = $_POST['pwd'];

// Sử dụng prepared statements để tránh SQL injection
$stmt = $conn->prepare("SELECT ShipperID, shipper_pwd FROM shippers WHERE Phone = ?");
$stmt->bind_param("s", $phone);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $row = $result->fetch_assoc();
    if ($pwd == $row['shipper_pwd']) { // Lưu ý: Sử dụng hashing để lưu và kiểm tra mật khẩu trong thực tế
        $_SESSION['shipper_id'] = $row['ShipperID']; // Lưu shipper_id vào session
        // Set cookie nếu cần
        setcookie('shipper_id', $row['ShipperID'], time() + (86400 * 30), "/"); // 86400 = 1 ngày
        header("Location: /"); // Chuyển hướng đến trang chào mừng
    } else {
        echo "Mật khẩu không đúng";
    }
} else {
    echo "Không tìm thấy tài khoản";
}

$stmt->close();
$conn->close();
?>
