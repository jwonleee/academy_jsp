package com.example.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({"/board/board_modify.board",
			"/board/updateForm.board", //사용자와 session값이 같아야 업데이트, 삭제 되니까 넣어줌(없어도 되긴함)
			"/board/board_delete.board" }) //경로
public class AuthFilter2 implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		/*
		 * 세션의 user_id와 request로 넘어오는 작성자가 다르면 수정불가.
		 * 
		 * 1. 각 요청경로에서 writer가 파라미터로 반드시 전달되도록 처리.
		 * 	  (넘어올때 request로 반드시 아이디가 실려있어야 함, board_content, board_modify 확인)
		 * 
		 * 
		 * 
		 */
		//한글 깨질 수도 있어서 인코딩 필수
		request.setCharacterEncoding("utf-8");
		
		//권한 검사
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;

		//각 요청에 넘어오는 writer 파라미터
		String writer = request.getParameter("writer");
		
		//세션에 저장된 user_id
		HttpSession session = req.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
//		System.out.println("작성자: " + writer);
//		System.out.println("세션ID: " + user_id);
		
		//세션이 없어나 or 작성자와 세션이 다른 경우
		if(user_id == null || !writer.equals(user_id) ) {
			
		
			String path = req.getContextPath(); //컨텍스트패스 (/JSP.web)
		
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('권한이 필요한 기능입니다');");
			out.println("location.href='" + path + "/board/board_list.board" + "';");
			out.println("</script>");
			
			return;
		}
			
		chain.doFilter(request, response);//필터가 여러개라면 다음 필터로 연결, 그렇게해서 연결된 필터가 없으면 컨트롤러로 간다
	}

}
