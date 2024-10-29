<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Thêm người dùng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center">Thêm người dùng</h2>
  <form action="/user?action=create" method="post" class="mt-4">
    <div class="mb-3">
      <label for="name" class="form-label">Nhập tên:</label>
      <input type="text" name="name" id="name" class="form-control" placeholder="Tên" required>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Nhập email:</label>
      <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
    </div>
    <div class="mb-3">
      <label for="country" class="form-label">Nhập quốc gia:</label>
      <input type="text" name="country" id="country" class="form-control" placeholder="Quốc gia" required>
    </div>
    <button type="submit" class="btn btn-success">Thêm</button>
    <a href="/user" class="btn btn-secondary">Quay lại</a>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>