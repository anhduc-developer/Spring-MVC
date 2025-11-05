<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký tài khoản</title>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap");

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
      }

      body {
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        padding: 20px;
      }

      .container {
        width: 100%;
        max-width: 700px;
        background: #fff;
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
      }

      .container .title {
        font-size: 28px;
        font-weight: 600;
        color: #333;
        position: relative;
        margin-bottom: 25px;
      }

      .container .title::before {
        content: "";
        position: absolute;
        left: 0;
        bottom: -8px;
        width: 50px;
        height: 4px;
        border-radius: 5px;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
      }

      form {
        width: 100%;
      }

      .user-details {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
      }

      .input-box {
        flex: 1 1 calc(50% - 10px);
        display: flex;
        flex-direction: column;
      }

      .input-box span {
        margin-bottom: 6px;
        font-weight: 500;
        color: #555;
      }

      .input-box input {
        height: 45px;
        padding: 0 15px;
        border-radius: 8px;
        border: 1px solid #ccc;
        outline: none;
        font-size: 16px;
        transition: 0.3s;
      }

      .input-box input:focus {
        border-color: #9b59b6;
        box-shadow: 0 0 5px rgba(155, 89, 182, 0.3);
      }

      .button {
        margin-top: 30px;
      }

      .button input {
        width: 100%;
        padding: 12px 0;
        border-radius: 8px;
        border: none;
        font-size: 18px;
        font-weight: 600;
        color: #fff;
        cursor: pointer;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        transition: 0.3s;
      }

      .button input:hover {
        background: linear-gradient(-135deg, #71b7e6, #9b59b6);
      }

      @media (max-width: 584px) {
        .input-box {
          flex: 1 1 100%;
        }
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="title">ĐĂNG KÍ TÀI KHOẢN</div>
      <form:form method="post" action="/register" modelAttribute="registerUser">
        <div class="user-details">
          <div class="input-box">
            <span>Tên</span>
            <form:input
              path="firstName"
              type="text"
              placeholder="Enter your First Name"
              required="required"
            />
          </div>
          <div class="input-box">
            <span>Họ</span>
            <form:input
              path="lastName"
              type="text"
              placeholder="Enter your Last Name"
              required="required"
            />
          </div>
          <div class="input-box">
            <span>Email</span>
            <form:input
              path="email"
              type="email"
              placeholder="Enter your email"
            />
          </div>
          <div class="input-box">
            <span>Số Điện Thoại</span>
            <form:input
              path="phone"
              type="text"
              placeholder="Enter your number"
            />
          </div>
          <div class="input-box">
            <span>Mật Khẩu</span>
            <form:password
              path="password"
              placeholder="Enter your password"
              required="required"
            />
          </div>
          <div class="input-box">
            <span>Xác nhận mật khẩu</span>
            <form:password
              path="confirmPassword"
              placeholder="Confirm your password"
              required="required"
            />
          </div>
        </div>
        <div class="button">
          <input type="submit" value="ĐĂNG KÝ" />
        </div>
      </form:form>
    </div>
  </body>
</html>
