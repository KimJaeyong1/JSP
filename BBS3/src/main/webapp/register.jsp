<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div id="back" class="container">
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
				<div class="panel panel-default mt-3">
					<div class="panel-heading">
						<h4 class="penel-header">
							<i class="bi bi-door-open"></i> 회원가입					
						</h4>
					</div>
					<form action="registerAction.jsp" method="post">
						<div class="mb-3">
							<input type="text" class="form-control" name="id" id="reg_id" placeholder="ID">
							<div id="text_id" class="form-text">아이디를 입력해 주세요 (3자 이상)</div>
						</div>
						<div class="mb-3">
							<input type="password" class="form-control" name="pw" id="reg_pw" placeholder="PASSWORD">
							<div id="text_pw" class="form-text">비밀번호를 입력해 주세요 (6자 이상)</div>
						</div>
						<div class="mb-3">
							<input type="email" class="form-control" name="email" id="reg_email" placeholder="E-MAIL">
							<div id="text_email" class="form-text">e-mail 주소를 입력해 주세요.</div>
						</div>
						<div class="mb-3">
							<input type="text" class="form-control" name="name" id="reg_name" placeholder="NAME">
							<div id="text_name" class="form-text">이름을 입력해 주세요. (2자 이상)</div>
						</div>
						<div class="mb-3">
							<input type="text" class="form-control" name="nick" id="reg_nick" placeholder="NICKNAME">
							<div id="text_nick" class="form-text">닉네임을 입력해 주세요. (2자 이상)</div>
						</div>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="submit" class="btn btn-primary">회원가입</button>
						</div>
					</form>
				</div>
			</div>
			<div id="right" class="col-sm-2">
				<img src="image/banner.png">
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>