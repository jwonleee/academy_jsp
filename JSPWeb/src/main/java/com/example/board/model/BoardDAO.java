package com.example.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.util.JDBCUtil;


public class BoardDAO {
	
	//1. 나 자신의 객체를 생성해서 1개로 제한
	private static BoardDAO instance = new BoardDAO();
	
	
	//2. 직접 객체를 생성할 수 없도록 생성자에 private
	private BoardDAO() {
		//드라이버 클래스는 어차피 생성되어야 하므로 생성자에 포함
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("드라이버클래스 로드에러");
		}
	}
	
	
	//3. 외부에서 객체 생성을 요구할 때 getter 메서드를 통해 1번의 객체를 반환
	public static BoardDAO getInstance() {
		return instance;
	}

	
	//4. 필요한 데이터베이스 변수 선언
	public String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public String uid = "JSP";
	public String upw = "JSP";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void regist(String writer, String title, String content) {
		
		String sql = "insert into board (bno, writer, title, content) values (board_seq.nextval, ?, ?, ?)";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
