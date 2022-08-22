package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vo.Orders;

public class OrdersDao {

	// 고객 주문 추가
		public int insertCustomerOrders(Connection conn, Orders orders) throws SQLException {
			
			int row = 0;
			
			// INSERT INTO orders (goods_no, customer_id, order_quantity,order_price, order_addr, order_state, update_date, create_date) VALUES (2,'guest',1,13300,'서울','주문',NOW(), NOW());
			
			String sql = "INSERT INTO orders (goods_no, customer_id, order_quantity,order_price, order_addr, order_state, update_date, create_date) VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())";
			
			PreparedStatement stmt = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, orders.getGoodsNo());
				stmt.setString(2, orders.getCustomerId());
				stmt.setInt(3, orders.getOrderQuantity());
				stmt.setInt(4, orders.getOrderPrice());
				stmt.setString(5, orders.getOrderAddr());
				stmt.setString(6, orders.getOrderState());
				
				row = stmt.executeUpdate();
			} finally {
				
				if(stmt != null) {
					stmt.close();
				}
			}
			
			return row;
		}
	
	// 고객 주문목록
	public List<Map<String,Object>> selectOrdersList(Connection conn,int rowPerPage,int beginRow) throws SQLException{
		
		System.out.println("OrdersDao안에있는 selectOrderList 실행");
		
		List<Map<String,Object>> list = new ArrayList<>();
		
		String sql = "SELECT o.order_no,o.goods_no,o.customer_id,o.order_quantity,o.order_price,o.order_addr,o.order_state,o.update_date,o.create_date,g.goods_no,g.goods_name,g.goods_price,g.update_date,g.create_date,g.sold_out FROM orders o INNER JOIN goods g ON o.goods_no = g.goods_no ORDER BY o.create_date DESC LIMIT ?,?";

		PreparedStatement stmt = null;
		ResultSet rset = null;
		Map<String,Object> map = null;
		
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			
			rset = stmt.executeQuery();
			
			while(rset.next()) {
				
				map = new HashMap<String,Object>();
				
				map.put("orderNo", rset.getInt("o.order_no"));
				map.put("goodsNo", rset.getInt("o.goods_no"));
				map.put("customerId", rset.getString("o.customer_id"));
				map.put("orderQuantity", rset.getString("o.order_quantity"));
				map.put("orderPrice", rset.getInt("o.order_price"));
				map.put("orderAddr", rset.getString("o.order_addr"));
				map.put("orderstate", rset.getString("o.order_state"));
				map.put("updateDateOr", rset.getString("o.update_date"));
				map.put("createDateOr", rset.getString("o.create_date"));
				map.put("goodsNo", rset.getInt("g.goods_no"));				
				map.put("goodsName", rset.getString("g.goods_name"));
				map.put("goodsPrice", rset.getInt("g.goods_price"));
				map.put("updateDateGd", rset.getString("g.update_date"));
				map.put("createDateGd", rset.getString("g.create_date"));
				map.put("soldOut", rset.getString("g.sold_out"));
				
				list.add(map); // list에 넣어주기
			}
		} finally {
			
			if(rset!=null) {rset.close();}
			if(stmt!=null) {stmt.close();}
		}
		
		System.out.println("OrderDao.selectOrdersList.list 값 : " + list);
		return list;
	}
	
	// 마지막 페이지
	
	  public int customerGoodsListLastPage(Connection conn) throws SQLException {
		  
		  System.out.println("OrdersDao안에있는 customerGoodsListLastPage 실행");
		   
		   String sql ="SELECT COUNT(*) FROM orders";
		   
		   PreparedStatement stmt = null;
		   ResultSet rset = null;
		   
		   int totalCount = 0;
		   
		   try {
			   stmt = conn.prepareStatement(sql);
			   rset = stmt.executeQuery();
			   
			   if(rset.next()) {
				   totalCount = rset.getInt("COUNT(*)");
			   }
			   
			   
		   } finally {
				
				if(rset!=null) {rset.close();}
				if(stmt!=null) {stmt.close();}
		   }		   
		   return totalCount;		   
	   }
	  
	  // 배송상태 수정
	  
	  public int updateOrdersOne(Connection conn,Orders orders) throws SQLException {
		  
		  System.out.println("OrdersDao안에있는 updateOrdersOne 실행");
		  
		  int row = 0;

		  String sql = "UPDATE orders SET order_state=? WHERE order_no=?";
		  
		  PreparedStatement stmt = null;
		  
		  try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, orders.getOrderState());
				stmt.setInt(2, orders.getOrderNo());
				
				row = stmt.executeUpdate();
						
			} finally {
				
				if(stmt!=null) { stmt.close();}
			}
			
		  
		  return row;
	  }
	  
		public Map<String, Object> selectOrdersOne(Connection conn, int ordersNo) throws SQLException {
			
			Map<String, Object> m = null; 
			
			String sql ="		SELECT\r\n"
					+ "		o.order_no,\r\n"
					+ "		o.goods_no,\r\n"
					+ "		o.customer_id,\r\n"
					+ "		o.order_quantity,\r\n"
					+ "		o.order_price,\r\n"
					+ "		o.order_addr,\r\n"
					+ "		o.order_state,\r\n"
					+ "		g.goods_no,\r\n"
					+ "		g.goods_name,\r\n"
					+ "		g.goods_price,\r\n"
					+ "		g.update_date,\r\n"
					+ "		g.create_date,\r\n"
					+ "		g.sold_out,\r\n"
					+ "		c.customer_id,\r\n"
					+ "		c.customer_name,\r\n"
					+ "		c.customer_address,\r\n"
					+ "		c.customer_telephone\r\n"
					+ "		FROM orders o INNER JOIN goods g\r\n"
					+ "		ON o.goods_no = g.goods_no \r\n"
					+ "									INNER JOIN customer c\r\n"
					+ "									ON o.customer_id = c.customer_id \r\n"
					+ "		WHERE o.order_no = ?";
			
			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, ordersNo);
				
				rs =stmt.executeQuery();
				
				System.out.println(rs+"<-rs");
				
					while(rs.next()) {
						m = new HashMap<String, Object>();
						
						m.put("orderNo", rs.getInt("o.order_no"));
						m.put("goodsNo", rs.getInt("o.goods_no"));
						m.put("customerId", rs.getString("o.customer_id"));
						m.put("orderQuantity", rs.getString("o.order_quantity"));
						m.put("orderPrice", rs.getInt("o.order_price"));
						m.put("orderAddr", rs.getString("o.order_addr"));
						m.put("orderstate", rs.getString("o.order_state"));
						m.put("goodsNo", rs.getInt("g.goods_no"));
						m.put("goodsName", rs.getString("g.goods_name"));
						m.put("goodsPrice", rs.getInt("g.goods_price"));
						m.put("updateDateGd", rs.getString("g.update_date"));
						m.put("createDateGd", rs.getString("g.create_date"));
						m.put("soldOut", rs.getString("g.sold_out"));
						m.put("customerIdc", rs.getString("c.customer_id"));
						m.put("customerName", rs.getString("c.customer_name"));
						m.put("customerAddress", rs.getString("c.customer_address"));
						m.put("customerTelephone", rs.getString("c.customer_telephone"));
		
						System.out.print(m+"<-selectOrdersOne의 m");					
					}
					
			} finally {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
			}
			
			return  m;
		}
		
	
	 
}
