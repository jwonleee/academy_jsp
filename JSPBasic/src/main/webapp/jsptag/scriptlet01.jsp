<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	//자바코드
	int a = 10;
	if(a >= 10) {
		out.println("10보다 큼"); //화면 출력
	} else {
		out.println("10보다 작음");
	}
	%>
	
	<hr>
	<%
	for(int i = 1; i <= 10; i++) {
		out.println("<br>" + i); //"" 넣으면 태그로 인식
	}
	%>
	
	<hr>
	<%
	int num = 0;
	if(num >= 0) {
		out.println("<h6>num은 0보다 큽니다.</6>");
	}
	%>
	
	<hr>
	<!-- 위의 변수 num 그대로 사용가능, 화면이 하나로 연결되어 있음 -->
	<% if(num >= 10) { %>
		<h6> num은 10보다 큼 </h6>
	<% } else { %>
		<h6> num은 10보다 작음</h6>
	<% } %>

	<hr>
	1. 구구단 3단 out.perintln과, br태그를 사용해서 브라우저 화면에 출력
	
	<% int j = 3; %>
	<% for(int k = 1; k <= 9; k++) { %>
	<%	out.println("<br>" + j + " * " + k + " = " + j*k); %>
	<% } %>
	
	<hr>
	2. 동일한 name을 가진 체크박스 20개를 브라우저에 생성<br> 
	
	<% for(int i = 1; i <= 20; i++) { %>
	<input type="checkbox" name = "test"> HTML <br>
	<% } %>
	
	
	



</body>
</html>