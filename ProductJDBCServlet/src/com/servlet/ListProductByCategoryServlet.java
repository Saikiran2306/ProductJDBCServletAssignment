package com.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDAO;
import com.dao.ProductDAOImpl;
import com.pojo.Product;

/**
 * Servlet implementation class ListProductByCategoryServlet
 */
@WebServlet("/displaybycategory")
public class ListProductByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListProductByCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cat=request.getParameter("category");
		ProductDAO dao=new ProductDAOImpl();
		List<Product> products=dao.findAllByCategory(cat);
		
		request.setAttribute("products", products);
		RequestDispatcher dispatcher = request.getRequestDispatcher("findbycategory.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
