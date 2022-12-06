package com.example.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.user.model.UserDAO;
import com.example.user.model.UserVO;

public class UserServiceImpl implements UserService{
	

	//컨트롤러의 역할을 분담
	//가입처리
	public int join(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		
		//아이디 or email 중복 검사 -> 없을 경우 가입
		
		UserDAO dao = UserDAO.getInstance();
		int result = dao.idCheck(id, email);
		
		if(result >= 1 ) { //ID or Email 중복
			return 1; // 1을 중복이다 라는 의미로 사용
		}else{ //중복 x -> 가입
			UserVO vo = new UserVO(id, pw, name, email, gender);
			dao.join(vo);
			return 0; // 0을 회원가입 성공 의미로 사용
		}
		
	}
	
	@Override
	public UserVO login(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		UserVO vo = dao.login(id, pw);
		
		return vo;
	}
	
	@Override  // dao랑 vo랑 같아도 되나 ok
	public UserVO getInfo(HttpServletRequest request, HttpServletResponse response) {
		
		//세션이 없기 때문에 세션을 생성해줌
		//세션에서 user_id값을 얻음
		HttpSession session = request.getSession();
		//세션을 통해 아이디를 받아옴 (로그인을 했을 당시 user_id라는 키로 저장해서 그걸로 받아옴)
		String result_id = (String)session.getAttribute("user_id");
		
		//dao 객체 생성
		UserDAO dao = UserDAO.getInstance();
		UserVO vo = dao.getInfo(result_id);
		
		//반환되어 돌아오는 vo이므로 return에 실어줌
		return vo;
	}

	@Override
	//성공실패 결과를 받지 않으려면 void가능, 받으려면 정수형
	public int update(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		
		//DAO 객체 생성
		UserDAO dao = UserDAO.getInstance();
		int result = dao.update(id, pw, name, gender);
		
		//업데이트 성공시 세션 변경
		//이름이 바뀌면 이름의 세션값을 바꿔줘야 함 (세션바꾸기)
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("user_name", name);
		}
		
		return result;
		
	}

	@Override
	public int delete(HttpServletRequest request, HttpServletResponse response) {
		
		//id가 필요
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		
		//DAO객체 생성
		UserDAO dao = UserDAO.getInstance();
		int result = dao.delete(id);
		
		if(result == 1) { //삭제 성공
			session.invalidate(); //남아있는 세션 전부 삭제
		}
		
		return result;
	}
	
	

}
