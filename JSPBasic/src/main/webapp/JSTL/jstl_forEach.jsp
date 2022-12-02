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

	<h3>1~100까지 홀수 합</h3>
	<%
	int sum = 0;
	for(int i = 1; i <= 100; i+=2) {
		sum = sum + i;
	}
	%>

	결과:<%=sum %>

	<hr />
	<c:set var="sum" value="0" />
	<!-- 변수값, 변수이름은 sum, sum값은 0 -->
	<!-- 지역변수의 개념으로 같은 sum이 있으면 덮어버림 -->
	<c:forEach var="i" begin="1" end="100" step="2">
		<c:set var="sum" value="${ sum + i }" />
	</c:forEach>

	결과:${ sum }

	<hr>
	<h3>2~9단 까지 구구단 세로 출력</h3>
	<!-- step은 생략하면 자동으로 1 -->
	<c:forEach var="i" begin="2" end="9" step="1">
		<c:forEach var="j" begin="1" end="9" step="1">
	 		${i}  * ${j} = ${i*j}<br>
		</c:forEach>
		<br>
	</c:forEach>

	<hr>
	<h3>향상된 포문</h3>
	<%
	 	int[] arr = new int[] {1, 2, 3, 4, 5};
	 	for(int a : arr) {
	 		out.println(a);
	 	}
	 %>

	<br>
	<!-- 배열은 생성구문이 없어서 아래와 같이 적어줌 -->
	<c:set var="arr" value="<%= new int[] {1, 2, 3, 4, 5} %>" />

	<!-- 회전하는 방법 꼭 알아두기 -->
	<c:forEach var="a" items="${ arr }" varStatus="s">
		<!-- for(int a : arr) 이것과 같음 -->
		인덱스번호: ${ s.index }
		순서: ${ s.count }
		값: ${ a }
		<br>
	</c:forEach>






</body>
</html>