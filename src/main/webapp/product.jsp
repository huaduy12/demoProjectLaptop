<%@page import="Model.User"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Model.Product"%>
<%@page import="Model.Review"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Thông tin chi tiết sản phẩm</title>

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

<script src="js/jquery.min.js"></script>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css" />

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

<style type="text/css">
.error-message {
        margin-bottom: 10px;
        display: none;
        color: red;
      }
</style>
    
  </head>
  <body>
  
  <div class="modal fade" id="myModal" role="dialog" style="background-color: transparent;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="background-color: green; ">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:white;"><i class="fa fa-check-square-o" aria-hidden="true"></i> Thêm vào giỏ hàng thành công</h4>
        </div>    
      </div>
      
    </div>
  </div>
    
    
    <jsp:include page="header.jsp"></jsp:include>

 <div class="modal fade" id="modaLikeSuccess" role="dialog" style="background-color: transparent;">
      <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content" style="background-color: green; ">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:white;"><i class="fa fa-check-square-o" aria-hidden="true" style="margin-right: 5px"></i>Sản phẩm đã được thêm vào danh sách yêu thích</h4>
        </div>    
      </div>
      
    </div>
  </div>
   
   
  
     <div class="modal fade" id="modaLikeFail" role="dialog" style="background-color: transparent;">
      <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content" style="background-color:red; ">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:white;"><i class="fa fa-check-square-o" aria-hidden="true" style="margin-right: 5px"></i>Sản phẩm đã tồn tại trong danh sách yêu thích</h4>
        </div>    
      </div>
      
    </div>
  </div>

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
              <li><a href="index.jsp">Trang chủ</a></li>
              <li><a href="store.jsp">Sản phẩm</a></li>
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
    <div class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <!-- Product main img -->
          <div class="col-md-5 col-md-push-2">
            <div id="product-main-img">
              <div class="product-preview">
                <img src="${product.thumbnail}" alt="" />
              </div>

                <!-- 1 ảnh chính 3 ảnh phụ -->
               <c:forEach items="${galery}" var="o">
                  <div class="product-preview">
                <img src="${o.thumbnail}" alt="" />
              </div>
               
               </c:forEach>
              
            </div>
          </div>
          <!-- /Product main img -->

          <!-- Product thumb imgs, ảnh phụ -->
          <div class="col-md-2 col-md-pull-5">
            <div id="product-imgs">
              <div class="product-preview">
              
                <img src="${product.thumbnail}" alt="" />
              </div>
   			<c:forEach items="${galery}" var="o">
                  <div class="product-preview">
                <img src="${o.thumbnail}" alt="" />
              </div>
               
               </c:forEach>
             
            </div>
          </div>
          <!-- /Product thumb imgs -->

          <!-- Product details -->
          <div class="col-md-5">
            <div class="product-details">
              <h2 class="product-name">${product.name}</h2>
              <div>
              <!-- Đánh giá sao chưa làm -->
              
              <%  Product p =(Product) request.getAttribute("product"); 
              float av = reviewDao.getAVGReview(p.getId()); %>
               
                 <%if(av < 2){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av >= 2 && av <3){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av>=3 && av <4){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(av >=4 && av < 5){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                         <%if(av ==5){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                
                <%int ct = reviewDao.getCountReview(p.getId()); %>
                <a class="review-link" href="#review"
                  ><%=ct%> Review(s) | Add your review</a
                >
              </div>
              <div>
                <h3 class="product-price">
                  <fmt:formatNumber value="${product.getDiscount()}" type="currency" /> <del class="product-old-price">
                  <fmt:formatNumber value="${product.getPrice()}" type="currency" /></del>
                </h3>
                <span class="product-available">In Stock</span>
              </div>
              <p>
                ${product.short_description}
              </p>

				<!-- màu với size là tạm thòi chưa xử lý -->
              <div class="product-options">
                <label>
                  Size
                  <select class="input-select">
                    <option value="0">X</option>
                  </select>
                </label>
                <label>
                  Color
                  <select class="input-select">
                    <option value="0">Red</option>
                  </select>
                </label>
              </div>

               
                <%
                User user = (User) session.getAttribute("user");
                          if(user != null){ %>
                            <button class="btn" onclick="addToWishlist(${product.getId()})">
                            <i class="fa fa-heart-o" style="margin-right: 5px"></i
                            ><span >Yêu thích</span>
                          </button>
                          <%} %>
                        <% if(user == null){ %>
                           <button class="btn" onclick="redirectToLogin()">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>  
               
                    
              
 

              <ul class="product-links" style="margin-bottom: 30px;">
                <li>Category:</li>
                <li><a href="#">Hãng sản xuất: ${category}</a></li>
              </ul>
              <div class="add-to-cart" style="display: flex;">
              
             <% if(user != null){ %>
              <form action="buynowServlet" method="get">
               <input type="hidden" value="${product.getId()}" name = 'idproductcheckout'>
               <button class="add-to-cart-btn">
                  <i class="fa fa-shopping-cart"></i> Mua ngay
                </button>
              </form>
              <%} %>
              
              <% if(user == null){ %>
             
              
               <button class="add-to-cart-btn" onclick="redirectToLogin()">
                  <i class="fa fa-shopping-cart"></i> Mua ngay
                </button>
          
              <%} %>
                
                 <%
                       if(user == null){ %>
                    	       <div class="add-to-cart">
                       
                        <button class="add-to-cart-btn" onclick="redirectToLogin()" >
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      <% }
                      %>
                      
                      <%if(user != null){ %>
                      <form action="addOrderServlet" method="post">
                      <div class="add-to-cart">
                        <input type="hidden" value="${product.getId()}" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" >
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      </form>
                      <%} %>
                
              </div>

              

              <ul class="product-links">
                <li>Chia sẻ:</li>
                <li>
                  <a href="#"><i class="fa fa-facebook"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-twitter"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-google-plus"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-envelope"></i></a>
                </li>
              </ul>
            </div>
          </div>
          <!-- /Product details -->

          <!-- Product tab -->
          <div class="col-md-12" id = "review">
            <div id="product-tab">
              <!-- product tab nav -->
              <ul class="tab-nav">
                <li class="active">
                  <a data-toggle="tab" href="#tab1">Thông tin chi tiết</a>
                </li>
               
               <% Product product =(Product) request.getAttribute("product");
                 int count = reviewDao.getCountReview(product.getId());
               %>
                <li><a data-toggle="tab" href="#tab3" >Đánh giá (<%=count%>)</a></li>
              </ul>
              <!-- /product tab nav -->

              <!-- product tab content -->
              <div class="tab-content">
                <!-- tab1  -->
                <div id="tab1" class="tab-pane fade in active">
                  <div class="row">
                    <div class="col-md-12">
                      <p>
                      ${product.description}
                      </p>
                    </div>
                  </div>
                </div>
                <!-- /tab1  -->

              

                <!-- tab3  -->
                <div id="tab3" class="tab-pane fade in">
                  <div class="row">
                    <!-- Rating -->
                    <div class="col-md-3">
                      <div id="rating">
                        <div class="rating-avg">
                        <%
                        float avg = reviewDao.getAVGReview(product.getId());
                        String formattedNumber = String.format("%.1f", avg);
                        
                          
                          
                        %>
                          <span><%=formattedNumber%></span>
                         <%if(avg < 2){ %>
                          <div class="rating-stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg >= 2 && avg <3){ %>
                          <div class="rating-stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg>=3 && avg <4){ %>
                          <div class="rating-stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg >=4 && avg < 5){ %>
                          <div class="rating-stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                         <%if(avg ==5){ %>
                          <div class="rating-stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                        </div>
                        
                        
                        <ul class="rating">
                          <li>
                          <%
                          float number5 =(float) reviewDao.getCountReviewRating(product.getId(),5)/reviewDao.getCountReview(product.getId());
                          NumberFormat percentFormat5 = NumberFormat.getPercentInstance();
                          percentFormat5.setMaximumFractionDigits(1); // Giữ 1 số thập phân

                          // Định dạng số thành dạng phần trăm với 1 số thập phân
                          String formattedPercentage5 = percentFormat5.format(number5);
                          %>
                            <div class="rating-stars">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                            </div>
                            <div class="rating-progress">
                              <div style="width: <%=formattedPercentage5%>"></div>
                            </div>
                            <%int c5 = reviewDao.getCountReviewRating(product.getId(),5); %>
                            <span class="sum"><%=c5%></span>
                          </li>
                          
                       <li>
                          <%
                          float number4 = (float)reviewDao.getCountReviewRating(product.getId(),4)/reviewDao.getCountReview(product.getId());
                          NumberFormat percentFormat4 = NumberFormat.getPercentInstance();
                          percentFormat4.setMaximumFractionDigits(1); // Giữ 1 số thập phân

                          // Định dạng số thành dạng phần trăm với 1 số thập phân
                          String formattedPercentage4 = percentFormat4.format(number5);
                          %>
                            <div class="rating-stars">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star-o"></i>
                            </div>
                            <div class="rating-progress">
                              <div style="width: <%=formattedPercentage4%>"></div>
                            </div>
                            <%int c4 = reviewDao.getCountReviewRating(product.getId(),4); %>
                            <span class="sum"><%=c4%></span>
                          </li>
                          
                          <li>
                          <%
                          float number3 =(float) reviewDao.getCountReviewRating(product.getId(),3)/reviewDao.getCountReview(product.getId());
                          NumberFormat percentFormat3 = NumberFormat.getPercentInstance();
                          percentFormat3.setMaximumFractionDigits(1); // Giữ 1 số thập phân

                          // Định dạng số thành dạng phần trăm với 1 số thập phân
                          String formattedPercentage3 = percentFormat3.format(number3);
                          %>
                            <div class="rating-stars">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                            </div>
                            <div class="rating-progress">
                              <div style="width: <%=formattedPercentage3%>"></div>
                            </div>
                            <%int c3 = reviewDao.getCountReviewRating(product.getId(),3); %>
                            <span class="sum"><%=c3%></span>
                          </li>
                          <li>
                          <%
                          float number2 =(float) reviewDao.getCountReviewRating(product.getId(),2)/reviewDao.getCountReview(product.getId());
                          NumberFormat percentFormat2 = NumberFormat.getPercentInstance();
                          percentFormat2.setMaximumFractionDigits(1); // Giữ 1 số thập phân

                          // Định dạng số thành dạng phần trăm với 1 số thập phân
                          String formattedPercentage2 = percentFormat2.format(number2);
                          %>
                            <div class="rating-stars">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                            </div>
                            <div class="rating-progress">
                              <div style="width: <%=formattedPercentage2%>"></div>
                            </div>
                            <%int c2 = reviewDao.getCountReviewRating(product.getId(),2); %>
                            <span class="sum"><%=c2%></span>
                          </li>
                          
                          <li>
                          <%
                          float number1 =(float)reviewDao.getCountReviewRating(product.getId(),1)/reviewDao.getCountReview(product.getId());
                          NumberFormat percentFormat1 = NumberFormat.getPercentInstance();
                          percentFormat1.setMaximumFractionDigits(1); // Giữ 1 số thập phân

                          // Định dạng số thành dạng phần trăm với 1 số thập phân
                          String formattedPercentage1 = percentFormat1.format(number1);
                          %>
                            <div class="rating-stars">
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                              <i class="fa fa-star-o"></i>
                            </div>
                            <div class="rating-progress">
                              <div style="width: <%=formattedPercentage1%>"></div>
                            </div>
                            <%int c1 = reviewDao.getCountReviewRating(product.getId(),1); %>
                            <span class="sum"><%=c1%></span>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <!-- /Rating -->


                    <!-- Reviews -->
                    <div class="col-md-6">
                      <div id="reviews">
                        <ul class="reviews">
                        
                       <% 
 					
  					 List<Review> reviews = reviewDao.getListReviews(product.getId());
  					 for(Review review : reviews){
  						 
						%>

                          <li>
                            <div class="review-heading">
                              <h5 class="name"><%=review.getName()%></h5>
                              <p class="date"><%=review.getCreate_at()%></p>
                              <div class="review-rating">
                              <%for(int i = 1;i<= review.getRating();i++){ %>
                                <i class="fa fa-star"></i>
                                <%} %>
                               <%if(review.getRating() == 4){ %> 
                                    <i class="fa fa-star-o empty"></i>
                               <%} %>
                               
                               <%if(review.getRating() == 3){ %> 
                                    <i class="fa fa-star-o empty"></i>
                                    <i class="fa fa-star-o empty"></i>
                               <%} %>
                               
                               <%if(review.getRating() == 2){ %> 
                                    <i class="fa fa-star-o empty"></i>
                                     <i class="fa fa-star-o empty"></i>
                                      <i class="fa fa-star-o empty"></i>
                               <%} %>
                               
                               <%if(review.getRating() == 1){ %> 
                                <i class="fa fa-star-o empty"></i>
                                 <i class="fa fa-star-o empty"></i>
                                  <i class="fa fa-star-o empty"></i>
                                    <i class="fa fa-star-o empty"></i>
                               <%} %>
                              </div>
                            </div>
                            <div class="review-body">
                              <p>
                                <%=review.getContent()%>
                              </p>
                            </div>
                          </li>
                       <%} %>
                        </ul>
                        
                        
                        <ul class="reviews-pagination">
                          <li class="active">1</li>
                          <li><a href="#">2</a></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
                          <li>
                            <a href="#"><i class="fa fa-angle-right"></i></a>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <!-- /Reviews -->


                    <!-- Review Form -->
                    <div class="col-md-3">
                      <div id="review-form">
                        <form class="review-form" action="reviewServlet" method="post" id = "review_form">
                         <input type="hidden" value="${product.getId()}" name = 'idproductreview'>
                          <input
                            class="input"
                            type="text"
                            name = "namereview"
                             id="username"
                            placeholder="Tên của bạn"
                          />
                          <span id="username-error" class="error-message"
                      >Vui lòng nhập tên đăng nhập hợp lệ
                    </span>
                          <input
                            class="input"
                            type="email"
                            name = "emailreview"
                            id="email"
                            placeholder="Email"
                          />
                           <span id="email-error" class="error-message"
                  >Vui lòng nhập email hợp lệ
                </span>
                          <textarea
                            class="input"
                            placeholder="Nội dung đánh giá"
                            name = "contentreview"
                            id = "content"
                          ></textarea>
                           <span id="content-error" class="error-message"
                  >Vui lòng nhập nội dung hợp lệ(lớn hơn 8 ký tự)
                </span>
                          <div class="input-rating">
                            <span>Đánh giá: </span>
                            <div class="stars">
                              <input
                                id="star5"
                                name="rating"
                                value="5"
                                type="radio"
                              /><label for="star5"></label>
                              <input
                                id="star4"
                                name="rating"
                                value="4"
                                type="radio"
                              /><label for="star4"></label>
                              <input
                                id="star3"
                                name="rating"
                                value="3"
                                type="radio"
                              /><label for="star3"></label>
                              <input
                                id="star2"
                                name="rating"
                                value="2"
                                type="radio"
                              /><label for="star2"></label>
                              <input
                                id="star1"
                                name="rating"
                                value="1"
                                type="radio"
                                 checked="checked"
                              /><label for="star1"></label>
                            </div>
                          </div>
                          <button type="submit" class="primary-btn">Gửi đánh giá</button>
                        </form>
                      </div>
                    </div>
                    <!-- /Review Form -->
                  </div>
                </div>
                <!-- /tab3  -->
              </div>
              <!-- /product tab content  -->
            </div>
          </div>
          <!-- /product tab -->
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /SECTION -->

    <!-- Section -->
    <div class="section" id = "relate">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <div class="section-title text-center">
              <h3 class="title">Những sản phẩm liên quan</h3>
            </div>
          </div>

        
   <c:forEach items="${productRelate}" var="o">
   			 <!-- product -->
          <div class="col-md-3 col-xs-6">
            <div class="product">
              <div class="product-img">
                <img src="${o.thumbnail}" alt="" />
                <div class="product-label">
                  <span class="new">NEW</span>
                </div>
              </div>
              <div class="product-body">
                <p class="product-category">${category}</p>
                <h3 class="product-name">
                  <a href="inforDatailServlet?id=${o.getId()}">${o.name}</a>
                </h3>
                <h4 class="product-price">
                  <fmt:formatNumber value="${o.getDiscount()}" type="currency" /> <del class="product-old-price">
                    <fmt:formatNumber value="${o.getPrice()}" type="currency" /></del>
                </h4>
                <div class="product-rating">
                  <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i>
                </div>
                <div class="product-btns">
                
                  <button class="add-to-wishlist" onclick="addToWishlist(${o.getId()})">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                      
                  <button class="add-to-compare">
                    <i class="fa fa-exchange"></i
                    ><span class="tooltipp"></span>
                  </button>
                  
                  <button class="quick-view">
                          <a href="inforDatailServlet?id=${o.getId()}"><i class="fa fa-eye"></i
                            ><span class="tooltipp">Xem sản phẩm</span></a>
   
                          </button>
                </div>
              </div>
              
               <form action="addOrderServlet" method="post">
                      <div class="add-to-cart">
                        <input type="hidden" value="${o.getId()}" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" >
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      </form>
            </div>
          </div>
          <!-- /product -->
   
   
   </c:forEach>
         
          

         

        
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /Section -->

    <!-- NEWSLETTER -->
    <div id="newsletter" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <div class="newsletter">
              <p>Sign Up for the <strong>NEWSLETTER</strong></p>
              <form>
                <input
                  class="input"
                  type="email"
                  placeholder="Enter Your Email"
                />
                <button class="newsletter-btn">
                  <i class="fa fa-envelope"></i> Subscribe
                </button>
              </form>
              <ul class="newsletter-follow">
                <li>
                  <a href="#"><i class="fa fa-facebook"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-twitter"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-instagram"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-pinterest"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /NEWSLETTER -->

   <jsp:include page="footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>

  <script type="text/javascript">
  $(document).ready(function() {
	  // Xử lý sự kiện khi bấm vào liên kết với href="#review-form"
	  $('a[href^="#"]').on('click', function(event) {
	    var target = $(this.getAttribute('href'));
	    if (target.length) {
	      event.preventDefault();
	      $('html, body').stop().animate({
	        scrollTop: target.offset().top
	      }, 1000);
	    }
	  });
	});

  
  </script>


   <script>
  function redirectToLogin() {
    window.location.href = "login.jsp";
  }
</script>

 <script>
      const formValidation = document.getElementById("review_form");
      const username = document.getElementById("username");
      const email = document.getElementById("email");
      const content = document.getElementById("content");
    
      
      const errorUsername = document.getElementById("username-error");
      const errorEmail = document.getElementById("email-error");
      const errorContent = document.getElementById("content-error");
    

      function getValue(id) {
        return document.getElementById(id).value.trim();
      }

      function checkName() {
        let regex = /^[a-zA-Z0-9]{1,}$/;
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

      function checkContent() {
          let regex = /^[a-zA-Z0-9]{8,}$/;
          if (!regex.test(content.value)) {
            content.focus();
            errorContent.style.display = "block";
            return false;
          } else {
        	  errorContent.style.display = "none";
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
      content.addEventListener("input", function () {
          checkContent();
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

        if (!checkContent) {
          checkContent;
          content.focus();
          error = true;
        }

      
        if (!error) {
            // Nếu không có lỗi, gỡ bỏ ngăn chặn gửi form
            event.target.submit();
          }
      });
      
     
    </script>




<!-- Thêm mã JavaScript sau thẻ </body> -->
<script>
$(document).ready(function() {
  // Kiểm tra nếu có thông báo trong session
  <% String cartMessage = (String) session.getAttribute("cartMessage");
     if (cartMessage != null) { %>
    // Hiển thị modal khi tài liệu đã tải xong
    $('#myModal').modal('show');
    setTimeout(function() {
        $('#myModal').modal('hide');
      }, 1000);
    <% session.removeAttribute("cartMessage"); // Xóa thông báo sau khi hiển thị
     } %>
});
</script>

<script>
  // Hàm cập nhật số lượng sản phẩm yêu thích trên trang
  function updateWishlistCount(count) {
    var wishlistCountElement = document.getElementById("wishlistCount");
    if (wishlistCountElement) {
      wishlistCountElement.innerText = count;
    }
  }
</script>


<script>
  function addToWishlist(productId) {
    var xhr = new XMLHttpRequest();
    var url = "wishlistServlet"; // Đặt URL của servlet của bạn ở đây
    var params = "idproduct=" + encodeURIComponent(productId);
    
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        // Xử lý kết quả từ servlet (nếu cần)
        if (xhr.responseText === "success") {
        	 $('#modaLikeSuccess').modal('show');
        	  setTimeout(function() {
        	        $('#modaLikeSuccess').modal('hide');
        	      }, 1000);
        	// Cập nhật số lượng sản phẩm yêu thích trên trang
              updateWishlistCount(xhr.getResponseHeader("X-Wishlist-Count"));
        } else {
        	 $('#modaLikeFail').modal('show');
       	  setTimeout(function() {
       	        $('#modaLikeFail').modal('hide');
       	      }, 1000);
        }
      }
    };
    
    xhr.send(params);
  }
</script>


    <!-- jQuery Plugins -->
    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
