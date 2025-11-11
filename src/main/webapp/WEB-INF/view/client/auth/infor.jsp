<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="/WEB-INF/view/client/layout/header.jsp"
%>
<link href="/client/css/bootstrap.min.css" rel="stylesheet" />
<link href="/client/css/style.css" rel="stylesheet" />

<div
  class="d-flex justify-content-center align-items-center"
  style="min-height: 100vh; background-color: #f8f9fa; padding-top: 120px"
>
  <div class="card shadow-lg border-0 rounded-4 p-4" style="width: 650px">
    <div class="text-center mb-4">
      <h2 class="fw-bold text-primary mb-3">Thông tin cá nhân</h2>
      <img
        src="/images/avatar/${user.avatar}"
        class="img-thumbnail rounded-circle shadow-sm"
        alt="Avatar"
        style="width: 150px; height: 150px; object-fit: cover"
      />
    </div>

    <table class="table table-bordered text-center align-middle mb-0">
      <tbody>
        <tr>
          <th class="bg-light" style="width: 40%">Họ và tên</th>
          <td>${user.fullName}</td>
        </tr>
        <tr>
          <th class="bg-light">Số điện thoại</th>
          <td>${user.phone}</td>
        </tr>
        <tr>
          <th class="bg-light">Email</th>
          <td>${user.email}</td>
        </tr>
        <tr>
          <th class="bg-light">Địa chỉ</th>
          <td>${user.address}</td>
        </tr>
      </tbody>
    </table>

    <div class="text-center mt-4">
      <a href="/user/update/${id}" class="btn btn-primary px-4 me-2"
        >Chỉnh sửa thông tin</a
      >
      <button
        onclick="window.history.back()"
        class="btn btn-outline-secondary px-4"
      >
        Quay lại
      </button>
    </div>
  </div>
</div>

<%@ include file="/WEB-INF/view/client/layout/footer.jsp" %>
