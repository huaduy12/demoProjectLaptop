<%@page import="Model.Category"%>
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="Dao.productDao" scope="page" />
<jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!DOCTYPE html>
	<html lang="en">
	
	<head>
	  <title>Trả lời | Quản trị Admin</title>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Main CSS-->
	  <link rel="stylesheet" type="text/css" href="css/main.css">
	  <!-- Font-icon css-->
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
	  <!-- or -->
	  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	  <link rel="stylesheet" type="text/css"
	    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	  <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
	  <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
	 
	
	</head>
	
	<body class="app sidebar-mini rtl">
	  <style>
	    .Choicefile {
	      display: block;
	      background: #14142B;
	      border: 1px solid #fff;
	      color: #fff;
	      width: 150px;
	      text-align: center;
	      text-decoration: none;
	      cursor: pointer;
	      padding: 5px 0px;
	      border-radius: 5px;
	      font-weight: 500;
	      align-items: center;
	      justify-content: center;
	    }
	
	    .Choicefile:hover {
	      text-decoration: none;
	      color: white;
	    }
	
	    #uploadfile,
	    .removeimg {
	      display: none;
	    }
	
	    #thumbbox {
	      position: relative;
	      width: 100%;
	      margin-bottom: 20px;
	    }
	
	    .removeimg {
	      height: 25px;
	      position: absolute;
	      background-repeat: no-repeat;
	      top: 5px;
	      left: 5px;
	      background-size: 25px;
	      width: 25px;
	      /* border: 3px solid red; */
	      border-radius: 50%;
	
	    }
	
	    .removeimg::before {
	      -webkit-box-sizing: border-box;
	      box-sizing: border-box;
	      content: '';
	      border: 1px solid red;
	      background: red;
	      text-align: center;
	      display: block;
	      margin-top: 11px;
	      transform: rotate(45deg);
	    }
	
	    .removeimg::after {
	      /* color: #FFF; */
	      /* background-color: #DC403B; */
	      content: '';
	      background: red;
	      border: 1px solid red;
	      text-align: center;
	      display: block;
	      transform: rotate(-45deg);
	      margin-top: -2px;
	    }
	  </style>
	  <!-- Navbar-->
	  <header class="app-header">
	    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
	      aria-label="Hide Sidebar"></a>
	    <!-- Navbar Right Menu-->
	    <ul class="app-nav">
	
	
	      <!-- User Menu-->
	      <li><a class="app-nav__item" href="logoutAdmin"><i class='bx bx-log-out bx-rotate-180'></i> </a>
	
	      </li>
	    </ul>
	  </header>
	  <!-- Sidebar menu-->
	  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	  <aside class="app-sidebar">
	    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="img/anhdaidien.jpg" width="50px"
	        alt="User Image">
	      <div>
	         <% User user = (User) session.getAttribute("userAdmin");
          if(user != null){
         %>
        <p class="app-sidebar__user-name"><b><%=user.getUsername()%></b></p>
        <%} %>
        <% if(user == null){ 
          response.sendRedirect("login.jsp");
        }
        %>
	        <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
	      </div>
	    </div>
	    <hr>
	      <ul class="app-menu">
      
      <li><a class="app-menu__item " href="indexAdmin.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Bảng điều khiển</span></a></li>
      <li><a class="app-menu__item " href="ManageEmployee"><i class='app-menu__icon bx bx-id-card'></i>
          <span class="app-menu__label">Quản lý người dùng</span></a></li>
          
      <li><a class="app-menu__item" href="ManageProduct"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
      </li>
      <li><a class="app-menu__item" href="ManageOrder.jsp"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quản lý đơn hàng</span></a></li>
      <li><a class="app-menu__item active" href="ManageContact.jsp"><i class='app-menu__icon bx bx-phone'></i><span
            class="app-menu__label">Quản lý liên hệ</span></a></li>
       
      <li><a class="app-menu__item" href="RevenueReport.jsp"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
      </li>
     
      
    </ul>
	  </aside>
	  <main class="app-content">
	    <div class="app-title">
	      <ul class="app-breadcrumb breadcrumb">
	        <li class="breadcrumb-item">Trả lời</li>
	      
	      </ul>
	    </div>
	    <div class="row">
	      <div class="col-md-12">
	        <div class="tile">
	          
	          <h3 class="tile-title">Phản hồi ý kiến</h3>
	      
	            
	          <div class="tile-body">
	            <div class="row element-button">

	            </div>
	           
	         
	         
	            <form class="row" action="responFeedback" method="post">
	              
	              <input class="form-control" type="hidden" id="id"
	                name="idfeedback" value="${feedback.id}">
	              
	              <div class="form-group col-md-4">
	                <label class="control-label">Tên tài khoản</label>
	                <input class="form-control" type="text" id="username"
	                name="username" value="${username}">
	              </div>
	              
	                <div class="form-group col-md-4">
	                <label class="control-label">Email</label>
	                <input class="form-control" type="text" id="email"
	                name="email" value="${feedback.email}" >
	              </div>
	              
	              <div class="form-group col-md-8">
	                <label class="control-label">Tiêu đề  </label>
	                <input class="form-control" type="text" placeholder="" name="subject"value="${feedback.subject}" disabled="disabled">
	              </div>

	             
	              <div class="form-group col-md-12">
	                <label class="control-label">Tin nhắn</label>
	                <textarea class="form-control" name="message" disabled="disabled"> ${feedback.message}</textarea>
	               
	              </div>
	              
	               <div class="form-group col-md-12">
	                <label class="control-label">Tin nhắn trả lời</label>
	                <textarea class="form-control" name="respon"></textarea>
	               
	              </div>
	
	       <div class = "row">
	           <button class="btn btn-save" type="submit" style="margin-left: 30px;">Trả lời</button>
	          
	        </form>
	        <button class="btn btn-cancel" type = "button" onclick="window.location.href='ManageContact.jsp'">Hủy bỏ</button>
	        
	        </div>
	   
	
	  </main>
	
	
	
	
	
	 
	
	
	
	
	
	
	  <script src="js/jquery-3.2.1.min.js"></script>
	  <script src="js/popper.min.js"></script>
	  <script src="js/bootstrap.min.js"></script>
	  <script src="js/main.js"></script>
	  <script src="js/plugins/pace.min.js"></script>
	 
	</body>
	
	</html>