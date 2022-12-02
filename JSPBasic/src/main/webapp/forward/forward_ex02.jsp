<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//forward 이동
	
	//RequestDispatcher dp = request.getRequestDispatcher("forward_ex03.jsp");
	//dp.forward(request, response); //리퀘스트, 리스폰스를 만나면 3번 페이지로 넘어감

	
	//3번 페이지에서 사용할 필요한 데이터를 담는 방법 request에 값 저장(3번페이지로 한번만 나가면 됨)
	//강제로 값 저장 - request.setArribute(키, 값);
	request.setAttribute("data", "홍길동");
	
	request.getRequestDispatcher("forward_ex03.jsp").forward(request, response);

	
	
%>