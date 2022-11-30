<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String seid = (String)session.getAttribute("user_id");
	String senick = (String)session.getAttribute("user_nick");


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%=seid %>님 환영합니다.<br>
	<a href="session_logout.jsp">session_logout</a>

</body>
</html>