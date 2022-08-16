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
			rs = stmt.executeQuery();

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
}