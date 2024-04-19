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
			str = "SELECT item.type, b.price FROM item JOIN (SELECT itemid, max(price) AS price FROM bids GROUP BY itemid) AS b ON item.itemid = b.itemid WHERE itemid = ?";
            PreparedStatement ps = con.prepareStatement(str);
            ps.setString(1, itemid);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
				String type = rs.getString("item.type");
				float price = Float.valueOf(rs.getString("b.price"));
				str = "SELECT item.*, b.price FROM item JOIN (SELECT itemid, max(price) AS price FROM bids GROUP BY itemid) AS b ON item.itemid = b.itemid WHERE item.type = ? and item.price >= ? and item.price <= ? and TIMESTAMPDIFF(day, item.closetime, NOW()) <= 30";
				ps = con.prepareStatement(str);
	            ps.setString(1, type);
	            ps.setFloat(2, price-100);
	            ps.setFloat(3, price+100);
	            ResultSet res = ps.executeQuery();
	            out.print("<br>");
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
				while (res.next()) {
					out.print("<tr>");
					out.print("<td>");
					out.print(res.getString("item.itemid"));
					out.print("</td>");
					out.print("<td>");
					out.print(res.getString("item.type"));
					out.print("</td>");
					out.print("<td>");
					out.print(res.getString("item.description"));
					out.print("</td>");
					out.print("<td>");
					out.print(res.getString("item.closetime"));
					out.print("</td>");
					out.print("<td>");
					out.print(res.getString("b.price"));
					out.print("</td>");
					out.print("<td>");
					out.print(res.getString("item.bidincrement"));
					out.print("</td>");
					out.print("</tr>");

				}
				out.print("</table>");
				ps.close();
				res.close();
				
            }

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>