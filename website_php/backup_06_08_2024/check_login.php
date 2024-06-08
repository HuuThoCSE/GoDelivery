<?php
if (!isset($_COOKIE['shipper_id'])) {
    // Nếu không tìm thấy cookie shipper_id, chuyển hướng người dùng đến trang đăng nhập
    header("Location: /login");
    // exit(); // Đảm bảo mã sau lệnh header không được thực thi
} else {
    header("Location: /");
}
?>
