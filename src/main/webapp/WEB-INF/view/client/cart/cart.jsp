<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Giỏ hàng - TechStore</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link
      href="/client/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

    <link href="/client/css/style.css" rel="stylesheet" />
  </head>
  <body>
    <jsp:include page="../layout/header.jsp" />

    <div class="container py-5 mt-5">
      <h2 class="mb-4">Giỏ hàng của bạn</h2>

      <c:choose>
        <c:when test="${not empty cart and not empty cart.items}">
          <div class="table-responsive">
            <table class="table align-middle">
              <thead>
                <tr>
                  <th>Sản phẩm</th>
                  <th>Đơn giá</th>
                  <th>Số lượng</th>
                  <th>Thành tiền</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items="${cart.items}">
                  <tr>
                    <td class="d-flex align-items-center">
                      <img src="/images/product/${item.product.photo}" alt="${item.product.name}" style="width:70px; height:70px; object-fit:cover" class="me-3" />
                      <div>
                        <div class="fw-bold">${item.product.name}</div>
                      </div>
                    </td>
                    <td>
                      <fmt:formatNumber type="number" value="${item.product.price}" />đ
                    </td>
                    <td>
                      <form action="/cart/update" method="post" class="d-inline-flex align-items-center">
                        <input type="hidden" name="productId" value="${item.product.id}" />
                        <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control form-control-sm me-2" style="width:80px" />
                        <button class="btn btn-sm btn-outline-secondary" type="submit">Cập nhật</button>
                      </form>
                    </td>
                    <td>
                      <fmt:formatNumber type="number" value="${item.product.price * item.quantity}" />đ
                    </td>
                    <td>
                      <form action="/cart/remove" method="post">
                        <input type="hidden" name="productId" value="${item.product.id}" />
                        <button class="btn btn-sm btn-danger">Xóa</button>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>

          <div class="d-flex justify-content-end">
            <div class="card p-3" style="min-width:320px">
              <div class="d-flex justify-content-between mb-2">
                <strong>Tạm tính</strong>
                <strong>
                  <fmt:formatNumber type="number" value="${cart.subTotal}" />đ
                </strong>
              </div>
              <div class="d-grid gap-2">
                <a href="/checkout" class="btn btn-primary">Thanh toán</a>
                <a href="/" class="btn btn-outline-secondary">Tiếp tục mua hàng</a>
              </div>
            </div>
          </div>

        </c:when>
        <c:otherwise>
          <div class="alert alert-info">Giỏ hàng trống. <a href="/">Tiếp tục mua sắm</a></div>
        </c:otherwise>
      </c:choose>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/client/js/main.js"></script>
  </body>
</html>
