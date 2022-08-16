package repository;

import vo.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class GoodsDao {
	 
	//상품추가
	public int insertGoods(Connection conn, Goods goods) throws SQLException {
		int keyId = 0;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "INSERT INTO goods (goods_name, goods_price, update_date, create_date, sold_out) VALUES (?,?,now(),now(),?)";
		try{
			// 쿼리 실행
			stmt = conn.prepareStatement(sql , Statement.RETURN_GENERATED_KEYS);
			
			// 1) insert
			
			stmt.setString(1, goods.getGoodsName());
			stmt.setInt(2, goods.getGoodsPrice());
			stmt.setString(3, goods.getSoldOut());
			// 디버깅
			System.out.println("\ninsertGoods - stmt : " + stmt);
			
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys(); // select last_key
			if(rs.next()) {
				keyId = rs.getInt(1);
			}
		}finally {
			// DB 자원해제
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
		}
		// 디버깅
		System.out.println("\ninsertGoods - keyId : " + keyId);
		return keyId;
	} // end insertGoods

	
	   public Map<String, Object> selectGoodsAndImgOne(Connection conn, int goodsNo) throws SQLException {
	
		String sql ="SELECT g.goods_no,"
				+ "g.goods_name,"
				+ "g.goods_price,"
				+ "g.update_date,"
				+ "g.create_date,"
				+ "g.sold_out, "
				+ "gi.goods_no,"
				+ "gi.filename, "
				+ "gi.origin_filename,"
				+ "gi.content_type,"
				+ "gi.create_date "
				+ "FROM goods g INNER JOIN goods_img gi "
				+ "ON g.goods_no = gi.goods_no "
				+ "WHERE g.goods_no = ? ";  
		   
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		
	
			stmt = conn.prepareStatement(sql);			
			stmt.setInt(1, goodsNo);
			rs = stmt.executeQuery();	
			
			while(rs.next()) {
				map.put("goodsNo", rs.getInt("g.goods_no")); // 얘는 겟셋이 안되서 내가 직접 쳐주어야
				map.put("goodsName", rs.getString("g.goods_name"));
				map.put("goodsPrice", rs.getInt("g.goods_price"));
				map.put("updateDate", rs.getString("g.update_date"));
				map.put("createDate", rs.getString("g.create_date"));
				map.put("soldOut", rs.getString("g.sold_out"));
				map.put("filename", rs.getString("gi.filename"));
				map.put("originFilename", rs.getString("gi.origin_filename"));
				map.put("contentType", rs.getString("gi.content_type"));
				map.put("createDate", rs.getString("gi.create_date"));
				System.out.print(map+"<-map1");
			}
			System.out.print(map+"<-map2");
		return map;
		
	}
	
	
	
	public int lastPage(Connection conn) throws SQLException {
		
		String sql= "SELECT COUNT(*) FROM goods"; 
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int totalRow = 0; // 전체페이지
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			
			if(rs.next()) { // 셀 수 있다면
				totalRow = rs.getInt("COUNT(*)");
			}
			
			// 디버깅
			System.out.print(totalRow +"dao");
		}
		
		finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		}		
		return totalRow;
	}
	
															
	public List<Goods> selectGoodsListByPage(Connection conn, final int rowPerPage , int beginRow) throws Exception{
	      
		   
	      String sql = "SELECT goods_no,goods_name,goods_price,update_date , create_date ,sold_out FROM goods ORDER BY goods_no DESC LIMIT ?, ?";
	      List<Goods> list = new ArrayList<Goods>(); // 주의! List<> *** = new ArrayList<>();
	            
	      PreparedStatement stmt = null;
	      Goods goods =new Goods();
	      ResultSet rs =null;
	      
	      try {
	         stmt = conn.prepareStatement(sql);
	         stmt.setInt(1, beginRow);
	         stmt.setInt(2, rowPerPage);
	         rs = stmt.executeQuery();
	         
	         
	         
	         while(rs.next()) {
	            goods = new Goods();   
	            goods.setGoodsNo(rs.getInt("goods_no"));
	            goods.setGoodsName(rs.getString("goods_name"));
	            goods.setGoodsPrice(rs.getInt("goods_price"));
	            goods.setUpdateDate(rs.getString("update_date"));
	            goods.setCreateDate(rs.getString("create_date"));
	            goods.setSoldOut(rs.getString("sold_out"));
	            
	            list.add(goods); // list로 리턴하니까 리스트에 값을 넣어주자
	         }
	           
	         //디버깅
	         System.out.println(goods.getGoodsName());	      
	      
	      }finally {
	         if(rs!=null) {rs.close();}
	         if(stmt!=null) {stmt.close();}
	      
	      }
	       
	      return list;
	        
	   }
}
