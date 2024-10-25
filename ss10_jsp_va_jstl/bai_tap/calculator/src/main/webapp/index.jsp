<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/calculator" method="post">
    <h1>Máy Tính</h1>
    <label>Toán hạng đầu tiên</label>
    <input type="text" name="firstOperand"> <br/>
    <label>Toán tử:           </label>
    <select name="operator">
        <option value="+">Cộng</option>
        <option value="-">Trừ</option>
        <option value="*">Nhân</option>
        <option value="/">Chia</option>
    </select> <br/>
    <label>Toán hạng thứ 2</label>
    <input type="text" name="secondOperand"> <br/>
    <label>Bằng:            </label>
    <input type="submit" value="=">
</form>
</body>
</html>