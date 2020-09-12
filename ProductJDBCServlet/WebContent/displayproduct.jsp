<%@page import="com.pojo.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Product e=(Product)request.getAttribute("product"); %>
Product Details <br> 
Id :${product.pID}<br>
Name :${product.pName}<br>
Price :${product.price}<br>
Quantity :${product.quantity}<br>
Category :${product.category}<br>
<br>


	<br>
<a href="index.jsp">Home</a>
</body>
</html>