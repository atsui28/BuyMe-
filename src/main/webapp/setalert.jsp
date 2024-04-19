<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
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
			String a = "buyer";
			if(session.getAttribute("usertype").equals(a)){
				
			String userid = (String)session.getAttribute("userid");
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			String sql = "insert into alert(userid, type, price, description, alertid) values (?, ?, ?, ?, ?)";
			String type = request.getParameter("type");
			String price = request.getParameter("price");
			String description = request.getParameter("description");
			String alertid = request.getParameter("key");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, type);
			ps.setString(3, price);
			ps.setString(4, description);
			ps.setString(5, alertid);
			ps.executeUpdate();
			ps.close();
			con.close();
			out.print("Success");
			}
		} catch (Exception ex) {
			out.print(ex);
			out.print("failed ");
		}
	%>

</body>
</html>