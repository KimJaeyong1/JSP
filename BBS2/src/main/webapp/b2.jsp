<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/reset.css">
<title>2번 게시판</title>
</head>
<body>
	<div id="containrer">
		<div id="left_content">
			<ul>
				<li><a href="index.jsp">홈</a></li>
				<li><a href="b1.jsp">1번</a></li>
				<li><a href="b2.jsp">2번</a></li>
			</ul>
		</div>


		<div id="center_content">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
				<%
				Class.forName("oracle.jdbc.driver.OracleDriver");

				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;

				try {
					String jdbcDriver = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
					String dbUser = "scott";
					String dbPass = "tiger";

					String SQL = "SELECT * FROM B2";

					conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
					stmt = conn.createStatement();
					rs = stmt.executeQuery(SQL);

					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("NUM2")%></td>
					<td><%=rs.getString("TITLE2")%></td>
					<td><%=rs.getString("WRITER2")%></td>
				</tr>
				<%
				}
				} catch (SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
				} finally {
				if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
				if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException ex) {
				}
				if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>