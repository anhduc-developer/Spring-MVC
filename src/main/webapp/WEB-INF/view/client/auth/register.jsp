<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký tài khoản</title>

    <!-- Bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      crossorigin="anonymous"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <style>
      body {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        font-family: "Poppins", sans-serif;
        padding: 40px;
      }

      .register-card {
        width: 100%;
        max-width: 900px;
        background: #fff;
        border-radius: 20px;
        padding: 60px 80px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        transform: scale(1);
        transition: 0.3s;
      }

      .register-card:hover {
        transform: scale(1.02);
      }

      h1 {
        font-size: 40px;
        font-weight: 700;
        text-align: center;
        color: #333;
        margin-bottom: 40px;
      }

      .form-label {
        font-size: 18px;
        font-weight: 500;
        color: #333;
      }

      .form-control {
        height: 55px;
        font-size: 17px;
        border-radius: 10px;
        padding-left: 15px;
      }

      .form-control:focus {
        border-color: #9b59b6;
        box-shadow: 0 0 10px rgba(155, 89, 182, 0.3);
      }

      .btn-primary {
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        border: none;
        font-size: 22px;
        font-weight: 600;
        padding: 15px;
        border-radius: 10px;
      }

      .btn-primary:hover {
        background: linear-gradient(-135deg, #71b7e6, #9b59b6);
        transform: scale(1.03);
      }

      .invalid-feedback {
        display: block;
        font-size: 15px;
      }

      @media (max-width: 768px) {
        .register-card {
          padding: 40px 30px;
        }
        h1 {
          font-size: 32px;
        }
      }
    </style>
  </head>

  <body>
    <div class="register-card">
      <h1>ĐĂNG KÝ TÀI KHOẢN</h1>

      <form:form
        method="post"
        action="/register"
        modelAttribute="registerUser"
        class="row g-4"
      >
        <!-- First name -->
        <div class="col-md-6">
          <label class="form-label">Tên</label>
          <form:input
            path="firstName"
            type="text"
            class="form-control"
            placeholder="Nhập tên của bạn"
            required="required"
          />
        </div>

        <!-- Last name -->
        <div class="col-md-6">
          <label class="form-label">Họ</label>
          <form:input
            path="lastName"
            type="text"
            class="form-control"
            placeholder="Nhập họ của bạn"
            required="required"
          />
        </div>

        <!-- Email -->
        <div class="col-md-6">
          <c:set var="errorEmail">
            <form:errors path="email" cssClass="invalid-feedback" />
          </c:set>
          <label class="form-label">Email</label>
          <form:input
            path="email"
            type="email"
            class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
            placeholder="Nhập địa chỉ email"
          />
          ${errorEmail}
        </div>

        <!-- Phone -->
        <div class="col-md-6">
          <c:set var="errorPhone">
            <form:errors path="phone" cssClass="invalid-feedback" />
          </c:set>
          <label class="form-label">Số điện thoại</label>
          <form:input
            path="phone"
            type="text"
            class="form-control"
            placeholder="Nhập số điện thoại"
          />
          ${errorPhone}
        </div>

        <!-- Password -->
        <div class="col-md-6">
          <c:set var="errorPassword">
            <form:errors path="password" cssClass="invalid-feedback" />
          </c:set>
          <label class="form-label">Mật khẩu</label>
          <form:input
            path="password"
            type="password"
            class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
            placeholder="Nhập mật khẩu"
            required="required"
          />
          ${errorPassword}
        </div>

        <!-- Confirm password -->
        <div class="col-md-6">
          <c:set var="errorConfirm">
            <form:errors path="confirmPassword" cssClass="invalid-feedback" />
          </c:set>
          <label class="form-label">Xác nhận mật khẩu</label>
          <form:input
            path="confirmPassword"
            type="password"
            class="form-control ${not empty errorConfirm ? 'is-invalid' : ''}"
            placeholder="Nhập lại mật khẩu"
            required="required"
          />
          ${errorConfirm}
        </div>

        <!-- Submit -->
        <div class="col-12 mt-5">
          <button type="submit" class="btn btn-primary w-100">
            ĐĂNG KÝ NGAY
          </button>
        </div>
        <!-- Phần đăng nhập -->
        <div class="login-redirect">
          <p>Bạn đã có tài khoản? <a href="/login">Đăng nhập</a></p>
        </div>
      </form:form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
