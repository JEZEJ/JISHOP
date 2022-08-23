package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import repository.SignDao;

public class SignService {
	private SignDao signDao; // 캡슐화
	
	
	public boolean idCheck(String id) {
		
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
			e.printStackTrace(); 
			try {
				conn.rollback(); 
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
