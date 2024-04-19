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
		List<String> list = new ArrayList<String>();

		try {
			String a = "representatives";
			if(session.getAttribute("usertype").equals(a)){	
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();	
				Statement stmt = con.createStatement();
				String str;
				str = "SELECT * form questions where answer is null ";
	            PreparedStatement ps = con.prepareStatement(str);
	            ResultSet rs = ps.executeQuery();
				out.print("<table>");
				out.print("<tr>");
				out.print("<td>");
				out.print("question");
				out.print("</td>");
				out.print("<td>");
				out.print("quesid");
				out.print("</td>");
				out.print("</tr>");
				while (rs.next()) {
					out.print("<tr>");
					out.print("<td>");
					out.print(rs.getString("qusetion"));
					out.print("</td>");
					out.print("<td>");
					out.print(rs.getString("quesid"));
					out.print("</td>");
					out.print("</tr>");
				}
				out.print("</table>");
				rs.close();
				ps.close();
				con.close();
			}
		} catch (Exception e) {
		}
	%>

</body>
</html>