<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/28/2024
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="product?action=create" method="post">
<h1>Thêm sản phẩm mới</h1>
    <label>Id: </label>
    <input type="number" name="productId" placeholder="id sản phẩm"> <br/>
    <label>Tên sản phẩm: </label>
    <input type="text" name="productName" placeholder="tên sản phẩm"> <br/>
    <label>Giá sản phẩm: </label>
    <input type="text" name="price" placeholder="giá"> <br/>
    <label>Số lượng: </label>
    <input type="text" name= "quantity" placeholder="số lượng"> <br/>
    <input type="submit" value="Thêm sản phẩm">
</form>
</body>
</html>
