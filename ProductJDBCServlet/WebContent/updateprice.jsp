<%@page import="com.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDAOImpl"%>
<%@page import="com.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<title>Insert title here</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
		<a class="navbar-brand font-weight-bold" href="#">PRODUCT
			MANAGEMENT</a> <a class="btn btn-outline-light my-2 my-sm-0"
			href="logout">LOGOUT</a>
	</nav>
	<br>
	<br>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		ProductDAO dao = new ProductDAOImpl();
		Product p = dao.findById(id);
	%>
	<div style="text-align: center;">
	<h3>Enter the Details</h3>
	<br>
	<form action="updateprice" method="get" name="id">
		Enter new price &nbsp<input type="text" name="price"
			value="<%=p.getPrice()%>" /> <input type="hidden" name="id"
			value="<%=p.getpID()%>" /><br> <br> <input type="submit"
			value="update" />

	</form>
	</div>
	<footer class="page-footer fixed-bottom bg-dark ">
		<div class="footer-copyright text-center py-3 text-white">
			© 2020 Copyright: <a class="text-white" href="#"> CDKGLOBAL</a>
		</div>
	</footer>
</body>
</html>