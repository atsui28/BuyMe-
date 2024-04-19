<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String sql = "insert into user(username, password, usertype, email, anonymize)"+ "VALUES (?, ?, ?, ?, false)";;
		String email = request.getParameter("email");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, account);
		ps.setString(2, password);
		ps.setString(3, type);
		ps.setString(4, email);
		ps.executeUpdate();
		ps.close();
		con.close();
		out.print("Account created");
	} catch (Exception ex) {
		out.print(ex);
		out.print("Failed ");
	}
%>
</body>
</html>