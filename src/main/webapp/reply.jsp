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
			String answer = request.getParameter("answer");
			String quesid = request.getParameter("quesid");
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			String sql = "UPDATE questions SET answer = ? where quesid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, answer);
			ps.setString(2, quesid);
			ps.executeUpdate();
			ps.close();
			con.close();
		}
		else{
			out.print("Success");
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed ");
	}
%>
</body>
</html>