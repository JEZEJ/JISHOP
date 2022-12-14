package service;

import java.sql.Connection;

import repository.CartDao;
import vo.Cart;

public class CartService {
	
	private CartDao cartDao;
	
	public int addCart(Cart cart) {
			
		int result = 0;
		Connection conn = null;
		
		try {
			
			conn = new DBUtil().getConnection(); //디비연동
			conn.setAutoCommit(false); // 자동커밋방지
			
			result = cartDao.insertCart(conn, cart);
			
			if(result == 0) {
				System.out.println("카트 담기 실패 !");
				throw new Exception();
			}
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
			
			try {
				conn.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
