<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/maytinh" method="post">
    <h1>Máy tính</h1>
    <label>Nhập số cần tính 1:</label>
    <input type="text" name="num1"> <br>
    <select name="phepTinh">
        <option value="cong">+</option>
        <option value="tru">-</option>
        <option value="nhan">x</option>
        <option value="chia">/</option>
    </select> <br>
    <label>Nhập số cần tính 2:</label>
    <input type="text" name="num2"> <br>
    <input type="submit" value="=">
</form>
</body>
</html>