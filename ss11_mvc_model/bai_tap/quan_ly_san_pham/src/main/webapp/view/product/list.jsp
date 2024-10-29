<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/28/2024
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<h1>Danh Sách Sản Phẩm</h1>

<p><a href="/product?action=create">Thêm sản phâm mới</a></p>
<p><a href="/product?action=find-id">Xem chi tiết sản phẩm</a></p>
<table border="1">
  <tr>
    <th>STT</th>
    <th>ID</th>
    <th>Tên Sản Phẩm</th>
    <th>Giá Sản Phẩm</th>
    <th>Số lượng</th>
  </tr>
  <c:forEach items="${products}" var="product" varStatus="status">
    <tr>
      <td>${status.count}</td>
      <td>${product.id}</td>
      <td>${product.name}</td>
      <td>${product.price}</td>
      <td>${product.quantity}</td>
      <td><button onclick="deleteProduct(${product.id},'${product.name}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Delete
      </button></td>
    </tr>
  </c:forEach>
</table>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form action="/product?action=delete" method="post">

    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input name="productId" id="productId">
        <span>Bạn thật sự muốn xoá </span><span id="name"></span><span> không???</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Delete</button>
      </div>
    </div>

    </form>
  </div>
</div>

<script>
  function deleteProduct(id, name){
    document.getElementById("productId").value = id;
    document.getElementById("name").innerText = name;
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
