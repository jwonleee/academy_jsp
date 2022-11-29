<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- post방식은 method="post" 적기 -->
	<form action="req_post02.jsp" method="post">
		아이디:<input type="text" name="id">
		이메일:<input type="email" name="email"><br>
		
		<input type="submit" name="확인"><br>
	</form>
	
</body>
</html>