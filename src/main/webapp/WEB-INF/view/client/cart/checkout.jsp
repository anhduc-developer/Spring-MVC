<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán - TechStore</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- CSS -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <link href="/client/css/style.css" rel="stylesheet">
</head>

<body>
    <jsp:include page="../layout/header.jsp" />

    <div class="container py-5 mt-5">
        <h2 class="mb-4">Thanh toán</h2>

        <div class="row">
            <!-- Thông tin giao hàng -->
            <div class="col-lg-7 mb-4">
                <div class="card p-4 shadow-sm">
                    <h5 class="mb-3">Thông tin giao hàng</h5>
                    <form:form action="/checkout/confirm" method="post" modelAttribute="cart">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="mb-3">
                            <label class="form-label">Họ và tên</label>
                            <input type="text" name="receiverName" class="form-control" required placeholder="Nguyễn Văn A">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số điện thoại</label>
                            <input type="text" name="receiverPhone" class="form-control" required placeholder="0987654321">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Địa chỉ giao hàng</label>
                            <textarea name="receiverAddress" class="form-control" rows="3" required placeholder="Số nhà, đường, phường/xã, quận/huyện, tỉnh/thành phố"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ghi chú (nếu có)</label>
                            <textarea name="note" class="form-control" rows="2" placeholder="Ví dụ: Giao giờ hành chính"></textarea>
                        </div>

                        <h5 class="mb-3 mt-4">Phương thức thanh toán</h5>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="COD" checked>
                            <label class="form-check-label" for="cod">
                                Thanh toán khi nhận hàng (COD)
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="bank" value="BANK">
                            <label class="form-check-label" for="bank">
                                Chuyển khoản ngân hàng
                            </label>
                        </div>

                        <div class="mt-4 d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">Xác nhận đặt hàng</button>
                        </div>
                    </form:form>
                </div>
            </div>

            <!-- Tóm tắt đơn hàng -->
            <div class="col-lg-5">
                <div class="card p-4 shadow-sm">
                    <h5 class="mb-3">Tóm tắt đơn hàng</h5>
                    <c:if test="${not empty cartItems}">
                        <ul class="list-group mb-3">
                            <c:forEach var="item" items="${cartItems}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <div>
                                        <strong>${item.product.name}</strong><br>
                                        <small>${item.quantity} × 
                                            <fmt:formatNumber value="${item.product.price}" type="number" />đ
                                        </small>
                                    </div>
                                    <span class="fw-bold">
                                        <fmt:formatNumber value="${item.product.price * item.quantity}" type="number" />đ
                                    </span>
                                </li>
                            </c:forEach>
                        </ul>

                        <div class="d-flex justify-content-between mb-2">
                            <span>Tổng tạm tính:</span>
                            <strong><fmt:formatNumber value="${totalPrice}" type="number" />đ</strong>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Phí vận chuyển:</span>
                            <strong>Miễn phí</strong>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <strong>Tổng cộng:</strong>
                            <strong><fmt:formatNumber value="${totalPrice}" type="number" />đ</strong>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <!-- JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/client/js/main.js"></script>
</body>
</html>
