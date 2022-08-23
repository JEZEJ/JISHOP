package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import repository.OrdersDao;
import vo.Orders;

public class OrdersService {
	
	private OrdersDao ordersDao;
	
	// 고객 주문 추가
		public int addCustomerOrders(Orders orders) {
			int row = 0;
			Connection conn = null;
			
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false); // executeUpdate() 실행 시 자동 커밋을 막음
				
				this.ordersDao = new OrdersDao();		 			
				row = ordersDao.insertCustomerOrders(conn, orders);
				
				if(row == 0) { 
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
	
	// 관리자가 고객주문 확인하기 + 페이징
	
	public List<Map<String,Object>> getOrdersListByEmployee(final int rowPerPage, int currentPage) {
		
		List<Map<String,Object>> list = new ArrayList<>();
		
		Connection conn = null;
		int beginRow = 0;
		beginRow = (currentPage -1) * rowPerPage;
		
		try {
			conn= new DBUtil().getConnection();
			conn.setAutoCommit(false);
			
			OrdersDao ordersDao = new OrdersDao();
			
			list = ordersDao.selectOrdersList(conn,rowPerPage,beginRow);
			
			if( list == null) {
				throw new Exception();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(SQLException e1) {
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
	
	// 라스트 페이지
	
	public int getOrderListByPageLastPage(int rowPerPage) {
		
		Connection conn =null;
		
		try {
			conn = new DBUtil().getConnection(); 
			conn.setAutoCommit(false); 	
			
			OrdersDao ordersDao = new OrdersDao();
			rowPerPage = ordersDao.customerGoodsListLastPage(conn);
			
			
			if(rowPerPage == 0 ) {
				
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
	
	// 관리자가 고객 배송상태 수정해줌
	
		public int modifyOrdersOne(Orders orders) {
			
			int result = 0;
			
			Connection conn = null;
			
			
			try {
				conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);
				
				OrdersDao ordersDao = new OrdersDao();
				result = ordersDao.updateOrdersOne(conn, orders);
				
				if(result==0) { // result값이 0이면 수정 실패
					
					throw new Exception();
				}
				conn.commit();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				try {
					conn.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			return result;
			
		}
		
		// 관리자의 고객주문확인의 상세보기용
		public Map<String, Object> getOrdersOne(int orderNo) {
			Map<String, Object> m = null;
			Connection conn = null;
				
			try {
				conn = new DBUtil().getConnection(); // 디비연동
				conn.setAutoCommit(false); //자동커밋방지	
				
				OrdersDao ordersDao = new OrdersDao();
				
				m = ordersDao.selectOrdersOne(conn, orderNo);
				System.out.println( "getOrdersListByEmployee의 m값"+m);
				
				if(m == null ) {
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
			
			return m;
		}
		

}
