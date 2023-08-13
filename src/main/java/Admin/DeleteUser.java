package Admin;

import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.userDao;

/**
 * Servlet implementation class deleteUser
 */
@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userDao userDao = new userDao();
	
	  private ScheduledFuture<?> scheduledFuture;

	    public ScheduledFuture<?> getScheduledFuture() {
	        return scheduledFuture;
	    }

	    public void setScheduledFuture(ScheduledFuture<?> scheduledFuture) {
	        this.scheduledFuture = scheduledFuture;
	    }
	    
	    
	    // Hàm lên lịch
	    public void scheduleTask(int id) {
	    	 long delay = 30; // Số ngày
		     TimeUnit timeUnit = TimeUnit.DAYS;
		    
	        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
	        scheduledFuture = scheduler.schedule(() -> userDao.deleteUser(id), delay, timeUnit);
	        scheduler.shutdown();
	    }
	
    /**
     * @see HttpServlet#HttpServlet()
     */
 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String idString =  request.getParameter("iduser");
		
		ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
		
		final int id = Integer.parseInt(idString);
			
		userDao.removeUser(id);
		scheduleTask(id);
		
		
		response.sendRedirect("ManageEmployee");
		
	}

}
