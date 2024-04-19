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
		String a = "representatives";
		if(session.getAttribute("usertype").equals(a)){	
			String userid = request.getParameter("userid");
			String price = request.getParameter("price");
			String itemid = request.getParameter("itemid");
			if(!(userid.equals(null) || userid.equals("")) &&!(price.equals(null) || price.equals("")) &&!(itemid.equals(null) || itemid.equals(""))){
				ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			String sql = "DELETE FROM bids where userid = ? and price = ? and itemid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, price);
			ps.setString(3, itemid);
			ps.executeUpdate();
			out.print("Success");
			ps.close();
			con.close();
			}
			else{
				out.print("null or empty data");
			}
		}
		else{
			out.print("Not Customer representatives");
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed ");
	}
%>
</body>
</html>