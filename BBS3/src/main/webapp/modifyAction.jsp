<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String writeTitle = request.getParameter("title"); 
		String writeContent = request.getParameter("content"); 
		String writeWriter = request.getParameter("writer"); 
		int writeNum = Integer.parseInt(request.getParameter("num"));
	
		String title = request.getParameter("title");	
		String content = request.getParameter("content");	
		String writer = request.getParameter("writer");	
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String dbId = "scott";
		String dbPw = "tiger";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		conn =  DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		String SQL = "UPDATE B1 SET TITLE = ?, CONTENT = ?, WRITER = ? WHERE NUM ="+writeNum;
		
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, writer);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	%>
	
		<script>
			alert("수정 완료");
			location.href = 'board1.jsp';
		</script>
</body>
</html>