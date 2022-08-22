package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import service.DBUtil;
import vo.Customer;

public class CustomerDao {

	// 회원가입
	public int insertCustomer(Connection conn, Customer paramCustomer) throws SQLException {
		
		System.out.println("CustomerDao안에있는 insertCustomer(회원가입) 실행");

		int row = 0;

		// customer테이블에 값 넣어주기
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

			if (stmt != null) {
				stmt.close();
			}
		}

		System.out.println("CustomerDao.insertCustomer.row값 : " + row);
		return row;
	}

	// 회원탈퇴
	public int deleteCustomer(Connection conn, Customer paramCustomer) throws SQLException {
		
		System.out.println("CustomerDao안에있는 deleteCustomer(회원탈퇴) 실행");

		int row = 0;

		// customer테이블에서 값 삭제하기 <회원탈퇴>
		String sql = " DELETE FROM customer WHERE customer_id=? AND customer_pass=PASSWORD(?)";

		PreparedStatement stmt = null;

		try {

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			stmt.setString(2, paramCustomer.getCustomerPass());

			row = stmt.executeUpdate();

		} finally {

			if (stmt != null) {
				stmt.close();
			}
		}
		
		System.out.println("CustomerDao.deleteCustomer.row값 : " + row);
		return row;
	}
	
	// 강제회원탈퇴 이거해야함 --> 직원이 고객테이블 강제회원탈퇴 시키는거
	public int admindeleteCustomer(Connection conn, Customer paramCustomer) throws SQLException {
		
		System.out.println("CustomerDao안에있는 admindeleteCustomer(강제회원탈퇴) 실행");

		int row = 0;

		// customer테이블에서 값 삭제하기 <회원탈퇴>
		String sql = " DELETE FROM customer WHERE customer_id=?;";

		PreparedStatement stmt = null;

		try {

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			stmt.setString(2, paramCustomer.getCustomerPass());

			row = stmt.executeUpdate();

		} finally {

			if (stmt != null) {
				stmt.close();
			}
		}
		
		return row;
	}
	
	
	// 로그인
	public Customer selectCustomer(Connection conn, Customer paramcustomer) throws Exception {
		
		System.out.println("CustomerDao안에있는 selectCustomer(로그인) 실행");

		Customer loginCustomer = null;
			
		// customer_id & customer_pass값이 같을시 같은 값 출력
		String sql = "SELECT customer_id,customer_name FROM customer where customer_id=? AND customer_pass=PASSWORD(?)";

		PreparedStatement stmt = null;
		ResultSet rset = null;

		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramcustomer.getCustomerId());
			stmt.setString(2, paramcustomer.getCustomerPass());
			rset = stmt.executeQuery(); // 0이 아니면 실행이됨

			if (rset.next()) {
				
				loginCustomer = new Customer();
				loginCustomer.setCustomerId(rset.getString("customer_id"));
				loginCustomer.setCustomerName(rset.getString("customer_name"));
			}
			
		} finally {

			if(stmt!=null) {stmt.close();}
			if(rset!=null) {rset.close();}
		}
		
		return loginCustomer;
	}

	// 회원정보상세보기
	public Customer selectCustomerOne(Connection conn, String customerId) throws SQLException {
		
		System.out.println("CustomerDao안에있는 selectCustomerOne(회원정보) 실행");

		Customer selectCustomer = null;

		// 상세보기 쿼리 (*은 가능하면 쓰지말기)
		String sql = "SELECT customer_id,customer_pass,customer_name,customer_address,customer_telephone,create_date,update_date FROM customer WHERE customer_id=?";

		PreparedStatement stmt = null;
		ResultSet rset = null;

		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, customerId); //session으로 받아온 Id값이 들어가서 출력해줌
			rset = stmt.executeQuery(); // rset에 파라미터들이 들어가있는 상태

			if (rset.next()) { //위에 값이 들어가면 실행시켜줌

				selectCustomer = new Customer();
				selectCustomer.setCustomerId(rset.getString("customer_id")); // customerid를 rset에서 가져옴 후 customerid에 넣어줌
				selectCustomer.setCustomerPass(rset.getString("customer_pass"));
				selectCustomer.setCustomerName(rset.getString("customer_name"));
				selectCustomer.setCustomerAddress(rset.getString("customer_address"));
				selectCustomer.setCustomerTelephone(rset.getString("customer_telephone"));
				selectCustomer.setCreateDate(rset.getString("create_date"));
				selectCustomer.setUpdateDate(rset.getString("update_date"));
			}

		} finally {

			if(stmt!=null) {stmt.close();}
			if(rset!=null) {rset.close();}
		}
		
		return selectCustomer;
	}

	// 회원정보수정
	
	public int updateCustomer(Connection conn, Customer paramCustomer) throws SQLException {
		
		System.out.println("CustomerDao안에있는 updateCustomer실행");
		
		int row = 0;
		
		String sql = "UPDATE customer SET customer_name = ? , customer_address=?,customer_telephone=? WHERE customer_id = ?";
		PreparedStatement stmt = null;
		
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerName());
			stmt.setString(2, paramCustomer.getCustomerAddress());
			stmt.setString(3, paramCustomer.getCustomerTelephone());
			
			row = stmt.executeUpdate();
			
		} finally {
			
			if(stmt!=null) {stmt.close();}
			
		}
		
		return row;
	}
	
	// 고객 상세보기
	public ArrayList<Customer> SelectCustomerList(Connection conn,int rowPerPage,int beginRow) throws SQLException{
		
		System.out.println("CustomerDao안에있는 SelectCustomerList실행");
		
		ArrayList<Customer> list = new ArrayList<Customer>();
		
		String sql = "SELECT customer_id,customer_name,customer_address,customer_telephone,update_date,create_date FROM customer ORDER BY create_date DESC LIMIT ?,?";
	
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		Customer customer = new Customer();
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rset = stmt.executeQuery();
			
			while(rset.next()) {
				customer = new Customer();
				customer.setCustomerId(rset.getString("customer_id"));
				customer.setCustomerName(rset.getString("customer_name"));
				customer.setCustomerAddress(rset.getString("customer_address"));
				customer.setCustomerTelephone(rset.getString("customer_telephone"));
				customer.setUpdateDate(rset.getString("update_date"));
				customer.setCreateDate(rset.getString("create_date"));
				list.add(customer);
				
			}
		} finally {
			if (rset != null) {
				rset.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}
		System.out.println("CustomerDao.SelectCustomerList.list값 :"+list);
		
		return list;
	}
	
	// 고객 상세보기 마지막 페이지
	public int CustomerlastPage(Connection conn) throws SQLException {
		
		System.out.println("CustomereDao안에있는 customerLastPage 실행");

		String sql = "SELECT COUNT(*) FROM customer";
		PreparedStatement stmt = null;
		ResultSet rset = null;
		int totalCount = 0;

		try {
			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}

			System.out.print(totalCount + "Customer의 dao");

		} finally {

			if (rset != null) {
				rset.close();
			}
			if (rset != null) {
				stmt.close();
			}
		}
		System.out.println("CustomerDao.customerLastPage.totalCount값 :"+totalCount);
		return totalCount;

	}
	
	
}