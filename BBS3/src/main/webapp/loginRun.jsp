<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		if(userId == "" || userPw == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디와 비밀번호를 입력해 주세요.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");			
		}
		
		if(userId != null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
				String dbId = "scott";
				String dbPw = "tiger";
				
				conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
				
				String SQL = "SELECT PW, ID FROM MEMBER WHERE ID = ?";			
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userId);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					if(rs.getString(1).equals(userPw) && rs.getString(2).equals(userId)) {
						session.setAttribute("sessionId", userId);
						response.sendRedirect("index.jsp");
					} else if (rs.getString(2).equals(userId)) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('비밀번호를 확인해 주세요.')");
						script.println("location.href = 'index.jsp'");
						script.println("</script>");			
					} else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('아이디를 확인해 주세요.')");
						script.println("location.href = 'index.jsp'");
						script.println("</script>");	
					}
				} 
				
			} catch(Exception e) {
				e.getStackTrace();
			}
		}
		
	%>
</body>
</html>