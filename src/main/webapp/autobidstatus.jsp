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
		String a = "buyer";
		if(session.getAttribute("usertype").equals(a)){
			
		String userid = (String)session.getAttribute("userid");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String sql = "select itemid from autobid where userid = ?";
		String bidincrement = request.getParameter("bidincrement");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String itemid = rs.getString("itemid");
			sql = "select userid, max(price) form bids where itemid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, itemid);
			ResultSet res = ps.executeQuery();
			res.next();
			if(userid.equals(res.getString("userid"))){
				out.print("You are the highest price for item" + itemid);
			}
			else{
				out.print("someone bids highier than you for item" + itemid);
			}
			res.close();
		}
		ps.close();
		con.close();
		}
		else{
			out.print("not buyer");
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed ");
	}
%>
</body>
</html>