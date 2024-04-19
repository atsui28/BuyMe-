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
	<%! 
	Integer id;
	String username;
	String userpassword;
	String useremail;
	String usertype;
	%>
	<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String sql = "select * from user where email=? and password=? and type=?";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		String buyer = "buyer";
		String seller = "seller";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		ps.setString(3, type);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{			
			useremail = rs.getString("email");
			userpassword = rs.getString("password");
			type = rs.getString("type");
			Integer userid = rs.getInt("userid");
				if(buyer.equals(type)|seller.equals(type)){
					session.setAttribute("userid", userid);
					session.setAttribute("name",username);
					session.setAttribute("email",useremail);
					session.setAttribute("usertype", type);					
					response.sendRedirect("enduserhome.jsp");
				}
				else{
					session.setAttribute("userid", userid);
					session.setAttribute("name",username);
					session.setAttribute("email",useremail);
					session.setAttribute("usertype", type);					
					response.sendRedirect("staffhome.jsp");
				}
				
			
		}
		rs.close();
		ps.close();
		con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("Log in failed ");
	}
%>
</body>
</html>