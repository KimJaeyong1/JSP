<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>   
<%@ page import="java.sql.Connection" %>   
<%@ page import="java.sql.PreparedStatement" %>   
<%@ page import="java.sql.ResultSet" %>   
<%@ page import="java.sql.SQLException" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int writeNum = Integer.parseInt(request.getParameter("NUM"));
	
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String dbId = "scott";
		String dbPw = "tiger";
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
		String SQL = "UPDATE B1 SET NUM = NULL WHERE NUM ="+writeNum;
	
		pstmt = conn.prepareStatement(SQL);
	
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	%>
	<script>
		alert("삭제 완료");
		location.href="board1.jsp";
	</script>
</body>
</html>