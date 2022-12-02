<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>path_ex03</h2>

	<a href="../path_ex01.jsp">ex01(상대)</a>
	<a href="/JSPBasic/path/path_ex01.jsp">ex01(절대)</a>

	<hr>
	<!-- a태그를 이용해서 session_login 페이지로 상대경로, 절대경로로 이동 -->

	<a href="../../session/session_login.jsp">session_login(상대)</a>
	<a href="/JSPBasic/session/session_login.jsp">session_login(절대)</a>
	<br>

	<hr>
	<!-- a태그를 이용해서 TestServlet으로 상대경로, 절대경로로 이동 -->

	<!-- ../../까지 가면 JSPBasic이고, TestServlet url 확인하면 http://localhost:8181/JSPBasic/hello 이므로 뒤에 hello만 붙여주면 됨 -->
	<a href="../../hello">TestServlet(상대)</a>
	<a href="http://localhost:8181/JSPBasic/hello">TestServlet(절대)</a>
	<br>

	<hr>
	<!-- img태그를 이용해서 HTML 폴더 안에 1.jpg 참조 -->

	<!-- src가 경로여서 여기에 적으면 됨 -->
	<!-- alt: 이미지가 뜨지 않으면 대신해서 "상대경로 or 절대경로"이라는 글자가 나타남 -->
	<!-- 이미지가 엑박이 뜨면 경로 설정이 잘못된 것 -->
	<img alt="상대경로" src="../../HTML/1.png">
	<br>
	<img alt="절대경로" src="/JSPBasic/HTML/1.png">


</body>
</html>