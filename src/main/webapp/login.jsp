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

    <title>Đăng nhập</title>

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
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link type="text/css" rel="stylesheet" href="css/loginstyle.css" />
    
    
    <style>
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
                <h4>Đăng ký ?</h4>
                <p>
                 Nhanh tay đăng ký tài khoản để nhận được nhiều ưu đãi miễn phí
                </p>
                <a class="button button-account" href="register.jsp"
                  >Đăng ký tài khoản</a
                >
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="login_form_inner">
               <c:if test="${success != null}">
                    <h3 style="color: red;">Chúc mừng bạn thay đổi mật khẩu thành công</h3>
               </c:if>
                <c:if test="${fail != null}">
                    <h3 style="color: red;">Thay đổi mật khẩu thất bại</h3>
               </c:if>
               
              <h3>Đăng nhập</h3>
              <form class="row login_form" action="loginServlet" id="formlogin" method="post">
                <div class="col-md-12 form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="email"
                    <c:if test="${email != null}">
                    value="${email}"
                    </c:if>
                    <c:if test="${cookie.cookieEmail != null}">
                    value="${cookie.cookieEmail.value}"
                    </c:if>
                    placeholder="Email"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Email'"
                  />
                   <span id="email-error" class="error-message"
                  >Vui lòng nhập email hợp lệ
                </span>
                </div>
                
                 <div class="col-md-12 form-group" style="margin-bottom: 5px">
                 <div class="input-group">
                  <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
                    value="${cookie.cookiePass.value}"
                    placeholder="Mật khẩu"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Mật khẩu'"
                  />
                   <span class="input-group-addon">
    			   <i class="glyphicon glyphicon-eye-open eye-icon" id = "eysicon"></i>
  				  </span>
  				  
                 </div>
                 
                </div>
                
                
                <div class="col-md-12 form-group">
                  <div class="creat_account">
                    <input type="checkbox" id="f-option2" name="remember" value="1" ${cookie.cookieRemember != null ? 'checked':''} />
                    <label for="f-option2">Ghi nhớ</label>
                  </div>
                </div>
                
                <c:if test="${email != null}">
                   <div class="col-md-12">
                    <p style="color:red">Tài khoản hoặc mật khẩu không chính xác </p>
                  </div>
                </c:if>
                
                <div class="col-md-12 form-group">
                  <button
                    type="submit"
                    value="submit"
                    class="button button-login w-100"
                  >
                    Đăng nhập
                  </button>
                  <a href="forgotPassword.jsp">Quên mật khẩu?</a>
                </div>
             </form>
             
             
             </div>
              <!--================End div col =================-->
            </div>
            
             <!--================End row =================-->
          </div>
          
           <!--================End container =================-->
        </div> 
        
    </section>
    <!--================End Login Box Area =================-->
    
    
   <script type="text/javascript">
    const formValidation = document.getElementById("formlogin");
  
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
  
  
  <script type="text/javascript">


const eyeIcon = document.getElementById("eysicon");
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
 
</script> 
   <jsp:include page="footer.jsp"></jsp:include>

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
