package Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.productDao;
import Model.Category;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory() {
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
		
		productDao productDao = new productDao();
		List<Category> categories = productDao.getListCategorys();
		
		String name = request.getParameter("name");
		
		int count = 0;
		for (Category category : categories) {
			if (category.getName().equalsIgnoreCase(name)) {
				count++;
			}
		}
		
		if(count ==0 ) {
			productDao.addCategory(name);
			response.sendRedirect("ManageProduct");
		}else {
			request.setAttribute("fail", "Hãng sản xuất đã tồn tại. Vui lòng thêm hãng khác");
			request.getRequestDispatcher("addCategory.jsp").forward(request, response);
		}
		
	}

}
