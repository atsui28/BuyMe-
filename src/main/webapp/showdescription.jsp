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
			String a = "greater";
			String str;
			String des = request.getParameter("description");
			des = "%" + des + "%";
			str = "SELECT item.*, b.price FROM item JOIN (SELECT itemid, max(price) AS price FROM bids GROUP BY itemid) AS b ON item.itemid = b.itemid WHERE item.description LIKE ?";
            PreparedStatement ps = con.prepareStatement(str);
            ps.setString(1, des);
            ResultSet rs = ps.executeQuery();
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>");
			out.print("itemid");
			out.print("</td>");
			out.print("<td>");
			out.print("category");
			out.print("</td>");
			out.print("<td>");
			out.print("description");
			out.print("</td>");
			out.print("<td>");
			out.print("closetime");
			out.print("</td>");
			out.print("<td>");
			out.print("current price");
			out.print("</td>");
			out.print("<td>");
			out.print("bidincrement");
			out.print("</td>");
			out.print("</tr>");
			while (rs.next()) {
				out.print("<tr>");
				out.print("<td>");
				out.print(rs.getString("item.itemid"));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString("item.type"));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString("item.description"));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString("item.closetime"));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString("b.price"));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString("item.bidincrement"));
				out.print("</td>");
				out.print("</tr>");

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