package com.example.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello") //요청에 대하여 어노테이션으로 연결
public class TestServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	//특정클래스 오버라이드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//System.out.println("헬로");
		//out객체 사용법
		resp.setContentType("text/html; charset=UTF-8"); //이 형태로 보여줘라, 라고 클라이언트에게 알려줌
		PrintWriter out = resp.getWriter();
		out.println("헬로"); //컨텐츠타입
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}
	
	
	
}
