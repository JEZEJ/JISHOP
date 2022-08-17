package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.DBUtil;
import vo.Customer;

public class CustomerDao {

	// 회원가입
	public int insertCustomer(Connection conn, Customer paramCustomer) throws SQLException {

		int row = 0;

		String sql = "INSERT INTO customer (customer_id,customer_pass,customer_name,customer_address,customer_telephone,update_date,create_date) VALUES (?, PASSWORD(?), ?, ?, ?, NOW(), NOW())";

		PreparedStatement stmt = null;

		try { // ?값 넣어주기
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			stmt.setString(2, paramCustomer.getCustomerPass());
			stmt.setString(3, paramCustomer.getCustomerName());
			stmt.setString(4, paramCustomer.getCustomerAddress());
			stmt.setString(5, paramCustomer.getCustomerTelephone());

			row = stmt.executeUpdate();

		} finally {

				stmt.close();
		}

		return row;
	}

	// 회원탈퇴
	public int deleteCustomer(Connection conn, Customer paramCustomer) throws SQLException {

		// DELETE FROM customer WHERE customer_id=? AND customer_pass=PASSWORD(?)

		int row = 0;

		String sql = " DELETE FROM customer WHERE customer_id=? AND customer_pass=PASSWORD(?)";

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			stmt.setString(2, paramCustomer.getCustomerPass());

			row = stmt.executeUpdate();

		} finally {
			stmt.close();
		}
		return row;
	}

	// 로그인
	public Customer selectCustomer(Connection conn, Customer paramcustomer) throws Exception {

		Customer loginCustomer = null;

		String sql = "SELECT customer_id customerId,customer_pass customerPass,customer_name customerName FROM customer where customer_id=? AND customer_pass=PASSWORD(?)";

		PreparedStatement stmt = null;

		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramcustomer.getCustomerId());
			stmt.setString(2, paramcustomer.getCustomerPass());
			rs = stmt.executeQuery(); // 0이 아니면 실행이됨

			if (rs.next()) {
				loginCustomer = new Customer(); // vo
				loginCustomer.setCustomerId(rs.getString("customerId"));
				loginCustomer.setCustomerPass(rs.getString("customerPass"));
				loginCustomer.setCustomerName(rs.getString("customerName"));

			}
		} finally {

			stmt.close();
			rs.close();
		}
		return loginCustomer;
	}
	
	// 회원정보상세보기
	public Customer selectCustomerOne (Connection conn, String customerId) throws SQLException {
		
		Customer selectCustomer = null;
		
		// 상세보기 쿼리 (*은 가능하면 쓰지말기)
		String sql = "SELECT customer_id,customer_pass,customer_name,customer_address,customer_telephone,create_date,update_date FROM customer WHERE customer_id=?";
		
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, customerId);
			rset = stmt.executeQuery(); //rset에 파라미터들이 들어가있는 상태
		
			if(rset.next()) {
				
				selectCustomer = new Customer();
				selectCustomer.setCustomerId(rset.getString("customer_id")); //customerid를 rset에서 가져옴 후 customerid에 넣어줌 
				selectCustomer.setCustomerPass(rset.getString("customer_pass"));
				selectCustomer.setCustomerName(rset.getString("customer_name"));
				selectCustomer.setCustomerAddress(rset.getString("customer_address"));
				selectCustomer.setCustomerTelephone(rset.getString("customer_telephone"));
				selectCustomer.setCreateDate(rset.getString("create_date"));
				selectCustomer.setUpdateDate(rset.getString("update_date"));
			}
			
		} finally {
			
			stmt.close();
			rset.close();
		}
		
		return selectCustomer;
	}
}