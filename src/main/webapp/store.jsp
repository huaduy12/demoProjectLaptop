<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="productDao" class="Dao.productDao" scope="page" />
<jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
    
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    <style type="text/css">
     .btn-filter{
  background: #d10024;
  color: #fff;
  font-weight: 700;
  border: none;
  border-radius: 40px;
     }
     
     .btn-filter:hover{
        color: #fff;
     }
     .btn-filter:focus{
        color: #fff;
     }
    </style>
  </head>
  <body>
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
  
  <div class="modal fade" id="modalSeccess" role="dialog" style="background-color: transparent;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="background-color: green; ">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:white;"><i class="fa fa-check-square-o" aria-hidden="true"></i> Đặt hàng thành công</h4>
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
            <li class="active"><a href="store.jsp">Cửa hàng</a></li>
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
              <li><a href="#">Tất cả</a></li>
              <li class="active">Cửa hàng</li>
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
          <!-- ASIDE -->
          <div id="aside" class="col-md-3">
            <!-- aside Widget -->
            <div class="aside">
              <h3 class="aside-title">Categories</h3>
              <div class="checkbox-filter">
                <div class="input-checkbox">
                  <input type="checkbox" id="category-1" />
                  <label for="category-1">
                    <span></span>
                    Laptops
                    <small>(120)</small>
                  </label>
                </div>

                <div class="input-checkbox">
                  <input type="checkbox" id="category-2" />
                  <label for="category-2">
                    <span></span>
                    Smartphones
                    <small>(740)</small>
                  </label>
                </div>

                <div class="input-checkbox">
                  <input type="checkbox" id="category-3" />
                  <label for="category-3">
                    <span></span>
                    Cameras
                    <small>(1450)</small>
                  </label>
                </div>

                <div class="input-checkbox">
                  <input type="checkbox" id="category-4" />
                  <label for="category-4">
                    <span></span>
                    Accessories
                    <small>(578)</small>
                  </label>
                </div>

                <div class="input-checkbox">
                  <input type="checkbox" id="category-5" />
                  <label for="category-5">
                    <span></span>
                    Laptops
                    <small>(120)</small>
                  </label>
                </div>

                <div class="input-checkbox">
                  <input type="checkbox" id="category-6" />
                  <label for="category-6">
                    <span></span>
                    Smartphones
                    <small>(740)</small>
                  </label>
                </div>
              </div>
            </div>
            <!-- /aside Widget -->

            <!-- aside Widget -->
            <div class="aside">
              <h3 class="aside-title">Price</h3>
              <div class="price-filter">
                <div id="price-slider"></div>
                
                <div class="input-number price-min">
                  <input id="price-min" type="number" />
                  <span class="qty-up">+</span>
                  <span class="qty-down">-</span>
                </div>
                <span>-</span>
                
                <div class="input-number price-max">
                  <input id="price-max" type="number" />
                  <span class="qty-up">+</span>
                  <span class="qty-down">-</span>
                </div>
                 <span>(đơn vị triệu)</span>
              </div>
                <button class="btn btn-filter"> Lọc sản phẩm </button>
            </div>
            <!-- /aside Widget -->

           

            
          </div>
          <!-- /ASIDE -->

          <!-- STORE -->
          <div id="store" class="col-md-9">
            <!-- store top filter -->
            <div class="store-filter clearfix">
              <div class="store-sort">
                <label>
                  Sắp xếp theo giá:
                  <select class="input-select">
                    <option value="0">Tăng dần</option>
                    <option value="1">Giảm dần</option>
                  </select>
                </label>

               
              </div>
              
            </div>
            <!-- /store top filter -->

            <!-- store products -->
            <div class="row">
            
           <% List<Product> products = productDao.getListProducts();
            int count = 0;
               if(!products.isEmpty()){
              	 for(Product product : products) {
              	   count++;
              	 %>
                    <!-- product -->
                  <div class="col-md-4 col-xs-6">  
                    <div class="product">
                      <div class="product-img">
                        <img src="<%=product.getThumbnail()%>" alt="" />
                        <div class="product-label">
                          <span class="new">Mới</span>
                        </div>
                      </div>
                      <div class="product-body">
                        <p class="product-category"><%=productDao.getNameCategory(product.getCategory_id()) %></p>
                        <h3 class="product-name">
                          <a href="inforDatailServlet?id=<%=product.getId()%>"><%=product.getName()%></a>
                        </h3>
                        <h4 class="product-price">
                          <%=new java.text.DecimalFormat("#,###").format(product.getDiscount())%> <del class="product-old-price">
                           <%=new java.text.DecimalFormat("#,###").format(product.getPrice())%></del>
                        </h4>
                       
                        
                        <%   float avg = reviewDao.getAVGReview(product.getId()); %>
                 
                 
                 <%if(avg == 0){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                 
                 <%if(avg > 0 && avg < 2){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg >= 2 && avg <3){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg>=3 && avg <4){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                          <%if(avg >=4 && avg < 5){ %>
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         <%} %>
                         
                         <%if(avg ==5){ %>
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         <%} %>
                        <div class="product-btns">
                        
                         <%User user = (User) session.getAttribute("user");
                          if(user != null){ %>
                           <button class="add-to-wishlist" onclick="addToWishlist(<%=product.getId()%>)">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>
                        <% if(user == null){ %>
                           <button class="add-to-wishlist" onclick="redirectToLogin()">
                            <i class="fa fa-heart-o"></i
                            ><span class="tooltipp">Yêu thích</span>
                          </button>
                          <%} %>  
                          
                          <button class="add-to-compare">
                            <i class="fa fa-exchange"></i
                            >
                          </button>
                          
                          <button class="quick-view">
                          <a href="inforDatailServlet?id=<%=product.getId()%>"><i class="fa fa-eye"></i
                            ><span class="tooltipp">Xem sản phẩm</span></a>
   
                          </button>
                        </div>
                      </div>
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
                        <input type="hidden" value="<%=product.getId()%>" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" >
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      </div>
                      </form>
                      <%} %>
                    </div>
                   </div>
                    <!-- /product -->
                    
                    <%if(count % 2 ==0 && count % 6 != 0){ %>
				<!-- /chia hết cho 2 -->
              <div class="clearfix visible-sm visible-xs"></div>
             <%} %>
              
               <%if(count % 3 ==0){ %>
				<!-- /chia hết cho 3 -->
              <div class="clearfix visible-lg visible-md"></div>
               <%} %>
              

             

               <%if(count % 6 ==0 && count % 2 !=0){ %>
				<!-- /chia hết cho 6 -->
              <div
                class="clearfix visible-lg visible-md visible-sm visible-xs"
              ></div>
              <%} %>
              
             <%}
             }
             %>

            </div>
            <!-- /store products -->

            <!-- store bottom filter -->
            <div class="store-filter clearfix">
              
              <ul class="store-pagination">
                <li class="active">1</li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li>
                  <a href="#"><i class="fa fa-angle-right"></i></a>
                </li>
              </ul>
            </div>
            <!-- /store bottom filter -->
          </div>
          <!-- /STORE -->
        </div>
        <!-- /row -->
      </div>
      <!-- /container -->
    </div>
    <!-- /SECTION -->

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

    <!-- FOOTER -->
    <footer id="footer">
      <!-- top footer -->
      <div class="section">
        <!-- container -->
        <div class="container">
          <!-- row -->
          <div class="row">
            <div class="col-md-3 col-xs-6">
              <div class="footer">
                <h3 class="footer-title">About Us</h3>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
                  do eiusmod tempor incididunt ut.
                </p>
                <ul class="footer-links">
                  <li>
                    <a href="#"
                      ><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a
                    >
                  </li>
                  <li>
                    <a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a>
                  </li>
                  <li>
                    <a href="#"
                      ><i class="fa fa-envelope-o"></i>email@email.com</a
                    >
                  </li>
                </ul>
              </div>
            </div>

            <div class="col-md-3 col-xs-6">
              <div class="footer">
                <h3 class="footer-title">Categories</h3>
                <ul class="footer-links">
                  <li><a href="#">Hot deals</a></li>
                  <li><a href="#">Laptops</a></li>
                  <li><a href="#">Smartphones</a></li>
                  <li><a href="#">Cameras</a></li>
                  <li><a href="#">Accessories</a></li>
                </ul>
              </div>
            </div>

            <div class="clearfix visible-xs"></div>

            <div class="col-md-3 col-xs-6">
              <div class="footer">
                <h3 class="footer-title">Information</h3>
                <ul class="footer-links">
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Contact Us</a></li>
                  <li><a href="#">Privacy Policy</a></li>
                  <li><a href="#">Orders and Returns</a></li>
                  <li><a href="#">Terms & Conditions</a></li>
                </ul>
              </div>
            </div>

            <div class="col-md-3 col-xs-6">
              <div class="footer">
                <h3 class="footer-title">Service</h3>
                <ul class="footer-links">
                  <li><a href="#">My Account</a></li>
                  <li><a href="#">View Cart</a></li>
                  <li><a href="#">Wishlist</a></li>
                  <li><a href="#">Track My Order</a></li>
                  <li><a href="#">Help</a></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- /row -->
        </div>
        <!-- /container -->
      </div>
      <!-- /top footer -->

      <!-- bottom footer -->
      <div id="bottom-footer" class="section">
        <div class="container">
          <!-- row -->
          <div class="row">
            <div class="col-md-12 text-center">
                <img class="img-fluid" src="img/payments.png" alt="">
           
              <span class="copyright">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;
                <script>
                  document.write(new Date().getFullYear());
                </script>
                All rights reserved | This template is made with
                <i class="fa fa-heart-o"></i> by Duy
               
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              </span>
            </div>
            </div>
          </div>
          <!-- /row -->
        </div>
        <!-- /container -->
      </div>
      <!-- /bottom footer -->
    </footer>
    <!-- /FOOTER -->

<script src="js/jquery.min.js"></script>


  <script>
  function redirectToLogin() {
    window.location.href = "login.jsp";
  }
</script>

<script>
$(document).ready(function() {
  // Kiểm tra nếu có thông báo trong session
  <% String cartMessage = (String) session.getAttribute("cartMessage");
     if (cartMessage != null) { %>
    // Hiển thị modal khi tài liệu đã tải xong
    $('#myModal').modal('show');
   <% session.removeAttribute("cartMessage");%>
    setTimeout(function() {
        $('#myModal').modal('hide');
      }, 1000);
    <% session.removeAttribute("cartMessage"); // Xóa thông báo sau khi hiển thị
     } %>
});
</script>
   
 <script>
$(document).ready(function() {
  // Kiểm tra nếu có thông báo trong session
  <% String success = (String) session.getAttribute("seccess");
     if (success != null) { %>
    // Hiển thị modal khi tài liệu đã tải xong
    $('#modalSeccess').modal('show');
    <%session.removeAttribute("seccess"); %>
    setTimeout(function() {
        $('#modalSeccess').modal('hide');
      }, 1000);
    <% session.removeAttribute("seccess"); // Xóa thông báo sau khi hiển thị
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
