<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>User-Manager</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Quản Lí Người Dùng</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-light" href="/user?action=create">Thêm khách hàng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="/user?action=search-country">Tìm kiếm quốc gia</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="/user?action=arrange-name">Sắp xếp theo tên</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
  <h1 class="text-center text-primary my-4 display-4">Danh sách người dùng</h1>

  <div class="d-flex justify-content-around my-4">
    <a href="/user?action=create" class="btn btn-primary">Thêm khách hàng</a>
    <a href="/user?action=search-country" class="btn btn-info">Tìm kiếm quốc gia</a>
    <a href="/user?action=arrange-name" class="btn btn-warning">Sắp xếp theo tên</a>
  </div>

  <table class="table table-bordered">
    <thead class="table-light">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Tên</th>
      <th scope="col">Email</th>
      <th scope="col">Quốc gia</th>
      <th scope="col">Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user">
      <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.country}</td>
        <td>
          <button onclick="deleteUser(${user.id},'${user.name}')" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
            Xoá
          </button>
          <button onclick="updateUser(${user.id},'${user.name}','${user.email}','${user.country}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal">
            Sửa
          </button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <!-- Modal sửa-->
  <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <form action="user?action=update" method="post">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="updateModalLabel">Sửa người dùng</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="hidden" name="id" id="id">
            <input type="text" name="name" id="name" class="form-control" required placeholder="Tên">
            <input type="email" name="email" id="email" class="form-control" required placeholder="Email">
            <input type="text" name="country" id="country" class="form-control" required placeholder="Quốc gia">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <!-- Modal xoá -->
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <form action="user?action=delete" method="post">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="deleteModalLabel">Xoá người dùng</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input name="idUser" id="idUser">
            <span>Bạn có muốn xoá </span><span id="userName"></span><span> không?</span>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
            <button type="submit" class="btn btn-primary">Xoá</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <script>
    function deleteUser(id, name) {
      document.getElementById("idUser").value = id;
      document.getElementById("userName").innerText = name;
    }

    function updateUser(id, name, email, country) {
      document.getElementById("id").value = id;
      document.getElementById("name").value = name;
      document.getElementById("email").value = email;
      document.getElementById("country").value = country;
    }
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>