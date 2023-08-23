package Admin;

import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.orderDao;
import Dao.productDao;
import Model.Order;
import Model.Orderdetail;
import Model.Product;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		 String orderdetailId = request.getParameter("orderdetail_id");
		  String status = request.getParameter("status");
		  
		  orderDao orderDao = new orderDao();
		  productDao productDao = new productDao();
		  orderDao.updateStatusOrderdetail(Integer.parseInt(orderdetailId),Integer.parseInt(status));
		  
		  Orderdetail orderdetail = orderDao.getOrderdetail(Integer.parseInt(orderdetailId));
		  Order order = orderDao.getOrderById(orderdetail.getOrder_id());
		  String email = order.getEmail();
		  //System.out.println(email);
		  Product product = productDao.getProductWishlist(orderdetail.getProduct_id());
		  
		  final String mess;
		  if(Integer.parseInt(status) == 2) {
		   mess = "<h1>Cảm ơn bạn đã đặt hàng</h1>"
                  + "<p>Dưới đây là thông tin sản phẩm bạn đã đặt:</p>"
                  + "<img src='" + product.getThumbnail() + "' alt='Product Image' /><br>"
                  + "<h3>" + product.getName() + "</h3>"
                  + "<p>Giá: " +new java.text.DecimalFormat("#,###").format( product.getPrice()) + "đ</p>"
                  + "<p>Số lượng: " + orderdetail.getQuantity() + "</p>";
		    }
		  
		  else if(Integer.parseInt(status) == 3) {
		   mess = "<h1>Rất tiếc đơn hàng của bạn đã bị hủy vì lý do ngoại lệ. Rất xin lỗi bạn</h1>"
                  + "<p>Dưới đây là thông tin sản phẩm bạn đã đặt:</p>"
                  + "<img src='" + product.getThumbnail() + "' alt='Product Image' /><br>"
                  + "<h3>" + product.getName() + "</h3>"
                  + "<p>Giá: " +new java.text.DecimalFormat("#,###").format( product.getPrice())+ "đ</p>"
                  + "<p>Số lượng: " + orderdetail.getQuantity() + "</p>";
		    }
		  else if(Integer.parseInt(status) == 4) {
			   mess = "<h1>Đơn hàng của bạn đã được bàn giao cho đơn vị vận chuyển</h1>"
	                  + "<p>Dưới đây là thông tin sản phẩm bạn đã đặt:</p>"
	                  + "<img src='" + product.getThumbnail() + "' alt='Product Image' /><br>"
	                  + "<h3>" + product.getName() + "</h3>"
	                  + "<p>Giá: " +new java.text.DecimalFormat("#,###").format( product.getPrice())+ "đ</p>"
	                  + "<p>Số lượng: " + orderdetail.getQuantity() + "</p>";
			    }
		  else {
				mess = "";
			}
		  
		  
		  
		// Tạo một ExecutorService để chạy tiến trình gửi email ngầm
	        ExecutorService executor = Executors.newSingleThreadExecutor();

	        executor.submit(() -> {
	            try {
	                Properties props = new Properties();
	                props.put("mail.smtp.host", "smtp.gmail.com");
	                props.put("mail.smtp.socketFactory.port", "465");
	                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	                props.put("mail.smtp.auth", "true");
	                props.put("mail.smtp.port", "465");
	                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication("lamgg113@gmail.com", "uvnmkcivhikouthc");
	                    }
	                });

	                MimeMessage message = new MimeMessage(session);
	                message.setFrom(new InternetAddress(email));
	                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	                message.setSubject("Đơn hàng của bạn đã được chúng tôi xác nhận.");
	                message.setContent(mess, "text/html;charset=UTF-8");
	                Transport.send(message);

	            } catch (MessagingException e) {
	                throw new RuntimeException(e);
	            }
	        });

	        executor.shutdown(); // Đóng ExecutorService khi đã hoàn thành
  
		  response.sendRedirect("ManageOrder.jsp");
 
	}

}
