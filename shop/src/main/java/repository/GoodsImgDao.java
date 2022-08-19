package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.GoodsImg;

public class GoodsImgDao {

	// 상품이미지 보기
	public GoodsImg selectGoodsImg(Connection conn, int goodsNo) throws SQLException {

		GoodsImg goodsImg = null;

		String sql = "SELECT goods_no,filename,origin_filename,content_type,create_date From goods_img";

		PreparedStatement stmt = null;
		ResultSet rset = null;

		try {

			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery();

			if (rset.next()) {

				goodsImg = new GoodsImg();
				goodsImg.setGoodsNo(rset.getInt("goodsNo"));
				goodsImg.setFileName(rset.getString("fileName"));
				goodsImg.setOriginFileName(rset.getString("originFilename"));
				goodsImg.setCreateDate(rset.getString("createDate"));

			}
		} finally {

			if (rset != null) {
				rset.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}

		return goodsImg;

	}

	// 상품이미지 추가해주기
	public int insertGoodsImg(Connection conn, GoodsImg goodsImg) throws SQLException {

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
		return row;
	}

}
