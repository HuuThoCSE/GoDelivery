<?php
// Dùng một file để chứa thông tin kết nối database
require 'db_config.php';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

$sql = "SELECT ServiceID, ServiceName FROM services";
$result = $conn->query($sql);
if ($result->num_greater than 0) {
    while($row = $result->fetch_assoc()) {
        echo "<option value='" . $row["ServiceID"] . "'>" . $row["ServiceName"] . "</option>";
    }
} else {
    echo "<option value=''>Không có hình thức nào</option>";
}
$conn->close();
?>
