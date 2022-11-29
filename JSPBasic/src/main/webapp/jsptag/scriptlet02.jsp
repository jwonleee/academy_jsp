<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//상단부 선언
	int a = 10;
	String str = "hello world";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- ctrl + shift + / 단축키 
	<%
		out.println(a + "<br>");
		out.println(str + "<br>");
	%>
	 --%>
	 
	<!-- 
	html 주석은 보임
	 -->

	<%=a %><br>
	<%=str %><br>
	
	<h2>구구단 3단을 표현식을 통해서 출력</h2>
	<% for(int i = 1; i <= 9; i++) { %>
		<%-- 이 부분은 html 코드가 들어가는 부분이기 때문에 그냥 적으면 출력, 변수만 <%= %>에 담아줌 --%>
		ah.... <%= "3 * " + i + " = " + 3*i %><br>
			   <%-- 3 * <%= i %> = <%=3*i %><br> --%>
	<% } %>
	
	<h2>반복문으로 체크박스에 1~20까지 이름을 붙여서 가로 출력</h2>
	<% for(int i = 1; i <= 20; i++) { %>
		<%= i %> <input type="checkbox" name = "test"> 
	<% } %>
	
	

</body>
</html>