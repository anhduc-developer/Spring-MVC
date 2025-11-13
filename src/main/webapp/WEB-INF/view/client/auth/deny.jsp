<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Truy cập bị từ chối</title>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

      body {
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        font-family: "Poppins", sans-serif;
      }

      .container {
        background-color: #fff;
        border-radius: 15px;
        padding: 50px 40px;
        max-width: 500px;
        width: 90%;
        text-align: center;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        animation: fadeIn 0.6s ease;
      }

      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(-20px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      .container h1 {
        font-size: 70px;
        color: #9b59b6;
        margin: 0;
      }

      .container h2 {
        font-size: 24px;
        margin-top: 10px;
        color: #333;
      }

      .container p {
        font-size: 16px;
        color: #555;
        margin: 20px 0 30px;
      }

      .btn {
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        color: #fff;
        text-decoration: none;
        padding: 12px 25px;
        border-radius: 8px;
        font-weight: 600;
        transition: all 0.3s ease;
      }

      .btn:hover {
        background: linear-gradient(-135deg, #71b7e6, #9b59b6);
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>403</h1>
      <h2>Truy cập bị từ chối</h2>
      <p>
        <c:choose>
          <c:when test="${not empty errorMessage}">
            <c:out value="${errorMessage}" />
          </c:when>
          <c:otherwise>
            Bạn không có quyền truy cập vào trang này.<br />
            Vui lòng quay lại trang chủ hoặc liên hệ quản trị viên nếu bạn nghĩ
            đây là lỗi.
          </c:otherwise>
        </c:choose>
      </p>
      <a href="<c:url value='/'/>" class="btn">Về trang chủ</a>
    </div>
  </body>
</html>
