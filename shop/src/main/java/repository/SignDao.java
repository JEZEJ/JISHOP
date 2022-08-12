package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.*;

public class SignDao {
	// 아이디체크			
	public String idCheck(Connection conn, String id) throws SQLException {
		String ckId = null;
		

		
		// if(rs!=null) {}
		// close....
		
		String sql = "SELECT t.id\r\n"
				+ "		FROM 	(SELECT customer_id id FROM customer\r\n"
				+ "				UNION\r\n"
				+ "				SELECT	employee_id id FROM employee\r\n"
				+ "				UNION\r\n"
				+ "				SELECT out_id id FROM outid) t\r\n"
				+ "		WHERE t.id=?";
		
		PreparedStatement stmt= null;
		ResultSet rs = null;
		
		
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);			
			rs = stmt.executeQuery();
			
		
			if(rs==null) {stmt.close();}
			else {rs.close();}
			
		return ckId;
	}
}
