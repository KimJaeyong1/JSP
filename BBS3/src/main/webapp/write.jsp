<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			<!-- 메인 내용 영역 -->
			<div class="col-sm-8">
				<form action="writeAction.jsp" method="post">
					<div class="mb-3 mt-5">
						<label for="input_title" class="form-label">제목</label>
						<input type="text" class="form-control" id="title_box" name="title">
					</div>
					<div class="mb-3">
						<label for="input_writer" class="form-label">작성자</label>
						<input type="text" class="form-control" id="writer_box" name="writer">
					</div>
					<div class="mb-3">
						<label for="input_content" class="form-label">글내용</label>
						<textarea class="form-control" id="content_box" name="content" rows="12"></textarea>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<a href="board1.jsp" class="btn btn-primary">글목록</a>
						<input class="btn btn-primary" type="submit" value="완료">
					</div>
				</form>
			</div>
			<!-- 오른쪽 배너 영역 -->
			<div id="right" class="col-sm-2">
				<img src="image/banner.png">
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>