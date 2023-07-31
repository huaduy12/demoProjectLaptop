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
              <h3>Đăng ký tài khoản</h3>
              <form class="row login_form" action="registerServlet" id="register_form" method="post">
                <div class="col-md-12 form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    name="username"
                    value="${user.username}"
                    placeholder="Tên đăng nhập"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Username'"
                  />
                   <span id="username-error" class="error-message"
                      >Vui lòng nhập tên đăng nhập hợp lệ
                    </span>
                </div>
                <div class="col-md-12 form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="email"
                    value="${user.email}"
                    placeholder="Địa chỉ email"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Địa chỉ email'"
                  />
                  <c:if test="${user != null}">
                    <span  style="color: red;"> Email đã tồn tại. Vui lòng nhập email khác
                </span>
                  </c:if>
                   <span id="email-error" class="error-message"
                  >Vui lòng nhập email hợp lệ
                </span>
                </div>
                <div class="col-md-12 form-group">
                 <div class="input-group">
                  <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
                    placeholder="Mật khẩu"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Mật khẩu'"
                  />
                   <span class="input-group-addon">
    			  <i class="glyphicon glyphicon-eye-open eye-icon"></i>
  				  </span>
                 </div>
                 
                  <span id="password-error" class="error-message"
                  >Vui lòng nhập mật khẩu hợp lệ(lớn hơn 8 ký tự)
                </span>
                </div>
                <div class="col-md-12 form-group">
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
    			  <i class="glyphicon glyphicon-eye-open eye-icon"></i>
  				  </span>
                 </div>
                  <span id="confirmPass-error" class="error-message"
                  >Xác nhận mật khẩu không chính xác
                </span>
                 
                </div>
                <div class="col-md-12 form-group">
                  <button
                    type="submit"
                    value="submit"
                    class="button button-register w-100"
                  >
                    Đăng ký
                  </button>
                  <c:if test="${susscess != null}">
                     <span>${susscess} </span>
                     <span id="countdown" style="color: red"></span>
                      <a class="button " href="login.jsp" style = "color: #fff">Đăng nhập ngay</a>
                  </c:if>
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
      const username = document.getElementById("username");
      const email = document.getElementById("email");
      const password = document.getElementById("password");
      const rePassword = document.getElementById("confirmPassword");
      
      const errorUsername = document.getElementById("username-error");
      const errorEmail = document.getElementById("email-error");
      const errorPassword = document.getElementById("password-error");
      const errorRePassword = document.getElementById("confirmPass-error");

      function getValue(id) {
        return document.getElementById(id).value.trim();
      }

      function checkName() {
        let regex = /^[a-zA-Z0-9]{1,20}$/;
        if (!regex.test(username.value)) {
          username.focus();
          errorUsername.style.display = "block";
          return false;
        } else {
          errorUsername.style.display = "none";
          return true;
        }
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
        
    	username.addEventListener("input", function () {
        checkName();
      });
      email.addEventListener("input", function () {
        checkEmail();
      });
      password.addEventListener("input", function () {
        checkPassword();
      });
      rePassword.addEventListener("input", function () {
        checkRePassword("password", "confirmPassword", errorRePassword)
      });
        let error = false;
        if (!checkName()) {
          checkName();
          username.focus();
          error = true;
        }

        if (!checkEmail()) {
          checkEmail();
          email.focus();
          error = true;
        }

        if (!checkPassword()) {
          checkPassword();
          password.focus();
          error = true;
        }

        if (!checkRePassword("password", "confirmPassword", errorRePassword)) {
          checkRePassword("password", "confirmPassword", errorRePassword);
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


const eyeIcon = document.createElement("i");
eyeIcon.classList.add("eye-icon", "glyphicon", "glyphicon-eye-open");
password.parentNode.appendChild(eyeIcon);
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

const eyeIconRe = document.createElement("i");
eyeIconRe.classList.add("eye-icon", "glyphicon", "glyphicon-eye-open");
rePassword.parentNode.appendChild(eyeIconRe);
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

<script type="text/javascript">
//Đếm ngược từ 10 giây
let countdown = 20;

// Lấy thẻ span chứa đếm ngược
let countdownElement = document.getElementById("countdown");

// Cập nhật giá trị đếm ngược và chuyển hướng sau khi hết thời gian
function updateCountdown() {
  countdownElement.textContent = countdown;
  
  if (countdown === 0) {
    // Chuyển hướng đến trang đăng nhập sau khi hết thời gian
    window.location.href = "login.jsp";
  } else {
    countdown--;
    setTimeout(updateCountdown, 1000); // Gọi lại hàm sau 1 giây
  }
}

// Bắt đầu đếm ngược khi trang tải xong
window.addEventListener("load", updateCountdown);

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
