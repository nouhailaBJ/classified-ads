<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
      <!--[if IE]>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <![endif]-->
      <meta name="description" content="">
      <meta name="author" content="ScriptsBundle">
      <title>{{  getSetting('title_name') }}</title>
      <!-- CSRF Token -->
      <meta name="csrf-token" content="{{ csrf_token() }}">
      <!-- =-=-=-=-=-=-= Favicons Icon =-=-=-=-=-=-= -->
      <link rel="icon" href="{{url('/')}}/images/favicon.ico" type="image/x-icon" />
      <!-- =-=-=-=-=-=-= Mobile Specific =-=-=-=-=-=-= -->
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <!-- =-=-=-=-=-=-= Bootstrap CSS Style =-=-=-=-=-=-= -->
      <link rel="stylesheet" href="{{url('/')}}/css/bootstrap.css">
      <!-- =-=-=-=-=-=-= Template CSS Style =-=-=-=-=-=-= -->
      <link rel="stylesheet" href="{{url('/')}}/css/style.css">
      <!-- =-=-=-=-=-=-= Font Awesome =-=-=-=-=-=-= -->
      <link rel="stylesheet" href="{{url('/')}}/css/font-awesome.css" type="text/css">
      <!-- =-=-=-=-=-=-= Flat Icon =-=-=-=-=-=-= -->
      <link href="{{url('/')}}/css/flaticon.css" rel="stylesheet">
      <!-- =-=-=-=-=-=-= Et Line Fonts =-=-=-=-=-=-= -->
      <link rel="stylesheet" href="{{url('/')}}/css/et-line-fonts.css" type="text/css">
      <!-- =-=-=-=-=-=-= Menu Drop Down =-=-=-=-=-=-= -->
      <link rel="stylesheet" href="{{url('/')}}/css/carspot-menu.css" type="text/css">
      <!-- =-=-=-=-=-=-= Animation =-=-=-=-=-=-= -->
      <link rel="stylesheet" href="{{url('/')}}/css/animate.min.css" type="text/css">
      <!-- =-=-=-=-=-=-= Select Options =-=-=-=-=-=-= -->
      <link href="{{url('/')}}/css/select2.min.css" rel="stylesheet" />
      <!-- =-=-=-=-=-=-= noUiSlider =-=-=-=-=-=-= -->
      <link href="{{url('/')}}/css/nouislider.min.css" rel="stylesheet">
      <!-- =-=-=-=-=-=-= Listing Slider =-=-=-=-=-=-= -->
      <link href="{{url('/')}}/css/slider.css" rel="stylesheet">
      <!-- =-=-=-=-=-=-= Owl carousel =-=-=-=-=-=-= -->
      <link rel="stylesheet" href="https://unpkg.com/vue-agile/dist/VueAgile.css">

      <link rel="stylesheet" type="text/css" href="{{url('/')}}/css/owl.carousel.css">
      <link rel="stylesheet" type="text/css" href="{{url('/')}}/css/owl.theme.css">
      <!-- =-=-=-=-=-=-= Check boxes =-=-=-=-=-=-= -->
      <link href="{{url('/')}}/skins/minimal/minimal.css" rel="stylesheet">
      <!-- =-=-=-=-=-=-= PrettyPhoto =-=-=-=-=-=-= -->
      <link rel="stylesheet" href="{{url('/')}}/css/jquery.fancybox.min.css" type="text/css" media="screen"/>
      <!-- =-=-=-=-=-=-= Responsive Media =-=-=-=-=-=-= -->
      <link href="{{url('/')}}/css/responsive-media.css" rel="stylesheet">
      <!-- =-=-=-=-=-=-= Template Color =-=-=-=-=-=-= -->
      <link rel="stylesheet" id="color" href="{{url('/')}}/css/colors/defualt.css">
	   <link href="{{url('/')}}/css/jquery.tagsinput.min.css" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600%7CSource+Sans+Pro:400,400i,600" rel="stylesheet">
      <!-- JavaScripts -->
      <script src="{{url('/')}}/js/modernizr.js"></script>
      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <body>
        <!-- =-=-=-=-=-=-= Preloader =-=-=-=-=-=-= -->
        <div class="preloader"></div>
       <div id="app">
            <!-- =-=-=-=-=-=-= Main Header =-=-=-=-=-=-= -->
            <div class="primary-header-1">
                <!-- Navigation Menu -->
                <div class="clearfix"></div>
                <!-- menu start -->
                <nav id="menu-1" class="mega-menu">
                    <!-- menu list items container -->
                    <section class="menu-list-items">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <!-- menu logo -->
                                <ul class="menu-logo">
                                <li>
                                    <router-link to="/"><img src="{{ url('/') }}/images/logo.png" alt="logo"> </router-link>
                                </li>
                                </ul>
                                <!-- menu links -->
                                <ul class="menu-links">
                                <!-- active class -->
                                <li>
                                @guest     
                                <router-link to="/signin">
                                    <i class="fa fa-plus" aria-hidden="true"></i> Add Your Annonce
                                 </router-link>
                                 @else
                                 <router-link to="/addProduct">
                                    <i class="fa fa-plus" aria-hidden="true"></i> Add Your Annonce
                                 </router-link>
                                 @endif
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><i class="fa fa-cubes" aria-hidden="true"></i>  Categories <i class="fa fa-angle-down fa-indicator"></i></a>
                                    <!-- drop down full width -->
                                    <div class="drop-down grid-col-12">
                                        <!--grid row-->
                                        <div class="grid-row">
                                            <!--grid column 2-->
                                            @foreach($categories as $category)
                                            <div class="grid-col-2">
                                            <h4><i class="fa {{ $category->icon }}" aria-hidden="true"></i> {{ $category->name}}</h4>
                                            <ul>
                                                @foreach($category->sub_cat as $sub)
                                                <li><router-link to="/category/{{ $sub->id }}">{{ $sub->name}}</router-link></li>
                                                @endforeach 
                                            </ul>
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <router-link to="/contact"><i class="fa fa-comment" aria-hidden="true"></i> Contact Us</router-link>
                                </li>
                                <li>
                                <router-link to="/blogs"><i class="fa fa-th-large" aria-hidden="true"></i> Blogs</router-link>
                                </li>
                                @guest
                                <li>
                                <router-link to="/signin">
                                    <i class="fa fa-sign-in" aria-hidden="true"></i> Register
                                </router-link>
                                </li>
                                <li>
                                <router-link to="/signin">
                                    <i class="fa fa-sign-in " aria-hidden="true"></i> Login
                                </router-link>
                                </li>
                                @else
                                <li>
                                <router-link to="/messenger">
                                    <i class="fa fa-commenting" aria-hidden="true"></i> Messenger
                                 </router-link>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img class="img-circle resize" alt="" src="{{ url('/uploads/avatar/'.Auth::user()->avatar ) }} "> <span class="myname hidden-xs"> {{ Auth::user()->name }}  </span> <span class="caret"></span></a>
                                    <!-- drop down multilevel  -->
                                    <ul class="drop-down-multilevel">
                                        <li><router-link to="/profile">
                                            <i class="fa fa-user" aria-hidden="true"></i> Profile
                                            </router-link>
                                        </li>
                                        <li><router-link to="/announces">
                                        <i class="fa fa-bullhorn" aria-hidden="true"></i> My Announces
                                            </router-link>
                                        </li>
                                        <li>
                                            <a href="{{ route('logout') }}" onclick="event.preventDefault();
                                                        document.getElementById('logout-form').submit();">
                                                <i class="fa fa-sign-out" aria-hidden="true"></i> Logout
                                            </a>

                                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                @csrf
                                            </form>
                                        </li>
                                    </ul>
                                </li>
                                @endif
                                </ul>
                            </div>
                        </div>
                    </div>
                    </section>
                </nav>
                <!-- menu end -->
            </div>
            @yield('content')
            <!-- =-=-=-=-=-=-= FOOTER =-=-=-=-=-=-= -->
            <footer class="footer-bg gray">
                <!-- Footer Content -->
                <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3  col-sm-6 col-xs-12">
                            <div class="widget my-quicklinks">
                            <h5>Categories</h5>
                            <ul >
                            @foreach($categories as $category)
                                <li><a href="#"><i class="fa {{ $category->icon }}" aria-hidden="true"></i> {{ $category->name }}</a></li>
                            @endforeach
                            </ul>
                            </div>
                        </div>
                        <div class="col-md-9  col-sm-6 col-xs-12">
                            <div class="widget my-quicklinks">
                            <h5>Pages</h5>
                            <div class="row">
                                @foreach($pages as $page)
                                <div class="col-md-4 page_url">
                                    <a href="{{ url('/page/'.$page->id)}}">
                                    <i class="fa fa-square" aria-hidden="true"></i> {{ $page->title }}</a>
                                </div>
                                @endforeach    
                            </div>
                            </div>
                        </div>
                </div>
                    <div class="row footer-bottom">
                        <div class="col-md-6  col-sm-12 col-xs-12">
                            <div class="copyright">
                            <p>{{ getSetting('footer') }}</p>
                            </div>
                        </div>
                        <div class="col-md-6  col-sm-12 col-xs-12">
                            <div class="socail-icons">
                                <a class="" href="{{ getSetting('facebook') }}"><i class="fa fa-facebook"></i></a>
                                <a class="" href="{{ getSetting('twitter') }}"><i class="fa fa-twitter"></i></a>
                                <a class="" href="{{ getSetting('linkedin') }}"><i class="fa fa-linkedin"></i></a>
                                <a class="" href="{{ getSetting('google') }}"><i class="fa fa-google-plus"></i></a>
                                <router-link to="/blogs">Blogs</router-link>
                                <router-link to="/contact"><i class="fa fa-comment" aria-hidden="true"></i> Contact Us</router-link>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </footer>
            <!-- =-=-=-=-=-=-= FOOTER END =-=-=-=-=-=-= -->         
       </div>  
      <!-- Back To Top -->
      <a href="#0" class="cd-top">Top</a>
      <script src="{{ asset('js/app.js') }}" defer></script>

        <!-- =-=-=-=-=-=-= JQUERY =-=-=-=-=-=-= -->
      <script src="{{ asset('/js/jquery.min.js') }}"></script>
      <!-- Bootstrap Core Css  -->
      <script src="{{url('/')}}/js/bootstrap.min.js"></script>
      <!-- Jquery Easing -->
      <script src="{{url('/')}}/js/easing.js"></script>
      <!-- Menu Hover  -->
      <script src="{{url('/')}}/js/carspot-menu.js"></script>
      <!-- Jquery Appear Plugin -->
      <script src="{{url('/')}}/js/jquery.appear.min.js"></script>
      <!-- Numbers Animation   -->
      <script src="{{url('/')}}/js/jquery.countTo.js"></script>
      <!-- Jquery Select Options  -->
      <script src="{{ asset('/js/select2.min.js') }}"></script>
      <!-- noUiSlider -->
      <script src="{{url('/')}}/js/nouislider.all.min.js"></script>
      <!-- Carousel Slider  -->
      <script src="{{url('/')}}/js/carousel.min.js"></script>
      <script src="{{url('/')}}/js/slide.js"></script>
      <!-- Image Loaded  -->
      <script src="{{url('/')}}/js/imagesloaded.js"></script>
      <script src="{{url('/')}}/js/isotope.min.js"></script>
      <!-- CheckBoxes  -->
      <script src="{{url('/')}}/js/icheck.min.js"></script>
      <!-- Jquery Migration  -->
      <script src="{{url('/')}}/js/jquery-migrate.min.js"></script>

      <!-- Style Switcher -->
      <script src="{{url('/')}}/js/color-switcher.js"></script>
      <!-- PrettyPhoto -->
      <script src="{{url('/')}}/js/jquery.fancybox.min.js"></script>
      <!-- Wow Animation -->
      <script src="{{url('/')}}/js/wow.js"></script>
      <!-- Template Core JS -->
      <script src="{{ asset('/js/custom.js') }}"></script>

      <script src="{{url('/')}}/js/jquery.tagsinput.min.js"></script>
      <script type="text/javascript">
         /*--------- Ad Tags --------*/ 
         $('#tags').tagsInput({
         		'width':'100%'
         });
      </script>
      <!-- JS -->
        @auth
        <script>
            var authuser = @json(auth()->user());
            window.user = @json(auth()->user())
        </script>
        @endauth
   </body>
</html>

