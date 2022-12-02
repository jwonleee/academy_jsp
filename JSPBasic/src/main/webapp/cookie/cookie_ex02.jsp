<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
	이 페이지 처음 진입하면 idCheck쿠키를 찾아서 값을 얻고 아이디 태그 안에
	미리 값을 넣어주는 코드를 작성
	input 태그에 value 속성을 활용
	*/
	//쿠키는 requset에 배열로 담음
	Cookie[] checkarr = request.getCookies();
	
	String idCheck = ""; //쿠키 없으면 공백값임
	if(checkarr != null) { //쿠키가 없을 수도 있으니까 null이 아닐때
		for(Cookie c : checkarr) { //for문으로 이름을 찾아봄
			if( c.getName().equals("remember_id") ) { //쿠키배열에 들어있는 이름값이랑 ok.jsp의 key값 = remember_id랑 같으면 
				idCheck = c.getValue(); //값을 꺼내서 idCheck변수에 담음
			}
		}
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>쿠키 로그인 연습</h2>

	<form action="cookie_ex02_ok.jsp" method="post">

		아이디:<input type="text" name="id" size="10" value="<%=idCheck %>"><br>
		비밀번호:<input type="password" name="pw" size="10"><br> <input
			type="submit" value="로그인"> <input type="checkbox"
			name="idCheck" value="y"> 아이디기억하기

	</form>

</body>
</html>