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
			String a = "buyer";
			if(session.getAttribute("usertype").equals(a)){
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			String str;
			String userid = (String)session.getAttribute("userid");
			str = "SELECT item.*, b.price FROM item JOIN (SELECT itemid, max(price) AS price, userid FROM bids GROUP BY itemid) AS b ON item.itemid = b.itemid WHERE b.userid = ? and TIMESTAMPDIFF(second, NOW(), item.closetime) <= 0 and b.price >= item.minprice";
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1, userid);
			ResultSet result = ps.executeQuery();
			while(result.next()){
				out.println("won the auction for item  " + result.getString("item.itemid") + " price " + result.getString("b.price") + " description:" + result.getString("item.description"));
			}
			result.close();
			str = "select alertid, type, price, description from alert where userid = ?";
			ps = con.prepareStatement(str);
			ps.setString(1, userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String des = rs.getString("description");
				String price = rs.getString("price");
				String type = rs.getString("type");
				des = "%" + des + "%";
				str = "SELECT item.*, b.price FROM item JOIN (SELECT itemid, max(price) AS price FROM bids GROUP BY itemid) AS b ON item.itemid = b.itemid WHERE item.description LIKE ? and item.type = ? and item.price >= ? - 100 and item.price <= ? + 100";
	            ps = con.prepareStatement(str);
	            ps.setString(1, des);
	            ps.setString(2, type);
	            ps.setString(3, price);
	            ps.setString(4, price);
	            ResultSet res = ps.executeQuery();
	            out.print(rs.getString("alertid"));
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
				out.print("<br>");
				res.close();
			}
			rs.close();
			ps.close();
			con.close();
			}
			
			else{
				out.print("not buyer ");
			}
		} catch (Exception e) {
		}
	%>

</body>
</html>