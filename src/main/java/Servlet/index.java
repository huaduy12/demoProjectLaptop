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

import Dao.orderDao;
import Dao.productDao;
import Model.Cart;
import Model.Item;
import Model.Order;
import Model.Orderdetail;
import Model.Product;
import Model.User;

/**
 * Servlet implementation class index
 */
@WebServlet("/index")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 HttpSession session = request.getSession();
         
         User us = (User) session.getAttribute("user");
         
         
		// xử lý giỏ hàng với cookie khi đăng nhập
		
    	productDao productDAO = new productDao();
    	Cookie[] cookies = request.getCookies();
    	List<Product> list = productDAO.getListProducts();
		String txt = "";
		
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("cart")) {
					txt += cookie.getValue();
				}
				
			}
		}
		orderDao orderDao = new orderDao();
		Order order = orderDao.getOrderByUserId(us.getId());
		Cart cart = new Cart(txt, list);
		 List<Item> items = cart.getItems();
		  for(Item it : items){
			  Orderdetail orderdetail = new Orderdetail(it.getPrice(),it.getQuantity(),it.getPrice()*it.getQuantity(),
					  it.getProduct().getId(),order.getId());
			  Orderdetail checkOrderDetail = orderDao.getOrderDetail(orderdetail);
			    if(checkOrderDetail == null ) {
			    	//System.out.println(orderdetail.toString());
			    	orderDao.addOrderdetail(orderdetail);
			    }else {
			    	
			    	Orderdetail updateorderDetail = new Orderdetail
			    			(it.getPrice(),checkOrderDetail.getQuantity(),it.getProduct().getId(),order.getId() );
					orderDao.updateQuantityOrderDetail(updateorderDetail);
					
					checkOrderDetail = orderDao.getOrderDetail(orderdetail);
					
				   Orderdetail updateTotalorderDetail = new Orderdetail(it.getPrice(),checkOrderDetail.getQuantity(),
						   it.getPrice() *(checkOrderDetail.getQuantity()),it.getProduct().getId(),order.getId() );
				   
				   orderDao.updateTotalOrderDetail(updateTotalorderDetail);
					
				}
			  
			  
			  
		  }

		  // sau khi add vào database xong thì xóa cookie của cart đi
    
         if(us != null){ 
        
 		if(cookies != null) {
 			for (Cookie cookie : cookies) {
 				if (cookie.getName().equals("cart")) {
 					 Cookie cooe = new Cookie("cart", "");
 	    			cooe.setMaxAge(0);
 	    		//	System.out.print("remove");
 	    			response.addCookie(cooe);
 				}
 			}
 		}
         }
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
