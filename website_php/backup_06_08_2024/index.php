<?php
session_start(); // Khởi động session
if (!isset($_COOKIE['shipper_id'])) { header("Location: /login");}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <title>GO - Order</title>
</head>
<style>
        .order-list {
            max-height: 400px; /* Điều chỉnh chiều cao tối đa theo nhu cầu */
            overflow-y: auto;
        }
</style>
<body>
<div class="container mt-5">
    <h2 class="mb-4"><b>GO - ĐẶT HÀNG</b></h2>
    <form action="" method="post" class="mb-4">
        <div class="mb-3">
            <input type="hidden" id="client_datetime" name="client_datetime" value="">
            <label for="service_id" class="form-label">Hình thức</label>
            <select class="form-select" name="service_id" id="service_id">
                <option value=''></option>
                <?php
                require 'db_config.php';

                // Truy vấn danh sách các hình thức
                $sql = "SELECT ServiceID, ServiceName FROM services";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    // Hiển thị từng hình thức trong dropdown
                    while($row = $result->fetch_assoc()) {
                        echo "<option value='" . $row["ServiceID"] . "'>" . $row["ServiceName"] . "</option>";
                    }
                } else {
                    echo "<option value=''>Không có hình thức nào</option>";
                }

                // Đóng kết nối
                $conn->close();
                ?>
            </select>
        </div>
        <div class="mb-3">
            <div class="mb-3" id="shop_selection_container">
                <label for="shop_selection" class="form-label">Cửa hàng:</label>
                <select class="form-select" name="shop_selection" id="shop_selection" required>
                <?php
                // Kết nối lại cơ sở dữ liệu
                $conn = new mysqli($servername, $username, $password, $dbname);
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // Thiết lập kết nối để sử dụng UTF-8
                $conn->set_charset("utf8mb4");

                // Truy vấn danh sách các quán
                $sql = "SELECT StoreID, Name FROM stores";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    // Hiển thị từng quán trong dropdown
                    while($row = $result->fetch_assoc()) {
                        echo "<option value='" . $row["StoreID"] . "'>" . $row["Name"] . "</option>";
                    }
                } else {
                    echo "<option value=''>Không có quán nào</option>";
                }

                // Đóng kết nối
                $conn->close();
                ?>
                </select>
            </div>
        </div>
        <!---
        <div class="mb-3">
            <div class="mb-3" id="address_selection_container">
                <label for="address_selection" class="form-label">Địa chỉ giao:</label>
                <select class="form-select" name="address_selection" id="address_selection">
                    <option value=""></option>
                    <option value="Phường 1">Phường 1</option>
                    <option value="Phường 2">Phường 2</option>
                    <option value="Phường 3">Phường 3</option>
                    <option value="Phường 4">Phường 4</option>
                    <option value="Phường 5">Phường 5</option>
                    <option value="Phường 8">Phường 8</option>
                    <option value="Phường 9">Phường 9</option>
                </select>
            </div>
        </div> -->
        <div class="mb-3">
            <label for="notes" class="form-label">Ghi chú</label>
            <textarea class="form-control" name="notes" id="notes" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">TẠO ĐƠN</button>
    </form>

    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h2>Summary</h2>
            <button class="btn btn-secondary" id="copyButton">Copy</button>
        </div>
        <div class="card-body" id="summaryContent">
        <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $service_id = htmlspecialchars($_POST['service_id']);
                $shop_selection = htmlspecialchars($_POST['shop_selection']);
                // $address = htmlspecialchars($_POST['address_selection']);
                $notes = htmlspecialchars($_POST['notes']);
                $clientDatetime = $_POST['client_datetime'];

                require 'db_config.php';

                // Kết nối lại cơ sở dữ liệu để lưu đơn hàng và lấy thông tin cần thiết
                $conn = new mysqli($servername, $username, $password, $dbname);
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // Thiết lập kết nối để sử dụng UTF-8
                $conn->set_charset("utf8mb4");

                // Lấy tên hình thức
                $sql = "SELECT ServiceName FROM services WHERE ServiceID = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $service_id);
                $stmt->execute();
                $stmt->bind_result($service_name);
                $stmt->fetch();
                $stmt->close();

                // Lấy tên quán
                $sql = "SELECT Name FROM stores WHERE StoreID = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $shop_selection);
                $stmt->execute();
                $stmt->bind_result($shop_name);
                $stmt->fetch();
                $stmt->close();
                
                // if($service_id != 2) {
                //     $full_notes = "Địa chỉ giao: " . $address . "\nGhi chú: " . nl2br($notes);
                // } else {
                //     $full_notes = "Hình thức:".$service_name . "\nGhi chú: " . nl2br($notes);
                // }

                // Loại bỏ HTML tags
                $notes = strip_tags($notes);

                // Loại bỏ các ký tự đặc biệt
                $notes = preg_replace('/[@]/', '', $notes);

                $full_notes = "Hình thức: ". $service_name . "\nGhi chú: " . nl2br($notes);
                
                // Lưu đơn hàng
                $sql = "INSERT INTO orders (ServiceID, StoreID, Notes, OrderDate) VALUES (?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("iiss", $service_id, $shop_selection, $full_notes, $clientDatetime);
                $stmt->execute();
                $order_id = $stmt->insert_id; // Lấy ID của đơn hàng mới tạo
                $stmt->close();

                // Đóng kết nối
                $conn->close();

                echo "<p><strong>ĐƠN all ID:</strong> " . $order_id . "</p>";
                echo "<p><strong>Hình thức:</strong> " . $service_name . "</p>";
                if($service_id != 2) {
                    echo "<p><strong>Cửa hàng:</strong> " . $shop_name . "</p>";
                    // echo "<p><strong>Địa chỉ giao:</strong> " . $address . "</p>";
                };
                echo "<p><strong>Ghi chú:</strong> " . nl2br($notes) . "</p>";

                $token = '7237982996:AAG4T45XcBGHuLCDKrCwTss_7bvm06uvUHw';  // Thay 'YOUR_BOT_TOKEN' bằng token thực tế của bạn
                $chat_id = '-1002181137988';  // Thay 'YOUR_CHAT_ID' bằng chat ID của nhóm

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

                $message = "*ĐƠN ID:* $order_id\n";
                $message .= "*Hình thức:* $service_name\n";
                if($service_id != 2) {
                    $message .= "*Cửa hàng:* $shop_name\n";
                }
                $message .= "*Ghi chú:* " . str_replace("\n", "  \n", $notes)."\n";  // Sử dụng ký tự xuống dòng trong Markdown
                $message .= "---\n";
                $message .= "*Nhận đơn:* http://huuthocs.id.vn/nhandon.php?orderid=$order_id";
                // Gửi thông điệp
                sendMessage($chat_id, $message, $token);
                
                header('/');
            }
            ?>
        </div>

    </div>

    <h2 class="mt-5 mb-4">DANH SÁCH ĐƠN HÀNG</h2>
    <div class="card">
        <div class="card-body order-list">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Hình thức</th>
                        <th>Quán</th>
                        <th>Ghi chú</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Kết nối tới cơ sở dữ liệu
                    $conn = new mysqli($servername, $username, $password, $dbname);

                    // Kiểm tra kết nối
                    if ($conn->connect_error) {
                        die("Connection failed: " . $conn->connect_error);
                    }

                    // Thiết lập kết nối để sử dụng UTF-8
                    $conn->set_charset("utf8mb4");

                    // Truy vấn danh sách các đơn hàng
                    // $sql = "SELECT * FROM orders ORDER BY OrderID DESC"
                    $sql = "SELECT o.OrderID, s.ServiceName, st.Name, o.Notes, st.Address_google 
                        FROM orders o 
                        LEFT JOIN services s ON o.ServiceID = s.ServiceID 
                        LEFT JOIN stores st ON o.StoreID = st.StoreID 
                        ORDER BY o.OrderDate DESC 
                        LIMIT 10";
                    // echo $sql;
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        // Hiển thị từng đơn hàng
                        while($row = $result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $row["OrderID"] . "</td>";
                            echo "<td>" . $row["ServiceName"] . "</td>";
                            echo "<td><a href='" . $row["Address_google"] . "'>" . $row["Name"] . "</a></td>";
                            echo "<td>" . nl2br($row["Notes"]) . "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>Không có đơn hàng nào.</td></tr>";
                    }

                    // Đóng kết nối
                    $conn->close();
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('#service_id').select2({
        tags: true
    }).on('change', function() {
        var serviceValue = $(this).val();
        if (serviceValue === "2") {
            $('#shop_selection_container').hide();
            $('#address_selection_container').hide();
        } else {
            $('#shop_selection_container').show();
            $('#address_selection_container').show();
        }
    });

    $('#shop_selection').select2({
        tags: true
    });
    $('#address_selection').select2({
        tags: true
    });

    // Kiểm tra giá trị ban đầu khi trang được tải
    $('#service_id').trigger('change');

    document.querySelector('form').addEventListener('submit', function() {
        var now = new Date();
        var datetimeString = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate() + ' ' + now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds();
        document.getElementById('client_datetime').value = datetimeString;
    });

    document.getElementById('copyButton').addEventListener('click', function() {
        var summaryContent = document.getElementById('summaryContent').innerText;
        var tempInput = document.createElement('textarea');
        tempInput.value = summaryContent;
        document.body.appendChild(tempInput);
        tempInput.select();
        document.execCommand('copy');
        document.body.removeChild(tempInput);
        alert('Đã sao chép thành công.');
    });
});
</script>

</body>
</html>