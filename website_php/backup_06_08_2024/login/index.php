<?php
session_start(); // Khởi động session

// if (isset($_COOKIE['shipper_id'])) {
//     header("Location: /");
//     exit();
// }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>Đăng nhập</h2>
    <form action="login.php" method="post">
        <div class="form-group">
            <label for="phone">Số điện thoại:</label>
            <input type="text" class="form-control" id="phone" placeholder="Nhập số điện thoại" name="phone" required>
        </div>
        <div class="form-group">
            <label for="pwd">Mật khẩu:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Nhập mật khẩu" name="pwd" required>
        </div>
        <button type="submit" class="btn btn-primary">Đăng nhập</button>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
