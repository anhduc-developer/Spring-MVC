<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Sản phẩm - TechStore</title>
    <link rel="stylesheet" href="/client/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/client/css/style.css" />
  </head>
  <body>
    <div class="container py-5">
      <h2 class="mb-4">Danh sách sản phẩm</h2>
      <div class="mb-4">
        <div class="mb-4">
          <button
            class="btn btn-outline-secondary me-2"
            onclick="history.back();"
          >
            <i class="bi bi-arrow-left"></i> Trở Lại
          </button>
          <a href="/" class="btn btn-outline-primary">
            <i class="bi bi-house-door"></i> Trang Chủ
          </a>
        </div>
      </div>
      <!-- Lọc theo loại sản phẩm -->
      <div class="mb-4">
        <c:forEach var="factory" items="${factorys}">
          <a href="/products/${factory}" class="btn btn-secondary me-2"
            >${factory}</a
          >
        </c:forEach>
      </div>

      <div class="row g-4">
        <c:forEach var="product" items="${products}">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card h-100">
              <img
                src="/images/product/${product.photo}"
                class="card-img-top"
                alt="${product.name}"
              />
              <div class="card-body d-flex flex-column">
                <h5 class="card-title text-truncate">${product.name}</h5>
                <p class="card-text text-truncate">${product.shortDesc}</p>
                <p class="fw-bold text-primary mb-3">
                  <fmt:formatNumber
                    value="${product.price}"
                    type="number"
                    groupingUsed="true"
                  />
                  ₫
                </p>
                <form
                  action="/cart/add/${product.id}"
                  method="post"
                  class="mt-auto"
                >
                  <input
                    type="hidden"
                    name="${_csrf.parameterName}"
                    value="${_csrf.token}"
                  />
                  <button type="submit" class="btn btn-outline-primary w-100">
                    <i class="fa fa-shopping-bag me-2"></i> Thêm vào giỏ hàng
                  </button>
                </form>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="/client/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
