<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/reset.css">
<title>Make Clone Site</title>
</head>
<body>
	<div id="containrer">
		<div id="left_content">
			<ul>
				<li><a href="index.jsp">홈</a></li>
				<li><a href="b1.jsp">1번</a></li>
				<li><a href="b1.jsp">1번</a></li>
			</ul>
		</div>
		<div id="center_content">
			<form action="writeAction.jsp" method="post">
				글번호 <input type="text" name="num"><br>
				제목 <input type="text" name="title"><br>
				내용 <input type="text" name="content"><br>
				이름 <input type="text" name="writer"><br>
				<input type="submit" value="글쓰기">
			</form>
		</div>
	</div>
</body>
</html>