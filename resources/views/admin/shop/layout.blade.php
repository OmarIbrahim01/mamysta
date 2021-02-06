<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Admin Panel</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/admin_panel/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/admin_panel/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/admin_panel/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  {{-- Section CSS --}}
  @yield('css')
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      
      <li class="nav-item d-none d-sm-inline-block">
        {{-- Logout --}}
        <a href="#" class="nav-link"><i class="fas fa-sign-out-alt"></i></a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ route('admin_home') }}" class="brand-link">
      <img src="/admin_panel/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Shop <small>Admin Panel</small></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/admin_panel/dist/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Omar Ibrahim</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

          <li class="nav-item">
            <a href="{{ route('admin_shop_dashboared') }}" class="nav-link {{ request()->is('dashboard') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>



          <li class="nav-item has-treeview {{ request()->is('orders') ? 'menu-open' : '' }}">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-shopping-cart"></i>
              <p>Orders
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview" style="margin-top: 10px; margin-bottom: 30px;">
              <li class="nav-item">
                <a href="{{ route('admin_shop_orders_index') }}" class="nav-link {{ request()->is('orders/all') ? 'active' : '' }}">
                  <i class="far fa-circle nav-icon text-primary"></i>
                  <p>View All Orders</p>
                </a>
              </li>
            </ul>
          </li>



          <li class="nav-item has-treeview {{ request()->is('customers') ? 'menu-open' : '' }}">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>Customers
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview" style="margin-top: 10px; margin-bottom: 30px;">
              <li class="nav-item">
                <a href="#" class="nav-link {{ request()->is('customers/all') ? 'active' : '' }}">
                  <i class="far fa-circle nav-icon text-primary"></i>
                  <p>View All Customers</p>
                </a>
              </li>
            </ul>
          </li>


          <li class="nav-item has-treeview {{ request()->is('products') ? 'menu-open' : '' }}">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-shopping-bag"></i>
              <p>Products
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview" style="margin-top: 10px; margin-bottom: 30px;">
              <li class="nav-item">
                <a href="{{ route('admin_shop_products_create') }}" class="nav-link {{ request()->is('products/create') ? 'active' : '' }}">
                  <i class="fas fa-plus-circle nav-icon text-info"></i>
                  <p>Add New Product</p>
                </a>
              </li>
              <hr style="border-color: #555;">
              <li class="nav-item">
                <a href="{{ route('admin_shop_products_index') }}" class="nav-link {{ request()->is('products/all') ? 'active' : '' }}">
                  <i class="far fa-circle nav-icon text-primary"></i>
                  <p>View All Products</p>
                </a>
              </li>
            </ul>
          </li>


          <li class="nav-header">Others</li>
          <li class="nav-item has-treeview {{ request()->is('products') ? 'menu-open' : '' }}">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-truck"></i>
              <p>Shipping
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview" style="margin-top: 10px; margin-bottom: 30px;">
              <li class="nav-item">
                <a href="#" class="nav-link {{ request()->is('products/all') ? 'active' : '' }}">
                  <i class="far fa-circle nav-icon text-primary"></i>
                  <p>Shipping Methods</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link {{ request()->is('products/all') ? 'active' : '' }}">
                  <i class="far fa-circle nav-icon text-primary"></i>
                  <p>Regions</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link {{ request()->is('products/all') ? 'active' : '' }}">
                  <i class="far fa-circle nav-icon text-primary"></i>
                  <p>Cities</p>
                </a>
              </li>
            </ul>
          </li>




         
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    @yield('header')

    <!-- Main content -->
    @yield('content')
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer text-center">
    <strong>Copyright &copy; 2020 <a href="#">Mamysta</a>.</strong>
    All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/admin_panel/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/admin_panel/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Bootstrap 4 -->
<script src="/admin_panel/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="/admin_panel/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/admin_panel/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/admin_panel/dist/js/demo.js"></script>
{{-- Section JS --}}
@yield('js')

</body>
</html>
