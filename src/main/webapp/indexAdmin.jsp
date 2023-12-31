<%@page import="Model.SalesStatistics"%>
<%@page import="Model.Orderdetail"%>
<%@page import="Dao.userDao"%>
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Admin.*"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDao" class="Dao.productDao" scope="page" />
<jsp:useBean id="reviewDao" class="Dao.reviewDao" scope="application" />
<jsp:useBean id="userDao" class="Dao.userDao" scope="application" />
<jsp:useBean id="orderDao" class="Dao.orderDao" scope="application" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
   <!DOCTYPE html>
<html lang="en">

<head>
  <title>Quản trị Admin</title>
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
     
      <li><a class="app-menu__item active" href="index.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Bảng điều khiển</span></a></li>
      <li><a class="app-menu__item " href="ManageEmployee"><i class='app-menu__icon bx bx-id-card'></i> <span
            class="app-menu__label">Quản lý người dùng</span></a></li>
    
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
    <div class="row">
      <div class="col-md-12">
        <div class="app-title">
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
          </ul>
          <div id="clock"></div>
        </div>
      </div>
    </div>
    <div class="row">
      <!--Left-->
      <div class="col-md-12 col-lg-6">
        <div class="row">
       <!-- col-6 -->
       <div class="col-md-6">
        <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
          <div class="info">
            <h4>Tổng khách hàng</h4>
            <%int countuser = userDao.getCountUser();
            
            %>
            <p><b><%=countuser%> khách hàng</b></p>
            <p class="info-tong">Tổng số khách hàng được quản lý.</p>
          </div>
        </div>
      </div>
       <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
              <div class="info">
                <h4>Tổng sản phẩm</h4>
                <%int countProduct = productDao.getCountProduct(); %>
                <p><b><%=countProduct%> sản phẩm</b></p>
                <p class="info-tong">Tổng số sản phẩm được quản lý.</p>
              </div>
            </div>
          </div>
           <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>Tổng đơn hàng</h4>
                <% int countOrder = orderDao.getCountOrderdetail(); %>
                <p><b><%=countOrder%> đơn hàng</b></p>
                <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
              </div>
            </div>
          </div>
           <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
              <div class="info">
                <h4>Sắp hết hàng</h4>
                <% int countOutofStock = productDao.getOuOfStockProduct(); %>
                <p><b><%=countOutofStock%> sản phẩm</b></p>
                <p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>
              </div>
            </div>
          </div>
           <!-- col-12 -->
           <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tình trạng đơn hàng</h3>
              <div>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>ID đơn hàng</th>
                      <th>Tên khách hàng</th>
                      <th>Tổng tiền</th>
                      <th>Trạng thái</th>
                    </tr>
                  </thead>
                  <tbody>
                  <% List<Orderdetail> orderdetails = orderDao.getListOrderdetailsLatest();
                     for(Orderdetail orderdetail : orderdetails){
                    	 String name = orderDao.getNameById(orderdetail.getOrder_id());
                  %>
                    <tr>
                      <td><%=orderdetail.getId()%></td>
                      <td><%=name%></td>
                      <td>
                      
                         <%=new java.text.DecimalFormat("#,###").format(orderdetail.getTotal_money())%>
                      </td>
                      <%if(orderdetail.getStatus() ==1){ %>
                      <td><span class="badge bg-info">Chờ xử lý</span></td>
                      <%} %>
                      
                       <%if(orderdetail.getStatus() ==2){ %>
                      <td><span class="badge bg-success">Giao dịch thành công</span></td>
                      
                      <% }%>
                       <%if(orderdetail.getStatus() ==3){ %>
                       <td><span class="badge bg-danger">Đã hủy	</span></td>
                       <%} %>
                    </tr>
                  
                  <%} %>
                  
               
                    
                  </tbody>
                </table>
              </div>
              <!-- / div trống-->
            </div>
           </div>
            <!-- / col-12 -->
             <!-- col-12 -->
            <div class="col-md-12">
                <div class="tile">
                  <h3 class="tile-title">Khách hàng mới</h3>
                <div>
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Tên khách hàng</th>
                        <th style="text-align: center;">Email</th>
                        <th>Số điện thoại</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%List<User> users = userDao.getNameUser();
                      for(User u : users){
                    %>
                      <tr>
                        <td><%=u.getId()%></td>
                        <td><%=u.getUsername()%></td>
                        <td><%=u.getEmail()%></td>
                        
                       
                        
                        <%if(u.getPhonenumber() == null){ %>
                            <td><span class="tag tag-success">Không có</span></td>          
                        <%} %>
                        <%if(u.getPhonenumber() != null){ %>
                            <td><span class="tag tag-success"><%=u.getPhonenumber()%></span></td>
                        <%} %>
                        
                      </tr>
                      <%} %>
                    </tbody>
                  </table>
                </div>

              </div>
            </div>
             <!-- / col-12 -->
        </div>
      </div>
      <!--END left-->
      <!--Right-->
      <div class="col-md-12 col-lg-6">
        <div class="row">
          <div class="col-md-12">
            <div class="tile">
              <h3 class="tile-title">Số lượng sản phẩm bán được trong 6 tháng gần nhất</h3>
              <div class="embed-responsive embed-responsive-16by9">
                <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="tile">
              <h3 class="tile-title">Thống kê doanh thu 6 tháng gần nhất </h3>
              <div class="embed-responsive embed-responsive-16by9">
                <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!--END right-->
    </div>


    <div class="text-center" style="font-size: 13px">
      <p><b>Copyright
          <script type="text/javascript">
            document.write(new Date().getFullYear());
          </script> Phần mềm quản lý bán hàng laptop | Dev By Nhóm 1
        </b></p>
    </div>
  </main>
  <script src="js/jquery-3.2.1.min.js"></script>
  <!--===============================================================================================-->
  <script src="js/popper.min.js"></script>
  <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
  <!--===============================================================================================-->
  <script src="js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="js/main.js"></script>
  <!--===============================================================================================-->
  <script src="js/plugins/pace.min.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript" src="js/plugins/chart.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript">
  <% int[] month = new int[6];
	int[] soldData = new int[6];
  List<SalesStatistics> statisticsList = orderDao.getListSales();
  for (int i = 0; i < statisticsList.size(); i++) {
	  SalesStatistics statistics = statisticsList.get(i);
	  month[i] = statistics.getOrderMonth();
	  soldData[i] = statistics.getTotalSold();
  }
  %>
    var data = {
      labels: ["Tháng <%=month[0]%>", "Tháng <%=month[1]%>", "Tháng <%=month[2]%>", "Tháng <%=month[3]%>", "Tháng <%=month[4]%>", "Tháng <%=month[5]%>"],
      datasets: [{
        label: "Dữ liệu đầu tiên",
        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
        strokeColor: "rgb(255, 212, 59)",
        pointColor: "rgb(255, 212, 59)",
        pointStrokeColor: "rgb(255, 212, 59)",
        pointHighlightFill: "rgb(255, 212, 59)",
        pointHighlightStroke: "rgb(255, 212, 59)",
        data: [<%= soldData[0] %>, <%= soldData[1] %>, <%= soldData[2] %>, <%= soldData[3] %>, <%= soldData[4] %>, <%= soldData[5] %>]
      }
      ]
    };
    
    <% int[] mont = new int[6];
	int[] sum = new int[6];
  List<SalesStatistics> statisticsListSum = orderDao.getListSumSales();

  for (int i = 0; i < statisticsListSum.size(); i++) {
	  SalesStatistics statistics = statisticsListSum.get(i);
	  mont[i] = statistics.getOrderMonth();
	  sum[i] = statistics.getTotalSold();
  }
  %>
  
    var data1 = {
    	      labels: ["Tháng <%=mont[5]%>", "Tháng <%=mont[4]%>", "Tháng <%=mont[3]%>", "Tháng <%=mont[2]%>", "Tháng <%=mont[1]%>", "Tháng <%=mont[0]%>"],
    	      datasets: [{
    	        label: "Dữ liệu đầu tiên",
    	        fillColor: "rgba(9, 109, 239, 0.651)  ",
    	        pointColor: "rgb(9, 109, 239)",
    	        strokeColor: "rgb(9, 109, 239)",
    	        pointStrokeColor: "rgb(9, 109, 239)",
    	        pointHighlightFill: "rgb(9, 109, 239)",
    	        pointHighlightStroke: "rgb(9, 109, 239)",
    	        data: [<%=sum[5]%>, <%=sum[4]%>, <%=sum[3]%>, <%=sum[2]%>, <%=sum[1]%>, <%=sum[0]%>]
    	      },  
    	      ]
    	    };
    var ctxl = $("#lineChartDemo").get(0).getContext("2d");
    var lineChart = new Chart(ctxl).Line(data);

    var ctxb = $("#barChartDemo").get(0).getContext("2d");
    var barChart = new Chart(ctxb).Bar(data1);
  </script>
  <script type="text/javascript">
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
</body>

</html>