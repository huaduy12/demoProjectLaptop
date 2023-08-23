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

    <title>Giới thiệu</title>

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
    .cart-btns a{
       flex-grow: 1
    }
    
     .cart-btns form{
       flex-grow: 1
    }
      .cart-btns form button{
       width: 100% !important;
    }
    
    
    
     
.text-black-50{
   color: #000 !important;
  text-align: justify !important;
  text-justify: inter-word;
  font-family: "Montserrat", sans-serif;
}
    
 .cart-dropdown .cart-btns button {
    display: inline-block;
    width: 100%;
    padding: 12px;
    background-color: #d10024;
    color: #fff;
    text-align: center;
    font-weight: 700;
    -webkit-transition: 0.2s all;
    transition: 0.2s all;
    border: none;
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
            <li><a href="store">Cửa hàng</a></li>
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
            <h2 class="font-weight-bold heading text-primary mb-4">Giới thiệu</h2>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50" >
            Chào mừng bạn đến với website bán laptop của chúng tôi!
            </p>
            <p class="text-black-50">
             Chúng tôi tự hào là địa điểm mua sắm trực tuyến lý tưởng dành cho những người đam mê công nghệ và đang tìm kiếm chiếc laptop hoàn hảo.
              Với một đội ngũ chuyên nghiệp và tận tâm, chúng tôi cam kết cung cấp cho bạn những sản phẩm laptop chất lượng, 
             đa dạng về thương hiệu, kiểu dáng và cấu hình, đáp ứng mọi nhu cầu và sở thích cá nhân.
            </p>
            <p class="text-black-50">
             Tại website của chúng tôi, bạn sẽ được khám phá một bộ sưu tập đa dạng các dòng laptop từ các thương hiệu
              hàng đầu trên thế giới như Apple, Dell, HP, Asus, Lenovo và nhiều hãng nổi tiếng khác. Từ những chiếc laptop siêu mỏng và nhẹ, phù hợp với người dùng di chuyển nhiều, 
             đến những máy tính xách tay mạnh mẽ, đáp ứng tối đa nhu cầu làm việc và giải trí của bạn.
            </p>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50">
            Chúng tôi luôn cập nhật những xu hướng công nghệ mới nhất, giúp bạn tiếp 
            cận những tính năng tiên tiến và hiệu suất vượt trội. Ngoài ra, chúng tôi cũng cung cấp những chương
             trình khuyến mãi hấp dẫn và dịch vụ chăm sóc khách hàng tận tâm,
             giúp bạn có trải nghiệm mua sắm trực tuyến đáng nhớ và thoải mái nhất.
            </p>
            <p class="text-black-50">
              Hãy để chúng tôi trở thành người bạn đồng hành đáng tin cậy trên hành trình tìm kiếm chiếc 
              laptop hoàn hảo cho bạn. Dù bạn là một doanh nhân chuyên nghiệp, một sinh viên năng động hay một người yêu công nghệ, 
              chúng tôi sẵn sàng đáp ứng mọi yêu cầu và đem đến cho bạn những trải nghiệm vượt trội.
            </p>
            
             <p class="text-black-50">
             Hãy trải nghiệm ngay và khám phá các sản phẩm tuyệt vời tại website của chúng tôi.
              Chúng tôi cam kết mang đến cho bạn sự hài lòng và niềm vui mua sắm tuyệt vời nhất!
            </p>
            
             <p class="text-black-50">
            Cảm ơn bạn đã lựa chọn chúng tôi!
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
                <h3 class="heading">Về chất lượng sản phẩm</h3>
                <p class="text-black-50">
                  Chúng tôi luôn ưu tiên chất lượng sản phẩm lên hàng đầu với những dịch vụ tốt nhất dành cho khách hàng
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-person"><i class="fa fa-user" aria-hidden="true"></i></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Về khách hàng</h3>
                <p class="text-black-50">
                  Luôn dành mọi ưu đãi tốt nhất và phục vụ tốt nhất dành cho khách hàng khi tới trải nghiệm tại website của chúng tôi.
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-security"><i class="fa fa-laptop" aria-hidden="true"></i></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">Dễ sử dụng và an toàn</h3>
                <p class="text-black-50">
                  Chúng tôi cam kết bảo đảm an toàn tuyệt đối cho các thông tin của khách hàng khi hoạt động trên website của chúng tôi.
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
              <span class="caption text-black-50"> Lượt khách hàng truy cập mỗi ngày</span>
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
              <span class="caption text-black-50">Lượt sản phẩm đang được giảm giá</span>
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
              <span class="caption text-black-50">Sản phẩm đang được bán</span>
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
              <span class="caption text-black-50"> Đại lý đang hợp tác</span>
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
    