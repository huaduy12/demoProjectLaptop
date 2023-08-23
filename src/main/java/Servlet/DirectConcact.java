package Servlet;

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

/**
 * Servlet implementation class DirectConcact
 */
@WebServlet("/DirectConcact")
public class DirectConcact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DirectConcact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		//final String mess = email;
	final String	mess = "<h1>Cảm ơn bạn đã liên hệ</h1>"
                + "<p>Chúng tôi sẽ liên lạc lại với bạn trong thời gian sớm nhất ?</p>"; 
		
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
                message.setSubject("Cảm ơn bạn đã liên hệ.");
                message.setContent(mess, "text/html;charset=UTF-8");
                Transport.send(message);

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        });

        executor.shutdown(); // Đóng ExecutorService khi đã hoàn thành
		response.sendRedirect("index.jsp");
		
		
	}

}
