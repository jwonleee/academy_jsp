package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.board.model.BoardVO;
import com.example.board.service.BoardService;
import com.example.board.service.BoardServiceImpl;
import com.example.user.service.UserService;
import com.example.user.service.UserServiceImpl;


@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);	
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			//한글처리
			request.setCharacterEncoding("utf-8");
			//요청분기
			String uri = request.getRequestURI();
			String path = request.getContextPath();
			
			String command = uri.substring(path.length());
			
			System.out.println("요청경로: " + command);

			//서비스 객체
			BoardService service = new BoardServiceImpl();
			
			//세션
			HttpSession session = request.getSession();
			
			
//			HttpSession session = null;
			
			if ( command.equals("/board/board_write.board") ) { //등록화면
				
				if(session.getAttribute("user_id") == null) {
					//이 작업은 두 번 일어나면안되서 forward 대신 redirect로 보내줌
					response.sendRedirect("../user/user_login.user");
					return;
				}
				
				
				request.getRequestDispatcher("board_write.jsp").forward(request, response);
				
			} else if( command.equals("/board/board_list.board") ) { //목록화면
				
				//조회메서드 - list를 화면으로 가지고 나감
				ArrayList<BoardVO> list = service.getList(request, response);
				request.setAttribute("list", list); //한번만 나갈꺼니까 request
				
				request.getRequestDispatcher("board_list.jsp").forward(request, response);
				
			} else if( command.equals("/board/board_content.board") ) { //상세내용화면

				//조회한 글에 대한 정보 조회
				BoardVO vo = service.getContent(request, response);
//				System.out.println(vo.getBno());
				request.setAttribute("vo", vo);
				
				request.getRequestDispatcher("board_content.jsp").forward(request, response);
				
			} else if( command.equals("/board/board_modify.board") ) { //수정화면
				
				//조회한 글에 대한 정보를 조회 재활용 (서비스 영역에서 똑같이 사용되니까)
				BoardVO vo = service.getContent(request, response);
				request.setAttribute("vo", vo);
				
				request.getRequestDispatcher("board_modify.jsp").forward(request, response);

			} else if( command.equals("/board/registForm.board") ) { //글 등록
				
				/*
				 * 1. service의 regist메서드로 연결
				 * 2. service에서 등록에 필요한 파라미터를 받습니다.
				 * 3. dao의 void regist() 메서드를 생성하고 insert작업
				 * 4. insert 이후에 컨트롤러에서 리스트(목록화면)로 리다이렉트(여기서는 리다이렉트가 국룰) 
				 */
				
				service.regist(request, response);
				response.sendRedirect("board_list.board"); //상대경로여서 /가 필요없음, 위에있는 부분을 실행하기 때문에
				
			} else if( command.equals("/board/updateForm.board")) {
				
				service.update(request, response); //update를 서비스 영역에 연결
				//1st
				//response.sendRedirect("board_list.board");
				
				//2nd
				//content로 가면 데이터들이 있어야 하는데 request.getParameter("bno")이게 화면에서 넘어오는 키값
				response.sendRedirect("board_content.board?bno=" + request.getParameter("bno"));
				
			} else if( command.equals("/board/board_delete.board")) {
				
				int result = service.delete(request, response);
				
				String msg = "";
				if(result == 1) { //삭제성공
					msg = "삭제성공";
					
				} else { //삭제실패
					msg= "삭제실패";
					
				}
				
				response.setContentType("text/html; charset = utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('"+ msg + "');");
				out.println("location.href = 'board_list.board'; ");
				out.println("</script>");
				
				
			}
			
			
		
	}

}
