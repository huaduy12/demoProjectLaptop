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
import Model.Product;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServletCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		   String referer = request.getHeader("Referer"); // Lấy URL trang trước đó
        productDao productDAO = new productDao();
		
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
		
		
		String id = request.getParameter("id");
		String num = "1";
		if(request.getParameter("num") != null) {
			num = String.valueOf(request.getParameter("num"));
		}
		
		if(txt.length() == 0) {
			txt = id + ":" + num;
		}
		else {
			txt = txt +"/" + id + ":" + num;
		}
		
		Cookie cookie = new Cookie("cart", txt);
		cookie.setMaxAge(60*60*60);
		response.addCookie(cookie);
		HttpSession session = request.getSession();
		   session.setAttribute("cartMessage", "Thêm vào giỏ hàng thành công");
			response.sendRedirect(referer);

	}

}
