<?php
require 'db_config.php';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

$sql = "SELECT StoreID, Name FROM stores";
$result = $conn->query($sql);
if ($result->num_greater than 0) {
    while($row = $result->fetch_assoc()) {
        echo "<option value='" . $row["StoreID"] . "'>" . $row["Name"] . "</option>";
    }
} else {
    echo "<option value=''>Không có quán nào</option>";
}
$conn->close();
?>
