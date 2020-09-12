package com.servlet;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class UpdatePriceServlet
 */
@WebServlet("/updateprice")
public class UpdatePriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePriceServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		double price = Double.parseDouble(request.getParameter("price"));
		ProductDAO dao = new ProductDAOImpl();
		dao.updateProductPrice(id, price);

		List<Product> products = dao.findAll();
		request.setAttribute("products", products);
		RequestDispatcher dispatcher = request.getRequestDispatcher("displayall.jsp");
		dispatcher.forward(request, response);

	}

}
