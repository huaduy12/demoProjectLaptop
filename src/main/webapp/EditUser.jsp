<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Thêm nhân viên | Quản trị Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <script>

    function readURL(input, thumbimage) {
      if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
        var reader = new FileReader();
        reader.onload = function (e) {
          $("#thumbimage").attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
      else { // Sử dụng cho IE
        $("#thumbimage").attr('src', input.value);

      }
      $("#thumbimage").show();
      $('.filename').text($("#uploadfile").val());
      $('.Choicefile').css('background', '#14142B');
      $('.Choicefile').css('cursor', 'default');
      $(".removeimg").show();
      $(".Choicefile").unbind('click');

    }
    $(document).ready(function () {
      $(".Choicefile").bind('click', function () {
        $("#uploadfile").click();

      });
      $(".removeimg").click(function () {
        $("#thumbimage").attr('src', '').hide();
        $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
        $(".removeimg").hide();
        $(".Choicefile").bind('click', function () {
          $("#uploadfile").click();
        });
        $('.Choicefile').css('background', '#14142B');
        $('.Choicefile').css('cursor', 'pointer');
        $(".filename").text("");
      });
    })
  </script>
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
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px"
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
      <li><a class="app-menu__item active" href="ManageEmployee"><i class='app-menu__icon bx bx-id-card'></i>
          <span class="app-menu__label">Quản lý người dùng</span></a></li>
          
      <li><a class="app-menu__item" href="ManageProduct"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
      </li>
      <li><a class="app-menu__item" href="ManageOrder.jsp"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quản lý đơn hàng</span></a></li>
      
          <li><a class="app-menu__item" href="ManageContact.jsp"><i class='app-menu__icon bx bx-phone'></i><span
            class="app-menu__label">Quản lý liên hệ</span></a></li>
      <li><a class="app-menu__item" href="RevenueReport.jsp"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
      </li>
     
      
    </ul>
  </aside>
  <main class="app-content">
    <div class="app-title">
      <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item">Danh sách người dùng</li>
        <c:if test="${user == null}">
         <li class="breadcrumb-item"><a href="#">Thêm người dùng</a></li>
        </c:if>
       
        <c:if test="${user != null}">
         <li class="breadcrumb-item"><a href="#">Sửa người dùng</a></li>
        </c:if>
      </ul>
    </div>
    <div class="row">
      <div class="col-md-12">

        <div class="tile">
		<c:if test="${user == null}">
          <h3 class="tile-title">Tạo mới người dùng</h3>
        </c:if>  
        
        <c:if test="${user != null}">
          <h3 class="tile-title">Sửa người dùng</h3>
        </c:if>  
        
          <div class="tile-body">
            <div class="row element-button">
             
            </div>
            <c:if test="${user != null}">
             
              <c:if test="${errorEmail != null}">
                  <p style="color:red;">${errorEmail} </p>
              </c:if>
              
               <c:if test="${errorPhone != null}">
                  <p style="color:red;">${errorPhone} </p>
              </c:if>
           
               
              <form class="row" action="EditUser" method="post">
               <input type="hidden" name ="iduser" value="${user.id}">
               <input type="hidden" name ="Oemail" value="${user.email}">
               <input type="hidden" name ="Ophone" value="${user.phonenumber}">
               
               
              <div class="form-group col-md-4">
                <label class="control-label">Tên tài khoản</label>
                <input class="form-control" type="text" id="usernameEdit" name ="username" value="${user.username}"required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Họ và tên</label>
                <input class="form-control" type="text" id="fullnameEdit" name ="fullname" value="${user.fullname}"required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Email</label>
                <input class="form-control" type="text" id="emailEdit" name ="email" value="${user.email}"required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Điện thoại</label>
                <input class="form-control" type="text" id="phonenumberEdit" name ="phonenumber" value="${user.phonenumber}" pattern="[0-9]{10}" required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Địa chỉ</label>
                <input class="form-control" type="text"  id="addressEdit" name ="address" value="${user.address}"required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Mật khẩu</label>
                <input class="form-control" type="text"  id="passwordEdit" name ="password" value="${user.password}"required>
              </div>
              
            
             </div>
          <button class="btn btn-save" type="submit">Lưu lại</button>
         </form>
         <button  class="btn btn-cancel" type="button" onclick="window.location.href = 'ManageEmployee'">Hủy bỏ</button>
         </c:if>
          
 
          <div class="tile-body">
            <div class="row element-button">
             
            </div>
            <c:if test="${user == null}">
              <c:if test="${failEmail != null}">
                  <p style="color:red;">${failEmail} </p>
              </c:if>
              
               <c:if test="${failPhone != null}">
                  <p style="color:red;">${failPhone} </p>
              </c:if>
              
              <form class="row" action="AddUser" method="post">
               
              <div class="form-group col-md-4">
                <label class="control-label">Tên tài khoản</label>
                <input class="form-control" type="text" id="username" name ="username" value=""required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Họ và tên</label>
                <input class="form-control" type="text" id="fullname" name ="fullname" value=""required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Email</label>
                <input class="form-control" type="email" id="email" name ="email" value=""required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Điện thoại</label>
                <input class="form-control" type="text" id="phonenumber" name ="phonenumber" value="" pattern="[0-9]{10}" required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Địa chỉ</label>
                <input class="form-control" type="text"  id="address" name ="address" value=""required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Mật khẩu</label>
                <input class="form-control" type="password"  id="password" name ="password" value="" pattern="[A-Za-z\d!@#$%^&*()_+~\|}{[]\:;'<>,.?/]{3,}" required>
              </div>
              
               <div class="form-group col-md-4">
                <label class="control-label" for="exampleFormControlSelect1">Vị trí</label>
   					 <select class="form-control" id="exampleFormControlSelect1" name = "role">
      						 <option value="2" >Khách hàng</option>
    				 		 <option value="1">Quản trị viên</option>
     
  			 		 </select>
              </div>
              
            
             </div>
          <button class="btn btn-save" type="submit">Lưu lại</button>
         </form>
         <button  class="btn btn-cancel" type="button" onclick="window.location.href = 'ManageEmployee'">Hủy bỏ</button>
         </c:if>
          
        </div>

	

          

  </main>


  <!--
  MODAL
-->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body">
          <div class="row">
            <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Tạo chức vụ mới</h5>
              </span>
            </div>
            <div class="form-group col-md-12">
              <label class="control-label">Nhập tên chức vụ mới</label>
              <input class="form-control" type="text" required>
            </div>
          </div>
          <BR>
          <button class="btn btn-save" type="button">Lưu lại</button>
          <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
          <BR>
        </div>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>
  <!--
  MODAL
-->


  <!-- Essential javascripts for application to work-->
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="js/plugins/pace.min.js"></script>

</body>

</html>