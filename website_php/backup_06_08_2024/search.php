<?php
include 'db_config.php';

$name = $_POST['name'];

// Truy vấn cơ sở dữ liệu
$sql = "SELECT Name, Address, Address_google, Phone FROM stores WHERE Name LIKE ?";
$stmt = $conn->prepare($sql);
$searchTerm = '%' . $name . '%';
$stmt->bind_param("s", $searchKeyword);
$searchKeyword = $searchTerm;
$stmt->execute();
$result = $stmt->get_result();

// Hiển thị kết quả
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<div class='card mb-3'><div class='card-body'>";
        echo "<h5 class='card-title'>" . $row['Name'] . "</h5>";
        echo "<p class='card-text'>" . $row['Address'] . "</p>";
        echo "<h5>Số điện thoại: <a href='tel:".$row['Phone']."'>".$row['Phone']."</a></h5>";
        echo "<a href='" . $row['Address_google'] . "' target='_blank'>Vị trí cửa hàng</a>";
        echo "</div></div>";
    }
} else {
    echo "Không tìm thấy cửa hàng nào.";
}

$conn->close();
?>
