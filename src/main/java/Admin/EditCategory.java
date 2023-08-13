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
 * Servlet implementation class EditCategory
 */
@WebServlet("/EditCategory")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("idcate"));
		String name = request.getParameter("namecate");
		request.setAttribute("idcate", id);
		request.setAttribute("namecate", name);
		request.getRequestDispatcher("addCategory.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("idcate"));
		String name = request.getParameter("namecate");
		String Oname = request.getParameter("Onamecate");
		
		productDao productDao = new productDao();
		
		
		
		int count = 0;
		
		List<Category> categories = productDao.getListCategorys();
		
		for (Category category : categories) {
			if(category.getName().equals(name)) {
				count++;
			}
		}
		
		if(count > 0 && !Oname.equals(name)) {
			request.setAttribute("existCate", "Hãng sản xuất đã tồn tại. Vui lòng nhập lại.");
			request.setAttribute("idcate", id);
			request.getRequestDispatcher("addCategory.jsp").forward(request, response);
		}
		else {
			productDao.updateCategory(id, name);
			response.sendRedirect("ManageCategory");
		}
		
		
		
	}

}
