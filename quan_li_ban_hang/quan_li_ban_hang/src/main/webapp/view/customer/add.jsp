<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/31/2024
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add customer</title>
</head>
<body>
<form action="/customer?action=add" method="post">
    <h1>Thêm khách hàng</h1>
    <label>Nhập tên khách hàng</label>
    <input type="text" name="name" placeholder="tên khách hàng"></br>
    <label>Nhập tuổi khách hàng</label>
    <input type="text" name="age" placeholder="tuổi khách hàng"></br>
    <input type="submit" value="Thêm">
</form>
</body>
</html>
