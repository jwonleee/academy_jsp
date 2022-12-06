<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<section>

	<div align="center">
	<h3>회원정보 수정 연습</h3>
	
		<form action="updateform.user" method="post">
			
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="${vo.id}" pattern = "\w{4,8}" required readonly ></td>
		
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" placeholder="4~8글자 영문자숫자" pattern = "\w{4,8}" required = "required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${vo.name}"  pattern = "[가-힣]{3,}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="${vo.email}" readonly ></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					
					<c:if test="${vo.gender == 'M' }">
					<input type="radio" name="gender" value = "M" checked = "checked">남자
					<input type="radio" name="gender" value = "F"> 여자
					</c:if>
					
					<c:if test="${vo.gender == 'F' }">
					<input type="radio" name="gender" value = "M" >남자
					<input type="radio" name="gender" value = "F" checked = "checked"> 여자
					</c:if>
					
					<%-- 3항 연산자 사용, checked라는 문자열에 태그 안에 출력
					<input type="radio" name="gender" value = "M" ${vo.gender == 'M' ? 'checked' : '' } >남자
					<input type="radio" name="gender" value = "F" ${vo.gender == 'F' ? 'checked' : '' } > 여자
					--%>
					
					</td>
				</tr>
							
			</table>
			
			<input type="submit" value="정보수정">
			<!-- button은 JS로 기능을 추가한다. -->
			<input type="button" value="마이페이지" onclick=" location.href = 'user_mypage.user' ">
		</form>
	
	</div>

</section>

<%@ include file="../include/footer.jsp" %>