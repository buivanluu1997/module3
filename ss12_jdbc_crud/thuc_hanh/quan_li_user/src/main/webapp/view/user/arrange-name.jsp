<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <title>Title</title>
</head>
<body>
<div class="container mt-5">
  <form action="user?action=arrange-name" method="get">
    <h1 class="text-center">Sắp xếp theo tên:</h1>
    <table class="table table-striped">
      <thead>
      <tr>
        <th>Id</th>
        <th>Tên</th>
        <th>Email</th>
        <th>Quốc gia</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${arrange}" var="user">
        <tr>
          <td>${user.id}</td>
          <td>${user.name}</td>
          <td>${user.email}</td>
          <td>${user.country}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </form>
  <div class="text-center mt-4">
    <a href="user?action=list" class="btn btn-primary">Quay lại trang chủ</a>
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>