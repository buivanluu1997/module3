<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/28/2024
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new Customer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<h1>Thêm Khách Hàng mới</h1>
<a href="/customer">Quay lại danh sách khách hàng</a>
<form action="/customer?action=create" method="post" class="container mt-4">
    <h4 class="mb-4">Nhập thông tin khách hàng cần thêm</h4>

    <div class="form-group">
        <label for="id">Id:</label>
        <input type="number" class="form-control" id="id" name="id" required>
    </div>

    <div class="form-group">
        <label for="name">Tên khách hàng:</label>
        <input type="text" class="form-control" id="name" name="name" required>
    </div>

    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" id="email" name="email" required>
    </div>

    <div class="form-group">
        <label for="address">Địa chỉ:</label>
        <input type="text" class="form-control" id="address" name="address" required>
    </div>

    <button type="submit" class="btn btn-primary">Thêm khách hàng</button>
</form>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
