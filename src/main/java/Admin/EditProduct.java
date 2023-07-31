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
import Model.Product;


/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/EditProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idString = request.getParameter("idproduct");
		int id =-1;
		if (idString != null) {
			id = Integer.parseInt(idString);
		}
		
		productDao productDao = new productDao();
		Product product = productDao.getProductById(id);
		int category_id = productDao.getCategoryProduct(id);
		
		Category category = productDao.getCategoryById(category_id);
		List<Category> notCategory = productDao.getListCategorysByAdmin(category_id);
		request.setAttribute("product", product);
		
		request.setAttribute("category", category);
		request.setAttribute("notCategory", notCategory);
		request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		int id =Integer.parseInt(request.getParameter("idproduct"));
		String  name = request.getParameter("name");
		String  shortdes = request.getParameter("short_description");
		Double gia = Double.parseDouble(request.getParameter("price"));
		Double discount = Double.parseDouble(request.getParameter("discount"));
		int soluong = Integer.parseInt(request.getParameter("quantity"));
		int feature = Integer.parseInt(request.getParameter("feature"));
		int maloai = Integer.parseInt(request.getParameter("category_id"));
		String anh = request.getParameter("thumbnail");
		String thongtin =request.getParameter("description");
	
		
		Product product = new Product(id, name, shortdes, gia, discount, soluong, anh, thongtin, feature,maloai);
		
		productDao productDao = new productDao();
		
		productDao.editsanpham(product);
		
		response.sendRedirect("ManageProduct");
		
	}

}
