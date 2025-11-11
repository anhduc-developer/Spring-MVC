<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Lịch Sử Mua Hàng - TechStore</title>

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/client/css/style.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="container py-5 mt-5">
    <h2 class="mb-4">Lịch Sử Mua Hàng</h2>

    <c:choose>
        <c:when test="${not empty orders}">
            <c:forEach var="order" items="${orders}">
                <div class="mb-4">
                    <h5>
                        Mã Đơn hàng #${order.id}<br>
                        Người Nhận: ${order.receiverName}<br>
                        Phone: ${order.receiverPhone}
                    </h5>
                    <div class="table-responsive">
                        <table class="table table-bordered align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Sản Phẩm</th>
                                    <th>Đơn Giá</th>
                                    <th>Số Lượng</th>
                                    <th>Thành Tiền</th>
                                    <th>Trạng Thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detail" items="${order.orderDetails}">
                                    <tr>
                                        <td>${detail.product.name}</td>
                                        <td><fmt:formatNumber value="${detail.product.price}" type="number" groupingUsed="true" /> ₫</td>
                                        <td>${detail.quantity}</td>
                                        <td>
                                            <fmt:formatNumber value="${detail.product.price * detail.quantity}" type="number" groupingUsed="true" /> ₫
                                        </td>
                                        <td>${order.status}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="3" class="text-end">Tổng Tiền:</th>
                                    <th colspan="2">
                                        <fmt:formatNumber value="${order.totalPrice}" type="number" groupingUsed="true" /> ₫
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">
                Giỏ hàng trống. <a href="/">Tiếp tục mua sắm</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="../layout/footer.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/client/js/main.js"></script>
<script src="/client/js/cart.js"></script>
</body>
</html>
