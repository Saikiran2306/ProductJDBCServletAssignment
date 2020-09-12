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
<style type="text/css">
.center {
  margin-left: auto;
  margin-right: auto;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<%
		Object o = session.getAttribute("name");
	%>
<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
		<a class="navbar-brand font-weight-bold" href="#">PRODUCT
			MANAGEMENT</a>

		<%
			if (o != null) {
		%>

		<a class="btn btn-outline-light my-2 my-sm-0" href="logout">LOGOUT</a>

		<%
			} else {
		%>

		<a class="btn btn-outline-light my-2 my-sm-0" href="login.jsp">LOGIN</a>


		<%
			}
		%>

	</nav><br>
	<%
		ProductDAO dao = new ProductDAOImpl();
		List<Product> list = (List<Product>) dao.findAll();
		pageContext.setAttribute("list", list);
	%>
<div style="text-align: center;">
	<h3>Get Product Details</h3>
	<form action="displayproduct">
		<select name="id">
			<option>Select Id</option>
			<c:forEach items="${pageScope.list}" var="p">
				<option>${p.pID}</option>
			</c:forEach>
		</select> &nbsp <input type="submit" value="Get" />
	</form>
	<br>
</div>
	<table border="2" class="table w-25 center" >
		<tr>
			<th>Product ID</th>
			<td>${product.pID}</td>
		</tr>

		<tr>
			<th>Product Name</th>
			<td>${product.pName}</td>
		</tr>

		<tr>
			<th>Price</th>
			<td>${product.price}</td>
		</tr>

		<tr>
			<th>Quantity</th>
			<td>${product.quantity}</td>
		</tr>

		<tr>
			<th>Category</th>
			<td>${product.category}</td>
		</tr>

	</table>
	<br>
	<div style="text-align: center;">
	<a href="index.jsp">Home</a>
	</div>
	<footer class="page-footer fixed-bottom bg-dark ">
		<div class="footer-copyright text-center py-3 text-white">
			© 2020 Copyright: <a class="text-white" href="#"> CDKGLOBAL</a>
		</div>
	</footer>
</body></html>

