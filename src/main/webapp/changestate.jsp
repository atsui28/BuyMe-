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
		String userid = (String)session.getAttribute("userid");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String sql = "UPDATE user SET user.anonymize = ? WHERE userid = ?";
		String anonymize = request.getParameter("anonymize");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, anonymize);
		ps.setString(2, userid);
		ps.executeUpdate();
		ps.close();
		con.close();
		out.print("change success");
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed ");
	}
%>
</body>
</html>