package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.userDao;
import Model.User;

/**
 * Servlet implementation class inforDatailUser
 */
@WebServlet("/inforDatailUserServlet")
public class inforDatailUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inforDatailUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		userDao userDao = new userDao();
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("tel");
		String address = request.getParameter("address");
		
		User userEmail = userDao.getUserByEmail(email);
		User userPhone = userDao.getUserByPhone(phone);
		User userSesstion  = (User) session.getAttribute("user");
		
		
		if(userEmail != null && !email.equals(userSesstion.getEmail()) ) {
			request.setAttribute("errorEmail", "Email đã được sử dụng, vui lòng nhập email khác");
		}
		else if(userPhone != null && !phone.equals(userSesstion.getPhonenumber()) ) {
			request.setAttribute("errorPhone", "Số điện thoại đã được sử dụng, vui lòng nhập cái khác");
		}else {
			
			int id = userSesstion.getId();
			User user = new User(id, username, fullname, email, phone, address);
			userDao.editUser(user);
			session.setAttribute("user", user);
			
		}
		request.getRequestDispatcher("account.jsp").forward(request, response);
		
		
	}

}
