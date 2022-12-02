<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

/*
	1. id, pw을 받아서 처리
	2. id가 abc1234이고 비밀번호가 asd123이라면 로그인 성공으로 간주하고 res_ex02_ok 리다이렉트
	3. id 혹은 pw가 틀린 경우 res_ex02_no페이지로 리다이렉트
*/

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("abc1234") && pw.equals("asd123")) {
		response.sendRedirect("res_ex02_ok.jsp");
	} else {
		response.sendRedirect("res_ex02_no.jsp");
	}

%>
