package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import vo.Cart;

public class CartDao {

	// 카트에 넣어주기 <손님이 원하는 항목 넣어줘야함>
	// 손님이 같은 번호 같은 상품을 2개이상 못담아서 그거 쿼리 고쳐줘야함

	// 첫번째 카트에 담기 ( 손님이 원하는 물건 카트에 담아주기 )
	public int insertCart(Connection conn, Cart cart) throws SQLException {

		int row = 0;

		String sql = "INSERT INTO CART (goods_no, customer_id, cart_quantity, update_date, create_date) VALUES (?, ?, ?, NOW(), NOW())";

		// stmt 초기화
		PreparedStatement stmt = null;

		try {

			// 쿼리 담아주기
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, cart.getGoodsNo());
			stmt.setString(2, cart.getCustomerId());
			stmt.setInt(3, cart.getCartQuantity());

			System.out.println("CartDao안에있는 insertCart : " + stmt);

			row = stmt.executeUpdate(); // 쿼리 실행해주기
			System.out.println("row : " + row);
		} finally {

			if (stmt != null) {
				stmt.close();
			}
		}
		return row;
	}

}
