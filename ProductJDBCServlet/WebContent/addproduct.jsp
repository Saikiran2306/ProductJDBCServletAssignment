<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
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
	</nav><br>
	<div style="text-align: center;">
	<span class="text-info">
	<%
		
		Object o = session.getAttribute("name");
	   Object o1 = request.getAttribute("check");
	  
		if (o1 != null)
		{
			
			String ch=(String)o1;
			if(ch.equals("1"))
			out.println(request.getAttribute("message"));
		}
	%>
	</span>
	<br>
	
	<h3>Provide the following details to add product</h3>
	<br>

	<form action="add" method="post">

		Product ID &nbsp <input type="text" name="id" required /> <br> <br>
		Product Name &nbsp <input type="text" name="name" required> <br>
		<br> Product Quantity &nbsp <input type="text" name="quantity"
			required /> <br> <br> Product Price &nbsp <input
			type="text" name="price" required /> <br> <br> Product
		Category &nbsp <input type="text" name="category" required /> <br>
		<br> <input type="submit" value="Add" />
	</form>
	</div>
<footer class="page-footer fixed-bottom bg-dark ">
    <div class="footer-copyright text-center py-3 text-white">© 2020 Copyright:
        <a class="text-white" href="#"> CDKGLOBAL</a>
    </div>
</footer>
</body>
</html>