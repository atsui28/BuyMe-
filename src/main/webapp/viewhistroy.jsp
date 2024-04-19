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
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			String str;
			String itemid = request.getParameter("itemid");
			str = "SELECT bids.*, user.name, user.email, user.anonymize from bids, user where bids.itemid = ? and bids.userid = user.userid";
            PreparedStatement ps = con.prepareStatement(str);
            ps.setString(1, itemid);
            ResultSet rs = ps.executeQuery();
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>");
			out.print("itemid");
			out.print("</td>");
			out.print("<td>");
			out.print("price");
			out.print("</td>");
			out.print("<td>");
			out.print("email");
			out.print("</td>");
			out.print("<td>");
			out.print("name");
			out.print("</td>");
			out.print("</tr>");
			String anonymization = "false";
			while (rs.next()) {
				if(anonymization.equals(rs.getString("user.anonymize"))){
				out.print("<tr>");
				out.print("<td>");
				out.print(rs.getString("bids.itemid"));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString("bids.price"));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString("user.email"));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString("user.name"));
				out.print("</td>");
				out.print("</tr>");
				}
				else{
					out.print("<tr>");
					out.print("<td>");
					out.print(rs.getString("bids.itemid"));
					out.print("</td>");
					out.print("<td>");
					out.print(rs.getString("bids.price"));
					out.print("</td>");
					out.print("<td>");
					out.print("hidden");
					out.print("</td>");
					out.print("<td>");
					out.print("hidden");
					out.print("</td>");
					out.print("</tr>");
				}
			}
			out.print("</table>");

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>