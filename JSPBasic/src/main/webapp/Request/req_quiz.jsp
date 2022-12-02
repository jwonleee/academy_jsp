<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		태그에 필요한 속성을 지정하고 POST방식으로 전달하고, OK페이지에서는 사용자가 입력한 값 출력
	--%>

	<form action="req_quiz_ok.jsp" method="post">
		<h3>입력양식</h3>
		아이디: <input type="text" name="id" placeholder="힌트: 8글자" maxlength="8"
			size="10"> <br> 비번: <input type="password" name="pw"
			placeholder="힌트: 알면뭐하게" size="10"> <br>

		<!-- checkbox, radio속성은 반드시 name속성을 통일 시켜서 하나의 그룹으로 묶습니다. -->
		<!-- checkbox 다중행 여러개 선택가능, radio는 단 1개 선택가능 -->
		관심분야: <input type="checkbox" name="inter" value="Java"> JAVA <input
			type="checkbox" name="inter" value="JSP"> JSP <input
			type="checkbox" name="inter" value="JS"> JS <input
			type="checkbox" name="inter" value="HTML"> HTML <input
			type="checkbox" name="inter" value="ORACLE"> ORACLE <br>

		전공분야: <input type="radio" name="major" value="경영">경영 <input
			type="radio" name="major" value="컴퓨터">컴퓨터 <input type="radio"
			name="major" value="수학">수학 <input type="radio" name="major"
			value="기계공학">기계공학 <br>

		<!-- name이란 속성은 다 가지고 있어야 함. 나중에 식별할 때 사용됨 -->
		<!-- 식별할 수 있는 value값 있어야 함. 아니면 서울,경기,부산,인천 나옴 -->
		지역: <select name="region">
			<option value="s">서울</option>
			<option value="k">경기</option>
			<option value="b">부산</option>
			<option value="e">인천</option>
		</select> <br> 정보입력: <br>
		<textarea rows="5" cols="30" name="입력란"></textarea>

		<br>
		<!-- form태그의 데이터를 서버로 전송하는 역할 -->

		<input type="submit" value="확인"> <input type="reset"
			value="폼초기화">


	</form>

</body>
</html>