<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP - Máy Tính</title>
    <!-- Thêm Bootstrap CSS từ CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <!-- Thẻ chứa form với thiết kế card -->
            <div class="card">
                <div class="card-header text-center">
                    <h1 class="h3 mb-3">Máy Tính</h1>
                </div>
                <div class="card-body">
                    <!-- Form máy tính -->
                    <form action="/calculator" method="post">
                        <div class="mb-3">
                            <label for="firstOperand" class="form-label">Toán hạng đầu tiên</label>
                            <input type="text" class="form-control" id="firstOperand" name="firstOperand" required>
                        </div>
                        <div class="mb-3">
                            <label for="operator" class="form-label">Toán tử</label>
                            <select class="form-select" id="operator" name="operator" required>
                                <option value="+">Cộng</option>
                                <option value="-">Trừ</option>
                                <option value="*">Nhân</option>
                                <option value="/">Chia</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="secondOperand" class="form-label">Toán hạng thứ 2</label>
                            <input type="text" class="form-control" id="secondOperand" name="secondOperand" required>
                        </div>
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary">=</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Thêm Bootstrap JS và các phần phụ thuộc -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
