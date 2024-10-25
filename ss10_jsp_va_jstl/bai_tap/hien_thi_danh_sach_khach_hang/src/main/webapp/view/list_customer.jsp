<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/25/2024
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <h1>Danh sách khách hàng</h1>
    <table class="table" border="1px">
        <tr>
            <th>Số thứ tự</th>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach items="${customers}" var="customer" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${customer.name}</td>
                <td>${customer.date}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.imageUrl}" alt="${customer.address}" width="100" height="100"/></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
