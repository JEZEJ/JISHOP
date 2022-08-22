package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import service.CustomerService;
import vo.OutId;

public class OutIdDao {
	

	public int insertOutId(Connection conn, String customerId) throws SQLException {
		
		System.out.println("OutIdDao안에있는 insertOutId실행");
		
		int row = 0;
		
		String sql = "	 INSERT INTO outid (out_id, out_date) VALUES (?, NOW())";
		
		PreparedStatement stmt=null;
		
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, customerId);
			
			row = stmt.executeUpdate();
			
		} finally {
			if(stmt!=null) {stmt.close();}
			
		}
		System.out.println("OutIdDao.insertOutId.row 값 : "+row);
		return row;
		
	}
}
