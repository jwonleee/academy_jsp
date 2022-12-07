package com.example.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.board.model.BoardVO;

public interface BoardService { //마치 like 메뉴판

	public void regist(HttpServletRequest request, HttpServletResponse response); //등록
	
	public ArrayList<BoardVO> getList(HttpServletRequest request, HttpServletResponse response); //조회
	
	//1행에 대한 데이터니까 반환은 BoardVO
	BoardVO getContent(HttpServletRequest request, HttpServletResponse response); //컨텐츠 확인
	
	void update(HttpServletRequest request, HttpServletResponse response); //컨텐츠 수정
	
	int delete(HttpServletRequest request, HttpServletResponse response);
	
}
