package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.*;

public class SignDao {
	
	// 아이디체크			
	public String idCheck(Connection conn, String id) throws SQLException {
		
			System.out.println("Signdao idCheck");
			String ckId = null;

			String sql = "SELECT t.id FROM (SELECT customer_id id FROM customer UNION SELECT employee_id id FROM employee UNION SELECT out_id id FROM outid) t WHERE t.id=?";
			// 세개중에 있으면 쓸수없다 
		
			PreparedStatement stmt= null;
			ResultSet rs = null;

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);			
			rs = stmt.executeQuery();

			if(rs.next()) {	
				ckId = rs.getString("t.id");
			}	
			
			System.out.println("Signdao idCheck : " + ckId);
			return ckId;
	}
}
