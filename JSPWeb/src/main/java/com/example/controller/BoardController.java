package com.example.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

			BoardService service = new BoardServiceImpl();
//			HttpSession session = null;
			
			if ( command.equals("/board/board_write.board") ) { //등록화면
				
				request.getRequestDispatcher("board_write.jsp").forward(request, response);
				
			} else if( command.equals("/board/board_list.board") ) { //목록화면
				
				request.getRequestDispatcher("board_list.jsp").forward(request, response);
				
			} else if( command.equals("/board/board_content.board") ) { //상세내용화면

				request.getRequestDispatcher("board_content.jsp").forward(request, response);
				
			} else if( command.equals("/board/board_modify.board") ) { //수정화면
				
				request.getRequestDispatcher("board_modify.jsp").forward(request, response);

			} else if( command.equals("/board/registForm.board") ) { //글 등록
				
				/*
				 * 1. service의 regist메서드로 연결
				 * 2. service에서 등록에 필요한 파라미터를 받습니다.
				 * 3. dao의 void regist() 메서드를 생성하고 insert작업
				 * 4. insert 이후에 컨트롤러에서 리스트(목록화면)로 리다이렉트(여기서는 리다이렉트가 국룰) 
				 */
				service.regist(request, response);
				
				response.sendRedirect("board_list.board"); //상대경로여서 /가 필요없음
				
			}
			
			
		
	}

}
