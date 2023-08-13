<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách hãng sản xuất | Quản trị Admin</title>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
      
      </head>

<body onload="time()" class="app sidebar-mini rtl">
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
         <%
         User user = (User) session.getAttribute("userAdmin");
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
      
      <li><a class="app-menu__item " href="index.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Bảng điều khiển</span></a></li>
      
         
     <li><a class="app-menu__item" href="ManageEmployee">
     <i class= 'app-menu__icon bx bx-id-card'></i><span class="app-menu__label">Quản lý người dùng</span></a></a>
      </li>
      <li><a class="app-menu__item active" href="ManageProduct"><i
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
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item active"><a href="#"><b>Danh sách hãng sản xuất</b></a></li>
            </ul>
            <div id="clock"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <div class="row element-button">
                        
                         <div class="col-sm-2">

                <a class="btn btn-add btn-sm"  title="Quay lại" href="ManageProduct">
                   <i class="fas fa-chevron-left"></i> Quay lại
                </a>
              </div>
                          
                          <div class="col-sm-2">
              
                            <a class="btn btn-add btn-sm" title="Thêm" onclick="location.href='addCategory.jsp'"><i class="fas fa-plus"></i>
                                Tạo danh mục mới</a>
                          </div>
                            

                          </div>
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    
                                  
                                    <th >Id</th>
                                    <th >Hãng sản xuất</th>
                                     <th width="100" style="text-align: center;">Chức năng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${categories}" var="o">
                                <tr>
                                   
                                  
                                    <td>${o.id}</td>
                                   
                                   
                                    <td>${o.name}</td>
                                    <td style="text-align: center;">
                                    
                                       <form action="EditCategory" method="get">
                                       <input type="hidden" value="${o.id}" name = "idcate" >
                                       <input type="hidden" value="${o.name}" name = "namecate" >
                                      <button class="btn btn-primary btn-lg edit" type="submit" title="Sửa" 
                                        ><i class="fas fa-edit"></i>
                                      </button>
                                      </form>  
                                                      
                                       
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </main>
     
  
  

  
  
                                  
<div class="modal fade" id="ModalThumbnail" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
    data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body">
          <div class="row">
            <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chỉnh sửa sản phẩm cơ bản</h5>
              </span>
            </div>
          </div>
            <form action="addimg" method="post"> 
          <div class="row">
            <div class="form-group col-md-6">
              <label class="control-label"> Ảnh 1</label>
              <input class="form-control" type="text"  id="id" name ="thumnail1" >
            </div>
    
          </div>
          <div class="row">
            <div class="form-group col-md-6">
              <label class="control-label">Ảnh 2</label>
              <input class="form-control" type="text"  id="thumbnail" name ="thumbnail2" >
            </div>
    
          </div>
          <div class="row">
            <div class="form-group col-md-6">
              <label class="control-label">Ảnh 3</label>
              <input class="form-control" type="text"  id="product_id" name ="thumbnail3" >
            </div>
    
          </div>
          <BR>
          <a href="#" style="    float: right;
        font-weight: 600;
        color: #ea0000;">Chỉnh sửa nâng cao</a>
          <BR>
          <BR>
          <button class="btn btn-save" type="submit">Lưu lại</button>
          <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
          <BR>
        </div>
        </form>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>


    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="src/jquery.table2excel.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <!-- Data table plugin-->
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">
        $('#sampleTable').DataTable();
        //Thời Gian
    function time() {
      var today = new Date();
      var weekday = new Array(7);
      weekday[0] = "Chủ Nhật";
      weekday[1] = "Thứ Hai";
      weekday[2] = "Thứ Ba";
      weekday[3] = "Thứ Tư";
      weekday[4] = "Thứ Năm";
      weekday[5] = "Thứ Sáu";
      weekday[6] = "Thứ Bảy";
      var day = weekday[today.getDay()];
      var dd = today.getDate();
      var mm = today.getMonth() + 1;
      var yyyy = today.getFullYear();
      var h = today.getHours();
      var m = today.getMinutes();
      var s = today.getSeconds();
      m = checkTime(m);
      s = checkTime(s);
      nowTime = h + " giờ " + m + " phút " + s + " giây";
      if (dd < 10) {
        dd = '0' + dd
      }
      if (mm < 10) {
        mm = '0' + mm
      }
      today = day + ', ' + dd + '/' + mm + '/' + yyyy;
      tmp = '<span class="date"> ' + today + ' - ' + nowTime +
        '</span>';
      document.getElementById("clock").innerHTML = tmp;
      clocktime = setTimeout("time()", "1000", "Javascript");

      function checkTime(i) {
        if (i < 10) {
          i = "0" + i;
        }
        return i;
      }
    }
    </script>
    
    <script type="text/javascript">
      //Tìm kiếm
      function myFunction() {
          var input, filter, table, tr, td, i, txtValue;
          input = document.getElementById("myInput");
          filter = input.value.toUpperCase();
          table = document.getElementById("myTable");
          tr = table.getElementsByTagName("tr");
          for (i = 0; i < tr.length; i++) {
              td = tr[i].getElementsByTagName("td")[0];
              if (td) {
                  txtValue = td.textContent || td.innerText;
                  if (txtValue.toUpperCase().indexOf(filter) > -1) {
                      tr[i].style.display = "";
                  } else {
                      tr[i].style.display = "none";  }}}}
      //Lọc bảng
      function sortTable() {
          var table, rows, switching, i, x, y, shouldSwitch;
          table = document.getElementById("myTable");
          switching = true;
          while (switching) {
              switching = false;
              rows = table.rows;
              for (i = 1; i < (rows.length - 1); i++) {
                  shouldSwitch = false;
                  x = rows[i].getElementsByTagName("TD")[0];
                  y = rows[i + 1].getElementsByTagName("TD")[0];
                  if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                      shouldSwitch = true;
                      break;
                  }
              }
              if (shouldSwitch) {
                  rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                  switching = true;
                  swal("Thành Công!", "Bạn Đã Lọc Thành Công", "success");
              }
          }
      }
      //Thời Gian
      function time() {
          var today = new Date();
          var weekday = new Array(7);
          weekday[0] = "Chủ Nhật";
          weekday[1] = "Thứ Hai";
          weekday[2] = "Thứ Ba";
          weekday[3] = "Thứ Tư";
          weekday[4] = "Thứ Năm";
          weekday[5] = "Thứ Sáu";
          weekday[6] = "Thứ Bảy";
          var day = weekday[today.getDay()];
          var dd = today.getDate();
          var mm = today.getMonth() + 1;
          var yyyy = today.getFullYear();
          var h = today.getHours();
          var m = today.getMinutes();
          var s = today.getSeconds();
          m = checkTime(m);
          s = checkTime(s);
          nowTime = h + ":" + m + ":" + s;
          if (dd < 10) {
              dd = '0' + dd
          }
          if (mm < 10) {
              mm = '0' + mm
          }
          today = day + ', ' + dd + '/' + mm + '/' + yyyy;
          tmp = '<i class="fa fa-clock-o" aria-hidden="true"></i> <span class="date">' + today + ' | ' + nowTime +
              '</span>';
          document.getElementById("clock").innerHTML = tmp;
          clocktime = setTimeout("time()", "1000", "Javascript");
    
          function checkTime(i) {
              if (i < 10) {
                  i = "0" + i;
              }
              return i;
          }
      }
    
      //Thêm
      $(document).ready(function () {
         
          var actions = $("table td:last-child").html();
          $(".add-new").click(function () {
              $(this).attr("disabled", "disabled");
              var index = $("table tbody tr:last-child").index();
              var row = '<tr>' +
                  '<td><input type="text" class="form-control" name="name" id="name" placeholder="Nhập Tên"></td>' +
                  '<td><input type="text" class="form-control" name="gioitinh" id="gioitinh" placeholder="Nhập Giới Tính"></td>' +
                  '<td><input type="text" class="form-control" name="namsinh" id="namsinh" value="" placeholder="Nhập Ngày Sinh"></td>' +
                  '<td><input type="text" class="form-control" name="diachi" id="diachi" value="" placeholder="Nhập Địa Chỉ"></td>' +
                  '<td><input type="text" class="form-control" name="chucvu" id="chucvu" value="" placeholder="Nhập Chức Vụ"></td>' +
                  '<td>' + actions + '</td>' +
                  '</tr>';
              $("table").append(row);
              $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
              $('[data-toggle="tooltip"]').tooltip();
          });
          //Kiểm tra rỗng
          $(document).on("click", ".add", function () {
              var empty = false;
              var input = $(this).parents("tr").find('input[type="text"]');
              input.each(function () {
                  if (!$(this).val()) {
                      $(this).addClass("error");
                      swal("Thông Báo!", "Dữ Liệu Trống Vui Lòng Kiểm Tra", "error");
                      empty = true;
                  } else {
                      $(this).removeClass("error");
                      swal("Thông Báo!", "Bạn Chưa Nhập Dữ Liệu", "warning");
                  }
              });
              $(this).parents("tr").find(".error").first().focus();
              if (!empty) {
                  input.each(function () {
                      $(this).parent("td").html($(this).val());
                      swal("Thành Công", "Bạn Đã Cập Nhật Thành Công", "success");
                  });
                  $(this).parents("tr").find(".add, .edit").toggle();
                  $(".add-new").removeAttr("disabled");
              }
          });
          
          // Xóa
          $(document).on("click", ".delete", function () {
              $(this).parents("tr").remove();
              swal("Thành Công!", "Bạn Đã Xóa Thành Công", "success");
              $(".add-new").removeAttr("disabled");
          });
      });
      //Not use
      jQuery(function () {
          jQuery(".cog").click(function () {
              swal("Sorry!", "Tính Năng Này Chưa Có", "error");
          });
      });
      //Tool tip
      $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</body>

</html>