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
 * Servlet implementation class changePasswordServlet
 */
@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePasswordServlet() {
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
		userDao userDao = new userDao();
		HttpSession session = request.getSession();
		
		String passwordOrigin = request.getParameter("passwordOri");
		String passwordNew = request.getParameter("passwordNew");
		
		User user1 =(User) session.getAttribute("user");
		
		if(userDao.changePassword(user1.getId(), passwordNew) > 0 && passwordOrigin.equals(user1.getPassword())) {
			User user = new User(user1.getId(), user1.getUsername(), user1.getFullname(),user1.getEmail(),user1.getPhonenumber(),user1.getAddress(),passwordNew);
			session.setAttribute("user", user);
			request.setAttribute("changeSusscess", "Thay đổi mật khẩu thành công");
		}
		else {
			request.setAttribute("changeFail", "Thay đổi mật khẩu thất bại");
		}
		request.getRequestDispatcher("changePassword.jsp").forward(request, response);
		
	}

}
