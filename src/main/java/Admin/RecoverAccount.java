package Admin;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ScheduledFuture;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.userDao;
import Model.User;

/**
 * Servlet implementation class RecoverAccount
 */
@WebServlet("/RecoverAccount")
public class RecoverAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	DeleteUser deleteUser = new DeleteUser();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecoverAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		userDao userDao = new userDao();
		List<User> users = userDao.getListUsersRecover();
		request.setAttribute("users", users);
		request.getRequestDispatcher("RecoverAccount.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		userDao userDao = new userDao();
		
		final int id = Integer.parseInt(request.getParameter("iduser"));
		userDao.RecoverUser(id);
		
		deleteUser.scheduleTask(id);
		ScheduledFuture<?> future = deleteUser.getScheduledFuture();
		if (future != null) {
		    future.cancel(true); // Hủy lịch trình
		}
		response.sendRedirect("ManageEmployee");
		
		
	}

}
