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
          <span class="app-menu__label">Quản lý khách hàng</span></a></li>
          
      <li><a class="app-menu__item" href="ManageProduct"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
      </li>
      <li><a class="app-menu__item" href="ManageOrder.jsp"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quản lý đơn hàng</span></a></li>
      
          </span></a></li>
      <li><a class="app-menu__item" href="RevenueReport.jsp"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
      </li>
     
      
    </ul>
  </aside>
  <main class="app-content">
    <div class="app-title">
      <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item">Danh sách người dùng</li>
      
       
         <li class="breadcrumb-item"><a href="#">Ảnh mô tả sản phẩm</a></li>
      </ul>
    </div>
    <div class="row">
      <div class="col-md-12">

        <div class="tile">
		
        
          <h3 class="tile-title">Ảnh mô tả</h3>
       
        
          <div class="tile-body">
            <div class="row element-button">
             
            </div>
           
             <form class="row" action="Addthumbnail" method="post">
               <input type="hidden" name ="idproduct" value="${id}">
             
             <c:if test="${size == 0}">
               
              <div class="form-group col-md-10">
                <label class="control-label">Link ảnh 1</label>
                <input class="form-control" type="text" id="" name ="thumbnail1" value="" required="required">
              </div>
             
              
               <div class="form-group col-md-10">
                <label class="control-label">Link ảnh 2</label>
                <input class="form-control" type="text" id="username" name ="thumbnail2" value="" required="required">
              </div>
             

               <div class="form-group col-md-10">
                <label class="control-label">Link ảnh 3</label>
                <input class="form-control" type="text" id="username" name ="thumbnail3" value="" required="required">
              </div>
              
              <div class="form-group col-md-10">
                <label class="control-label">Link ảnh 4</label>
                <input class="form-control" type="text" id="username" name ="thumbnail4" value="" required="required">
              </div>
               </c:if>
               
               
               <c:if test="${size == 4}">
           
              <div class="form-group col-md-9">
                <label class="control-label">Link ảnh 1</label>
                  <input class="form-control" type="hidden" id="" name ="id1" value="${galeries1.id}">
                  <input class="form-control" type="text" id="" name ="thumbnail1" value="${galeries1.thumbnail}" required="required">
                   
              </div>
              <div class="form-group col-md-3">
                  <img src="${galeries1.thumbnail}" alt="" width="100px;">                   
              </div>
             
               <div class="form-group col-md-9">
                <label class="control-label">Link ảnh 2</label>
                <input class="form-control" type="hidden" id="" name ="id2" value="${galeries2.id}">
                  <input class="form-control" type="text" id="" name ="thumbnail2" value="${galeries2.thumbnail}" required="required">
              </div>
              
               <div class="form-group col-md-3">
                  <img src="${galeries2.thumbnail}" alt="" width="100px;">                   
              </div>
             

               <div class="form-group col-md-9">
                <label class="control-label">Link ảnh 3</label>
                <input class="form-control" type="hidden" id="" name ="id3" value="${galeries3.id}">
                  <input class="form-control" type="text" id="" name ="thumbnail3" value="${galeries3.thumbnail}" required="required">
              </div>
               <div class="form-group col-md-3">
                  <img src="${galeries3.thumbnail}" alt="" width="100px;">                   
              </div>
              
              <div class="form-group col-md-9">
               <label class="control-label">Link ảnh 4</label>
                 <input class="form-control" type="hidden" id="" name ="id4" value="${galeries4.id}">
                  <input class="form-control" type="text" id="" name ="thumbnail4" value="${galeries4.thumbnail}" required="required">
              </div>
              
               <div class="form-group col-md-3">
                  <img src="${galeries4.thumbnail}" alt="" width="100px;">                   
              </div>
               </c:if>
               
                 
             
             
             </div>
          <button class="btn btn-save" type="submit">Lưu lại</button>
         </form>
         <button  class="btn btn-cancel" type="button" onclick="window.location.href = 'ManageProduct'">Hủy bỏ</button>
        


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