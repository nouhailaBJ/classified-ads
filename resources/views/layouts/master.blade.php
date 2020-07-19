<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>{{  getSetting('title_name') }}</title>
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link rel="stylesheet" href="{{  url('/') }}/css/app.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Cairo:300,400,400i,700" rel="stylesheet">

</head>
<body class="hold-transition sidebar-mini ">
<div class="wrapper" id="app">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="{{ url('/')}}" class="nav-link"><i class="fa fa-eye" aria-hidden="true"></i> Visit Site</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <router-link to="/admin/profile" class="nav-link"><i class="fa fa-user-circle" aria-hidden="true"></i> My Profile</router-link>
      </li>
    </ul>
    <!-- SEARCH FORM -->
    <div class="form-inline ml-3">
    <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" @keyup="searchit" v-model="search" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" @click="searchit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </div>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ url('/admin/home')}}" class="brand-link">
      <span class="brand-text font-weight-light text-center">Admin Panel</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{  url('/uploads/avatar/'.auth::user()->avatar) }}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">{{ Auth::user()->name }}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
          <router-link to="/admin/home" class="nav-link">
              <i class="fa fa-home" aria-hidden="true"></i>
              <p>
                Home
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/users" class="nav-link">
             <i class="fa fa-users" aria-hidden="true"></i>
              <p>
                Users
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/products" class="nav-link">
             <i class="fa fa-tasks" aria-hidden="true"></i>
              <p>
                Products
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/location" class="nav-link">
             <i class="fa fa-circle" aria-hidden="true"></i>
              <p>
                Location
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/categories" class="nav-link">
             <i class="fa fa-tasks" aria-hidden="true"></i>
              <p>
                Categories
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/blogs" class="nav-link">
             <i class="fa fa-th" aria-hidden="true"></i>
              <p>
                Blogs
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/todo" class="nav-link">
             <i class="fa fa-check-circle" aria-hidden="true"></i>
              <p>
                To Do List
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/pages" class="nav-link">
             <i class="fa fa-file" aria-hidden="true"></i>
              <p>
                Make Pages
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/media" class="nav-link">
             <i class="fa fa-anchor" aria-hidden="true"></i>
              <p>
                Media
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/calender" class="nav-link">
             <i class="fa fa-calendar" aria-hidden="true"></i>
              <p>
                Calender
              </p>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link to="/admin/messages" class="nav-link">
             <i class="fa fa-comments" aria-hidden="true"></i>
              <p>
                Messages
              </p>
            </router-link>
          </li>
          <li class="nav-item">
           <router-link to="/admin/settings" class="nav-link">
             <i class="fa fa-cogs " aria-hidden="true"></i>
              <p>
                Settings
              </p>
            </router-link>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="{{ route('logout') }}"
               onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                      <i class="fa  fa-user-times" aria-hidden="true"></i>              
               <p>
               Log Out
              </p> 
          </a>
          <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
              @csrf
          </form>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  @yield('content')
  <!-- Main Footer -->
  <footer class="main-footer">
    Copyright &copy; 2020  All rights reserved.
  </footer>
</div>
<script src="{{  url('/') }}/js/app.js"></script>
<script src="{{  url('/') }}/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="{{  url('/') }}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="{{  url('/') }}/plugins/ekko-lightbox/ekko-lightbox.min.js"></script>
<script src="{{  url('/') }}/dist/js/script.js"></script>
<script src="{{  url('/') }}/dist/js/demo.js"></script>
<script>

$(function () {
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox({
        alwaysShowClose: true
      });
    });

  })
</script>
</body>
</html>
