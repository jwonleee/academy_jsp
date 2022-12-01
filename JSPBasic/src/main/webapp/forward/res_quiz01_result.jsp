<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%

	double kornum = Double.parseDouble(request.getParameter("kor"));
	double engnum = Double.parseDouble(request.getParameter("eng"));
	double mathnum = Double.parseDouble(request.getParameter("math"));
	
	double avg = (kornum + engnum + mathnum) / 3;
	
		if(avg  >= 60) {
			request.setAttribute("result", avg);
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