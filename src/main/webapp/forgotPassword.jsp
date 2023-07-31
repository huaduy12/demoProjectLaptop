<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Aroma Shop - Login</title>
    <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css" />
    <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css" />
    <link rel="stylesheet" href="vendors/linericon/style.css" />
    <link
      rel="stylesheet"
      href="vendors/owl-carousel/owl.theme.default.min.css"
    />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/nice-select.css" />
    <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css" />

    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/loginstyle.css" />
    
       <style>
       .error-message {
        margin-top: 5px;
        display: none;
        color: red;
      }
      .eye-icon {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    cursor: pointer;
  }
  .input-group-addon{
     background: #eee;
     padding:0px 16px;
     border: none;
     border-bottom: 1px solid #ccc;
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
            <li><a href="about.jsp">Giới thiệu</a></li>
            <li><a href="contact.jsp">Liên hệ</a></li>
      </ul>
      <!-- /NAV -->
    </div>
    <!-- /responsive-nav -->
  </div>
  <!-- /container -->
</nav>
<!-- /NAVIGATION -->


    <!--================Login Box Area =================-->
    <section class="login_box_area section-margin">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="login_box_img">
              <div class="hover">
                <h4>Bạn có tài khoản chưa?</h4>
                <p>
                  Nếu đã có tài khoản hãy nhanh tay đăng nhập để nhận những ưu đãi mới nhất.
                </p>
                <a class="button button-account" href="login.jsp">Đăng nhập ngay</a>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="login_form_inner register_form_inner">
              <h3>Quên mật khẩu</h3>
              <form class="row login_form" action="fogotPassword" id="register_form" method="post">
                
                <div class="col-md-12 form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="email"
                    value=""
                    placeholder="Nhập địa chỉ email đã đăng ký"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Nhập địa chỉ email đã đăng ký'"
                  />
                  <c:if test="${emailnotExist != null}">
                    <span  style="color: red;"> Email này chưa được đăng ký. Vui lòng nhập email khác
                </span>
                  </c:if>
                   <span id="email-error" class="error-message"
                  >Vui lòng nhập email hợp lệ
                </span>
                </div>
              
             
                <div class="col-md-12 form-group">
                  <button
                    type="submit"
                    value="submit"
                    class="button button-register w-100"
                  >
                    Gửi mã
                  </button>
                  
                </div>
              </form>
              
            </div>
          </div>
        </div>
      </div>
    </section>

  <jsp:include page="footer.jsp"></jsp:include>
  
  
  
    <script>
      const formValidation = document.getElementById("register_form");
    
      const email = document.getElementById("email");
     
      const errorEmail = document.getElementById("email-error");
    

      function getValue(id) {
        return document.getElementById(id).value.trim();
      }


      function checkEmail() {
        let regex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$/;
        if (!regex.test(email.value)) {
          errorEmail.style.display = "block";
          return false;
        } else {
          errorEmail.style.display = "none";
          return true;
        }
      }

    

      formValidation.addEventListener("submit", function (event) {
    	  
    	event.preventDefault(); // Ngăn chặn gửi form mặc định 
        
    	
      email.addEventListener("input", function () {
        checkEmail();
      });
     
        let error = false;
      
        if (!checkEmail()) {
          checkEmail();
          email.focus();
          error = true;
        }

    
      
    

        if (!error) {
            // Nếu không có lỗi, gỡ bỏ ngăn chặn gửi form
            event.target.submit();
          }
      });
      
     
    </script>







    <!--================End Login Box Area =================-->

    <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="vendors/skrollr.min.js"></script>
    <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
    <script src="vendors/jquery.ajaxchimp.min.js"></script>
    <script src="vendors/mail-script.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
