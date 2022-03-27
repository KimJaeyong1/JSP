<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>    
<%@ page import="java.sql.Connection" %>    
<%@ page import="java.sql.PreparedStatement" %>    
<%@ page import="java.sql.SQLException" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/register.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<title>회원가입 페이지</title>
</head>
<body>
	<%
		String id = request.getParameter("id");	
		String pw = request.getParameter("pw");	
		String email = request.getParameter("email");	
		String name = request.getParameter("name");	
		String nick = request.getParameter("nick");	
	
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
			String dbId = "scott";
			String dbPw = "tiger";
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			String SQL = "INSERT INTO MEMBER VALUES (REG_NUM.NEXTVAL, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			pstmt.setString(4, name);
			pstmt.setString(5, nick);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	%>
	<script>
		alert("회원가입이 완료 되었습니다.");
		location.href="index.jsp";
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>