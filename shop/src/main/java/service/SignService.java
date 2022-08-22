package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import repository.SignDao;

public class SignService {
	private SignDao signDao; // 캡슐화
	
	
	public boolean idCheck(String id) {
		// SignDao signDao = new SignDao(); 1)
		// SignService 안에서 사용하는 모든 SignDao는 동일한 SignDao
		
		System.out.println("SignService안에있는 idCheck실행");
		
		boolean result = false; 
		this.signDao = new SignDao(); 

		Connection conn = null;
	
		try {
			conn = new DBUtil().getConnection();
			
			if(signDao.idCheck(conn, id) == null) {
				result = true;
			} 
			//true이면 사용가능한 값
			
			conn.commit(); 
		
		} catch(Exception e) {
			e.printStackTrace(); // 콘솔에 문제있슴다 하고 출력
			try {
				conn.rollback(); // 만약 예외있음 커밋대신 롤백
			} catch (SQLException e1) {				
				e1.printStackTrace();
			} 
		} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		
			System.out.println("SignService.idCheck.result값 : " + result); 
			return result;
		}
	
	}
