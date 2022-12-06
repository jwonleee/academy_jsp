package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.user.model.UserVO;
import com.example.user.service.UserService;
import com.example.user.service.UserServiceImpl;

@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response); //do, post 통합
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response); //do, post 통합
	}

	//get, post 하나로 묶는 메서드
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		//요청분기
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		
		String command = uri.substring(path.length());
		
		System.out.println("요청경로: " + command);

		UserService service = new UserServiceImpl();
		HttpSession session = null;
		
		switch (command) {
		case "/user/user_join.user":
			
			request.getRequestDispatcher("user_join.jsp").forward(request,response);
			
			break;
		case "/user/joinForm.user":
			
			int result = service.join(request, response);
			
			if(result >= 1) { //아이디 중복되었을 경우
				//메시지
				request.setAttribute("msg", "중복된 아이디 or 이메일입니다."); //메시지를 보내야하기에 포워드 사용
				request.getRequestDispatcher("user_join.jsp").forward(request, response);
				
				
			}else { //가입 성공
				
				//request.getRequestDispatcher("user_login.jsp").forward(request, response);
				//response.sendRedirect("user_login.jsp"); //MVC2 방식을 위반함 /컨트롤러 안타고 바로 가기 때문에
				response.sendRedirect("user_login.user");
			}
			break;
		
		case "/user/user_login.user": //로그인페이지
			
			request.getRequestDispatcher("user_login.jsp").forward(request, response);
			break;
		
		case "/user/loginForm.user": //로그인요청
			
			UserVO vo = service.login(request, response);
		
			if(vo == null) { //로그인 실패
				request.setAttribute("msg", "아이디 비밀번호를 확인하세요");
				request.getRequestDispatcher("user_login.jsp").forward(request, response);
			}else { //로그인 성공
				//세션에 아이디, 이름을 저장
				session = request.getSession();
				session.setAttribute("user_id", vo.getId());
				session.setAttribute("user_name", vo.getName());
				
				//마이페이지로 이동
				response.sendRedirect("user_mypage.user");
				
			}
			
			break;
		
		case "/user/user_mypage.user": //마이페이지
			
			request.getRequestDispatcher("user_mypage.jsp").forward(request, response);
			
			break;
			
		case "/user/user_logout.user": //로그아웃
			
			session = request.getSession();
			session.invalidate(); //세션무효화 (아예 싹다 소멸, remove는 그건 아님)
			
			//main 컨트롤러 사용
			//response.sendRedirect("/JSBasic/index.main"); //메인으로
			response.sendRedirect(path + "/index.main"); //위와 같은 표현
			
			break;
			
		case "/user/user_modify.user": //정보수정화면
			
			//회원데이터를 가지고 나오는 작업
			/* 
			 * service와 dao에 getInfo() 메서드를 선언
			 * service메서드 세션에서 아이디를 얻습니다.
			 * dao에서는 id를 전달받아 회원 데이터를 조회하여 vo에 저장합니다.
			 * controller에서는 조회한 vo를 저장하고 화면으로 가지고 나갑니다.
			 * 화면에서는 input태그에 값을 출력해주세요
			 */
			
			//UserVO로 들어오는데 service의 getInfo를 호출하고, 반환받음
			UserVO vo2 = service.getInfo(request, response);
			
			//세번째 페이지에서 일회용으로 쓰기 때문에 request로 담아줌
//			request.setAttribute("result_id", vo2.getId()); //키, 값
//			request.setAttribute("result_name", vo2.getName());
//			request.setAttribute("result_email", vo2.getEmail());
//			request.setAttribute("result_gender", vo2.getGender());
			
			//위에서 가져옴 vo2를 vo라는 이름에 담아주고,
			request.setAttribute("vo", vo2); //화면에서 vo사용 가능
			
			request.getRequestDispatcher("user_modify.jsp").forward(request, response);
			
			break;
			
		case "/user/update_form.user" :
			
			//회원정보를 업데이트 하는 작업
			/*
			 * service와 dao에 update() 메서드를 생성
			 * service의 필요한 파라미터 값을 받습니다. (pw, name, gender) 조건절 (id)
			 * dao에서 데이터를 전달받아서 업데이트를 실행
			 * 업데이트 이후에는 컨트롤러를 태워서 mypage로 리다이렉트 
			 */
			
			//컨트롤러에서 service.update 연결
			int update = service.update(request, response);
			
			if(update == 1) { //업데이트 성공
				//response.sendRedirect("user_mypage.user"); //컨트롤러를 태워서 user로 보내야 함
				
				//out객체를 이용해서 화면에 스트립트를 작성해서 보냄
				response.setContentType("text/html; charset = utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('정보가 수정되었습니다');");
				out.println("location.href = 'user_mypage.user'; ");
				out.println("</script>");
				
			} else { //업데이트 실패
				//modify를 포워드 사용하면 - 필요한 값들을 못 들고 나옴
				//redirect를 컨트롤러로 태우면 그 case다음에 있는 정보들을 다들고 나옴
				response.sendRedirect("user_modify.user");
			}
			break;

		case "/user/user_delete.user" :
			
			int delete = service.delete(request, response);
			
			if(delete == 1) {
				response.sendRedirect(path + "/index.main"); //메인화면
			} else {
				response.sendRedirect("user_mypage.user"); //마이페이지
			}
			
			break;
			
			
		default:
			break;
		}
		
		
	}
	
}
