<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>path_ex01</h2>
	<!-- 
	절대경로: 프로젝트의 전체경로 (IP주소, port번호를 제외한 / 컨텍스트 경로부터 시작)
	상대경로: 현재 위치에서 다른 파일의 경로를 참조
	 -->
	
	<a href="path_ex02.jsp">ex02(상대)</a>
	<a href="http://localhost:8181/JSPBasic/path/path_ex02.jsp">ex02(절대)</a>
	<a href="/">ex02(절대)</a> <!-- apache 홈페이지로 이동 -->
	<a href="/JSPBasic/path/path_ex02.jsp">ex02(절대)</a>
	
	
</body>
</html>