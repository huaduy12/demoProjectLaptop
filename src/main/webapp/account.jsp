<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Dao.orderDao"%>
<%@page import="Model.Order"%>
<%@page import="Model.User"%>
<jsp:useBean id="productDao" class="Dao.productDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />
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

    <title>Quản lý tài khoản</title>

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

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />
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

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <ul class="breadcrumb-tree">
              <li><a href="#">Tài khoản</a></li>
              <li class="active">Thông tin chi tiết</li>
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
          
          <form action="inforDatailUserServlet" id="formUpdateUser" method="post">
          
            <!-- Billing Details -->
            <div class="billing-details">
              <div class="section-title text-center">
                <h3 class="title">Thông tin chi tiết</h3>
              </div>
              <div class="form-group">
                <input
                  class="input"
                  type="text"
                  name="username"
                  id = "username"
                  placeholder="Tên người dùng"
                  value="${sessionScope.user.username}"
                />
                <span id="username-error" class="error-message"
                  >Vui lòng nhập lại tên ít nhất 2 ký tự
                </span>
              </div>
              <div class="form-group">
                <input
                  class="input"
                  type="text"
                  name="fullname"
                  placeholder="Tên đầy đủ"
                  value="${sessionScope.user.fullname}"
                />
              </div>
              <div class="form-group">
                <input
                  class="input"
                  type="text"
                  name="email"
                  id ="email"
                  placeholder="Email"
                  value="${sessionScope.user.email}"
                />
                  <span id="email-error" class="error-message"
                  >Vui lòng nhập lại email hợp lệ
                </span>
                <c:if test="${errorEmail != null}">
                      <p style="color: red"> ${errorEmail} </p>
                </c:if>
              </div>
              <div class="form-group">
                <input
                  class="input"
                  type="text"
                  name="tel"
                  id = "tel"
                  placeholder="Số điện thoại"
                  value="${sessionScope.user.phonenumber}"
                />
                  <span id="phone-error" class="error-message"
                  >Vui lòng nhập lại số điện thoại hợp lệ
                </span>
                <c:if test="${errorPhone != null}">
                      <p style="color: red"> ${errorPhone} </p>
                </c:if>
              </div>
              
              <div class="form-group">
                <input
                  class="input"
                  type="text"
                  name="address"
                  placeholder="Địa chỉ"
                  value="${sessionScope.user.address}"
                />
              </div>
              
            </div>
            <button type="submit" class="primary-btn order-submit mb-20"> Cập nhập</button>
            
            </form>
          </div>

          <!-- Order Details -->
          <div class="col-md-5 order-details">
            <div class="section-title text-center">
              <h3 class="title">Sản phẩm mua gần nhất</h3>
            </div>
            <div class="order-summary">
              <div class="order-col">
                <div><strong>PRODUCT</strong></div>
                <div><strong>TOTAL</strong></div>
              </div>
              <div class="order-products">
               <%   
        		    User user = (User) session.getAttribute("user");
        		    List<Order> order = null;
        		    if(user != null){
        		        order = orderDao.getOrderByUserLatest(user.getId()); 
        		    }
                    %>
                 <%
                    int count = 0;
                    double total = 0;
                    List<Orderdetail> allOrderdetails = new ArrayList<>();
                      if(order != null){
                    	  for(Order o : order){
                    		  List<Orderdetail> orderDetailsForOrder = orderDao.getListOrderdetailNotNull(o.getId());
                    	      allOrderdetails.addAll(orderDetailsForOrder);
                    	  }
                      }

                     for(Orderdetail orderdetail : allOrderdetails){
                    	  Product product = productDao.getProductById(orderdetail.getProduct_id());
                    	  
                    	  if(orderdetail.getStatus() == 2){ 
                    		  count++;
                    	  %>
                    		  <div class="order-col">
                				  <div><%=orderdetail.getQuantity()%>x  <%=product.getName()%></div>
                				 <div><%=new java.text.DecimalFormat("#,###").format(orderdetail.getTotal_money())%></div>
               				 </div>
                    	 <% }
                    	  if(count > 3 ) break;
                    %>
                
                
                
                <%} %>
              </div>
            </div>
            <div><strong>Địa chỉ đặt hàng gấn nhất</strong></div>
            <div class="payment-method">
            <%
            List<String> list = null;
            if(user != null){
            	list = orderDao.getAddressOrderdetail(user.getId());
            }
            int c= 0;
            for(String s: list){
            	c++;
            %>
            
              <div class="input-radio">
                <input type="radio" name="payment" id="payment-<%=c%>" />
                <label for="payment-<%=c%>">
                  <span></span>
                  Địa chỉ <%=c %>
                </label>
                <div class="caption">
                  <p><%=s%></p>
                </div>
              </div>
             <% } %>
            </div>
          </div>
          <!-- /Order Details -->
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /SECTION -->


   <jsp:include page="footer.jsp"></jsp:include>
  
   <script src="js/jquery.min.js"></script>
  
   <script>
$(document).ready(function() {
    document.getElementById("payment-1").checked = true;
});
</script>

 <script type="text/javascript">
    const formValidation = document.getElementById("formUpdateUser");
    
    const email = document.getElementById("email");
    const phone = document.getElementById("tel");
    const username = document.getElementById("username");
    
    const errorEmail = document.getElementById("email-error");
    const errorPhone = document.getElementById("phone-error");
    const errorUsername = document.getElementById("username-error");
    
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

    function checkPhone() {
    	let regex = /^$|^[0-9]{10}$/; // rỗng hoặc nhập
        if (!regex.test(phone.value)) {
          errorPhone.style.display = "block";
          return false;
        } else {
          errorPhone.style.display = "none";
          return true;
        }
      }
    
    function checkUsername() {
    	let regex = /^.{2,}$/;
        if (!regex.test(username.value)) {
          errorUsername.style.display = "block";
          return false;
        } else {
          errorUsername.style.display = "none";
          return true;
        }
      }
    
    
    formValidation.addEventListener("submit", function (event) {
  	  
  	event.preventDefault(); // Ngăn chặn gửi form mặc định 
      
    email.addEventListener("input", function () {
      checkEmail();
    });
    phone.addEventListener("input", function () {
        checkPhone();
      });
    
    username.addEventListener("input", function () {
        checkUsername();
      });
    
      let error = false;
      
      if (!checkEmail()) {
        checkEmail();
        email.focus();
        error = true;
      }

      if (!checkPhone()) {
          checkPhone();
          phone.focus();
          error = true;
        }
      
      if (!checkUsername()) {
          checkUsername();
          username.focus();
          error = true;
        }
      
      if (!error) {
          // Nếu không có lỗi, gỡ bỏ ngăn chặn gửi form
          event.target.submit();
        }
    });
    
   
  </script>


    <!-- jQuery Plugins -->
   
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
