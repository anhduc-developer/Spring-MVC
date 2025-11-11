<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navbar -->
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
  <!-- Navbar Brand-->
  <a class="navbar-brand ps-3" href="/admin">Mai Anh Đức</a>

  <!-- Sidebar Toggle-->
  <button
    class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
    id="sidebarToggle"
  >
    <i class="fas fa-bars"></i>
  </button>

  <!-- Navbar Search-->
    <div class="input-group">
      <button class="btn btn-primary" id="btnNavbarSearch" type="button">
        <i class="fas fa-search"></i>
      </button>
    </div>
  </form>

  <!-- Navbar User Menu -->
  <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a
        class="nav-link dropdown-toggle"
        id="navbarDropdown"
        href="#"
        role="button"
        data-bs-toggle="dropdown"
      >
        <i class="fas fa-user fa-fw"></i>
      </a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdown"
      >
        <li><a class="dropdown-item" href="#!">Settings</a></li>
        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
        <li><hr class="dropdown-divider" /></li>
                <form method="post" action="/logout">
                    <input
                    type="hidden"
                    name="${_csrf.parameterName}"
                    value="${_csrf.token}"/>
                    <button class="dropdown-item" >Logout</button>
                </form>
      </ul>
    </li>
  </ul>
</nav>
