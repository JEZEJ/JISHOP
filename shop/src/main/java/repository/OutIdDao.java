package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import service.CustomerService;
import vo.OutId;

public class OutIdDao {
	

	public int insertOutId(Connection conn, String customerId) throws SQLException {
		int row = 0;
		

		/*
		 INSERT INTO 
		 outid (out_id, out_date) 
		 VALUES (?, NOW())
		 */
		
		String sql = "	 INSERT INTO \r\n"
				+ "		 outid (out_id, out_date) \r\n"
				+ "		 VALUES (?, NOW())";
		
		PreparedStatement stmt=null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, customerId);
			
			row = stmt.executeUpdate();
			
		} finally {
			stmt.close();
			
		}
		
		
		
		return row;
		
	}
}
