<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String idCheck = request.getParameter("idCheck");
	
	//로그인 성공이라 가정
	if(id.equals("aaa123") && pw.equals("1234")) {
		
		//로그인 성공시 id쿠키 생성
		Cookie cookie = new Cookie("user_id", id);
		cookie.setMaxAge(1800);
		response.addCookie(cookie);
		
		//idCheck쿠키
		//사용자가 체크박스를 체크했다면 idCheck를 생성, 시간은 30초
		if(idCheck != null && idCheck.equals("y")) { //y가 없으면 null값인데 equals로는 비교할 수 없음
			Cookie idCheckCookie = new Cookie("remember_id",id);
			idCheckCookie.setMaxAge(30);
			response.addCookie(idCheckCookie);
		}
		
		response.sendRedirect("cookie_ex02_welcome.jsp");//성공페이지	
	} else {
		response.sendRedirect("cookie_ex02.jsp");//로그인화면
	}
	
	



%>