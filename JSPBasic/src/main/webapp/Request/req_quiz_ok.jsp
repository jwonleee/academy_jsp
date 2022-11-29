<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%-- 변수 설정시 영어로 하자~ --%>  
<%
	request.setCharacterEncoding("utf-8");

	String 아이디 = request.getParameter("id");
	String 비밀번호 = request.getParameter("pw");
	
	String[] 관심분야 = request.getParameterValues("inter"); //checkbox
	String 전공분야 = request.getParameter("major");
	
	String 지역 = request.getParameter("region");
	
	String 정보입력 = request.getParameter("입력란");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	아이디: <%=아이디 %><br>
	비밀번호: <%=비밀번호 %><br>
	<br>
	관심분야: <%=Arrays.toString(관심분야) %><br>
	전공분야: <%=전공분야 %><br>
	<br>
	지역: <%=지역 %><br>
	추가정보: <%=정보입력 %><br>

</body>
</html>