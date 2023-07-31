package Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.productDao;
import Model.Galery;

/**
 * Servlet implementation class Addthumbnail
 */
@WebServlet("/Addthumbnail")
public class Addthumbnail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addthumbnail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idString = request.getParameter("idproduct");
		int id = -1;
		
		if (idString != null) {
			id = Integer.parseInt(idString);
		}
		productDao productDao = new productDao();
		List<Galery> galeries = productDao.getListGaleries(id);
		int size = galeries.size();
		if(size == 4) {
			request.setAttribute("galeries1", galeries.get(0));
			request.setAttribute("galeries2", galeries.get(1));
			request.setAttribute("galeries3", galeries.get(2));
			request.setAttribute("galeries4", galeries.get(3));
		}
		
		
		request.setAttribute("id", id);
		request.setAttribute("size", galeries.size());
		request.getRequestDispatcher("addThumbnail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int idproduct = Integer.parseInt(request.getParameter("idproduct"));
		String id1 = request.getParameter("id1");
		String id2 = request.getParameter("id2");
		String id3 = request.getParameter("id3");
		String id4 = request.getParameter("id4");
		
		
		String thumbnail1 = request.getParameter("thumbnail1");
		String thumbnail2 = request.getParameter("thumbnail2");
		String thumbnail3 = request.getParameter("thumbnail3");
		String thumbnail4 = request.getParameter("thumbnail4");
		
		productDao productDao = new productDao();
		
		List<Galery> galeries = productDao.getListGaleries(idproduct);
		if(galeries.size() ==0) {
			productDao.addGalery(thumbnail1, idproduct);
			productDao.addGalery(thumbnail2, idproduct);
			productDao.addGalery(thumbnail3, idproduct);
			productDao.addGalery(thumbnail4, idproduct);
		}else {
			productDao.updateGalery(id1, thumbnail1);
			productDao.updateGalery(id2, thumbnail2);
			productDao.updateGalery(id3, thumbnail3);
			productDao.updateGalery(id4, thumbnail4);
		}
		
		response.sendRedirect("ManageProduct");
		
	}

}
