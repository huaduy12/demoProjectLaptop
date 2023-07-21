<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro-Ecommerce</title>

    <!-- Google font -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
      rel="stylesheet"
    />

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css" />
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

 
   
    
    <!-- Custom stlylesheet -->
   
    <link type="text/css" rel="stylesheet" href="css/style.css" />
     <link type="text/css" rel="stylesheet" href="css/aboutstyle.css" />

<style type="text/css">
	.cart-btns{
		display: flex
		}
    
</style>
  
  </head>
  <body>
   
  
     <jsp:include page="header.jsp"></jsp:include>
   
    
    <!-- NAVIGATION -->
    <nav id="navigation">
      <!-- container -->
      <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
          <!-- NAV -->
          <ul class="main-nav nav navbar-nav">
            <li ><a href="index.jsp">Trang chủ</a></li>
            <li><a href="store.jsp">Cửa hàng</a></li>
            <li class="active"><a href="about.jsp">Giới thiệu</a></li>
            <li><a href="contact.jsp">Liên hệ</a></li>
          </ul>
          <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
      </div>
      <!-- /container -->
    </nav>
    <!-- /NAVIGATION -->


    <div class="section">
      <div class="container">
        <div class="row text-left mb-5">
          <div class="col-12">
            <h2 class="font-weight-bold heading text-primary mb-4">About Us</h2>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam
              enim pariatur similique debitis vel nisi qui reprehenderit totam?
              Quod maiores.
            </p>
            <p class="text-black-50">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni
              saepe, explicabo nihil. Est, autem error cumque ipsum repellendus
              veniam sed blanditiis unde ullam maxime veritatis perferendis
              cupiditate, at non esse!
            </p>
            <p class="text-black-50">
              Enim, nisi labore exercitationem facere cupiditate nobis quod
              autem veritatis quis minima expedita. Cumque odio illo iusto
              reiciendis, labore impedit omnis, nihil aut atque, facilis
              necessitatibus asperiores porro qui nam.
            </p>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni
              saepe, explicabo nihil. Est, autem error cumque ipsum repellendus
              veniam sed blanditiis unde ullam maxime veritatis perferendis
              cupiditate, at non esse!
            </p>
            <p class="text-black-50">
              Enim, nisi labore exercitationem facere cupiditate nobis quod
              autem veritatis quis minima expedita. Cumque odio illo iusto
              reiciendis, labore impedit omnis, nihil aut atque, facilis
              necessitatibus asperiores porro qui nam.
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="section pt-0">
      <div class="container">
        <div class="row justify-content-between mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
            <div class="img-about dots">
              <img src="img/product03.png" alt="Image" class="img-fluid" />
            </div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-home2"><i class="fa fa-home" aria-hidden="true"></i></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Quality properties</h3>
                <p class="text-black-50">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Nostrum iste.
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-person"><i class="fa fa-user" aria-hidden="true"></i></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Top rated agents</h3>
                <p class="text-black-50">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Nostrum iste.
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-security"><i class="fa fa-laptop" aria-hidden="true"></i></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Easy and safe</h3>
                <p class="text-black-50">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Nostrum iste.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="0">
            <img src="img/product01.png" alt="Image" class="img-fluid" />
          </div>
          <div class="col-md-4 mt-lg-5" data-aos="fade-up" data-aos-delay="100">
            <img src="img/product02.png" alt="Image" class="img-fluid" />
          </div>
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
            <img src="img/product03.png" alt="Image" class="img-fluid" />
          </div>
        </div>
        <div class="row section-counter mt-5">
          <div
            class="col-6 col-sm-6 col-md-6 col-lg-3"
            data-aos="fade-up"
            data-aos-delay="300"
          >
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"
                ><span class="countup text-primary">2917</span></span
              >
              <span class="caption text-black-50"># of Buy Properties</span>
            </div>
          </div>
          <div
            class="col-6 col-sm-6 col-md-6 col-lg-3"
            data-aos="fade-up"
            data-aos-delay="400"
          >
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"
                ><span class="countup text-primary">3918</span></span
              >
              <span class="caption text-black-50"># of Sell Properties</span>
            </div>
          </div>
          <div
            class="col-6 col-sm-6 col-md-6 col-lg-3"
            data-aos="fade-up"
            data-aos-delay="500"
          >
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"
                ><span class="countup text-primary">38928</span></span
              >
              <span class="caption text-black-50"># of All Properties</span>
            </div>
          </div>
          <div
            class="col-6 col-sm-6 col-md-6 col-lg-3"
            data-aos="fade-up"
            data-aos-delay="600"
          >
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"
                ><span class="countup text-primary">1291</span></span
              >
              <span class="caption text-black-50"># of Agents</span>
            </div>
          </div>
        </div>
      </div>
    </div>


     <jsp:include page="footer.jsp"></jsp:include>

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>

    <script src="js/jscontact/bootstrap.bundle.min.js"></script>
    <script src="js/jscontact/tiny-slider.js"></script>
    <script src="js/jscontact/aos.js"></script>
    <script src="js/jscontact/navbar.js"></script>
    <script src="js/jscontact/counter.js"></script>
    <script src="js/jscontact/custom.js"></script>
  </body>
</html>
    