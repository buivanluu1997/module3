<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>User-Manager</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
  <h1 class="text-center">Danh sách người dùng</h1>

  <p><a href="/user?action=create" class="btn btn-success">Thêm khách hàng</a></p>
  <p><a href="/user?action=search-country" class="btn btn-success">Tìm kiếm quốc gia</a></p>
  <p><a href="/user?action=arrange-name" class="btn btn-success">Sắp xếp theo tên</a></p>

  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Id</th>
      <th>Tên</th>
      <th>Email</th>
      <th>Quốc gia</th>
      <th>Hành động</th>
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
            <input type="hidden" name="idUser" id="idUser">
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