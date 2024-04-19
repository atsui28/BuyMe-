<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>login</title>
	</head>
	
	<body>	
	Log in
	<br>
		<form method="post" action="login.jsp">
			<table>
				<tr>    
					<td>Email</td><td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
					<select name="type" size=1>
					<option value="buyer">buyer</option>
					<option value="seller">seller</option>
					<option value="representatives">representatives</option>
					<option value="admin">admin</option>
					</select>&nbsp;<br>
				<input type="submit" value="Log in">
		</form>
	<br>
	Create a new account
	<br>
		<form method="post" action="create.jsp">
			<table>
				<tr>
					<td>Email</td><td><input type="text" name="email"></td>
				</tr>
				<tr>    
					<td>Name</td><td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
					<select name="type" size=1>
					<option value="buyer">buyer</option>
					<option value="seller">seller</option>
					</select>&nbsp;<br>
				<input type="submit" value="Create">
		</form>
	<br>
	Delete account
	<br>
		<form method="post" action="delete.jsp">
			<table>
				<tr>
					<td>Email</td><td><input type="text" name="email"></td>
				</tr>
				<tr>    
					<td>Name</td><td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
					<select name="type" size=1>
					<option value="buyer">buyer</option>
					<option value="seller">seller</option>
					</select>&nbsp;<br>
				<input type="submit" value="Delete">
		</form>
	<br>
	
	


</body>
</html>