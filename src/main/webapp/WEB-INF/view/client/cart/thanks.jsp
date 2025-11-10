<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thank You</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f5f5f5;
        margin: 0;
      }
      h1 {
        color: #4caf50;
      }
      p {
        font-size: 1.2em;
      }
      a {
        margin-top: 20px;
        text-decoration: none;
        color: white;
        background-color: #4caf50;
        padding: 10px 20px;
        border-radius: 5px;
      }
      a:hover {
        background-color: #45a049;
      }
    </style>
  </head>
  <body>
    <h1>Cảm ơn bạn đã mua hàng!</h1>
    <p>Đơn hàng của bạn đã được ghi nhận.</p>
    <a href="/">Quay lại trang chủ</a>
  </body>
</html>
