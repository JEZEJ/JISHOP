package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vo.Cart;

public class CartDao {
	
	// 카트에 넣어주기 <손님이 원하는 항목 넣어줘야함> 
	// 손님이 같은 번호 같은 상품을 2개이상 못담아서 그거 쿼리 고쳐줘야함
	
	public int insertCart(Connection conn,Cart cart) throws SQLException { 
		
		System.out.println("CardDao안에있는 insertCart실행");
	
		int row = 0;
		
		// 카트에 내가 원하는 상품 인서트하기
		String sql = "INSERT INTO cart (goods_no,customer_id,cart_quantity,update_date,create_date) VALUES (?,?,?,NOW(),NOW())";
		
		PreparedStatement stmt = null;
		
		try {
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, cart.getGoodsNo());
			stmt.setString(2, cart.getCustomerId());
			stmt.setInt(3, cart.getCartQuantity());
			
			row = stmt.executeUpdate(); // 쿼리 실행
	
		} finally {
			
			if(stmt != null) {stmt.close();}
		}
		
		return row;
		
	}

}
