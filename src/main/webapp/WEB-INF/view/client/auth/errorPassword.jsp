<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/client/css/bootstrap.min.css" rel="stylesheet" />
<link href="/client/css/style.css" rel="stylesheet" />

<div
  class="container d-flex justify-content-center align-items-center"
  style="min-height: 80vh"
>
  <div class="card shadow-lg p-5" style="max-width: 450px; width: 100%">
    <h3 class="text-center text-danger mb-4">LỖI MẬT KHẨU</h3>

    <c:if test="${not empty error}">
      <div class="alert alert-danger text-center">${error}</div>
    </c:if>

    <div class="text-center mt-3">
      <a href="javascript:history.back()" class="btn btn-primary">Quay Lại</a>
    </div>
  </div>
</div>
