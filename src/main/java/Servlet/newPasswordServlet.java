package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.userDao;

/**
 * Servlet implementation class newPasswordServlet
 */
@WebServlet("/newPassword")
public class newPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newPasswordServlet() {
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
		
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		
		RequestDispatcher dispatcher = null;
	
		userDao userDao = new userDao();
		
		String email = (String) session.getAttribute("email");
		int row = userDao.changePasswordByEmail(email, newPassword);
        
		if(row > 0) {
			request.setAttribute("success", "Thành công");
		}else {
			request.setAttribute("fail", "Thất bại");
		}
		
		session.removeAttribute("email");
		session.removeAttribute("otp");
		request.getRequestDispatcher("login.jsp").forward(request, response);
			
		
	}

}
