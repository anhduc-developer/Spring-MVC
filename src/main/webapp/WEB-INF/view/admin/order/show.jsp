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

    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />

      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Quản Lý Đơn Hàng</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Orders</li>
            </ol>

            <div class="row">
              <div class="col-12 mx-auto">
                <h3>Danh Sách Đơn Hàng</h3>

                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>Mã Đơn Hàng</th>
                      <th>Tổng tiền</th>
                      <th>Trạng thái</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="order" items="${orders}">
                      <tr>
                        <td>${order.id}</td>
                        <td>
                          <fmt:formatNumber
                            value="${order.totalPrice}"
                            type="number"
                            groupingUsed="true"
                          />
                        </td>

                        <td>${order.status}</td>
                        <td>
                          <a
                            href="/admin/order/detail/${order.id}"
                            class="btn btn-success"
                            >View</a
                          >
                          <a
                            href="/admin/order/update/${order.id}"
                            class="btn btn-warning mx-2"
                            >Update</a
                          >
                          <a
                            href="/admin/order/delete/${order.id}"
                            class="btn btn-danger"
                            >Delete</a
                          >
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
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
    ></script>
    <script src="/resources/js/scripts.js"></script>
  </body>
</html>
