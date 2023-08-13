<%@page import="Model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="productDao" class="Dao.productDao" scope="page" />
<jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  margin-top: 15px;
     }
     
     .btn-filter:hover{
        color: #fff;
     }
     .btn-filter:focus{
        color: #fff;
     }
     
     .numberpage:focus{
         color:#fff;
     }
     li.active .numberpage{
         color:#fff;
     }
    </style>
    
  <c:set value="${tag}" var="a"></c:set>
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
              <li><a href="#">Tất cả</a></li>
              <li class="active">Danh sách yêu thích</li>
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
         

          <!-- STORE -->
    <div id="store" class="col-md-12">
           
            <!-- store products -->
     <c:if test="${products != null}">
       <div class="row">

        
               <c:set var="count" value="0"></c:set>
              <c:forEach items="${products}" var="o">
                    <c:set var = "count" value="${count+1}"></c:set>
                     <!-- product -->
                  <div class="col-md-3 col-xs-6">  
                    <div class="product">
                      <div class="product-img">
                        <img src="${o.getThumbnail()}" alt="" />
                        <div class="product-label">
                          <span class="new">Mới</span>
                        </div>
                      </div>
                      <div class="product-body">
                        <p class="product-category"><c:out value="${productDao.getNameCategory(o.getCategory_id())}" /></p>
                        <h3 class="product-name">
                         <c:if test="${o.quantity > 0 && o.status == 0}">
                              <a href="inforDatailServlet?id=${o.getId()}">${o.getName()}</a>
                         </c:if>
                         <c:if test="${o.quantity <= 0 && o.status == 1}">
                              <a>${o.getName()}.  <span style="color: red;">
												Tạm hết hàng</span></a>
                         </c:if>
                          
                        </h3>
                        <h4 class="product-price">
                          <fmt:formatNumber value="${o.getDiscount()}" type="currency" /> <del class="product-old-price">
                           <fmt:formatNumber value="${o.getPrice()}" type="currency" /></del>
                        </h4>
                       
                        
                  <c:set var="avg" value="${reviewDao.getAVGReview(o.getId())}" />
                 
                 
                 <c:choose>
				 	 <c:when test="${avg == 0}">
				  	  	<div class="product-rating">
				   	  		 <i class="fa fa-star"></i>
				     		 <i class="fa fa-star"></i>
				    		  <i class="fa fa-star"></i>
				     		 <i class="fa fa-star"></i>
				      		<i class="fa fa-star"></i>
				    	</div>
  					</c:when>
 
				
                  <c:when test="${avg > 0 && avg < 2}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                   </c:when>
                         
                   <c:when test="${avg >=2 && avg < 3}">
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                   </c:when>
                         
                     <c:when test="${avg >=3 && avg < 4}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                        </c:when>
                         
                        <c:when test="${avg >=4 && avg < 5}">
                           <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </div>
                         </c:when>
                         
                         <c:when test="${avg == 5}">
                          <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                          </div>
                         </c:when>
                         
                         
                     </c:choose>  
                      </div>
                    
                     <div class="add-to-cart">
                     
                        <form action="removeProductWish" method="post">
										<input type="hidden" value="${o.getId()}"
											name='idproductremove'>
										<button class="add-to-cart-btn" style="margin-bottom: 5px;">
											<i class="fa fa-heart-o"></i> Bỏ yêu thích
										</button>
					  </form>
					  
					<c:if test="${o.quantity > 0 && o.status == 0}">
                         <form action="addOrderServlet" method="post">
                       
                        <input type="hidden" value="${o.getId()}" name = 'idproductcart'>
                        <button class="add-to-cart-btn" type="submit" >
                         <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                        </button>
                      
                       </form>
                   </c:if>
                   
                   	<c:if test="${o.quantity <= 0 || o.status == 1}">
                   	         <button class="add-to-cart-btn" >
                         <i class="fa fa-shopping-cart"></i> Tạm hết hàng
                        </button>
                   	
                   	</c:if>
                        
                      </div>
                    </div>
                   </div>
                    <!-- /product -->
     
              
      </c:forEach>
              
              
   </div>
   <!-- Hết row -->
       <!-- /store products -->

            <!-- store bottom filter -->
            <div class="store-filter clearfix">
              
              <ul class="store-pagination">
              
              
                 
                  <c:if test="${numberPage >= 2 && numberPage <=6}">
                  
                     <c:forEach begin="${1}" end="${numberPage}" var="i">
                           <li class ="${(requestScope.page) == i ? 'active':''}" ><a class = "numberpage" href="loadwishlist?page=${i}">${i}</a></li>
                     </c:forEach>
                  </c:if>
              
                <c:if test="${numberPage > 6}">
					    <c:set value="1" var="startPage">
						</c:set>
						<c:set value="6" var="endPage">
						</c:set>
		
						<c:if test="${page >=5}">
							<c:set value="${page-2}" var="startPage">
							</c:set>
							<c:set value="${page+2}" var="endPage">
							</c:set>
						</c:if>
		
						<c:if test="${numberPage == page}">
							<c:set value="${numberPage}" var="endPage">
							</c:set>
						</c:if>
						<c:if test="${page == numberPage-1}">
							<c:set value="${numberPage}" var="endPage">
							</c:set>
						</c:if>
						
						
					
				
				<!-- Previous -->
				<c:if test="${page !=1}">
					
					 <li >
                         <a class = "numberpage" href="loadwishlist?page=${page-1}"><i class="fa fa-angle-left"></i></a>
                       </li>
				</c:if>
				
				
				<c:if test="${page >= 5}">
					<li class="page-item ${(requestScope.page) == 1 ? 'active':''}">
					<a class="page-link" href="loadwishlist?page=${1}">${1}</a>
					</li>
					<li class="page-item"><a class="page-link">...</a></li>
				</c:if>
				
				<c:forEach begin="${startPage}" end="${endPage}" var="i">

					 <li class ="${(requestScope.page) == i ? 'active':''}" ><a class = "numberpage"  href="loadwishlist?page=${i}">${i}</a></li>
				</c:forEach>
				
				<c:if test="${page != numberPage}">
					  <li >
                         <a href="loadwishlist?page=${page+1}"><i class="fa fa-angle-right"></i></a>
                       </li>
				</c:if>
				
				
				</c:if>          
              </ul>
            </div>
            <!-- /store bottom filter -->
            
        </c:if>
        <!-- kết thúc phân trang ở store.jsp -->
   
            
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




   
   
    <jsp:include page="footer.jsp"></jsp:include>

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
