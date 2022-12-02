package com.example.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.test") //1. URL주소를 확장자패턴으로 변경
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("실행");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	//2. get, post 요청을 하나로 모음
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//3. 한글처리
		request.setCharacterEncoding("utf-8");
		
		//4. 요청분기
		System.out.println( request.getRequestURI() );
		//이렇게만 하면 basic파일의 href 부분의 이름이 바뀌어도 들어감
		//경로를 일관성있게 통일해주는게 좋음
		
		//System.out.println( request.getContextPath() ); //ContextPath()하면 JSPBasic 출력
		String path = request.getContextPath();
		//문자열 자르기
		String command = request.getRequestURI().substring( path.length() );
		System.out.println(command); //JSPBasic 잘리고, controller/join.test 출력
		
		
		switch (command) {
		case "/controller/join.test":
			 System.out.println("가입 처리");
			 break;
		
		case "/controller/login.test":
			 System.out.println("로그인 처리");
			 break;
			 
		case "/controller/logout.test":
			System.out.println("로그아웃 처리");
			break;
			
		case "/controller/delete.test":
			System.out.println("탈퇴 처리");
			break;
			
		case "/controller/update.test":
			System.out.println("수정 처리");
			break;
			 
		default:
			 break;
		}
		
	}
	
	
	
}
