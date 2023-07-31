<%@page import="Dao.productDao"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="userDao" class="Dao.userDao" scope="application" />
<jsp:useBean id="productDao" class="Dao.productDao" scope="page" />
<jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <title>Báo cáo thống kê | Quản trị Admin</title>
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
     
      <li><a class="app-menu__item " href="ManageProduct"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
      </li>
      <li><a class="app-menu__item" href="ManageOrder.jsp"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Quản lý đơn hàng</span></a></li>
     
          </span></a></li>
    
      <li><a class="app-menu__item active" href="RevenueReport.jsp"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
      </li>
      
    </ul>
  </aside>
  <main class="app-content">
    <div class="row">
      <div class="col-md-12">
        <div class="app-title">
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Báo cáo doanh thu</b></a></li>
          </ul>
          <div id="clock"></div>
        </div>
      </div>
    </div>
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="widget-small primary coloured-icon"><i class='icon  bx bxs-user fa-3x'></i>
                    <div class="info">
                        <h4>Tổng khách hàng</h4>
                         <%int countuser = userDao.getCountUser();
            %>
                        <p><b><%=countuser%> nhân viên</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small info coloured-icon"><i class='icon bx bxs-purchase-tag-alt fa-3x' ></i>
                    <div class="info">
                     <h4>Tổng số sản phẩm</h4>
                        <%int countProduct = productDao.getCountProduct(); %>
                <p><b><%=countProduct%> sản phẩm</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-shopping-bag-alt'></i>
                    <div class="info">
                        <h4>Tổng đơn hàng</h4>
                        <% int countOrder = orderDao.getCountOrderdetail(); %>
                <p><b><%=countOrder%> đơn hàng</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small primary coloured-icon"><i class='icon fa-3x bx bxs-info-circle' ></i>
                    <div class="info">
                        <h4>Sản phẩm mới</h4>
                        <%int c = productDao.getCountProductNew();%>
                        <p><b><%=c%> sản phẩm</b></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="widget-small primary coloured-icon"><i class='icon fa-3x bx bxs-chart' ></i>
                    <div class="info">
                        <h4>Tổng thu nhập</h4>
                        <% double sum = orderDao.getSumTotal(); %>
                        <p><b><%=new java.text.DecimalFormat("#,###").format(sum)%> đ</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small info coloured-icon"><i class='icon fa-3x bx bxs-user-badge' ></i>
                    <div class="info">
                        <h4>Đơn hàng đang chờ xử lý</h4>
                        <%int cn = orderDao.getHandleOrder(); %>
                        <p><b><%=cn%> đơn hàng</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-tag-x' ></i>
                    <div class="info">
                        <h4>Sắp Hết hàng</h4>
                      <% int countOutofStock = productDao.getOuOfStockProduct(); %>
                <p><b><%=countOutofStock%> sản phẩm</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-receipt' ></i>
                    <div class="info">
                        <h4>Đơn hàng hủy</h4>
                        <%int cnt = orderDao.getCancelOrder(); %>
                        <p><b><%=cnt%> đơn hàng</b></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div>
                        <h3 class="tile-title">SẢN PHẨM BÁN CHẠY</h3>
                    </div>
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá tiền</th>
                                    <th>Hãng sản xuất</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%List<Integer> list = orderDao.getBestSelling();
                             for(int o : list){
                            	 Product product = productDao.getProductById(o);
                            	 String nameCate = productDao.getNameCategory(product.getCategory_id());
                            %>
                                <tr>
                                    <td><%=product.getId()%></td>
                                    <td><%=product.getName()%></td>
                                    <td><%=new java.text.DecimalFormat("#,###").format(product.getDiscount())%> đ</td>
                                    <td><%=nameCate%></td>
                                </tr>
                            
                            <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div>
                            <h3 class="tile-title">TỔNG ĐƠN HÀNG ĐANG CHỜ XỬ LÝ</h3>
                        </div>
                        <div class="tile-body">
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                
                               
                                    <tr>
                                            <th>ID đơn hàng</th>
                                            <th>Khách hàng</th>
                                            <th>Đơn hàng</th>
                                            <th>Số lượng</th>
                                            <th>Tổng tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <% List<Orderdetail> orderdetails = orderDao.getListOrderHandle();
                                for(Orderdetail orderdetail : orderdetails){
                                	Product product = productDao.getProductById(orderdetail.getProduct_id());
                                	String nameOrder = orderDao.getNameById(orderdetail.getOrder_id());
                                
                                %>
                                    <tr>
                                            <td><%=orderdetail.getId()%></td>
                                            <td><%=nameOrder%></td>
                                            <td><%=product.getName()%></td>
                                            <td><%=orderdetail.getQuantity()%> sản phẩm</td>
                                            <td><%=new java.text.DecimalFormat("#,###").format(orderdetail.getTotal_money())%> đ</td>
                                    </tr>
                                 <%} %>   
                                    
                                    <tr>
                                       <th colspan="4">Tổng cộng:</th>
                                       <%double d = orderDao.getTotalOrderHandle(); %>
                                        <td><%=new java.text.DecimalFormat("#,###").format(d)%> đ</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div>
                            <h3 class="tile-title">SẢN PHẨM ĐÃ HẾT HÀNG</h3>
                        </div>
                        <div class="tile-body">
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Ảnh</th>
                                            <th>Số lượng</th>
                                            <th>Tình trạng</th>
                                            <th>Giá tiền</th>
                                            <th>Danh mục</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%List<Product> products = productDao.getProductOutofStock();
                                for(Product product : products){
                                	int cate_id = productDao.getCategoryProduct(product.getCategory_id());
                                	String nameCate= productDao.getNameCategory(cate_id);
                                %>
                                    <tr>
                                            <td><%=product.getId()%></td>
                                            <td><%=product.getName()%></td>
                                            <td><img src="<%=product.getThumbnail()%>" alt="" width="100px;"></td>
                                            <td><%=product.getQuantity()%></td>
                                            <td><span class="badge bg-danger">Hết hàng</span></td>
                                            <td><%=new java.text.DecimalFormat("#,###").format(product.getDiscount())%> đ</td>
                                            <td><%=nameCate%></td>
                                    </tr>
                                    
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
       
       

        <div class="text-center" style="font-size: 12px">
            <p><b>Hệ thống quản lý website bán Laptop | Code by nhóm 1</b></p>
        </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="js/plugins/chart.js"></script>
   
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
      $('[data-toggle="tooltip"]').tooltip();
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
      // Sửa
      $(document).on("click", ".edit", function () {
          $(this).parents("tr").find("td:not(:last-child)").each(function () {
              $(this).html('<input type="text" class="form-control" value="' + $(this)
                  .text() + '">');
          });
          $(this).parents("tr").find(".add, .edit").toggle();
          $(".add-new").attr("disabled", "disabled");
      });
      jQuery(function () {
          jQuery(".add").click(function () {
              swal("Thành Công!", "Bạn Đã Sửa Thành Công", "success");
          });
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
  
</script>
</body>

</html>