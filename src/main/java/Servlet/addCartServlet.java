package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.cartDao;
import Dao.productDao;
import Model.Cart;
import Model.Cartdetail;
import Model.Product;
import Model.User;

/**
 * Servlet implementation class addCartServlet
 */
@WebServlet("/addCartServlet")
public class addCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCartServlet() {
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
	    
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");
	    
	    
	    productDao productDao = new productDao();
		String idProduct = request.getParameter("idproductcart");
		int id =-1;
		if(idProduct != null) {
			id = Integer.parseInt(idProduct);
		}
		Product product = productDao.getProductById(id);
		
		// kiểm tra xem trong cart có user_id chưa, chưa thì tạo , có thì tìm id của cart có user_id đó
		
		cartDao cartDao = new cartDao();
		Cart cart = cartDao.getCartByUserId(user.getId());
		
		if(cart == null) {
			Cart newCart = new Cart(0, user.getId());
			cartDao.addCart(newCart);
			 cart = newCart; // Gán cart mới tạo cho biến cart
		}
		// cập nhập lại cart
		cart = cartDao.getCartByUserId(user.getId());
		 // Thêm sản phẩm vào chi tiết giỏ hàng (cartDetail)
	    Cartdetail cartDetail = new Cartdetail(1,cart.getId(), product.getId(),product.getDiscount());
	    
	    Cartdetail checkCartDetail = cartDao.getCartDetai(cartDetail);
	    if(checkCartDetail == null ) {
	    	cartDao.addCartdetail(cartDetail);
	    }else {
	    	
	    	Cartdetail updatecartDetail = new Cartdetail(checkCartDetail.getQuantity(),cart.getId(), product.getId());
			cartDao.updateQuantityCartDetail(updatecartDetail);
			
		   checkCartDetail = cartDao.getCartDetai(cartDetail);
		   Cartdetail updateTotalcartDetail = new Cartdetail(checkCartDetail.getQuantity(),cart.getId(), product.getId(),product.getDiscount()*(checkCartDetail.getQuantity()));
		   cartDao.updateTotalCartDetail(updateTotalcartDetail);
			
		}
	    
		
	  // Cập nhật tổng giá trị giỏ hàng cart (nếu cần thiết)
	  
	    List<Cartdetail> cartdetails = cartDao.getListCartdetailByCart_id(cart.getId());
	   double total = 0.0;
	   for (Cartdetail c : cartdetails) {
		total += c.getTotal_item();
	   }
	  
	   Cart cart2 = new Cart(cart.getId(),total,cart.getUser_id());
	   cartDao.updateCart(cart2);
		
		response.sendRedirect("index.jsp");
	}

}
