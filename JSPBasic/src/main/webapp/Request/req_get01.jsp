<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- action에는 지정된 페이지의 경로 -->
	<!-- post방식은 form태그가 필요하고 method="post"를 적습니다 -->
	<!-- 이 페이지는 get 방식 -->
	<form action="req_get02.jsp">

		아이디:<input type="text" name="id" value="ab123"> <br>
		비밀번호:<input type="password" name="pw"><br> 동의항목 <input
			type="checkbox" name="agree" value="agree의 값">동의1 <input
			type="checkbox" name="agree" value="2">동의2 <input
			type="checkbox" name="agree" value="3">동의3 <input
			type="submit" value="확인">

	</form>

</body>
</html>