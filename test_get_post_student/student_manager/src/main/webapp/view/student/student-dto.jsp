<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2024
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>StudentDTO List</title>
</head>
<body>
  <h1>Danh sách sinh viên thuộc lớp học</h1>
  <table border="1">
    <tr>
      <th>Student Id</th>
      <th>Student Name</th>
      <th>Student Age</th>
      <th>Class Name</th>
    </tr>
    <c:forEach items="${studentDTOList}" var="studentDTO">
      <tr>
        <td>${studentDTO.studentId}</td>
        <td>${studentDTO.studentName}</td>
        <td>${studentDTO.studentAge}</td>
        <td>${studentDTO.className}</td>
      </tr>
    </c:forEach>
  </table>

</body>
</html>
