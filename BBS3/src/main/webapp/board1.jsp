<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;	
	
	String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	String dbId = "scott";
	String dbPw = "tiger";
	
	conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	stmt = conn.createStatement();
	
	String SQL = "SELECT * FROM B1 WHERE NUM IS NOT NULL ORDER BY NUM DESC";
	rs = stmt.executeQuery(SQL);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<title>자유 게시판</title>
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
			<!-- 메인 내용 영역 -->
			<div class="col-sm-8 mt-3">
				<div class="main-block">
					<h5 class="main-header">
						<i class="bi bi-pencil-square"></i> 자유 게시판
					</h5>
				</div>
				<table class="table table-hover table table-bordered">
					<thead class="table-light">
						<tr>
							<th scope="col" style="width: 80px">No</th>
							<th scope="col" style="width: 500px">제목</th>
							<th scope="col">작성자</th>
						</tr>
					</thead>
				<tbody>
					<%
						while (rs.next()) {
					%>
						<tr>
							<th scope="row"><%=rs.getString("NUM")%></th>
							<td><a href="view.jsp?NUM=<%=rs.getString("NUM")%>"><%=rs.getString("TITLE")%></a></td>
							<td><%=rs.getString("WRITER")%></td>
						</tr>
					<%
						}
						
						rs.close();
						stmt.close();
						conn.close();
					
					%>
				</tbody>
				</table>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<a href="write.jsp" class="btn btn-primary">글쓰기</a>
				</div>
				<!-- 메인 하단 페이지내이션 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>
			<!-- 오른쪽 배너 영역 -->
			<div id="right" class="col-sm-2">
				<img src="image/banner.png">
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>