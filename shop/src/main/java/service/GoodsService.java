package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import repository.GoodsDao;
import repository.GoodsImgDao;
import vo.*;



public class GoodsService {
	
	private GoodsImgDao goodsImgDao;
	private GoodsDao goodsDao;	


	
	// 두개의 인서트를 하나의 트랜젝션으로해야한대
	public int addGoods(Goods goods, GoodsImg goodsImg) {
		Connection conn = null;
		
		PreparedStatement goodsStmt = null;
		PreparedStatement imgStat = null;		
		//쿼리가 두개래
		
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			goodsDao = new GoodsDao();
			goodsImgDao = new GoodsImgDao();
			
			int goodsNo = goodsDao.insertGoods(conn, goods); // goodsNo가 없어도 오토인크리먼트로 자동생성되어 DB에 입력
			
			if(goodsNo !=0) { // 0이아니면 키값 받아왓다는 소리
				goodsImg.setGoodsNo(goodsNo); // vo만들어야 오류 안난다는데
				if(goodsImgDao.insertGoodsImg(conn, goodsImg) ==0) { // 입력실패
					throw new Exception(); // 이미지 입력실패시 강제로 롤백(catch절 이동)
				}
				}
			
			conn.commit(); // 예외 업승ㄹ 때만 컵밋
		} catch(Exception e) {
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
		return 0;		
	}
	
	
	public Map<String, Object> getGoodsAndImgOne(int goodsNo) {
		Map<String,Object> map = null;
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			GoodsDao goodsDao = new GoodsDao(); 	
			map = goodsDao.selectGoodsAndImgOne(conn, goodsNo);
			
			System.out.print(map +"<-getGoodsAndImgOne map");
			conn.commit();
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
		
		return map;
	}
	
	
	
	public int getGoodsListLastPage(int rowPerPage) {
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); //자동커밋방지
			 
			// GoodsDao 객체생성
			GoodsDao goodsDao = new GoodsDao(); 
			
			// lastPage 메서드호출
			rowPerPage = goodsDao.lastPage(conn);
			
			//디버깅 
			System.out.print(rowPerPage +"<-rowPerPage");
			
			if(rowPerPage ==0) {
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
	
	
	public List<Goods> getGoodsListByPage(final int rowPerPage, int currentPage) {
		List<Goods> list = new ArrayList<Goods>();		
		
		this.goodsDao = new GoodsDao();
		Connection conn = null;
		int beginRow = 0;	
		beginRow = (currentPage -1 ) * rowPerPage;
		
			
		try {
			conn = new DBUtil().getConnection();
			
			// GoodsDao 객체생성
			GoodsDao goodsDao = new GoodsDao();
			
			// 메서드 호출
			list = goodsDao.selectGoodsListByPage(conn, rowPerPage, beginRow);
		
			// 디버깅
			System.out.println(list +"<-goodsservice의 list"); 
		
			if(list==null ) {
				throw new Exception();
			}
			conn.commit(); // list에 무사히 들어오면 커밋 ㄱ
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback(); // 뭔가 잘못되며 보고후에 돌아갈거야
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
		return list;
	}
}
