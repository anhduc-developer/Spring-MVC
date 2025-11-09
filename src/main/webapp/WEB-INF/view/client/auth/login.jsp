<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="<c:url value='/client/css/login.css' />" />
  </head>

  <body>
    <!-- 🌳 Nền tự nhiên -->
    <div class="nature-background">
      <div class="floating-leaf leaf-1"></div>
      <div class="floating-leaf leaf-2"></div>
      <div class="floating-leaf leaf-3"></div>
      <div class="floating-leaf leaf-4"></div>
    </div>

    <!-- 🌼 Khối đăng nhập -->
    <div class="login-container">
      <div class="wellness-card">
        <div class="organic-border"></div>

        <!-- 🪷 Tiêu đề -->
        <div class="mindful-header">
          <div class="zen-logo">
            <svg width="56" height="56" viewBox="0 0 56 56" fill="none">
              <circle
                cx="28"
                cy="28"
                r="26"
                stroke="currentColor"
                stroke-width="2"
                opacity="0.6"
              />
              <circle
                cx="28"
                cy="28"
                r="18"
                stroke="currentColor"
                stroke-width="1.5"
                opacity="0.8"
              />
              <circle
                cx="28"
                cy="28"
                r="10"
                fill="currentColor"
                opacity="0.9"
              />
              <path
                d="M28 18v20M18 28h20"
                stroke="white"
                stroke-width="1.5"
                stroke-linecap="round"
              />
            </svg>
            <div class="zen-glow"></div>
          </div>
          <h1>ĐĂNG NHẬP TÀI KHOẢN</h1>
        </div>

        <!-- 🪴 Form đăng nhập -->
        <form
          action="/login"
          method="post"
        >
          <c:set var="errorEmail">
            <form:errors path="email" cssClass="invalid-feedback" />
          </c:set>
        <c:if test="${param.error != null}">
          <div class="my-2" style="color: red">TÀI KHOẢN KHÔNG HỢP LỆ</div>
        </c:if>
        <c:if test="${param.logout != null}">
          <div class="my-2" style="color: rgb(43, 36, 141)">Đăng xuất thành công</div>
        </c:if>
          <!-- Email -->
          <div class="organic-field">
            <div class="field-nature"></div>
            <input
              type="email"
              name="username"
              placeholder="name@example.com"
              required
            />
            <label for="email">Email</label>
            <div class="growth-indicator">
              <div class="leaf-sprout"></div>
            </div>
            <span class="gentle-error" id="emailError"></span>
          </div>

          <!-- Password -->
          <div class="organic-field">
            <form method="post" action="/login">
            <div class="field-nature"></div>
            <input
              type="password"
              name="password"
              placeholder="Mật khẩu"
              required
            />
            <label for="password">Mật khẩu</label>
            <!-- CSRF Token -->
            <input
              type="hidden"
              name="${_csrf.parameterName}"
              value="${_csrf.token}"
            />
            <span class="gentle-error" id="passwordError"></span>
          </div>

          <!-- Nút đăng nhập -->
          <button type="submit" class="harmony-button">
            <div class="button-earth"></div>
            <span class="button-text">ĐĂNG NHẬP</span>
            <div class="button-growth">
              <div class="growing-circle circle-1"></div>
              <div class="growing-circle circle-2"></div>
              <div class="growing-circle circle-3"></div>
            </div>
            <div class="button-aura"></div>
          </button>
        </form>
 
        <!-- 🌸 Đường phân chia -->
        <div class="balance-divider">
          <div class="divider-branch"></div>
          <div class="divider-center">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
              <path
                d="M12 2L8 8h8l-4-6zM12 22l4-6H8l4 6zM2 12l6-4v8l-6-4zM22 12l-6 4V8l6 4z"
                fill="currentColor"
                opacity="0.6"
              />
            </svg>
          </div>
          <div class="divider-branch"></div>
        </div>

        <div class="nurture-signup">
          <span>Bạn chưa có tài khoản?</span>
          <a href="/register" class="growth-link"
            >Đăng ký ngay</a
          >
        </div>
    <script src="<c:url value='/client/js/login.js' />"></script>
  </body>
</html>
