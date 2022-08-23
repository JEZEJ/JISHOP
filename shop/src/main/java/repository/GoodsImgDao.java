package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.GoodsImg;

public class GoodsImgDao {

	// 상품이미지 보기
	public GoodsImg selectGoodsImg(Connection conn, int goodsNo) throws SQLException {

		System.out.println("GoodsImgDao안에있는 selectGoodsImg 실행");

		GoodsImg goodsImg = null;

		String sql = "SELECT goods_no,filename,origin_filename,content_type,create_date FROM goods_img";

		PreparedStatement stmt = null;
		ResultSet rset = null;

		try {

			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery();

			if (rset.next()) {

				goodsImg = new GoodsImg();
				goodsImg.setGoodsNo(rset.getInt("goods_no"));
				goodsImg.setFileName(rset.getString("fileName"));
				goodsImg.setOriginFileName(rset.getString("origin_filename"));
				goodsImg.setCreateDate(rset.getString("create_date"));

			}
		} finally {

			if (rset != null) {
				rset.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}

		System.out.println("GoodsImgDao.GoodsImg.goodsImg 값 : " + goodsImg);
		return goodsImg;

	}

	// 상품이미지 추가해주기
	public int insertGoodsImg(Connection conn, GoodsImg goodsImg) throws SQLException {

		System.out.println("GoodsImgDao안에있는 insertGoodsImg 실행");

		int row = 0;

		// GOODS_IMG INSERT해주기
		String sql = "INSERT INTO goods_img (goods_no,filename,origin_filename,content_type,create_date) VALUES (?,?,?,?,NOW())";

		PreparedStatement stmt = null;

		try {

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, goodsImg.getGoodsNo());
			stmt.setString(2, goodsImg.getFileName());
			stmt.setString(3, goodsImg.getOriginFileName());
			stmt.setString(4, goodsImg.getContentType());

			row = stmt.executeUpdate();

		} finally {

			if (stmt != null) {
				stmt.close();
			}
		}
		System.out.println("GoodsImgDao.insertGoodsImg.row 값 : " + row);
		return row;
	}

	// 상품 수정할때 이미지도 같이 수정할거라 여기에도 수정쿼리 만들어줘야함
	public int updateGoodsImg(Connection conn, GoodsImg goodsImg) throws Exception {
		
		int row = 0;

		String sql = "UPDATE goods_img SET filename = ?, origin_filename = ?, content_type = ? WHERE goods_no = ?";

		PreparedStatement stmt = null;

		try {

			stmt = conn.prepareCall(sql);
			stmt.setString(1, goodsImg.getFileName());
			stmt.setString(2, goodsImg.getOriginFileName());
			stmt.setString(3, goodsImg.getContentType());
			stmt.setInt(4, goodsImg.getGoodsNo());

			row = stmt.executeUpdate(); //쿼리실행

			System.out.println("updateGoodsImg의 row 값 : " + row);
			
		} finally {
			
			if (stmt != null) { stmt.close(); }
		}

		return row;
	}
}
