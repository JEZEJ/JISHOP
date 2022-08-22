package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import repository.CustomerDao;
import repository.EmployeeDao;
import repository.OutIdDao;
import vo.Customer;
import vo.OutId;

public class CustomerService { 
	
	// 회원가입
	public void signInCustomer(Customer paramCustomer) {
		
		System.out.println("CustomerSerive안에있는 sigdInCustomer실행");
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); //자동커밋해지
			
			CustomerDao customerDao = new CustomerDao();	
			
			try {
				customerDao.insertCustomer(conn, paramCustomer); 
				//Dao안에있는 insertCustomer을 실행
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
		
		System.out.println("CustomerSerive안에있는 removeCustomer실행");
		
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
	
	// 강제탈퇴<해야함>
		public boolean adminremoveCustomer (Customer paramCustomer) {
			
			
			Connection conn = null;
			
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false); 
				
				CustomerDao customerDao = new CustomerDao(); 
				if(customerDao.admindeleteCustomer(conn, paramCustomer) !=1) { 
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
			
			System.out.println("CustomerSerive안에있는 loginCustomer실행");
			
				Connection conn = null; // DB연결준비
				Customer customer = new Customer(); //vo.customer객체 만들기
			
				try {
					
				conn = new DBUtil().getConnection(); // DB연결
				conn.setAutoCommit(false);
				
				CustomerDao customerDao = new CustomerDao(); //Dao			
				customer = customerDao.selectCustomer(conn, paramCustomer); 
				
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
		public Customer customerOne (String customerId) {
			
			System.out.println("CustomerSerive안에있는 customerOne실행");
			
			Connection conn = null;
			Customer customer = new Customer();
			
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);
				
				CustomerDao customerDao = new CustomerDao();			
				customer = customerDao.selectCustomerOne(conn, customerId);
					
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
		
		// 회원정보 수정하기
		public int modifyCustomer(Customer customer) {
			
			System.out.println("CustomerService.modifyCustomer 실행");
			
			Connection conn = null;
			int row = 0;
			
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);

				CustomerDao customerDao = new CustomerDao();
				row = customerDao.updateCustomer(conn, customer);

				if (row == 0) {
					throw new Exception();
				}
				conn.commit();
			} catch (Exception e) {
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
			return row;

		}
		
		// 고객 목록 관리
		
		public ArrayList<Customer> getCustomerList(int rowPerPage,int currentPage) {
			
			ArrayList<Customer> list = new ArrayList<Customer>();
			
			Connection conn = null;
			int beginRow = (currentPage -1) * rowPerPage;
			
			try {
				conn = new DBUtil().getConnection();
				CustomerDao customerDao = new CustomerDao();
				
				list = customerDao.SelectCustomerList(conn, rowPerPage, beginRow);
				
				if (list == null) {
					throw new Exception();
				}
				conn.commit();
			} catch (Exception e) {

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
			return list;
			
		}
		
		// 라스트 페이징 서비스
		
		public int getCustomerListLastPage(int rowPerPage) {
			
			Connection conn = null;
			
			try {
				
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);
				
				CustomerDao customerDao = new CustomerDao();
				rowPerPage = customerDao.CustomerlastPage(conn);
				
				if(rowPerPage == 0) {
					throw new Exception();
				}
				conn.commit();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				try {
					conn.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			return rowPerPage;
		}
	}
