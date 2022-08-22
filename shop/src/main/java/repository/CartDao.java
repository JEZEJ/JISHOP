package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vo.Cart;

public class CartDao {
	
	// 카트에 넣어주기
	public int insertCart(Connection conn,Cart cart) throws SQLException { 
		
		System.out.println("CardDao안에있는 insertCart실행");
	
		int row = 0;
		
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
