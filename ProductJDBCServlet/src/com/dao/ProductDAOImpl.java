package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.connection.MyConnection;
import com.pojo.Product;

public class ProductDAOImpl implements ProductDAO {

	@Override
	public int addProduct(Product product) {
		// TODO Auto-generated method stub
		int added = 0;
		try {
			
			String insert = "insert into product values(?,?,?,?,?)";
			PreparedStatement ps = MyConnection.getConnection().prepareStatement(insert);
			ps.setInt(1, product.getpID());
			ps.setString(2, product.getpName().toUpperCase());
			ps.setDouble(3, product.getPrice());
			ps.setInt(4, product.getQuantity());
			ps.setString(5, product.getCategory().toUpperCase());
			
			added = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		

		return added;
	}

	@Override
	public boolean updateProductPrice(int id, double price) {
		// TODO Auto-generated method stub
		boolean flag = false;

		try {

			String insert = "update product set price=? where pid=?";
			PreparedStatement ps = MyConnection.getConnection().prepareStatement(insert);
			ps.setDouble(1, price);
			ps.setInt(2, id);
			int update = ps.executeUpdate();
			if (update > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public boolean updateProductQuantity(int id, int quantity) {
		// TODO Auto-generated method stub
		boolean flag = true;

		try {

			String insert = "update product set quantity=? where pid=?";
			PreparedStatement ps = MyConnection.getConnection().prepareStatement(insert);
			ps.setInt(1, quantity);
			ps.setInt(2, id);
			int update = ps.executeUpdate();
			if (update > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return flag;
	}

	@Override
	public Product findById(int id) {
		// TODO Auto-generated method stub
		Product p = null;
		try {

			String data = "select * from product where pid=?";
			PreparedStatement ps = MyConnection.getConnection().prepareStatement(data);
			ps.setInt(1, id);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				p = new Product(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3), resultSet.getInt(4),
						resultSet.getString(5));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		List<Product> products = new ArrayList<Product>();
		try {

			String data = "select * from product";
			Statement s = MyConnection.getConnection().createStatement();

			ResultSet resultSet = s.executeQuery(data);

			while (resultSet.next()) {
				Product p = new Product(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getInt(4), resultSet.getString(5));
				products.add(p);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	@Override
	public List<Product> findAllByCategory(String category) {
		// TODO Auto-generated method stub
		boolean flag = false;
		List<Product> products=new ArrayList<>();
		
		try {

			String data = "select *  from product where category=?";
			PreparedStatement ps = MyConnection.getConnection().prepareStatement(data);
			ps.setString(1, category.toUpperCase());
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				Product p = new Product(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getInt(4), resultSet.getString(5));
				
	
				
					products.add(p);
			
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return products;
	}

	@Override
	public int deleteById(int id) {
		// TODO Auto-generated method stub
		int added = 0;
		String insertData = "delete from product where pid=?";

		try {
			PreparedStatement ps = MyConnection.getConnection().prepareStatement(insertData);
			ps.setInt(1, id);
			added = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return added;
	}

}
