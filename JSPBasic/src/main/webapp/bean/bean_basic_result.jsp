<%@page import="com.example.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//user안에 있는 원자값들을 화면에 출력
	//가져올 때 User타입이어서 User 참조변수에 담아주고
	User result = (User)request.getAttribute("user");
	
	//아래에서 get사용하여 출력

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>bean_basic_result</h3>

	아이디:
	<%=result.getId()%><br> 비밀번호:
	<%=result.getPw() %><br> 이름:
	<%=result.getName() %><br> 이메일:
	<%=result.getEmail() %><br>

</body>
</html>