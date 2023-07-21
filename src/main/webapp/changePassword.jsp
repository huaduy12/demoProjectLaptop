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

    <title>Electro - HTML Ecommerce Template</title>

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


<link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

    
    <style type="text/css">
     .error-message {
        margin-top: 5px;
        display: none;
        color: red;
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

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <ul class="breadcrumb-tree">
              <li><a href="#">Tài khoản</a></li>
              <li class="active">Thay đổi mật khẩu</li>
            </ul>
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->

    <!-- SECTION -->
    <div class="section1">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-7">
          
          <form action="changePasswordServlet" id = "formchangePass" method="post">
          <!-- Billing Details -->
            <div class="billing-details">
              <div class="section-title">
                <h3 class="title">Thay đổi mật khẩu</h3>
              </div>
              <div class="form-group">
                 <div class="input-group">
                  <input
                    type="password"
                    class="form-control"
                    id="passwordOri"
                    name="passwordOri"
                    placeholder="Mật khẩu cũ"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Mật khẩu cũ'"
                  />
                   <span class="input-group-addon">
    			  <i class="glyphicon glyphicon-eye-open eye-icon" id = "eyeOri" ></i>
  				  </span>
                 </div>
              </div>
              <div class="form-group">
              <div class="input-group">
                  <input
                    type="password"
                    class="form-control"
                    id="passwordNew"
                    name="passwordNew"
                    placeholder="Mật khẩu mới"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Mật khẩu mới'"
                  />
                   <span class="input-group-addon">
    			  <i class="glyphicon glyphicon-eye-open eye-icon" id = "eyePass"></i>
  				  </span>
                 </div>
                 <span id="password-error" class="error-message"
                  >Vui lòng nhập mật khẩu hợp lệ(lớn hơn 8 ký tự)
                </span>
              </div>
              <div class="form-group">
               <div class="input-group">
                  <input
                    type="password"
                    class="form-control"
                    id="confirmPassword"
                    name="confirmPassword"
                    placeholder="Xác nhận mật khẩu"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Xác nhận mật khẩu'"
                  />
                   <span class="input-group-addon">
    			  <i class="glyphicon glyphicon-eye-open eye-icon" id = "eyeConfirm"></i>
  				  </span>
                 </div>
                 <span id="confirmPass-error" class="error-message"
                  >Xác nhận mật khẩu không chính xác
                </span>
              </div>
              
              <c:if test="${changeSusscess != null}">
                  <p id = "message" style="color: red;"> ${changeSusscess}</p>
              </c:if>
              
               <c:if test="${changeFail != null}">
                  <p id = "message" style="color: red;"> ${changeFail}</p>
              </c:if>
              
            </div>
            <button
                    type="submit"
                    value="submit"
                    class="primary-btn order-submit mb-20">
                   Thay đổi
                  </button>
           
          
          </form>
            
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /SECTION -->

    <jsp:include page="footer.jsp"></jsp:include>

  <script>
      const formValidation = document.getElementById("formchangePass");
     
      const password = document.getElementById("passwordNew");
      const rePassword = document.getElementById("confirmPassword");
      
     
      const errorPassword = document.getElementById("password-error");
      const errorRePassword = document.getElementById("confirmPass-error");

      function getValue(id) {
        return document.getElementById(id).value.trim();
      }


      function checkPassword() {
        let regex = /^[a-zA-Z0-9]{8,}$/;
        if (!regex.test(password.value)) {
          errorPassword.style.display = "block";
          return false;
        } else {
          errorPassword.style.display = "none";
          return true;
        }
      }
      function checkRePassword(idPassword, idRePassword, errorElement) {
        if (getValue(idPassword) !== getValue(idRePassword)) {
          errorElement.style.display = "block";
          return false;
        } else {
          errorElement.style.display = "none";
          return true;
        }
      }
   
     formValidation.addEventListener("submit", function (event) {
    	  
    	event.preventDefault(); // Ngăn chặn gửi form mặc định 
        
    	
      password.addEventListener("input", function () {
        checkPassword();
      });
      rePassword.addEventListener("input", function () {
        checkRePassword("passwordNew", "confirmPassword", errorRePassword)
      });
        let error = false;
        

        if (!checkPassword()) {
          checkPassword();
          password.focus();
          error = true;
        }

        if (!checkRePassword("passwordNew", "confirmPassword", errorRePassword)) {
          checkRePassword("passwordNew", "confirmPassword", errorRePassword);
          rePassword.focus();
          error = true;
        }
    

        if (!error) {
            // Nếu không có lỗi, gỡ bỏ ngăn chặn gửi form
            event.target.submit();
          }
      });
      
     
    </script>

<script type="text/javascript">

const passwordOri = document.getElementById("passwordOri");

const eyeIconOri = document.getElementById("eyeOri");
eyeIconOri.addEventListener("click", function () {
	    if (passwordOri.type === "password") {
	    	passwordOri.type = "text";
	    	eyeIconOri.classList.remove("glyphicon-eye-open");
	    	eyeIconOri.classList.add("glyphicon-eye-close");
	    } else {
	    	passwordOri.type = "password";
	    	eyeIconOri.classList.remove("glyphicon-eye-close");
	    	eyeIconOri.classList.add("glyphicon-eye-open");
	    }
	  });

const eyeIcon = document.getElementById("eyePass");
eyeIcon.addEventListener("click", function () {
	    if (password.type === "password") {
	     password.type = "text";
	      eyeIcon.classList.remove("glyphicon-eye-open");
	      eyeIcon.classList.add("glyphicon-eye-close");
	    } else {
	      password.type = "password";
	      eyeIcon.classList.remove("glyphicon-eye-close");
	      eyeIcon.classList.add("glyphicon-eye-open");
	    }
	  });

const eyeIconRe = document.getElementById("eyeConfirm");
eyeIconRe.addEventListener("click", function () {
	    if (rePassword.type === "password") {
	    	rePassword.type = "text";
	      eyeIconRe.classList.remove("glyphicon-eye-open");
	      eyeIconRe.classList.add("glyphicon-eye-close");
	    } else {
	    	rePassword.type = "password";
	      eyeIconRe.classList.remove("glyphicon-eye-close");
	      eyeIconRe.classList.add("glyphicon-eye-open");
	    }
	  });

</script>

<script>
    setTimeout(function() {
        document.getElementById("message").style.display = "none";
    }, 15000); // 15 giây
</script>

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
