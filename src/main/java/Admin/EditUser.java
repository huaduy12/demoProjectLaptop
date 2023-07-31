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
 * Servlet implementation class EditUser
 */
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		userDao userDao = new userDao();
		
		String idString = request.getParameter("iduser");
		int id = -1;
		if(idString != null ) {
			id = Integer.parseInt(idString);
		}
		
		User user = userDao.getUserById(id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("EditUser.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String idString = request.getParameter("iduser");
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		
		String email = request.getParameter("email");
		String phonnumber = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		
		int id = -1;
		if(idString != null) {
			id = Integer.parseInt(idString);
		}
		
		User user = new User(id,username,fullname,email,phonnumber,address,password);
		
		userDao userDao = new userDao();
		userDao.updateInfor(user);
		response.sendRedirect("ManageEmployee");
		
		
	}

}
