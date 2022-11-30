<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//user_id쿠키를 찾는 작업
	Cookie[] arr = request.getCookies();
	
	String id = "";
	if(arr != null) {
		for(Cookie c : arr) {
			if( c.getName().equals("user_id") ) {
				id = c.getValue();
			}
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	내가만든쿠키~ 만든사람(<%=id %>)<br>
	<a href="cookie_ex02.jsp">뒤로</a>
	
</body>
</html>