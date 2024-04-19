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
		String a = "seller";
		if(session.getAttribute("usertype").equals(a)){
			
		String userid = (String)session.getAttribute("userid");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String sql = "insert into item(iniprice, closetime, minprice, description, type, bidincrement, userid) VALUES (?, date_add(?), ?, ?, ?, ?, ?)";
		String description = request.getParameter("description");
		String iniprice = request.getParameter("iniprice");
		String type = request.getParameter("type");
		String daytime = request.getParameter("daytime");
		String minprice = request.getParameter("minprice");
		String bidincrement = request.getParameter("bidincrement");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, iniprice);
		ps.setString(2, daytime);
		ps.setString(3, minprice);
		ps.setString(4, description);
		ps.setString(5, type);
		ps.setString(6, bidincrement);
		ps.setString(7, userid);
		ps.executeUpdate();
		ps.close();
		con.close();
		out.print("post success");
		}
		else{
			out.print("not seller");
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed ");
	}
%>
</body>
</html>