<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8"); //한글처리
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	//age에 따라서 다른 결과 페이지로 이동
	int result = Integer.parseInt(age);
	
	if(result >= 20) {
		response.sendRedirect("res_ex01_ok.jsp"); //강제 페이지 이동(응답)
	} else {
		response.sendRedirect("res_ex01_no.jsp");
	}

%>

<%-- html 사용안해서 자바코드 밖에 안 남음, 나중에 servlet 사용 --%>