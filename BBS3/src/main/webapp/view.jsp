<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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
	<div class="container">
		<div class="row">
			<div id="left" class="col-sm-2">
				<div id="left_top">
					<a href="index.jsp"><img src="image/logo(png).png"></a>		
				</div>
				<%
					String loginId = (String)session.getAttribute("sessionId");
				
					if(session.getAttribute("sessionId") != null) {
				%>
				<div id="session_login">
					<div id="session_box">
					<%= loginId %>님<br>환영 합니다!
					</div>
					<div id="logout_button">
						<a href="logout.jsp"><button type="button" id="logout_button" class="btn btn-primary">로그아웃</button></a>
					</div>
				</div>
				<%
					} else {
				%>								
				<div id="login_box">
					<form action="loginRun.jsp" method="post">
						<div class="mb-3">
							<input type="text" class="form-control" id="input_id" name="id" placeholder="ID">
						</div>
						<div class="mb-3">
							<input type="password" class="form-control mt-1" id="input_pw" name="pw" placeholder="PASSWORD">
						</div>
						<a href="register.jsp"><button type="button" id="register_button" class="btn btn-primary">회원가입</button></a>
						<button type="submit" id="login_button" class="btn btn-primary">로그인</button>
					</form>
				</div>
				<%
					}
				%>
				<nav id="left_navbar" class="nav flex-column">
					<a class="nav-link text-white active" aria-current="page" href="board1.jsp">자유게시판</a>
					<a class="nav-link text-white" href="#">Link</a>
					<a class="nav-link text-white" href="#">Link</a>
					<a class="nav-link text-white disabled">Disabled</a>
				</nav>			
			</div>
			<%
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
				String dbId = "scott";
				String dbPw = "tiger";
				
				int writeNum = Integer.parseInt(request.getParameter("NUM"));
				
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				
				conn = DriverManager.getConnection(dbUrl, dbId,dbPw);
				stmt = conn.createStatement();
				
				String SQL = "SELECT NUM, TITLE, WRITER, CONTENT FROM B1 WHERE NUM ="+writeNum;
				rs = stmt.executeQuery(SQL);
				if(rs.next()) {
					String NUM = rs.getString(1);
					String TITLE = rs.getString(2);
					String WRITER = rs.getString(3);
					String CONTENT = rs.getString(4);
			%>
			<!-- 메인 내용 영역 -->
			<div class="col-sm-8">
				<table class="table mt-5">
					<tbody>
						<tr>
							<th scope="row">글번호</th>
							<td><%= NUM %></td>
						</tr>
						<tr>
							<th scope="row">글제목</th>
							<td><%= TITLE %></td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td><%= WRITER %></td>
						</tr>
					</tbody>
				</table>
				<div class="mb-3">
				<label for="input_content" class="form-label">글내용</label>
				<textarea class="form-control" id="content_box" name="content" rows="12" readonly><%= CONTENT %></textarea>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button type="button" class="btn btn-primary" onclick="location.href='board1.jsp'">글목록</button>
					<button type="button" class="btn btn-primary" onclick="location.href='modify.jsp?NUM=<%= rs.getString("NUM") %>'">글수정</button>
					<button type="button" class="btn btn-primary" onclick="location.href='delete.jsp?NUM=<%= rs.getString("NUM") %>'">삭제</button>
				</div>
			</div>
			<div id="right" class="col-sm-2">
				<img src="image/banner.png">
			</div>
		</div>
	</div>
	<%
				}
	%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>