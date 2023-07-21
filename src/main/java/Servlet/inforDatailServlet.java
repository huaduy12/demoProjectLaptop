package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.productDao;
import Model.Galery;
import Model.Product;

/**
 * Servlet implementation class inforDatailServlet
 */
@WebServlet("/inforDatailServlet")
public class inforDatailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inforDatailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		productDao productDao = new productDao();
		
		
		String idString = request.getParameter("id");
		int id =-1;
		if(idString != null) {
			id = Integer.parseInt(idString);
		}
		
		Product product = productDao.getProductById(id);
		String category = "";
		List<Product> productRelate = new ArrayList<>();
		if(product != null) {
			category = productDao.getNameCategory(product.getCategory_id());
			 productRelate = productDao.getListProductByCategory(product.getCategory_id(),id);
		}
	
	   
		List<Galery> galery = productDao.getListGaleries(id);
		
        request.setAttribute("product", product);
        request.setAttribute("category", category);
        request.setAttribute("productRelate", productRelate);
        request.setAttribute("galery", galery);
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
