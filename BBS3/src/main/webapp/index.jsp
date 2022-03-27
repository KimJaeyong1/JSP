<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<title>ShenWoo.com</title>
</head>
<body>
	<div id="back" class="container">
		<div class="row">
			<div id="left" class="col-sm-2">
				<div id="left_top">
					<a href="index.jsp">
						<img src="image/logo(png).png">
					</a>
				</div>
				<%
				String loginId = (String) session.getAttribute("sessionId");

				if (session.getAttribute("sessionId") != null) {
				%>
				<div id="session_login">
					<div id="session_box">
						<%=loginId%>님<br>환영 합니다!
					</div>
					<div id="logout_button">
						<a href="logout.jsp">
							<button type="button" id="logout_button" class="btn btn-primary">로그아웃</button>
						</a>
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
						<a href="register.jsp">
							<button type="button" id="register_button" class="btn btn-primary">회원가입</button>
						</a>
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
				<div class="row">
					<div class="col-sm-6 main-block-left mt-3">
						<div class="main-block">
							<h5 class="main-header">
								<i class="bi bi-flag-fill"></i> 1번 게시판
							</h5>
							<div class="panel panel-default">
								<ul class="list-group">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 1번글</a>
										<a href="#">1번글 작성자</a>
										<small>3days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 2번글</a>
										<a href="#">2번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 3번글</a>
										<a href="#">3번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 4번글</a>
										<a href="#">4번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 5번글</a>
										<a href="#">5번글 작성자</a>
										<small>3 days ago</small>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-6 main-block-left mt-3">
						<div class="main-block">
							<h5 class="main-header">
								<i class="bi bi-flag-fill"></i> 2번 게시판
							</h5>
							<div class="panel panel-default">
								<ul class="list-group">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 1번글</a>
										<a href="#">1번글 작성자</a>
										<small>3days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 2번글</a>
										<a href="#">2번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 3번글</a>
										<a href="#">3번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 4번글</a>
										<a href="#">4번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 5번글</a>
										<a href="#">5번글 작성자</a>
										<small>3 days ago</small>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-6 main-block-left mt-3">
						<div class="main-block">
							<h5 class="main-header">
								<i class="bi bi-flag-fill"></i> 3번 게시판
							</h5>
							<div class="panel panel-default">
								<ul class="list-group">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 1번글</a>
										<a href="#">1번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 2번글</a>
										<a href="#">2번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 3번글</a>
										<a href="#">3번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 4번글</a>
										<a href="#">4번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 5번글</a>
										<a href="#">5번글 작성자</a>
										<small>3 days ago</small>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-6 main-block-left mt-3">
						<div class="main-block">
							<h5 class="main-header">
								<i class="bi bi-flag-fill"></i> 4번 게시판
							</h5>
							<div class="panel panel-default">
								<ul class="list-group">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 1번글</a>
										<a href="#">1번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 2번글</a>
										<a href="#">2번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 3번글</a>
										<a href="#">3번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 4번글</a>
										<a href="#">4번글 작성자</a>
										<small>3 days ago</small>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<a href="#">1번 게시판 5번글</a>
										<a href="#">5번글 작성자</a>
										<small>3 days ago</small>
									</li>
								</ul>
							</div>
						</div>
					</div>
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