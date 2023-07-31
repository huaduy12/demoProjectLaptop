<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Model.Order"%>
<%@page import="Model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="Dao.productDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="Free HTML Templates" name="keywords" />
    <meta content="Free HTML Templates" name="description" />

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon" />

    <!-- Google font -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
      rel="stylesheet"
    />

    <!-- Bootstrap -->

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
    <link type="text/css" rel="stylesheet" href="css/cartstyle.css" />
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
    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
      <div
        class="d-flex flex-column align-items-center justify-content-center"
        style="min-height: 150px"
      >
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Quản lý giỏ hàng</h1>
        <div class="d-inline-flex">
          <p class="m-0"><a href="">Trang chủ</a></p>
          <p class="m-0 px-2">-</p>
          <p class="m-0">Giỏ hàng</p>
        </div>
      </div>
    </div>
    <!-- Page Header End -->
    <!-- Cart Start -->
    <div class="container pt-5">
      <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
          <table class="table table-bordered text-center mb-0">
            <thead class="bg-secondary text-dark">
              <tr>
                <th>Sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
                <th>Gỡ bỏ</th>
              </tr>
               <%   
        		    User user = (User) session.getAttribute("user");
        		    Order order = null;
        		    if(user != null){
        		        order = orderDao.getOrderByUserId(user.getId()); 
        		    }
                    %>
            </thead>
            <tbody class="align-middle">
              <%
              
                    List<Orderdetail> orderdetails = null;
                      if(order != null){
                    	  orderdetails = orderDao.getListOrderdetailOrderBy(order.getId());
                      }
                    if(orderdetails != null){
                     for(Orderdetail orderdetail : orderdetails){
                    	  Product product = productDao.getProductById(orderdetail.getProduct_id());
                    %>
              <tr>
                <td class="align-middle" style="text-align: left;">
                   <div class= row>
                      <div class = "col-md-3">
                        <img src="<%=product.getThumbnail()%>" alt="" style="width: 70px" />
                      </div>
                      <div class = "col-md-9">
                       <%=product.getName()%>
                      </div>
                   </div>
                
                </td>
                <td class="align-middle"><%=new java.text.DecimalFormat("#,###").format(orderdetail.getPrice())%></td>
                <td class="align-middle">
                  <div
                    class="input-group quantity mx-auto"
                    style="width: 100px"
                  >
                  <form action="updateCartServlet" method="post">
                  <input type="hidden" name = "orderdetailId" value="<%=orderdetail.getId()%>">
                   <input type="hidden" name = "orderdetailQuantity" value="<%=orderdetail.getQuantity()%>">
                  <div class="input-group-btn">
                      <button class="btn btn-sm btn-primary btn-minus" type="submit" name = "minus" value = "minus">
                        <i class="fa fa-minus"></i>
                      </button>
                    </div>
                  </form>
                    
                    <input
                      type="text"
                      class="form-control form-control-sm bg-secondary text-center inline-input"
                      value="<%=orderdetail.getQuantity()%>" disabled="disabled"
                    />
                <form action="updateCartServlet" method="post">
                  <input type="hidden" name = "orderdetailId" value="<%=orderdetail.getId()%>">
                    <div class="input-group-btn">
                      <button class="btn btn-sm btn-primary btn-plus" type="submit" name= "plus" value = "plus">
                        <i class="fa fa-plus"></i>
                      </button>
                    </div>
                </form>
                  </div>
                </td>
                <td class="align-middle"><%=new java.text.DecimalFormat("#,###").format(orderdetail.getTotal_money())%></td>
                
              
                
                <td class="align-middle">
                  <form action="updateCartServlet" method="post">
                   <input type="hidden" name = "orderdetailId" value="<%=orderdetail.getId()%>">
                  <button class="btn btn-sm btn-primary" type="submit" name="remove" value = "remove" style="width: 42px">
                    <i class="fa fa-times"></i>
                  </button>
                   </form>
                </td>
            
              </tr>
              <%} 
                    }
              %>
             
            </tbody>
          </table>
        </div>
        <div class="col-lg-4">
          <div class="card border-secondary mb-5">
            <div class="card-header bg-secondary border-0">
              <h4 class="font-weight-semi-bold m-0">Tóm tắt giỏ hàng của bạn</h4>
            </div>
            <div class="card-body">
              <div class="d-flex justify-content-between mb-3 pt-1">
                <h6 class="font-weight-medium">Tổng:</h6>
                
                <% double total = 0.0;
                if(order != null){
                	  total = orderDao.calculateOrderTotal(order.getId()); } %>
              
                <h6 class="font-weight-medium"><%=new java.text.DecimalFormat("#,###").format(total)%></h6>
              </div>
              <div class="d-flex justify-content-between">
                <h6 class="font-weight-medium">Phí vận chuyển:</h6>
                <h6 class="font-weight-medium">0</h6>
              </div>
            </div>
            <div class="card-footer border-secondary bg-transparent">
              <div class="d-flex justify-content-between mt-2">
                <h5 class="font-weight-bold">Tổng tiền: </h5>
                <h5 class="font-weight-bold"><%=new java.text.DecimalFormat("#,###").format(total)%></h5>
              </div>
              
             <c:if test="${failBuy != null}">
                     <p style="color: red;">${failBuy}</p>
             </c:if>
             <form action="checkQuantityBuy" method="post">
              <button
                class="btn btn-block btn-primary my-3 py-3"
                
              >
                Thanh toán
              </button>
             </form>
             
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Cart End -->

    <jsp:include page="footer.jsp"></jsp:include>

    <!-- JavaScript Libraries -->
    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
