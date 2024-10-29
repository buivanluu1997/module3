<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tìm kiếm tên quốc gia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Tìm kiếm tên quốc gia</h2>

    <!-- Form tìm kiếm -->
    <form action="user?action=search-country" method="post" class="mb-4">
        <div class="mb-3">
            <label for="searchCountry" class="form-label">Nhập tên muốn tìm:</label>
            <input type="text" name="searchCountry" id="searchCountry" placeholder="Tên quốc gia" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    </form>

    <!-- Bảng hiển thị kết quả -->
    <table class="table table-bordered">
        <c:choose>
            <c:when test="${not empty result}">
                <thead class="table-light">
                <tr>
                    <th>Id</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Quốc gia</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${result}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.country}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4" class="text-center text-danger">Tên quốc gia bạn tìm không có trong danh sách</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>

    <!-- Nút quay lại -->
    <div class="text-center mt-4">
        <a href="user" class="btn btn-secondary">Quay lại trang chủ</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>