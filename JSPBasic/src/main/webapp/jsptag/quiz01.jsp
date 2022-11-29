<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
1. Set을 이용해서 처리
2. 1~45까지 로또번호를 생성하고 리스트에 추가
3. 중복되지 않은 숫자의 6개의 로또번호를 저장하면 됩니다.
4. 화면에 출력
*/

HashSet<Integer> set = new HashSet<>();


while(true) {
	
	int ran = (int)(Math.random() * 45 ) + 1;

	set.add(ran);
	if(set.size() == 6) {
		break;
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

	로또번호: <%= set.toString() %>

</body>
</html>