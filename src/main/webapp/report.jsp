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
		String a = "admin";
		if(session.getAttribute("usertype").equals(a)){	
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			String sql = "select SUM(b.price) AS total FROM item JOIN (SELECT itemid, max(price) AS price FROM bids GROUP BY itemid) AS b ON item.itemid = b.itemid WHERE TIMESTAMPDIFF(second, NOW(), item.closetime) <= 0";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			out.println("Total earning is " + rs.getString("total"));
			float total = Float.valueOf(rs.getString("total"));
			rs.close();
			sql = "select count(itemid) as num form item";
			ResultSet res = stmt.executeQuery(sql);
			res.next();
			out.println("Earning per item is" + total/Float.valueOf(res.getString("num")));
			res.close();
			sql = "select item.type, AVG(b.price) AS price FROM item JOIN (SELECT itemid, max(price) AS price FROM bids GROUP BY itemid) AS b ON item.itemid = b.itemid WHERE TIMESTAMPDIFF(second, NOW(), item.closetime) <= 0";
			ResultSet resu = stmt.executeQuery(sql);
			while(resu.next()){
				out.println("earning per " + rs.getString("item.type") + " is " + rs.getString("price"));
			}
			resu.close();
			sql = "select count(userid) as people from user where type = buyer or type = seller";
			ResultSet resul = stmt.executeQuery(sql);
			resul.next();
			out.println("Earning per enduser is" + total/Float.valueOf(res.getString("people")));
			resul.close();
			sql = "select item.userid, count(item.itemid) as amount from item, bids where WHERE item.itemid = bids.itemid and TIMESTAMPDIFF(second, NOW(), item.closetime) <= 0 and max(bids.price) >= item.minprice";
			ResultSet result = stmt.executeQuery(sql);
			while(resu.next()){
				out.println("Best selling user: " + rs.getString("userid") + " sells " + rs.getString("amount"));
			}
			result.close();
			con.close();
		}
		else{
			out.print("Not admin");
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed ");
	}
%>
</body>
</html>