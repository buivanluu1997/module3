
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<h1>Quản lý sản phẩm rau củ quả</h1>
<a href="product?action=add">Thêm sản phẩm</a>
<a href="product?action=search">Tìm kiếm sản phẩm</a>
<table class="table table-bordered table-striped table-hover">
    <tr>
        <th>STT</th>
        <th>Mã Hàng Hoá</th>
        <th>Tên Hàng Hoá</th>
        <th>Đơn vị tính</th>
        <th>Giá</th>
        <th>Loại Hàng Hoá</th>
        <th>Ngày thu hoạch</th>
        <th>Sửa</th>
        <th>Xoá</th>
    </tr>
    <c:forEach items="${listProduct}" var="product" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.code}</td>
            <td>${product.name}</td>
            <td>${product.unit}</td>
            <td>${product.price}</td>
            <td>${product.categoryName}</td>
            <td>${product.harvestDay}</td>
            <td>
                <button type="button" onclick="updateProduct(${product.id},'${product.code}'
                        ,'${product.name}','${product.unit}','${product.price}','${product.harvestDay}','${product.categoryId}')" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateModal">
                    Sửa
                </button>
            </td>
            <td>
                <button type="button" onclick="deleteProduct(${product.id},'${product.name}')" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    Xoá
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Modal Update-->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="product?action=update" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="updateModalLabel">Cập nhật sản phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input hidden="hidden" type="text" name="productId" id="productId">
                <label>Mã Hàng hoá:</label>
                <input type="text" name="code" id="code"><br>
                <label>Tên Hàng hoá:</label>
                <input type="text" name="productName" id="productName"><br>
                <label>Chọn đơn vị:</label>
                <select name="unit">
                    <option value="kg">kg</option>
                    <option value="Bó">Bó</option>
                </select><br>
                <label>Giá:</label>
                <input type="number" name="price"><br>
                <label>Ngày thu hoạch:</label>
                <input name="harvestDay" type="text"><br>
                <label>Chọn loại sản phẩm:</label>
                <select name="categoryId">
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach><br>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </div>
        </div>
        </form>
    </div>
</div>

<!-- Modal Delete-->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="product?action=delete" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="deleteModalLabel">Xoá sản phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label>Id: </label>
                <input type="text" name="id" id="id" size="5">
                <span>Bạn có muốn xoá sản phẩm </span><span id="name"></span><span> không?</span>
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
    function deleteProduct(id, name){
        document.getElementById("id").value = id;
        document.getElementById("name").innerText = name;
    }

    function updateProduct(id,code,name,unit,price,harvestDay,categoryId){
        document.getElementById("productId").value = id;
        document.getElementById("code").value = code;
        document.getElementById("productName").value = name;
        document.getElementById("unit").value = unit;
        document.getElementById("harvestDay").value = harvestDay;
        document.getElementById("categoryId").value = categoryId;

    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
