<%@page import="com.pojo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
.my-custom-scrollbar {
	position: relative;
	height: 350px;
	width: 700px;
	overflow: auto;
}

.table-wrapper-scroll-y {
	display: block;
}
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

	</nav>
	<br><br>
<div style="text-align: center;">
	<h3>List of Products</h3><br>
	</div>
	<div
		class="table-wrapper-scroll-y my-custom-scrollbar table-striped center">
		<table border="2" class="table">
			<thead class="thead-inverse">
				<tr class="font-weight-bold">
					<th>Id</th>
					<th>Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Category</th>
					<%
							if (o != null) {
						%>
					<th>Delete</th>
					<th>Update</th>
					<%
							}
						%>
				</tr>
			</thead>
			<tbody class="overflow-auto">
				<c:forEach items="${products}" var="p">
					<tr class="f-15">
						<td>${p.pID}</td>
						<td>${p.pName }</td>
						<td>${p.price }</td>
						<td>${p.quantity}</td>
						<td>${p.category}</td>
						<%
								if (o != null) {
							%>
						<td><a href="deleteid?id=${p.pID}">Delete</a></td>
						<td><a href="updateprice.jsp?id=${p.pID}">Update</a></td>
						<%
								}
							%>

					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<div style="text-align: center;">
	<a href="index.jsp">Home</a>
	</div>
	<footer class="page-footer fixed-bottom bg-dark ">
		<div class="footer-copyright text-center py-3 text-white">
			© 2020 Copyright: <a class="text-white" href="#"> CDKGLOBAL</a>
		</div>

	</footer>
</body>
</html>