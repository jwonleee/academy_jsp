<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	session.invalidate(); //세션무효화
	response.sendRedirect("session_login.jsp");

%>
<%-- 화면에서 출력할 동작이 없으므로 html 부분 지워줘도 됨 --%>
