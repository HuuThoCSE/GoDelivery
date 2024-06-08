<!DOCTYPE html>
<html lang="vi">
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
        max-height: 400px;
        overflow-y: auto;
    }
</style>
<body>
<div class="container mt-5">
    <h2 class="mb-4"><b>ĐẶT HÀNG</b></h2>
    <form action="" method="post" class="mb-4">
        <div class="mb-3">
            <label for="service_id" class="form-label">Hình thức</label>
            <select class="form-select" name="service_id" id="service_id">
                <option value=''>Chọn một hình thức...</option>
                <!-- Options will be loaded here -->
            </select>
        </div>
        <div class="mb-3 d-none" id="phone-number-container">
            <label for="phone_number" class="form-label">Số điện thoại</label>
            <input type="text" class="form-control" name="phone_number" id="phone_number" placeholder="Nhập số điện thoại của khách hàng">
        </div>
        <div class="mb-3">
            <label for="notes" class="form-label">Ghi chú</label>
            <textarea class="form-control" name="notes" id="notes" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">TẠO ĐƠN</button>
    </form>

    <!-- More content below... -->
</div>

<script>
    $(document).ready(function() {
        $('#service_id').select2().on('change', function() {
            var serviceId = $(this).val();
            if (serviceId) {
                $('#phone-number-container').removeClass('d-none');
            } else {
                $('#phone-number-p-container').addClass('d-none');
            }
        });

        $('form').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();
            $.ajax({
                url: $(this).attr('action'),
                type: 'POST',
                data: formData,
                success: function(response) {
                    alert('Đơn hàng đã được tạo thành công!');
                    $('form').trigger('reset');
                    $('#phone-number-container').addClass('d-none');
                },
                error: function() {
                    alert('Có lỗi xảy ra, vui lòng thử lại.');
                }
            });
        });
    });
</script>

</body>
</html>
