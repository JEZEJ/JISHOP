package service;

import java.sql.Connection;
import java.sql.SQLException;

import repository.CustomerDao;
import repository.OutIdDao;
import vo.Customer;
import vo.OutId;

public class CustomerService { 
	
	// 회원가입
	public void signInCustomer(Customer paramCustomer) {

		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); 
			
			CustomerDao customerDao = new CustomerDao();	
			
			try {
				customerDao.insertCustomer(conn, paramCustomer);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}						
			conn.commit();
			
			} catch (Exception e1) {
				
				e1.printStackTrace();
				try {
					conn.rollback();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			} finally {				
				try {
					conn.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}	
	}
	
	// 탈퇴
	public boolean removeCustomer (Customer paramCustomer) {
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); 
			
			CustomerDao customerDao = new CustomerDao(); 
			if(customerDao.deleteCustomer(conn, paramCustomer) !=1) { 
				throw new Exception();
			}
			OutIdDao OutIdDao = new OutIdDao();
			if(OutIdDao.insertOutId(conn, paramCustomer.getCustomerId()) !=1) {
					
					throw new Exception();
				}
						
			conn.commit(); 
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback(); // CustomerDao OutIdDao 
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		} finally {
				try {
					conn.close(); 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return true;
		}
	
		// 로그인
		public Customer loginCustomer (Customer paramCustomer) {
			
				Connection conn = null;
				
				Customer customer =new Customer();
			
				try {
					
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);
				
				CustomerDao customerDao = new CustomerDao();			
				customer=customerDao.selectCustomer(conn, paramCustomer);
				
				conn.commit();
				
				} catch (Exception e) {
					
					e.printStackTrace();
				} finally {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}	
				}
			return customer;
		}
		
		//회원정보상세보기
		public Customer customerOne (Customer paramCustomer) {
			
			Connection conn = null;
			Customer customer = new Customer();
			
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);
				
				CustomerDao customerDao = new CustomerDao();			
				customer=customerDao.selectCustomer(conn, paramCustomer);
				
				
				conn.commit();
				
				} catch (Exception e) {
					
					e.printStackTrace();
				} finally {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}	
				}
			return customer;
		}
	}
