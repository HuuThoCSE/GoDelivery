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
    <a href='/'>GoDelivery</a>
    <h2 class="mb-4"><b>ĐẶT HÀNG</b></h2>
    <form action="" method="post" class="mb-4">
        <div class="mb-3">
            <input type="hidden" id="client_datetime" name="client_datetime" value="">
            <label for="service_id" class="form-label">Hình thức</label>
            <select class="form-select" name="service_id" id="service_id">
                <option value=''></option>
                <?php include 'load_services.php'; ?>
            </select>
        </div>
        <div class="mb-3" id="shop_selection_container">
            <label for="shop_selection" class="form-label">Cửa hàng:</label>
            <select class="form-select" name="shop_selection" id="shop_selection" required>
                <?php include 'load_stores.php'; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="notes" class="form-label">Ghi chú</label>
            <textarea class="form-control" name="notes" id="notes" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">TẠO ĐƠN</button>
    </form>
    <?php include 'order_summary.php'; ?>
</div>

<script>
    $(document).ready(function() {
        $('#service_id, #shop_selection').select2();
        
        $('#service_id').on('change', function() {
            var serviceValue = $(this).val();
            if (serviceValue === "2") {
                $('#shop_selection_container').hide();
            } else {
                $('#shop_selection_container').show();
            }
        });

        // Kiểm tra giá trị ban đầu khi trang được tải
        $('#service_id').trigger('change');
    });
</script>

</body>
</html>
