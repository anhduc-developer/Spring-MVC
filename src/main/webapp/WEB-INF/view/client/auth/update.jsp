<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<link href="/client/css/bootstrap.min.css" rel="stylesheet" />
<link href="/client/css/style.css" rel="stylesheet" />

<%@ include file="/WEB-INF/view/client/layout/header.jsp" %>

<link rel="stylesheet" href="/client/css/infor.css" />
<script src="/client/js/infor.js" defer></script>

<!-- ✅ Thêm margin-top để tránh bị header che -->
<div
  class="user-info-container d-flex justify-content-center align-items-start"
  style="margin-top: 120px; min-height: 100vh"
>
  <div
    class="user-info-card p-5 shadow-lg rounded-4 bg-white"
    style="max-width: 700px; width: 100%"
  >
    <h2 class="text-center mb-4 text-primary fw-bold">CẬP NHẬT THÔNG TIN</h2>

    <!-- Avatar -->
    <div class="avatar-section text-center mb-4">
      <img
        src="/images/avatar/${user.avatar}"
        class="img-thumbnail rounded-circle shadow-sm"
        alt="Avatar"
        style="width: 180px; height: 180px; object-fit: cover"
      />
      <label
        for="avatarUpload"
        class="avatar-upload mt-3 d-block text-primary fw-semibold"
        style="cursor: pointer"
      >
        Thay đổi ảnh đại diện
      </label>
      <input type="file" id="avatarUpload" accept="image/*" hidden />
    </div>

    <!-- Form cập nhật thông tin -->
    <form:form
      modelAttribute="user"
      action="/user/update"
      method="post"
      enctype="multipart/form-data"
    >
      <!-- Thông tin cá nhân -->
      <div class="mb-4">
        <form:label path="fullName" cssClass="form-label fw-semibold"
          >Họ và tên</form:label
        >
        <form:input
          path="fullName"
          cssClass="form-control form-control-lg"
          placeholder="Nhập họ và tên"
        />
      </div>

      <div class="mb-4">
        <form:label path="phone" cssClass="form-label fw-semibold"
          >Số điện thoại</form:label
        >
        <form:input
          path="phone"
          cssClass="form-control form-control-lg"
          placeholder="Nhập số điện thoại"
        />
      </div>

      <div class="mb-4">
        <form:label path="address" cssClass="form-label fw-semibold"
          >Địa chỉ</form:label
        >
        <form:input
          path="address"
          cssClass="form-control form-control-lg"
          placeholder="Nhập địa chỉ mới"
        />
      </div>

      <hr class="my-4" />

      <button
        type="submit"
        class="update-btn btn btn-primary btn-lg w-100 py-3 fw-semibold"
      >
        Cập nhật thông tin
      </button>
    </form:form>
  </div>
</div>

<%@ include file="/WEB-INF/view/client/layout/footer.jsp" %>
