package service;


import java.sql.Connection;
import java.sql.SQLException;

import repository.CustomerDao;
import repository.OutIdDao;
import vo.Customer;
import vo.OutId;


public class CustomerService { // 서비스는 이름 유연하게 써도 된대
	// 트랜젝션 처리를 서비스에서 한다 그래서 트라이캐치파이널리 막 씌우면서 복잡한 이유
	
	public void signInCustomer(Customer paramCustomer) {
		// Customer에 담을 필요가 없다
		// insertCustomer만 실행하면 끝인거야
		

		
		Connection conn = null;
		
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // 자동커밋 방지
			
			CustomerDao customerDao = new CustomerDao();			
			try {
				customerDao.insertCustomer(conn, paramCustomer);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}						
			conn.commit();
			
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				try {
					conn.rollback();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} finally {				
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		
	}
	
	
		
	// loginAction.jsp 호출
	// 딜리트는 리턴할게 없어서 불리언 쓴거오
	public boolean removeCustomer (Customer paramCustomer) {
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // executeUpdate()실행시 자동커밋 안되게 잠그기
			//								└ 메모리엔 O 실제 디비에 반영 안되는 상태
			
			CustomerDao customerDao = new CustomerDao(); // 커스토머 디에이오 호출
			if(customerDao.deleteCustomer(conn, paramCustomer) !=1) { 
				throw new Exception();
			}
			OutIdDao OutIdDao = new OutIdDao();
			if(OutIdDao.insertOutId(conn, paramCustomer.getCustomerId()) !=1) {
					// 예외 >   try, catch, finally, throw, throws 중 throw가 예외발생
					throw new Exception();
				}

		
						
			conn.commit(); // 위에 둘다 같은 conn 실행시켜서 둘다 실패 없을시 드디어 커밋 ★★★★★
		} catch (Exception e) {
			e.printStackTrace();// 콘솔창에 예외메시지 출력 / 기입 必
			try {
				conn.rollback(); // CustomerDao OutIdDao 예외나면 롤백
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		} finally {
				try {
					conn.close(); // 예외가 나든 안나든 클로스는 이루어지고
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return true;
		}
	
	
		// 얘는 세션에 넣어야하니까 리턴값이 customer이여야지
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
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				}
			return customer;
			
		}
	
	}
