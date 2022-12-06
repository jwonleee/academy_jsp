package com.example.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.util.JDBCUtil;

public class UserDAO {
	
	//UserDAO는 불필요하게 여러 개 만들어질 필요가 없기 때문에
	//한 개의 객체만 만들어지도록 Singleton 형식으로 설계
	
	//1. 나 자신의 객체를 생성해서 1개로 제한
	private static UserDAO instance = new UserDAO();
	
	
	//2. 직접 객체를 생성할 수 없도록 생성자에 private
	private UserDAO() {
		//드라이버 클래스는 어차피 생성되어야 하므로 생성자에 포함
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("드라이버클래스 로드에러");
		}
	}
	
	
	//3. 외부에서 객체 생성을 요구할 때 getter 메서드를 통해 1번의 객체를 반환
	public static UserDAO getInstance() {
		return instance;
	}

	
	//4. 필요한 데이터베이스 변수 선언
	public String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public String uid = "JSP";
	public String upw = "JSP";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	//5. 메서드
	public int idCheck(String id, String email) {
		int result = 0;
		
		String sql = "select count(*) as total from users where id = ? or email = ?";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				result = rs.getInt("total");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	//회원가입
	public void join(UserVO vo) {
	
		String sql = "insert into users values(?, ?, ?, ?, ?)";
		
		try	{
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getGender());
			
			pstmt.executeUpdate(); // 실행 후 성공 시 1 반환 실패 시 0 반환
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
	}
	
	//로그인
	public UserVO login(String id, String pw) {
		
		UserVO vo = null;
		
		String sql = "select * from users where id = ? and pw = ?";
		
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //로그인 성공 시 데이터가 조회되서 나타났을 것이다. 이를 vo에 담는다.

				String id2 = rs.getString("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String gender = rs.getString("gender");
				
				vo = new UserVO(id2, null, name, email, gender);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
	//////////////////////////////////////////////////////////////////////
	
		return vo; //vo가 null이면 로그인 실패
	}
	
	public UserVO getInfo(String result_id) { //id가 파라미터로(화면에서) 안넘어오니까 세션에 저장되어 있는 것을 꺼내서 사용
		
		String sql = "select * from users where id = ? "; //아이디가 맞는 정보

		UserVO vo = null; //데이터 조회한 결과를 생성해서 vo에 담아줌, 미리 생성해서 담아줘도 됨(받아오는 파라미터값이 이미 있는 아이디이므로 null값 아니니까)
		
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, result_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //로그인 성공 시 데이터가 조회되서 나타났을 것이다. 이를 vo에 담는다.
				  			//select 같은 경우 DB에서 읽어온 데이터를 자바에서 쓰기 위해서
							//변수에 담아서 UseVO객체에 담음, insert, delete 에서는 필요 없음
				String id = rs.getString("id"); //id
				String name = rs.getString("name"); //name
				String email = rs.getString("email"); //email
				String gender = rs.getString("gender"); //gender
				
				vo = new UserVO(id, null, name, email, gender);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		
		return vo;
		
	}
	
	
	public int update(String in_id, String in_pw, String in_name, String in_gender) {
		int result = 0;
		
		String sql = "update users\r\n"
					+ "set pw = ?, name = ?, gender = ?\r\n"
					+ "where id = ? ";
		
		try {
			
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, in_pw);
			pstmt.setString(2, in_name);
			pstmt.setString(3, in_gender);
			pstmt.setString(4, in_id);
			
			result = pstmt.executeUpdate(); // 성공1 or 실패0
			
			if(result == 1) { // 사실 여기서는 이 부분 없어도 됨
				System.out.println("성공");
			} else {
				System.out.println("실패");
			}
			
	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		
		return result;
	}
	
	//회원 탈퇴 기능
	public int delete(String id) {
		int result = 0;
		
		String sql = "delete from users where id = ?";
		
		try {
			
			conn = DriverManager.getConnection(url,uid,upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
	
}
