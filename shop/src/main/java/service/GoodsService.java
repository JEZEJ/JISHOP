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

		System.out.println("GoodsService안에있는 addGoods실행");

		int goodsNo = 0;
		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			this.goodsDao = new GoodsDao();

			goodsNo = goodsDao.insertGoods(conn, goods);

			System.out.println("goodsDao.insertGoods(): " + goodsNo);

			if (goodsNo != 0) {
				goodsImg.setGoodsNo(goodsNo);
				this.goodsImgDao = new GoodsImgDao();

				if (goodsImgDao.insertGoodsImg(conn, goodsImg) == 0) {
					goodsNo = 0;
					System.out.println("goodsImgDao.insertGoods 실행 : " + goodsNo);

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
		System.out.println("GoodsService.addGoods.goodsNo값 : " + goodsNo);
		return goodsNo;
	}

	// sold_out값 변경
	public int GoodssoldOut(Goods goods) {

		System.out.println("GoodsService안에있는 GoodssoldOut실행");

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
		System.out.println("GoodsService.GoodssoldOut.row값 : " + row);
		return row;

	}

	// 상품 상세보기
	public Map<String, Object> getGoodsAndImgOne(int goodsNo) {

		System.out.println("GoodsService안에있는 getGoodsAndImgOne실행");

		Map<String, Object> map = null;

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

		System.out.println("GoodsService.getGoodsAndImgOne.map값 : " + map);
		return map;
	}

	// 상품수정 (상품내용수정)
	public boolean modifyGoods(Goods goods) {
		
		boolean result = false;

		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			goodsDao = new GoodsDao();
			goodsImgDao = new GoodsImgDao();

			int row = goodsDao.updateGoods(conn, goods);
			
			if(row == 0) {
				throw new Exception();
			}		
			result = true;
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			// 문제 있으면 롤백해주기
			try {
				conn.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} finally {
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;

	}

	// 상품리스트 출력 (g마켓이나 쇼핑몰처럼 페이지에 여러개 나오는것처럼 해야해서 list나 map으로 해줘야함)
	public List<Map<String, Object>> getGoodsListByPage(int rowPerPage, int currentPage) {

		System.out.println("GoodsService안에있는 getGoodsListByPage실행");

		List<Map<String, Object>> list = null;

		Connection conn = null;

		int beginRow = 0;
		beginRow = (currentPage - 1) * rowPerPage;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			// GoodsDao 객체생성
			GoodsDao goodsDao = new GoodsDao();

			// 메서드 호출
			list = goodsDao.selectGoodsListByPage(conn, rowPerPage, beginRow);

			if (list == null) {
				throw new Exception();
			}

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

	// 페이징
	public int getGoodsListLastPage(int rowPerPage) {

		System.out.println("GoodsService안에있는 getGoodsListLastPage실행");

		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // 자동커밋방지

			// GoodsDao 객체생성
			GoodsDao goodsDao = new GoodsDao();

			// lastPage 메서드호출
			rowPerPage = goodsDao.goodsLastPage(conn);

			if (rowPerPage == 0) {
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

		System.out.println("GoodsService.getGoodsListLastPage.rowPerPage값 : " + rowPerPage);
		return rowPerPage;

	}

}
