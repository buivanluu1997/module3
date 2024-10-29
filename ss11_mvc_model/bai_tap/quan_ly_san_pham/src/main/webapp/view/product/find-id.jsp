<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/28/2024
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Xem chi tiết sản phẩm</h1>
<form action="product?action=find-id" method="post">
  <label>Nhập id sản phẩm cần xem</label>
  <input type="number" name="id" placeholder="Nhập id">
  <input type="submit" value="Xem sản phẩm chi tiết">
</form>

<table border="1">
  <tr>
    <th>ID</th>
    <th>Tên Sản Phẩm</th>
    <th>Giá Sản Phẩm</th>
    <th>Số lượng</th>
  </tr>
  <tr>
    <td>${product.id}</td>
    <td>${product.name}</td>
    <td>${product.price}</td>
    <td>${product.quantity}</td>
  </tr>
</table>

</body>
</html>
