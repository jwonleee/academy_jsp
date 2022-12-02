<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 원래는 request.Parameter 사용했었음 -->
	<!-- param.태그이름 으로 한번씩 받아서 사용합니다. -->
	${ param.name }
	<br> ${ param.id }
	<br> ${ param.pw }

</body>
</html>