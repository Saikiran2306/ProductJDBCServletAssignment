<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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

	</nav>
	<div style="text-align: center;">
		
			<br>
			<h3>Welcome to the Product Management</h3>


			<br>
		
	
	
			<a href="findall">Display All Products</a> <br> <br> <a
				href="findproduct.jsp">Get Specific Product Details</a> <br> <br>
			<a href="findbycategory.jsp">Display Products by Category</a> <br>
			<br>

			<%
				if (o != null) {
			%>
			<a href="addproduct.jsp">Add Product</a>
			<%
				}
			%>

		</div>
	
	<footer class="page-footer fixed-bottom bg-dark ">
		<div class="footer-copyright text-center py-3 text-white">
			© 2020 Copyright: <a class="text-white" href="#"> CDKGLOBAL</a>
		</div>
	</footer>
</body>
</html>