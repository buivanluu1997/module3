<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
<form id="addProduct" action="product?action=add" method="post">
    <h1>Thêm Sản Phẩm</h1>
    <label>Nhập mã sản phẩm:</label>
    <input type="text" name="code" id="code" pattern="^MHH-[A-Z0-9]{4}$" placeholder="MHH-XXXX"
           required title="Mã hàng hoá phải có định dạng MHH-XXXX, trong đó X là chữ cái in hoa hoặc số."><br>
    <label>Nhập tên sản phẩm:</label>
    <input type="text" name="name" placeholder="tên sản phẩm"><br>
    <label>Chọn đơn vị</label>
    <select name="unit">
        <option value="kg">kg</option>
        <option value="Bó">Bó</option>
    </select><br>
    <label>Nhập giá:</label>
    <input type="number" name="price" id="price" min="1000" step="1"
           required title="Giá phải là số nguyên dương và lớn hơn hoặc bằng 1.000 VNĐ."><br>
    <label>Chọn loại sản phẩm</label>
    <select name="categoryId">
        <c:forEach items="${categories}" var="category">
            <option value="${category.id}">${category.name}</option>
        </c:forEach>
    </select><br>
    <label>Nhập ngày thu hoạch(năm-tháng-ngày)</label>
    <input type="text" name="harvestDay" placeholder="2024-10-23">
    <button type="submit">Thêm</button>
</form>

<script>
    document.getElementById("addProduct").addEventListener("submit", function (event) {
        const code = document.getElementById("code").value;
        const price = document.getElementById("price").value;

        const codePattern = /^MHH-[A-Z0-9]{4}$/;
        if (!codePattern.test(code)) {
            alert("Mã hàng hóa không hợp lệ. Định dạng đúng là MHH-XXXX, với X là chữ in hoa hoặc số.")
            event.preventDefault();
        }
        if (isNaN(price) || price < 1000) {
            alert("Giá phải là số nguyên dương và lớn hơn hoặc bằng 1.000 VNĐ.")
            event.preventDefault();
        }
    });
</script>
</body>
</html>
