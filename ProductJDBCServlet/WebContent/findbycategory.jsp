<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
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
<style type="text/css">
.center {
  margin-left: auto;
  margin-right: auto;
}
</style>
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
		Set<String> result=new HashSet<>();
		for(Product p:list)
		{
			result.add(p.getCategory());
		}
		pageContext.setAttribute("result", result);
	%>
<div style="text-align: center;">
	<h3>Get Similar Category of Products</h3> <br>
	
	<form action="displaybycategory">
	
		<select name="category">
		<option>Select Id</option>
			<c:forEach items="${pageScope.result}" var="cat">
				<option>${cat}</option>
			</c:forEach>
		</select> &nbsp <input type="submit" value="Get" />
	</form>
	</div>
	<br>

	<table border="2" class="table w-50 center">
		<tr>
			<th>Product ID</th>
			<th>Product Name</th>
			<th>Price</th>
			<th>Quantity</th>

		</tr>
		<c:forEach items="${products}" var="p">
			<tr>
				<td>${p.pID}</td>
				<td>${p.pName }</td>
				<td>${p.price }</td>
				<td>${p.quantity}</td>
			</tr>
		</c:forEach>
	</table>

	<br>
	<div style="text-align: center;">
<a href="index.jsp">Home</a>
</div>
<footer class="page-footer fixed-bottom bg-dark ">
    <div class="footer-copyright text-center py-3 text-white">© 2020 Copyright:
        <a class="text-white" href="#"> CDKGLOBAL</a>
    </div>
</footer>
</body>
</html>