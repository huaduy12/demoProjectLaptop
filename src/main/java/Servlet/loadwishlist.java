package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.productDao;
import Dao.wishlistDao;
import Model.Product;
import Model.User;
import Model.Wishlist;

/**
 * Servlet implementation class loadwishlist
 */
@WebServlet("/loadwishlist")
public class loadwishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadwishlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		productDao productDao = new productDao();
		wishlistDao wishlistDao = new wishlistDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
		List<Wishlist> wishlists = null;
		if (user != null) {
			wishlists = wishlistDao.getListWishlistByUser(user.getId());
		}
		
		List<Product> products = new ArrayList<>();
		for (Wishlist wishlist : wishlists) {
			Product product = productDao.getOrderById(wishlist.getProduct_id());
			products.add(product);
		}
		
		//List<Product> products = productDao.getListProducts();
		
		int numberProduct = 8; // số sản phầm được hiện lên trang;
		int page; // số trang hiện tại
		int size = products.size();
		int numberPage = (size%numberProduct == 0 ? (size/numberProduct):((size/numberProduct)+1));
		String xpage = request.getParameter("page"); // lấy số trâng được bấm về;
		if(xpage == null) {
			page =1;
		}
		else {
			page = Integer.parseInt(xpage);
		}
		int start,end;
		start = (page -1)* numberProduct;
		end = Math.min(page*numberProduct, size);
		List<Product> list = productDao.getProductByPage(products, start, end);
		
		
		int id = 0;
		request.setAttribute("products", list);
		request.setAttribute("page", page);
		request.setAttribute("numberPage",numberPage);
		request.setAttribute("tag", id); // đánh dấu hiển thị sản phẩm không theo danh mục
		request.getRequestDispatcher("wish.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
