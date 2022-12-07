package com.example.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

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
	
	//조회메서드
	public ArrayList<BoardVO> getList() {
		
		ArrayList<BoardVO> list = new ArrayList<>();
		
		String sql = "select * from board order by bno desc";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			//rs결과를 list에 저장
			while(rs.next()) {
				
				//rs가 여러번 실행할 때마다 (= 다음 row가 있다면)
				//한 행에 대한 처리(getInt, getString, getDouble, getTimestamp, getDate)
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				//BoardVO타입 객체 생성후 생성자로 한번에 담기 
				BoardVO vo = new BoardVO(bno, writer, title, content, regdate, hit);
				
				//list에 객체 저장
				list.add(vo);
				
			}
			
//			위와 같은 구문
//			그냥 객체 생성 후 vo.set으로 저장
//			화면에서 쓸거면 getTimestamp가 편하고, 자바에서 쓰려면 getDate가 편함
//			while(rs.next()) {
//				BoardVO vo = new BoardVO();
//				vo.setBno( rs.getInt("bno"));
//				vo.setTitle( rs.getString("title"));
//				vo.setWriter( rs.getString("writer"));
//				vo.setContent( rs.getString("content"));
//				vo.setRegdate( rs.getTimestamp("regdate"));
//				vo.setBno( rs.getInt("hit"));
//			
//				list.add(vo);
//				
//			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//글 세부내용
	public BoardVO getContent(String bno) {
		
		BoardVO vo = null;
		
		String sql = "select * from board where bno = ?";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno); //자동형변환이 있어서 String으로 받아도 됨 bno = '1';(?)
			
			rs = pstmt.executeQuery();
			
			//한 행이니까 if로
			if(rs.next()) {
				vo = new BoardVO();
				vo.setBno( rs.getInt("bno"));
				vo.setTitle( rs.getString("title"));
				vo.setWriter( rs.getString("writer"));
				vo.setContent( rs.getString("content"));
				vo.setRegdate( rs.getTimestamp("regdate"));
				vo.setHit( rs.getInt("hit"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
	
	return vo;
		
	}
	
	//수정메서드
	public void update(String bno, String title, String content) {
		
		String sql = "update board set title = ?, content = ? where bno = ?";
		
		try {
			
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, bno);
			
			pstmt.executeUpdate(); //void형이니까 여기서 끝
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
	}
	
	//삭제 기능
	public int delete(String bno) {
		
		int result = 0;
		
		String sql = "delete from board where bno = ?";
		
		try {
			
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			
			result = pstmt.executeUpdate();
			//반환값 보려고 result에 다 담음
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		
		
		
		return result;
	}
	
	
	
}
