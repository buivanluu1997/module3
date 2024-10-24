<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ứng dụng Product Discount Calculator</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/calculate-discount" method="post">
    <label for="productDescription">Mô tả của sản phẩm: </label>
    <input type="text" id="productDescription" name="productDescription" size="30px"> <br>
    <label for="listPrice">Giá niêm yết của sản phẩm: </label>
    <input type="text" id="listPrice" name="listPrice"> <br>
    <label for="discountPercent">Tỷ lệ chiết khấu (phần trăm): </label>
    <input type="text" id="discountPercent" name="discountPercent"> <br>
    <input type="submit" value="Tính chiết khấu">
</form>
</body>
</html>