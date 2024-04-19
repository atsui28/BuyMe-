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
		String itemid = request.getParameter("itemid");
		float p = Float.valueOf(request.getParameter("price"));
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String sql = "select TIMESTAMPDIFF(second, NOW(), item.closetime) AS time, b.price, item.bidincrement FROM item JOIN (SELECT itemid, max(price) AS price FROM bids GROUP BY itemid) AS b ON item.itemid = b.itemid WHERE item.itemid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, itemid);
		ResultSet rs = ps.executeQuery();
		rs.next();
		float np = Float.valueOf(rs.getString("b.price"));
		float bi = Float.valueOf(rs.getString("item.bidincrement"));
		int b = rs.getInt("time");
		if(b>10&&p-np>=bi){
			rs.close();
			sql = "insert into bids(userid, price, itemid) VALUES (?, ?, ?)";
			String price = request.getParameter("price");
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setFloat(2, p);
			ps.setString(3, itemid);
			ps.executeUpdate();
			
			sql = "select autobid.price, autobid.userid, MAX(bids.price)from autobid, bids where autobid.userid = bids.userid and bids.price < ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, price);
			ResultSet res = ps.executeQuery();
			if(res.next()){
				float ap = Float.valueOf(res.getString("autobid.price"));
				userid = res.getString("autobid.userid");
				if(p+bi<ap){
					sql = "insert into bids(userid, price, itemid) VALUES (?, ?, ?)";
					String description = request.getParameter("description");
					p = p + bi;
					ps.setString(1, userid);
					ps.setFloat(2, p);
					ps.setString(3, itemid);
					ps.executeUpdate();
				}
			}

			res.close();
			
			con.close();
			out.print("post success");
		}
		else{
			rs.close();
			ps.close();
			con.close();
			out.print("non-compliant");
		}
		}
		else{

			out.print("closed ");
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed ");
	}
%>
</body>
</html>