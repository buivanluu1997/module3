<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/31/2024
  Time: 10:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh Sach Khach Hang Da Mua</title>
</head>
<body>
<h1>Danh sách khách hàng đã mua hàng</h1>
<table border="1">
  <tr>
    <th>Id khách hàng</th>
    <th>Tên khách hàng</th>
    <th>Tuổi</th>
    <th>Ngày mua hàng</th>
  </tr>
  <c:forEach items="${customerOrderDTOs}" var="cod">
    <tr>
      <td>${cod.id}</td>
      <td>${cod.name}</td>
      <td>${cod.age}</td>
      <td>${cod.date}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
