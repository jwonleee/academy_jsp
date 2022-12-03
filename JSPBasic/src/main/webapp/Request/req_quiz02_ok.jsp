<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	//값 받기
	String name = request.getParameter("name");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	
	//실수형으로 변환
	double dh = Double.parseDouble(height);
	double dw = Double.parseDouble(weight);
	
	// 제곱이어서 Math.pow 사용해도 됨
	double bmi = dw / (dh/100 * dh/100);
	
	//String result 변수 선언해서 result값만 출력하는 것도 가능
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>
		IBM 지수 확인<br>
	</h3>
	이름: <%=name %><br>
	키: <%=height %><br>
	몸무게: <%=weight %><br>
	BMI: <%=bmi %><br>

	<%-- 출력하기 위해서는 여기에 if문 사용해줘야함 / %로 감싸고, "과체중" 써도 됨 --%>
	<%if(bmi >= 25) {%>
	과체중
	<% } else if (bmi > 18) {%>
	정상
	<% } else { %>
	저체중
	<% } %>


</body>
</html>