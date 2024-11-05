<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/29/2024
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<h1>Danh sách học sinh</h1>
<p><a href="student?action=add">Thêm học sinh</a></p>
<p><a href="student?action=student-dto">Hiển thị học sinh và lớp học</a></p>
<table class="table table-striped table-bordered">
    <tr>
        <th>Id</th>
        <th>Họ Và Tên</th>
        <th>Tuổi</th>
        <th>Class_id</th>
        <th>Xoá</th>
        <th>Sửa</th>
    </tr>
    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.classId}</td>
            <td><button onclick="deleteStudent(${student.id},'${student.name}')" type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Xoá
            </button></td>
            <td><button onclick="updateStudent(${student.id},'${student.name}','${student.age}','${student.classId}')" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateModal">
                Sửa
            </button></td>
        </tr>
    </c:forEach>
</table>

<!-- Modal Xoá -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="student?action=delete" method="post">

        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="deleteModalLabel">Xoá học sinh</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label>Id: </label>
                <input type="text" name="id" id="studentId" size="5">
                <span>Bạn có muốn xoá </span><span id="studentName"></span><span> không?</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary">Xoá</button>
            </div>
        </div>

        </form>
    </div>
</div>


<!-- Modal Xoá -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="student?action=update" method="post">

            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="updateModalLabel">Xoá học sinh</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="id" id="id">
                    <label>Tên:</label>
                    <input type="text" name="name" id="name" required>
                    <label>Tuổi:</label>
                    <input type="number" name="age" id="age" required>
                    <label>Chọn lớp:</label>
                    <select name="classId" id="classId" required>
                        <c:forEach items="${classList}" var="clazz">
                            <option value="${clazz.id}">${clazz.name}</option>
                        </c:forEach>
                    </select
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                </div>
            </div>

        </form>
    </div>
</div>

<script>
    function deleteStudent(id, name){
        document.getElementById("studentId").value = id;
        document.getElementById("studentName").innerText = name;
    }

    function updateStudent(id, name, age, classId){
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("age").value = age;
        document.getElementById("classId").value = classId;
    }
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
