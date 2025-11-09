<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng - TechStore</title>

    <!-- Font & Icon -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Library CSS -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <link href="/client/css/style.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../layout/header.jsp" />

    <div class="container py-5 mt-5">
        <h2 class="mb-4">Giỏ hàng của bạn</h2>

        <c:choose>
            <c:when test="${not empty cartItems}">
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
                        <c:forEach var="item" items="${cartItems}">
                            <tr data-product-id="${item.product.id}">
                                <td class="d-flex align-items-center">
                                    <img src="/images/product/${item.product.photo}"
                                         alt="${item.product.name}"
                                         style="width:70px;height:70px;object-fit:cover"
                                         class="me-3">
                                    <div class="fw-bold">
                                        <a href="/product/${item.product.id}" target="_blank">${item.product.name}</a>
                                    </div>
                                </td>
                                <td>
                                    <span class="price" data-price="${item.product.price}">
                                        <fmt:formatNumber type="number" value="${item.product.price}" />đ
                                    </span>
                                </td>
                                <td>
                                    <div class="input-group input-group-sm" style="width:120px">
                                        <button class="btn btn-outline-secondary btn-decrease" type="button">-</button>
                                        <input type="number" class="form-control text-center quantity"
                                               value="${item.quantity}" min="1">
                                        <button class="btn btn-outline-secondary btn-increase" type="button">+</button>
                                    </div>
                                </td>
                                <td>
                                    <span class="total">
                                        <fmt:formatNumber type="number" value="${item.product.price * item.quantity}" />đ
                                    </span>
                                </td>
                                <td>
                                    <form action="/cart/remove/${item.id}" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
                            <strong>Tổng cộng</strong>
                            <strong><span id="cart-total"><fmt:formatNumber type="number" value="${totalPrice}" />đ</span></strong>
                        </div>
                        <div class="d-grid gap-2">
                            <a href="/checkout" class="btn btn-primary">Thanh toán</a>
                            <a href="/" class="btn btn-outline-secondary">Tiếp tục mua hàng</a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">
                    Giỏ hàng trống. <a href="/">Tiếp tục mua sắm</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <!-- JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/client/js/main.js"></script>

    <!-- File JS riêng cho giỏ hàng -->
    <script src="/client/js/cart.js"></script>
</body>
</html>
