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

	// 이미지 업로드
	public int addGoods(Goods goods, GoodsImg goodsImg) {
		int goodsNo = 0;
		Connection conn = null;


		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			this.goodsDao = new GoodsDao();

			goodsNo = goodsDao.insertGoods(conn, goods);
			

			System.out.println("goodsDao.insertGoods(): " + goodsNo);

			if(goodsNo != 0) { 
				goodsImg.setGoodsNo(goodsNo);
				this.goodsImgDao = new GoodsImgDao(); 

				if(goodsImgDao.insertGoodsImg(conn, goodsImg) == 0) {
					goodsNo = 0; 
					System.out.println("goodsImgDao.insertGoods 실행 >> " + goodsNo);

					throw new Exception();
					
				}
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

		return goodsNo;
	}
	
	//sold_out값 변경
	public int GoodssoldOut(Goods goods) {
		
		Connection conn = null;
		int row = 0;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			
			GoodsDao goodsDao = new GoodsDao();
			row = goodsDao.updateGoodsSoldOut(conn, goods);
			
			if (row == 0) {
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
	
	public Map<String, Object> getGoodsAndImgOne(int goodsNo) {
		Map<String,Object> map = null;
		
		Connection conn = null;
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			GoodsDao goodsDao = new GoodsDao(); 	
			map = goodsDao.selectGoodsAndImgOne(conn, goodsNo);
			
			conn.commit();
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	
	
	//페이징
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
		return list;
	}
}
