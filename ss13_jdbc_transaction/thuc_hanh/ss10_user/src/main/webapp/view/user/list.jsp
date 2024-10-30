<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2024
  Time: 2:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
  <h1>Danh Sach User</h1>
  <p><a href="user?action=add">Them nguoi dung</a></p>
  <p><a href="user?action=search-id">Tim kiem theo id</a></p>
  <p><a href="user?action=transaction">Thuc hien transaction</a></p>
<table class="table table-striped">
    <tr>
        <th>Id</th>
        <th>Tên</th>
        <th>Email</th>
        <th>Quốc gia</th>
        <th>Xoá người dùng</th>
        <th>Sửa người dùng</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><button onclick="deleteUser(${user.id},'${user.name}')" type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Xoá
            </button></td>
            <td><button onclick="updateUser(${user.id},'${user.name}','${user.email}','${user.country}')" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateModal">
                Sửa
            </button></td>
        </tr>
    </c:forEach>
</table>

  <!-- Modal Xoá-->
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <form action="user?action=delete" method="post">

          <div class="modal-content">
              <div class="modal-header">
                  <h1 class="modal-title fs-5" id="deleteModalLabel">Sửa người dùng</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <input type="number" size="10px" name="id" id="id">
                  <span>Bạn có muốn xoá </span><span id="name"></span><span> không???</span>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                  <button type="submit" class="btn btn-primary">Xoá</button>
              </div>
          </div>

          </form>
      </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <form action="user?action=update" method="post">

              <div class="modal-content">
                  <div class="modal-header">
                      <h1 class="modal-title fs-5" id="updateModalLabel">Cập nhật người dùng</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <input hidden="hidden" type="number" size="10px" name="id" id="userId">
                      <input type="text"  name="name" id="UserName">
                      <input type="text"  name="email" id="email">
                      <input type="text"  name="country" id="country">
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                      <button type="submit" class="btn btn-primary">Cập nhật</button>
                  </div>
              </div>

          </form>
      </div>
  </div>


  <script>
      function deleteUser(id, name){
          document.getElementById("id").value = id;
          document.getElementById("name").innerText = name;
      }

      function updateUser(id, name, email, country){
          document.getElementById("userId").value = id;
          document.getElementById("name").value = name;
          document.getElementById("mail").value = email;
          document.getElementById("country").value = country;
      }
  </script>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
