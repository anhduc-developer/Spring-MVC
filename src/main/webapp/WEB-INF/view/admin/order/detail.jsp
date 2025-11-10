<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="Mai Anh Đức" />
    <title>Dashboard - Mai Anh Đức</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <!-- Layout -->
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />

      <!-- Main content -->
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">QUẢN LÝ ĐƠN HÀNG</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Orders</li>
            </ol>

    <div>
      <div class="row">
        <div class="col-12 mx-auto">
          <h3>Chi Tiết Đơn Hàng</h3>
            </div>
            <hr>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Sản Phẩm</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Giá</th>
                        <th>Số Lượng</th>
                        <th>Thành Tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${items}">

                    <tr>
                        <td>
                        <img src="/images/product/${item.product.photo}" 
                            alt="${item.product.name}" 
                            class="img-fluid" 
                            style="max-width: 100px;" />
                        </td>

                        <td>${item.product.name}</td>
                        <td>
                        <fmt:formatNumber value="${item.product.price}" type="number" /> ₫
                        </td>
                        <td>${item.quantity}</td>  
                        <td>
                        <fmt:formatNumber value="${item.product.price * item.quantity}" type="number" /> ₫
                        </td>
               
                    </tr>
                    </c:forEach>                    
                </tbody>
    </div>
</div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>

    <!-- Scripts -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
      <script
  src="/resources/js/scripts.js"
    ></script>
  </body>
</html>