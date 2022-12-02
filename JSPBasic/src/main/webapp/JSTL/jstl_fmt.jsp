<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>formatNumber, formatDate, parseDate, parseNumber</h2>
	<%--
	format → 형식변환(보여지는 숫자, 날짜의 형식 변환)
	parse → 형변환(데이터타입 변환)
	 --%>

	<hr>
	<h3>formatDate → 날짜를 날짜의 형태로 변경</h3>

	<c:set var="day" value="<%=new Date() %>" />

	${ day }
	<br>
	<!-- Fri Dec 02 16:27:37 KST 2022 이렇게 나옴 -->
	<fmt:formatDate var="r_day" value="${ day }"
		pattern="yyyy년 MM월 dd일 hh:mm:ss" />
	<fmt:formatDate var="r_day2" value="${ day }" pattern="yy-MM-dd" />
	${ r_day }
	<br> ${ r_day2 }
	<br>

	<hr>
	<h3>parseDate → 문자를 날짜의 형태로 변경</h3>
	<fmt:parseDate var="r_day3" value="2022-12-02" pattern="yyyy-MM-dd" />
	<!-- 패턴은 동일한 형태로 들어가야 함 -->
	<fmt:parseDate var="r_day4" value="2022-12-02 23:45:12"
		pattern="yyyy-MM-dd HH:mm:ss" />
	<!-- 24시간 기준 HH -->
	${ r_day3 } ${ r_day4 }


	<hr>
	<h3>formatNumber → 숫자형식을 숫자의 형태로 변경</h3>
	<fmt:formatNumber var="r_num" value="2000" pattern="0,000.000" />
	<!-- 0이 자릿수, 원은 문자열로 붙여 ㅎㅎ -->
	${ r_num }
	<br>

	<hr>
	<h3>parserNumber → 문자를 숫자의 형태로 변경</h3>
	<!-- 문자가 있을 때 그 숫자만 뽑고 싶다하면 사용 -->
	<fmt:parseNumber var="r_num2" value="1,000원" pattern="0,000원" />
	${ r_num2 }
	<br>


	<hr>
	<h2>실습</h2>
	<h3>아래 값들을 2020년 05월 03일 형식으로 변경해서 출력</h3>

	<c:set var="TIME_A" value="2020-05-03" />
	<!-- 문자 -->
	<fmt:parseDate var="TIME_A1" value="${ TIME_A }" pattern="yyyy-MM-dd" />
	<fmt:formatDate var="TIME_A2" value="${ TIME_A1 }"
		pattern="yyyy년 MM월 dd일" />
	${ TIME_A2 }
	<br>
	<!-- var값은 생략하면 나감 -->

	<c:set var="TIME_B" value="<%=new Date() %>" />
	<!-- 날짜 -->
	<fmt:formatDate var="TIME_B1" value="${ TIME_B }"
		pattern="yyyy년 MM월 dd일" />
	${ TIME_B1 }
	<br>

</body>
</html>