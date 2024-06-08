<?php
session_start(); // Khởi động session

if (!isset($_COOKIE['shipper_id'])) { header("Location: /login");}
include 'db_config.php';

$shipper_id = $_COOKIE['shipper_id'] ?? '';
$shipper_name = "";

// Định nghĩa hàm sendMessage ở ngoài bất kỳ hàm nào khác
function sendMessage($chat_id, $message, $token) {
    $url = "https://api.telegram.org/bot$token/sendMessage";
    $data = array('chat_id' => $chat_id, 'text' => $message, 'parse_mode' => 'Markdown');

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $result = curl_exec($ch);
    if (curl_errno($ch)) {
        error_log('Curl error: ' . curl_error($ch));  // Log lỗi nếu có
        die('Error: ' . curl_error($ch));
    }
    curl_close($ch);
    error_log('Message sent to Telegram successfully');  // Log thông báo tin nhắn đã được gửi thành công
    return $result;
}

function send_telegram($order_id, $shipper_id, $shipper_name){
    $token = '7237982996:AAG4T45XcBGHuLCDKrCwTss_7bvm06uvUHw'; 
    $chat_id = '-1002181137988';
    $message = "*ĐƠN ID $order_id:* *(SP$shipper_id - $shipper_name)* đã nhận đơn.";

    // Gửi thông điệp
    sendMessage($chat_id, $message, $token);
}

if (isset($_GET['orderid'])) {
    $order_id = $_GET['orderid'];

    $stmt = $conn->prepare("SELECT ShipperID, ShipmentID FROM shipments WHERE OrderID = ?");
    $stmt->bind_param("i", $order_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $shipment_id = $row['ShipmentID'];
            $existing_shipper_id = $row['ShipperID'];

            echo "ShipmentID: " . $shipment_id . "<br>";

            // Truy vấn để lấy tên của shipper
            if (!empty($shipper_id)) {
                $shipperStmt = $conn->prepare("SELECT Name FROM shippers WHERE ShipperID = ?");
                $shipperStmt->bind_param("i", $shipper_id);
                $shipperStmt->execute();
                $shipperResult = $shipperStmt->get_result();

                if ($shipperResult->num_rows > 0) {
                    $shipperRow = $shipperResult->fetch_assoc();
                    // echo "Tên Shipper: " . $shipperRow['Name'] . "<br>";
                    $shipper_name = $shipperRow['Name'];
                } else {
                    echo "Không tìm thấy thông tin shipper.<br>";
                }
            }

            if (!empty($existing_shipper_id)) {
                $shipperStmt = $conn->prepare("SELECT Name FROM shippers WHERE ShipperID = ?");
                $shipperStmt->bind_param("i", $existing_shipper_id);
                $shipperStmt->execute();
                $shipperResult = $shipperStmt->get_result();

                if ($shipperResult->num_rows > 0) {
                    $shipperRow = $shipperResult->fetch_assoc();
                    echo "<p style='color: red; font-weight: bold;'>Đơn đã được nhận bởi: SP". $existing_shipper_id . " - " . $shipperRow['Name'] . "</p><br>";
                } else {
                    echo "Không tìm thấy thông tin shipper.<br>";
                }
                $shipperStmt->close();
            } else if (!empty($shipper_id)) {
                $updateStmt = $conn->prepare("UPDATE shipments SET ShipperID = ? WHERE ShipmentID = ?");
                $updateStmt->bind_param("ii", $shipper_id, $shipment_id);
                $updateStmt->execute();
                $updateStmt->close();
                print($order_id ." - ". $shipment_id ." - ". $shipper_name);
                send_telegram($order_id, $shipper_id, $shipper_name);
                echo "ShipperID đã được cập nhật thành: " . $shipper_id . "<br>";
            }
        }
    } else {
        echo "Không tìm thấy đơn hàng nào.<br>";
    }
    $stmt->close();
} else {
    echo "Không có mã đơn hàng được cung cấp.<br>";
}
$conn->close();
?>