<?php
session_start(); // Khởi động session để có thể truy cập và xóa các biến session

// Xóa tất cả các biến session
session_unset();

// Hủy session
session_destroy();

// Kiểm tra nếu có cookie 'shipper_id' và xóa nó
if (isset($_COOKIE['shipper_id'])) {
    unset($_COOKIE['shipper_id']);
    setcookie('shipper_id', '', time() - 3600, '/'); // Đặt thời gian quá khứ để hủy cookie
}

// Chuyển hướng người dùng về trang đăng nhập hoặc trang chủ
header("Location: /login"); // Sửa đổi đường dẫn phù hợp nếu cần
exit();
?>
