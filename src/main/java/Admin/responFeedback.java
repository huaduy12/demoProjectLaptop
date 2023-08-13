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

import Dao.concactDao;
import Dao.userDao;
import Model.Feedback;
import Model.User;

/**
 * Servlet implementation class responFeedback
 */
@WebServlet("/responFeedback")
public class responFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String idString = request.getParameter("id");
		int id = 0;
		if (idString != null) {
			id = Integer.parseInt(idString);
		}
		concactDao concactDao = new concactDao();
		Feedback feedback = concactDao.getListFeedbackById(id);
		
		userDao userDao = new userDao();
		User user = userDao.getUserById(feedback.getUser_id());
		
		request.setAttribute("feedback",feedback);
		request.setAttribute("username", user.getUsername());
		request.getRequestDispatcher("ResponContact.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("idfeedback"));
		
		String respon = request.getParameter("respon");
		String username = request.getParameter("username");
		String email= request.getParameter("email");
		
	
		concactDao concactDao = new concactDao();
		concactDao.updateFeedback(id);
		
		 final String mess;
		 
		   mess = "<h1>Cảm ơn bạn đã phản hồi</h1>"
                 + "<p>Chung tôi rất cảm ơn về phản hồi của bạn. Dưới đây là phần trả lời của chúng tôi:</p>"
                
                 + "<p>Chào: " +username + ".</p>"
                 + "<p>Chúng tôi xin trả lời bạn: " + respon + "</p>";
		
		 
		  
		  
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
	                message.setSubject("Phản hồi từ website bán laptop.");
	                message.setContent(mess, "text/html;charset=UTF-8");
	                Transport.send(message);

	            } catch (MessagingException e) {
	                throw new RuntimeException(e);
	            }
	        });

	        executor.shutdown(); // Đóng ExecutorService khi đã hoàn thành
		
		response.sendRedirect("ManageContact.jsp");
		
	}

}
