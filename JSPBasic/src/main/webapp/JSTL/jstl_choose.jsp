<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${ param.name eq '홍길동' }">
			<h3>홍길동</h3>
		</c:when>
		<c:when test="${param.name eq '이순신' }">
			<h3>이순신</h3>
		</c:when>
		<c:otherwise>
			<h3>둘다 아님</h3>
		</c:otherwise>
	</c:choose>

	<hr>
	<c:choose>
		<c:when test="${ param.age >= 20 }">
			성인입니다.
		</c:when>
		<c:otherwise>
			미성년자입니다.
		</c:otherwise>


	</c:choose>



</body>
</html>