package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.*;

public class SignDao {
	
	// 아이디체크	<없는 아이디 넣기위해> 아이디 중복 xx	
	public String idCheck(Connection conn, String id) throws SQLException {
		
			System.out.println("SignDao안에있는 idCheck실행");
			String ckId = null;

			String sql = "SELECT t.id FROM (SELECT customer_id id FROM customer UNION SELECT employee_id id FROM employee UNION SELECT out_id id FROM outid) t WHERE t.id=?";
			// 세개중에 있으면 아이디를 쓸수없음
		
			PreparedStatement stmt= null;
			ResultSet rset = null;

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);			
			rset = stmt.executeQuery();

			if(rset.next()) {	
				ckId = rset.getString("t.id");
			}	
			
			System.out.println("Signdao.idCheck.ckId 값 : " + ckId);
			return ckId;
	}
}
