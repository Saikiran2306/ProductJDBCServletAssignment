package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDAO;
import com.dao.ProductDAOImpl;
import com.pojo.Product;

/**
 * Servlet implementation class ListAllProductsServlet
 */
@WebServlet("/findall")
public class ListAllProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListAllProductsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAOImpl();
		List<Product> products = dao.findAll();
		HttpSession session = request.getSession(false);
		String name = (String) session.getAttribute("name");
		session.setAttribute("name", name);

		request.setAttribute("products", products);
		RequestDispatcher dispatcher = request.getRequestDispatcher("displayall.jsp");
		dispatcher.forward(request, response);

	}

}
