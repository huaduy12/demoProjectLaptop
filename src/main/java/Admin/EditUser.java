package Admin;

import java.io.IOException;
import java.util.List;

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
		
		String Oemail = request.getParameter("Oemail");
		String Ophone = request.getParameter("Ophone");
		int id = -1;
		if(idString != null) {
			id = Integer.parseInt(idString);
		}
		
		User user = new User(id,username,fullname,email,phonnumber,address,password);
		
		userDao userDao = new userDao();
		User user3 = userDao.getUserById(id);
		
		
		List<User> users = userDao.getListUsers();
		int cnt1 =0,cnt2 = 0;
		for (User user2 : users) {
			if(user2.getEmail().equalsIgnoreCase(email)) {
				cnt1++;
			}
			if( user2.getPhonenumber()!= null && user2.getPhonenumber().equalsIgnoreCase(phonnumber)) {
				cnt2++;
			}
		}
		
		if(cnt1 > 0 && !email.equals(Oemail)) {
			request.setAttribute("errorEmail","Email bị trùng, Vui lòng nhập email khác");
			request.setAttribute("user", user3);
			request.getRequestDispatcher("EditUser.jsp").forward(request, response);
		}else if(cnt2 > 0 && !phonnumber.equals(Ophone)) {
			request.setAttribute("errorPhone","Số điện thoại bị trùng, Vui lòng nhập số điện thoại khác");
			request.setAttribute("user", user3);
			request.getRequestDispatcher("EditUser.jsp").forward(request, response);
		}else {
			userDao.updateInfor(user);
			response.sendRedirect("ManageEmployee");
		}
		
		
		
		
		
		
		
	}

}
