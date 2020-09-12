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
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/add")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		String category = request.getParameter("category");
		Product p = new Product(id, name, price, quantity, category);
		ProductDAO dao = new ProductDAOImpl();
		int added = dao.addProduct(p);
		if (added > 0) {
			
			List<Product> products=dao.findAll();
			request.setAttribute("products", products);

			RequestDispatcher dispatcher = request.getRequestDispatcher("displayall.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("check", "1");
			request.setAttribute("message", "CAN'T Add The Product,It already exists");
			RequestDispatcher dispatcher = request.getRequestDispatcher("addproduct.jsp");
			dispatcher.forward(request, response);
		}
	}
	}


