<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Thêm viewport meta tag -->
    <title>GO - Tìm kiếm cửa hàng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<style>
<style>
@media (max-width: 768px) {
    h2 {
        font-size: 1.5rem; /* Giảm kích thước tiêu đề cho màn hình nhỏ */
    }

    .form-control {
        font-size: 1rem; /* Điều chỉnh kích thước font cho input */
    }
}
</style>

</style>
<body>
<div class="container mt-5">
    <h2>GODelivery - Tìm kiếm cửa hàng</h2>
    <div class="form-group">
        <input type="text" id="searchInput" class="form-control" placeholder="Nhập tên cửa hàng">
    </div>
    <div id="results" class="mt-3"></div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="search.js"></script>
</body>
<script>
$(document).ready(function() {
    $('#searchInput').on('input', function() {
        var input = $(this).val();
        if (input.length >= 2) { // Chỉ tìm kiếm khi có ít nhất 2 ký tự
            $.post('search.php', {name: input}, function(data) {
                $('#results').html(data);
            });
        } else {
            $('#results').html('');
        }
    });
});
</script>
</html>
