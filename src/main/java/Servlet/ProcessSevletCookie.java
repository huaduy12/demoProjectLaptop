package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Dao.productDao;
import Model.Cart;
import Model.Item;
import Model.Product;

/**
 * Servlet implementation class ProcessSevlet
 */
@WebServlet("/process")
public class ProcessSevletCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
        productDao productDAO = new productDao();
	//	HttpSession session = request.getSession();
        
        
		Cookie[] cookies = request.getCookies();
		
		List<Product> list = productDAO.getListProducts();
		String txt = "";
		
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("cart")) {
					txt += cookie.getValue();
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		Cart cart = new Cart(txt, list);
		
		int id =Integer.parseInt(request.getParameter("id"));
		
		
		int num = -1;
		if(request.getParameter("num") != null) {
			num =Integer.parseInt(request.getParameter("num"));
		}
	
		
		Product product = productDAO.getProductById(id);
		int numStore = product.getQuantity();
		if(request.getParameter("remove") != null) {
			cart.removeItem(id);
		}
		else if(num == -1 && (cart.getQuantityById(id) <= 1)) {
		
			cart.removeItem(id);
		}else if(num != 0) {
			
			if (num == 1 && (cart.getQuantityById(id) >= numStore)) {
		        num =0;
			}
			Item item = new Item(product, num, product.getPrice());
			cart.addItem(item);
			
			num = 0;
		//	System.out.println(num);
		}
		
		List<Item> items = cart.getItems();
		txt = "";
		if (items.size()>0) {
			txt = items.get(0).getProduct().getId() + ":" + items.get(0).getQuantity();
			for (int i = 1; i < items.size(); i++) {
				txt = txt + "/"+ items.get(i).getProduct().getId() + ":" + items.get(i).getQuantity();
			}
		}
		Cookie cookie = new Cookie("cart", txt);
		cookie.setMaxAge(60*60*60);
		response.addCookie(cookie);
		//request.setAttribute("cart", cart);
		
		//session.setAttribute("cart", cart);
		//session.setMaxInactiveInterval(7*24*24);
		//request.getRequestDispatcher("mycart.jsp").forward(request, response);
		 response.sendRedirect("cart.jsp");
	}

}
