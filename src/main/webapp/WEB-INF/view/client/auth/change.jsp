<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/client/css/bootstrap.min.css" rel="stylesheet" />
<link href="/client/css/style.css" rel="stylesheet" />

<%@ include file="/WEB-INF/view/client/layout/header.jsp" %>
<div
  class="container d-flex justify-content-center align-items-center"
  style="min-height: 80vh; margin-top: 100px"
>
  <div class="card shadow-lg p-5" style="max-width: 450px; width: 100%">
    <h3 class="text-center text-primary mb-4">ĐỔI MẬT KHẨU</h3>

    <!-- Hiển thị thông báo lỗi/thành công -->
    <c:if test="${not empty error}">
      <div class="alert alert-danger text-center">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
      <div class="alert alert-success text-center">${success}</div>
    </c:if>

    <form action="/change-password" method="post">
      <!-- CSRF token cho Spring Security -->
      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />

      <div class="mb-3">
        <label for="newPassword" class="form-label">Mật khẩu mới</label>
        <input
          type="password"
          class="form-control"
          id="newPassword"
          name="newPassword"
          placeholder="Nhập mật khẩu mới"
          required
        />
      </div>

      <div class="mb-4">
        <label for="confirmPassword" class="form-label"
          >Xác nhận mật khẩu mới</label
        >
        <input
          type="password"
          class="form-control"
          id="confirmPassword"
          name="confirmPassword"
          placeholder="Nhập lại mật khẩu mới"
          required
        />
      </div>

      <button type="submit" class="btn btn-primary w-100 py-2">
        ĐỔI MẬT KHẨU
      </button>
    </form>

    <div class="text-center mt-3">
      <a href="/" class="text-decoration-none">&larr; Trang Chủ</a>
    </div>
  </div>
</div>

<%@ include file="/WEB-INF/view/client/layout/footer.jsp" %>
