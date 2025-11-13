<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="Mai Anh Đức" />
    <title>Chi tiết sản phẩm - Mai Anh Đức</title>

    <link href="/css/styles.css" rel="stylesheet" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />

      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Quản Lý Sản Phẩm</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Chi tiết sản phẩm</li>
            </ol>

            <div class="container mt-5">
              <div class="row">
                <div class="col-md-8 mx-auto">
                  <div class="card shadow">
                    <div class="card-header bg-primary text-white fw-bold">
                      THÔNG TIN SẢN PHẨM
                    </div>

                    <ul class="list-group list-group-flush">
                      <li class="list-group-item text-center">
                        <img
                          src="/images/product/${product.photo}"
                          class="img-fluid rounded"
                          alt="Ảnh sản phẩm"
                          style="max-height: 300px; object-fit: cover"
                        />
                      </li>
                      <li class="list-group-item">
                        <strong>ID:</strong> ${product.id}
                      </li>
                      <li class="list-group-item">
                        <strong>Tên sản phẩm:</strong> ${product.name}
                      </li>
                      <li class="list-group-item">
                        <strong>Giá:</strong>
                        <fmt:formatNumber
                          value="${product.price}"
                          pattern="#,###"
                        />
                        ₫
                      </li>
                      <li class="list-group-item">
                        <strong>Đã bán:</strong> ${product.sold}
                      </li>
                      <li class="list-group-item">
                        <strong>Số lượng:</strong> ${product.quantity}
                      </li>
                      <li class="list-group-item">
                        <strong>Mô tả chi tiết:</strong> ${product.detailDesc}
                      </li>
                      <li class="list-group-item">
                        <strong>Mô tả ngắn:</strong> ${product.shortDesc}
                      </li>
                    </ul>
                  </div>

                  <div class="mt-4">
                    <a href="/admin/product" class="btn btn-success">
                      <i class="fa-solid fa-arrow-left"></i> Quay lại
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>

        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>

    <!-- Scripts -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
