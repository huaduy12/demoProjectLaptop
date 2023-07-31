package Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.userDao;
import Model.User;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
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
		
		
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		
		String email = request.getParameter("email");
		String phonnumber = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		int role = Integer.parseInt(request.getParameter("role"));
		
		
		User user = new User(username,fullname,email,phonnumber,address,password,role);
		
		userDao userDao = new userDao();
		userDao.addUserByAdmin(user);
		response.sendRedirect("ManageEmployee");
	}

}
