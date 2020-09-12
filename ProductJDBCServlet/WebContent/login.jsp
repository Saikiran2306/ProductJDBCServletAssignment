<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
		<a class="navbar-brand font-weight-bold" href="#">PRODUCT
			MANAGEMENT</a> 
	</nav><br>

		<div style="text-align: center;">

		<h3>Enter Login Credentials</h3><br>
		<form action="login" method="post">
			 <input type="text" name="username"
				placeholder="Enter username" required /> <br> <br>
			 <input type="password" name="password"
				placeholder="Enter password" required /> <br> <br> <input
				type="submit" value="LOGIN" />
		</form>
	</div>
	<footer class="page-footer fixed-bottom bg-dark ">
    <div class="footer-copyright text-center py-3 text-white">© 2020 Copyright:
        <a class="text-white" href="#"> CDKGLOBAL</a>
    </div>
</footer>
</body>
</html>