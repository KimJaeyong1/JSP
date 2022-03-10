<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 저장</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbcDriver = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	String dbUser = "scott";
	String dbPass = "tiger";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	String sql = "INSERT INTO B1 VALUES (?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, num);
	pstmt.setString(2, title);
	pstmt.setString(3, content);
	pstmt.setString(4, writer);
	
	pstmt.executeUpdate();
	%>
	
	<script type="text/javascript">
	alert("글쓰기 완료");
	location.href='b1.jsp';	
	</script>
</body>
</html>