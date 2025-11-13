<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>${product.name} - Tech Store</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
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
    <div
      id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <jsp:include page="../layout/header.jsp" />
    <div class="container-fluid page-header py-5">
      <h1 class="text-center text-white display-6">${product.name}</h1>
      <ol class="breadcrumb justify-content-center mb-0"></ol>
    </div>
    <div class="container-fluid py-5 mt-5">
      <div class="container py-5">
        <div class="row g-4 mb-5">
          <div class="col-lg-8 col-xl-9">
            <div class="row g-4">
              <div class="col-lg-6">
                <div class="border rounded">
                  <img
                    src="/images/product/${product.photo}"
                    class="img-fluid rounded"
                    alt="Image"
                  />
                </div>
              </div>
              <div class="col-lg-6">
                <h4 class="fw-bold mb-3">${product.name}</h4>
                <p class="mb-3">${product.factory}</p>
                <h5 class="fw-bold mb-3">
                  <fmt:formatNumber type="number" value="${product.price}" />đ
                </h5>
                <div class="d-flex mb-4">
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star"></i>
                </div>
                <p class="mb-4">${product.shortDesc}</p>
                <div class="input-group quantity mb-5" style="width: 100px">
                  <div class="input-group-btn"></div>
                </div>
                <div class="d-flex mb-4">
                  <form
                    action="/cart/add/${product.id}"
                    method="post"
                    class="d-flex align-items-center"
                  >
                    <input
                      type="hidden"
                      name="${_csrf.parameterName}"
                      value="${_csrf.token}"
                    />
                    <button
                      type="submit"
                      class="btn border border-secondary rounded-pill px-4 py-2 text-primary"
                    >
                      <i class="fa fa-shopping-bag me-2 text-primary"></i> Add
                      to Cart
                    </button>
                  </form>
                </div>
              </div>
              <div class="product-detail-desc p-4 mt-3 border rounded bg-light">
                <h5 class="fw-bold mb-3">Mô tả chi tiết</h5>
                <div
                  style="
                    line-height: 1.8;
                    font-size: 1.05rem;
                    white-space: pre-line;
                  "
                >
                  ${product.detailDesc}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <jsp:include page="../layout/footer.jsp" />
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/client/js/main.js"></script>
  </body>
</html>
