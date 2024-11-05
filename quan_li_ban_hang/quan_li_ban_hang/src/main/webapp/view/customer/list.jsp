<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/31/2024
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<h1>Danh sách khách hàng</h1>
<p><a href="/customer?action=add">Thêm khách hàng</a></p>
<p><a href="/customer?action=customer-order">Hiển thị danh sách khách hàng đã mua hàng</a></p>
<table class="table table-striped table-hover table-bordered align-middle">
    <tr>
        <th>Id</th>
        <th>Tên khách hàng</th>
        <th>Tuổi</th>
        <th>Xoá</th>
        <th>Sửa</th>
    </tr>
    <c:forEach items="${customers}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.age}</td>
            <td>
                <button onclick="deleteCustomer(${customer.id},'${customer.name}')" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    Xoá
                </button>
            </td>
            <td>
                <button onclick="updateCustomer(${customer.id},'${customer.name}','${customer.age}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal">
                    Sửa
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Modal update-->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/customer?action=edit" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="updateModalLabel">Sửa khách hàng</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="id" id="id" hidden="hidden">
                    <label>Tên</label>
                    <input type="text" name="name" id="name">
                    <label>Tuổi</label>
                    <input type="text" name="age" id="age">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal delete -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="deleteModalLabel">Xoá khách hàng</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label>Id: </label>
                    <input type="text" size="5" name="idCustomer" id="idCustomer">
                    <span>Bạn có muốn xoá </span><span id="namCustomer"></span><span> không?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Xoá</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script>
    function deleteCustomer(id,name){
        document.getElementById("idCustomer").value = id;
        document.getElementById("namCustomer").innerText = name;
    }

    function updateCustomer(id,name,age){
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("age").value = age;
    }
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
