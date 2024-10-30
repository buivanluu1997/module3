<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2024
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search id user</title>
</head>
<body>
<h1>Tìm kiếm theo id</h1>
<form action="user?action=search-id" method="post">
    <label>Nhập id cần tìm kiếm: </label>
    <input type="number" name="searchId">
    <input type="submit" value="Tìm kiếm">
</form>

<table border="1">
    <c:if test="${not empty user}">
        <tr>
            <th>Id</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Quốc gia</th>
        </tr>
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
        </tr>
    </c:if>
    <c:if test="${empty user}">
        <tr>
            <td colspan="4">Id không tồn tại</td>
        </tr>
    </c:if>
</table>
</body>
</html>
