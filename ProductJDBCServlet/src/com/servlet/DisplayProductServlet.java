package com.servlet;

import java.io.IOException;

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
 * Servlet implementation class DisplayProduct
 */
@WebServlet("/displayproduct")
public class DisplayProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id=Integer.parseInt(request.getParameter("id"));
		ProductDAO dao=new ProductDAOImpl();
		Product p=dao.findById(id);
		request.setAttribute("product", p);
		RequestDispatcher dispatcher = request.getRequestDispatcher("findproduct.jsp");
		dispatcher.forward(request, response);
	}

	

}
