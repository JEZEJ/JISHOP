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
		public int insertGoods(Connection conn, Goods goods) throws Exception {
			
		System.out.println("GoodsDao안에있는 insertGoods(상품추가) 실행");
		
		int row = 0;
		
		String sql = "insert into goods(goods_name, goods_price, update_date, create_date,sold_out) values (?, ?, now(), now(),'N')";

		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		stmt.setString(1, goods.getGoodsName());
		stmt.setInt(2, goods.getGoodsPrice());

		stmt.executeUpdate(); 
		
		ResultSet rset = stmt.getGeneratedKeys(); // return 값 

		if(rset.next()) {
			row = rset.getInt(1);
			System.out.println("GoodsDao.insertGoods 실행 >> "+ row);

		}

		if(rset != null) { rset.close(); }
		if(stmt != null) { stmt.close(); }

		System.out.println("GoodsDao.insertGoods.row 값 : "+ row);
		return row;
	}
		
		
	  // 상품 품절여부 변경 <GoodsList에서 가능> -- 만드는중
		public int updateGoodsSoldOut(Connection conn,Goods goods) throws SQLException {
			
			System.out.println("GoodsDao안에있는 updateGoodsSoldOut(상품품절여부 변경) 실행");
			
			int row = 0;
			
			String sql = "UPDATE goods SET sold_out = ? WHERE goods_no = ?";
			PreparedStatement stmt = null;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, goods.getSoldOut());
				stmt.setInt(2, goods.getGoodsNo());
				
				row = stmt.executeUpdate();
				
			} finally {
				if(stmt!=null) {
					stmt.close();
				}
			}
			System.out.println("GoodsDao.updateGoodsSoldOut.row 값 : "+ row);
			return row;
		}
		
	   // 상품 상세보기 사진 ( 상세보기 하려면 테이블 3개 조인 ) -- > goods 테이블 / goods_img 테이블 / orders 테이블
		public Map<String,Object> selectGoodsAndImgOne(Connection conn, int goodsNo) throws SQLException {
			
			Map<String,Object> map = new HashMap<String,Object>();
			// SELECT g.*, gi.* FROM goods g INNER JOIN goods_img gi 
			// ON g.goods_no = gi.goods_no WHERE g.goods_no = 1
			
			String sql = "SELECT g.goods_no,g.goods_name,g.goods_price,g.update_date,g.create_date,g.sold_out, gi.goods_no,gi.filename, gi.origin_filename,gi.content_type,gi.create_date FROM goods g INNER JOIN goods_img gi ON g.goods_no = gi.goods_no WHERE g.goods_no = ?";
			PreparedStatement stmt = null;
			ResultSet rset = null;
			
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, goodsNo);
			rset = stmt.executeQuery();
			
			while(rset.next()){
				map.put("goodsNo", rset.getInt("g.goods_no"));
				map.put("goodsName",rset.getString("g.goods_name"));
				map.put("goodsPrice", rset.getInt("g.goods_price"));
				map.put("updateDate",rset.getString("g.update_date") );
			    map.put("createDate", rset.getString("g.create_date"));
			    map.put("soldOut",rset.getString("g.sold_out") );
			    map.put("fileName",rset.getString("gi.filename") );
			    map.put("originFilename", rset.getString("gi.origin_filename"));
			    map.put("contentType",rset.getString("gi.content_type") );
			    map.put("createDate",rset.getString("gi.create_date") );

			
			}
		
			System.out.println("map 값 : " + map);
			
			return map;
			
		}	
		
	//상품수정하기
		
	public int updateGoods(Connection conn,Goods goods) throws SQLException {
		
		System.out.println("GoodsDao안에있는 updateGoods실행");
		
		int row;
		
		// 수정이니깐 업데이트 쿼리
		String sql = "UPDATE goods SET goods_name = ?, goods_price = ?, sold_out = ?, update_date = NOW() WHERE goods_no = ?";
		
		PreparedStatement stmt = null;
		
		try {
			stmt = conn.prepareStatement(sql); 
			//set해서 값 넣어주기
			stmt.setString(1, goods.getGoodsName());
			stmt.setInt(2, goods.getGoodsPrice());
			stmt.setString(3, goods.getSoldOut());
			stmt.setInt(4, goods.getGoodsNo());
			
			row = stmt.executeUpdate(); // 쿼리 실행
			
		} finally {
			
			if(stmt != null) {stmt.close();}
		}
		
		return row;
	}
		
	
	//상품리스트														
	public List<Map<String,Object>> selectGoodsListByPage(Connection conn, int rowPerPage , int beginRow) throws Exception{   
		
		  List<Map<String,Object>> list = null; //두가지 테이블을 조인해야하기때문에 Map으로 주기
		
		  System.out.println("GoodsDao안에있는 selectGoodsListByPage(상품리스트) 실행");
		   
	      // 사진이랑 같이 보는 상품리스트 쿼리...    
		  String sql = "SELECT g.goods_no,g.goods_name,g.goods_price,gi.filename FROM goods g LEFT JOIN (SELECT goods_no, SUM(order_quantity) sumNum FROM orders GROUP BY goods_no) t ON g.goods_no = t.goods_no INNER JOIN goods_img gi ON g.goods_no = gi.goods_no ORDER BY g.goods_no DESC LIMIT ?, ?"; 
	            
	      PreparedStatement stmt = null;
	      ResultSet rset =null;
	      
	      try {
			   list = new ArrayList<Map<String,Object>>();
			   stmt = conn.prepareStatement(sql);
			   stmt.setInt(1, beginRow);
			   stmt.setInt(2, rowPerPage);
			   rset = stmt.executeQuery();
		   
		   while(rset.next()) {
			   Map<String, Object> map = new HashMap<String, Object>();
			   
			  map.put("goodsNo", rset.getInt("g.goods_no"));
			  map.put("goodsName", rset.getString("g.goods_name"));
			  map.put("goodsPrice", rset.getString("g.goods_price"));
			  map.put("filename", rset.getString("gi.filename"));
			  
			  list.add(map);
			
		   		}
		   
		   } finally {
			   if(rset != null) { rset.close();	}
			   if(stmt != null) { stmt.close(); }
		   }
		   return list;
	        
	   }
	
		// 라스트페이지 (리스트랑 세트)
	
		public int goodsLastPage(Connection conn) throws SQLException {
		
		String sql = "SELECT COUNT(*) FROM goods";
		// 카운트로 상품테이블 갯수를 카운트해줘야함
		
		PreparedStatement stmt = null;
		ResultSet rset = null;
		int lastPage = 0;
		
		stmt = conn.prepareStatement(sql);
	    rset = stmt.executeQuery();
		
	    
		 if(rset.next()) {
			 lastPage = rset.getInt("COUNT(*)");
	         }
		
		 // 디버깅
		 System.out.println("lastPage : " + lastPage);
		 
		 if(rset!=null)   {
				rset.close();
			}
		 if(stmt!=null)   {
				stmt.close();
			}
		 
		return lastPage;
	} 
}
