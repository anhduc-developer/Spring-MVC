<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="layoutSidenav_nav">
  <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
      <div class="nav">
        <div class="sb-sidenav-menu-heading">Core</div>

        <!-- Dashboard -->
        <a class="nav-link" href="/admin">
          <div class="sb-nav-link-icon">
            <i class="fas fa-tachometer-alt"></i>
          </div>
          Dashboard
        </a>

        <!-- User -->
        <a class="nav-link" href="/admin/user">
          <div class="sb-nav-link-icon">
            <i class="fas fa-users"></i>
          </div>
          User
        </a>

        <!-- Product -->
        <a class="nav-link" href="/admin/product">
          <div class="sb-nav-link-icon">
            <i class="fas fa-box"></i>
          </div>
          Product
        </a>

        <!-- Order -->
        <a class="nav-link" href="/admin/order">
          <div class="sb-nav-link-icon">
            <i class="fas fa-shopping-cart"></i>
          </div>
          Order
        </a>
      </div>
    </div>

    <div class="sb-sidenav-footer">
      <div class="small">Tên người dùng:</div>
      ADMIN
    </div>
  </nav>
</div>
