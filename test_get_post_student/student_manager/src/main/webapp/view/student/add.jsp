<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2024
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Student</title>
    <style>
        body{
            display: flex;
            justify-content: center;
            align-content: center;
            height: 100vh;
            margin: 0;
        }
    </style>
</head>
<body>

<form action="student?action=add" method="post">
    <h1>Thêm Học Sinh</h1>
    <label>Nhập tên:</label>
    <input type="text" name="name" placeholder="Tên học sinh"><br/>
    <label>Nhập email:</label>
    <input type="text" name="age" placeholder="age"><br/>
    <label>Chọn lớp:</label>
    <select name="classId">
       <c:forEach items="${classList}" var="clazz">
           <option value="${clazz.id}">${clazz.name}</option>
       </c:forEach>
    </select>
    <input type="submit" value="Thêm">
</form>
</body>
</html>
