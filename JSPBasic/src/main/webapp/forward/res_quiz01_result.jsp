<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	double kornum = Double.parseDouble(request.getParameter("kor"));
	double engnum = Double.parseDouble(request.getParameter("eng"));
	double mathnum = Double.parseDouble(request.getParameter("math"));
	
	double avg = (kornum + engnum + mathnum) / 3;
	
		if(avg  >= 60) {
			//평균데이터를 넘긴다 (안넘기면 세번째 페이지에서 아무것도 없음)
			request.setAttribute("result", avg);
			//setAttribute로 실었으면 forward로 나가야 함
			request.getRequestDispatcher("res_quiz01_ok.jsp").forward(request, response);
			
		} else {
			response.sendRedirect("res_quiz01_no.jsp");
		};

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>