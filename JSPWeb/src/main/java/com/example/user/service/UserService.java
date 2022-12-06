package com.example.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.user.model.UserVO;

public interface UserService {
	
	public int join(HttpServletRequest request, HttpServletResponse response); //회원가입
	
	public UserVO login(HttpServletRequest request, HttpServletResponse response); //로그인
	
	public UserVO getInfo(HttpServletRequest request, HttpServletResponse response); //정보조회(정보 수정하려고)
	//UserVO를 받음, doAction에 있는 request, response임
	
	public int update(HttpServletRequest request, HttpServletResponse response); //업데이트
	
	public int delete(HttpServletRequest request, HttpServletResponse response); //회원탈퇴
}
