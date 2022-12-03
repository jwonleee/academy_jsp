<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//쿠키 확인하기
	//브라우저에 쿠키는 request객체에 자동으로 넘어와서 저장됩니다. (완료되기 전까지는 어디서든 사용가능)
	
	Cookie[] cookies = request.getCookies(); //클라이언트가 서버한테 request로 쿠키 던짐(연결되어있다고 알려주려고)	
	//쿠키가 없다면 null이기 때문에 에러발생
	if(cookies != null) {
		for(Cookie c : cookies) {
			out.println(c.getName() + "<br>"); //USER_ID, USER_NAME
			out.println(c.getValue() + "<br>"); //KKK123, 홍길동
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

	<h3>쿠키 사용하기</h3>

	<a href="cookie_ex01_reset.jsp">쿠키삭제</a>

</body>
</html>