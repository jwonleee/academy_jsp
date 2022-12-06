<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/header.jsp" %> 


<section>
	<div align = "center" >
		<h3> 회원가입 </h3>
		
		<!-- 태그에서 제공하는 input 유효성 검사
			중요!!!! 기억보다 기록하자
			
		   pattern = JS정규표현식
		   required = "required"
		   
		   정규표현식에 일치하지 않으면 submint 불가
		   공백을 허용하지 않음
		   
		   라디오 or 체크박스 미리 선택
		   checked = "checked"
		   
		   셀렉트박스의 미리 선택
		   selected = "selected"
		   
		   input 태그를 읽기 속성으로 하는 거
		   readonly = "readonly"
		 	
		   input 태그 사용안하기 = 태그가 작동이 안함
		   disabled = "disableds"
		
		 -->
		
		
		
		<form action="joinForm.user" method="post">
		
			<span style = "color" : red>${msg }</span>
			
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" placeholder="4~8글자 영문자숫자" pattern = "\w{4,8}" required = "required"></td>
		
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" placeholder="4~8글자 영문자숫자" pattern = "\w{4,8}" required = "required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" pattern = "[가-힣]{3,}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<input type="radio" name="gender" value = "M" checked = "checked">남자
					<input type="radio" name="gender" value = "F"> 여자
					</td>
				</tr>
							
			</table>
			
			<input type="submit" value="가입">
			<!-- button은 JS로 기능을 추가한다. -->
			<input type="button" value="로그인하기" onclick="location.href = 'user_login.user'">
		</form>
	
	</div>
</section>

<script>
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
</script>



<%@include file = "../include/footer.jsp"  %>