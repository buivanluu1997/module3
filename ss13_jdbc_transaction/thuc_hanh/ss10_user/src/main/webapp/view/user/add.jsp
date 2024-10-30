<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2024
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
</head>
<body>
<h1>Thêm người dùng</h1>
<form action="user?action=add" method="post">
    <label>Nhập tên</label>
    <input type="text" name="name" placeholder="tên">
    <label>Nhập email</label>
    <input type="text" name="email" placeholder="email">
    <label>Nhập quốc gia</label>
    <input type="text" name="country" placeholder="quốc gia">
    <input type="submit" value="Thêm">
</form>
</body>
</html>
