<%@page import="java.util.ArrayList"%>
<%@page import="com.example.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	
	ArrayList<User> list = new ArrayList<>();

	for(int i = 1; i <= 10; i++) {
		User user = new User();
		user.setId(i+""); //다 문자열
		user.setName("홍길동" + i);
		user.setEmail(i + "@naver.com");
		
		list.add(user);
	}
		
	//리퀘스트에 담는다
	request.setAttribute("list", list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>list안에 값을 행별로 번호를 붙여서 반복문으로 출력</h3>

	${ list }
	<br>
	<!-- list객체 주소가 나옴 -->
	<c:set var="sum" value="0" />
	<c:forEach var="a" items="${ list }" varStatus="s">
		<!-- 향상된 for문과 같음 -->
		
		${ a.id }
		${ a.name }
		${ a.email } <!-- get 안써도 나옴 -->
		
		${ s.count }번:  ${ a.getId() } / ${ a.getName() } / ${ a.getEmail() }
		
		<c:set var="sum" value="${ sum + s.count }" />
		<br>
	</c:forEach>
	번호합:${ sum }

</body>
</html>