<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/header.jsp" %> 

<section>
	<div align = "center">
		<form action = "loginForm.user" method = "post">
			<h3>로그인 연습</h3>
			
			<input type="text" name="id" placeholder="아이디"> <br>
			<input type="password" name="pw" placeholder="비밀번호"><br>
			
			<input type="submit" value="로그인" class = "btn btn-default">
			<!-- 디자인 관련해서는 W3School 가면 BootStrap 에서 확인이 가능하다. --> 
		
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