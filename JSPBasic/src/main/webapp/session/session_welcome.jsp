<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	//세션이 없다면 리다이렉트
	if(session.getAttribute("user_id") == null) {
		response.sendRedirect("session_login.jsp");
	}

	//세션사용
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

	<%-- seid와 senick을 body에서 출력 --%>
	<%=seid %>님 환영합니다.
	<br>
	<a href="session_logout.jsp">session_logout</a>

</body>
</html>