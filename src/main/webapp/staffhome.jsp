<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Staff home</title>
	</head>
	
	<body>	
			<a href="logout.jsp">Logout</a>
	<br>
		<a href="getquestion.jsp">get questions(for Customer representatives)</a>
	<br>
	Answer question(for Customer representatives)
	<br>
		<form method="post" action="reply.jsp">
			<table>
				<tr>    
					<td>quesid</td><td><input type="text" name="quesid"></td>
				</tr>
				<tr>
					<td>reply</td><td><input type="text" name="answer"></td>
				</tr>
			</table>
				<input type="submit" value="reply">
		</form>
	<br>
	Reset passwords(for Customer representatives)
	<br>
		<form method="post" action="resetpassword.jsp">
			<table>
				<tr>    
					<td>User Email</td><td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>New Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
				<input type="submit" value="Reset Password">
		</form>
	<br>
	Create a new Customer representative account (for admin)
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
					<option value="representative">Customer representative</option>
					</select>&nbsp;<br>
				<input type="submit" value="Create">
		</form>
	<br>
	Remove bid(for Customer representative)
	<br>
		<form method="post" action="removebid.jsp">
			<table>
				<tr>
					<td>userid</td><td><input type="text" name="userid"></td>
				</tr>
				<tr>    
					<td>price</td><td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>itemid</td><td><input type="text" name="itemid"></td>
				</tr>
			</table>
				<input type="submit" value="Remove">
		</form>
	<br>
	Remove auction(for Customer representative)
	<br>
		<form method="post" action="removeauction.jsp">
			<table>
				<tr>
					<td>itemid</td><td><input type="text" name="itemid"></td>
				</tr>
			</table>
				<input type="submit" value="Remove">
		</form>
	<br>
	<a href="report.jsp">Get report(for admin)</a>
	<br>
	


</body>
</html>