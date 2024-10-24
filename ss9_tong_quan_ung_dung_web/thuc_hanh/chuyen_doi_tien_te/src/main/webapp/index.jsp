<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h2>Chuyển đổi tiền tệ:</h2>
<form action="/convert" method="post">
    <div class="convert">
        <label>Tỷ lệ: </label> <br/>
        <input type="text" name="rate" placeholder="RATE" value="25000"><br/>
        <label>USD: </label><br/>
        <input type="text" name="usd" placeholder="USD" value="0"><br/>
        <input type="submit" id="submit" value="Converter">
    </div>
</form>
</body>
</html>