package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import repository.SignDao;

public class SignService {
	private SignDao signDao; // 캡슐화
		

	
	public boolean idCheck(String id) {
		// SignDao signDao = new SignDao(); 1)
		// 사인서비스 안에서 사용하는 모든 SignDao는 동일한 SignDao
		
		
		boolean result = false; 
		this.signDao = new SignDao(); // 2), 1)로 쓰면 NULLPointException뜬대

		Connection conn = null;
	
		try {
			conn = new DBUtil().getConnection();
			if(signDao.idCheck(conn, id)== null) {
				result = true;
			} //signDao호출 및 메서드이용, null이면 사용이 가능하ㄴ단 소리니까
			
			conn.commit(); // 트라이절 마지막에 커밋 기계적으로 달래
		
		} catch(Exception e) {
			e.printStackTrace(); // 콘솔에 문제있슴다 하고 출력
			try {
				conn.rollback(); // 만약 예외있음 커밋대신 롤백시키구
			} catch (SQLException e1) {				
				e1.printStackTrace();
			} 
		} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return result;
		}
		
		// conn... 클로즈
		
	}

