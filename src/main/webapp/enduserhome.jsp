<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>End user</title>
	</head>
	
	<body>	
		<a href="autobidstatus.jsp">Get automatic bidding status(for buyers)</a>
	<br>
		<a href="showalert.jsp">Get possible alert feedback(for buyers)</a>
	<br>
		<a href="logout.jsp">Logout</a>
	<br>
	Change anonymize state
	<br>
		<form method="post" action="changestate.jsp">
			<select name="anonymize" size=1>
				<option value="true">true</option>
				<option value="false">false</option>
			</select>&nbsp;<br> <input type="submit" value="Change">
		</form>
	<br>
	View history of bids for an item
	<br>
		<form method="get" action="viewhistory.jsp">
			<table>
				<tr>    
					<td>itemid</td><td><input type="text" name="itemid"></td>
				</tr>
			</table>
			<input type="submit" value="Search">
		</form>
	<br>
	View history of bids for a user
	<br>
		<form method="get" action="viewuser.jsp">
			<table>
				<tr>    
					<td>user email</td><td><input type="text" name="email"></td>
				</tr>
			</table>
			<input type="submit" value="Search">
		</form>
	<br>
	View similar items on auction in the preceding month(also include items on auction)
	<br>
		<form method="get" action="viewsimilar.jsp">
			<table>
				<tr>    
					<td>itemid</td><td><input type="text" name="itemid"></td>
				</tr>
			</table>
			<input type="submit" value="Search">
		</form>
	<br>
	Search items by type <!-- reference query.jsp -->
	<br>
		<form method="get" action="showtype.jsp">
			<select name="type" size=1>
				<option value="truck">truck</option>
				<option value="motorbike">motorbike</option>
				<option value="car">car</option>
			</select>&nbsp;<br> <input type="submit" value="Search">
		</form>
	<br>
	Search items by price<!-- reference query.jsp -->
	<br>
		<form method="get" action="showprice.jsp">
			<select name="area" size=1>
				<option value="under">under or equal</option>
				<option value="greater">greater than</option>
			</select>&nbsp;<br> 
			<table>
				<tr>    
					<td>Price</td><td><input type="text" name="price"></td>
				</tr>
			</table>
			<input type="submit" value="Search">
		</form>
	<br>
	Search items by keywords<!-- reference query.jsp -->
	<br>
		<form method="get" action="showdescription.jsp">
			<table>
				<tr>    
					<td>Keywords</td><td><input type="text" name="description"></td>
				</tr>
			</table>
			<input type="submit" value="Search">
		</form>
	<br>
	Post items (only for sellers)
	<br>
		<form method="post" action="postitem.jsp">
		<select name="type" size=1>
				<option value="truck">truck</option>
				<option value="motorbike">motorbike</option>
				<option value="car">car</option>
			</select>&nbsp;
			<table>
				<tr>
					<td>description</td><td><input type="text" name="type"></td>
				</tr>
				<tr>    
					<td>initial price</td><td><input type="text" name="iniprice"></td>
				</tr>
				<tr>
					<td>bid increment</td><td><input type="text" name="bidincrement"></td>
				</tr>
				<tr>
					<td>min price</td><td><input type="text" name="minprice"></td>
				</tr>
				<tr>
					<td>date and time as a value in YYYY-MM-DD hh:mm:ss</td>
				</tr>
				<tr>
					<td>daytime</td><td><input type="text" name="daytime"></td>
				</tr>
			</table>
				<input type="submit" value="Post item">
		</form>
	<br>
	Post bid (only for buyers)
	<br>
		<form method="post" action="delete.jsp">
			<table>
				<tr>
					<td>Itemid</td><td><input type="text" name="itemid"></td>
				</tr>
				<tr>    
					<td>price</td><td><input type="text" name="price"></td>
				</tr>
			</table>
			<input type="submit" value="Post bid">
		</form>
	<br>
	Set automatic bidding(only for buyers)
	<br>
		<form method="post" action="setautobid.jsp">
			<table>
				<tr>
					<td>Itemid</td><td><input type="text" name="itemid"></td>
				</tr>
				<tr>    
					<td>upper limit</td><td><input type="text" name="price"></td>
				</tr>
			</table>
			<input type="submit" value="Set">
		</form>
	<br>
	Set item alerts(for buyers)
	<br>
		<form method="post" action="setalert.jsp">
			<select name="type" size=1>
				<option value="truck">truck</option>
				<option value="motorbike">motorbike</option>
				<option value="car">car</option>
			</select>&nbsp;
			<table>
				<tr>    
					<td>Keywords</td><td><input type="text" name="description"></td>
				</tr>
				<tr>    
					<td>Price around(+-100)</td><td><input type="text" name="price"></td>
				</tr>
				<tr>    
					<td>Enter a key that identify this alert</td><td><input type="text" name="key"></td>
				</tr>
			</table>
			<input type="submit" value="Set">
		</form>
	<br>
	Ask questions
	<br>
		<form method="post" action="askques.sjp">
			<table>
				<tr>
					<td>Question</td><td><input type="text" name="ques"></td>
				</tr>
			</table>
			<input type="submit" value="Submit">
		</form>
	<br>
	Search questions
	<br>
		<form method="get" action="searchques.jsp">
			<table>
				<tr>
					<td>Keywords</td><td><input type="text" name="key"></td>
				</tr>
			</table>
			<input type="submit" value="Search">
		</form>
	<br>
</body>
</html>