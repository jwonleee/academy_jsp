<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	//setAttribute로 보내서 getParameter가 아님(폼 값이 아니니까, 폼 값은 getParameter)
	double result = (double)request.getAttribute("result");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	평균 점수:
	<%=result %>


</body>
</html>