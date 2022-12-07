<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp" %>

<div align="center" class="div_center">
	<h3>게시판 글 수정 페이지</h3>
	<hr>
	
	<form action="updateForm.board" method="post">
		
		<table border="1" width="500">
			
			<tr>
				<td>
					<input type="hidden" name="bno" value="${vo.bno }" >
				</td>
				<!-- input 태그 안달아서 bno 안 넘어감, update시에 bno 필요 -->
				<!-- hidden태그: 화면에 보일 필요는 없지만 데이터를 보내야 할 때 -->
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" value="${vo.writer }" readonly></td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="title" value="${vo.title }">
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea rows="10" style="width: 95%;" name="content">${vo.content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정 하기" >&nbsp;&nbsp;
					<input type="button" value="목록" onclick="location.href='board_list.board'">        
				</td>
			</tr>
			
		</table>
	</form>
	
</div>

<%@ include file ="../include/footer.jsp" %>