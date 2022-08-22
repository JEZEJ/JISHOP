package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Notice;

public class NoticeDao {

	// 공지사항 목록보기
	public List<Notice> selectNoticeList(Connection conn, final int rowPerPage, int beginRow) throws SQLException {

		int row = 0;

		String sql = "SELECT notice_no,notice_title,notice_content,update_date,create_date FROM notice ORDER BY notice_no DESC LIMIT ?,?";

		List<Notice> list = new ArrayList<Notice>();
		Notice notice = new Notice();
		PreparedStatement stmt = null;
		ResultSet rset = null;

		try {

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rset = stmt.executeQuery();

			while (rset.next()) {

				notice = new Notice();
				notice.setNoticeNo(rset.getInt("notice_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setUpdateDate(rset.getString("update_date"));
				notice.setCreateDate(rset.getString("create_date"));

				list.add(notice);

			}

		} finally {

			if (rset != null) { rset.close(); }
			if (stmt != null) { stmt.close(); }
		}

		return list;

	}
	
	// 공지사항 목록보기 <마지막페이지위해 카운트해주기>
	public int lastPage(Connection conn) throws SQLException {

		System.out.println("NoticeDao안에있는 lastPage실행");

		int row = 0;

		String sql = "SELECT COUNT(*) FROM notice";

		PreparedStatement stmt = null;
		ResultSet rset = null;

		try {

			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery();

			if (rset.next()) {
				row = rset.getInt("COUNT(*)");
			}
		} finally {
			if (stmt != null) {
				stmt.close();
			}
			if (rset != null) {
				rset.close();
			}
		}

		System.out.println("NoticeDao.lastPage.row값 : " + row);
		return row;

	}

	// 공지사항 작성하기
	public int insertNotice(Connection conn, Notice notice) throws SQLException {

		System.out.println("NoticeDao안에있는 insertNotice 실행");

		int row = 0;

		String sql = "INSERT INTO notice (notice_title,notice_content,update_date,create_date) VALUES (?,?,NOW(),NOW())";

		PreparedStatement stmt = null;

		try {

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());

			row = stmt.executeUpdate();
		} finally {

			if (stmt != null) {
				stmt.close();
			}
		}

		System.out.println("NoticeDao.insertNotice.row 값 : " + row);
		return row;

	}

	// 공지사항 상세보기
	// 공지사항 테이블값 모두 가져와야함
	public Notice selectNoticeOne(Connection conn, int noticeNo) throws SQLException {

		System.out.println("NoticeDao안에있는 selectNoticeOne 실행");

		Notice noticeOne = null;

		// 상세보기 쿼리
		String sql = "SELECT notice_no,notice_title,notice_content,update_date,create_date FROM notice Where notice_no = ?";

		PreparedStatement stmt = null;
		ResultSet rset = null;

		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, noticeNo);
			rset = stmt.executeQuery();

			if (rset.next()) {

				noticeOne = new Notice();
				noticeOne.setNoticeNo(rset.getInt("notice_no"));
				noticeOne.setNoticeTitle(rset.getString("notice_title"));
				noticeOne.setNoticeContent(rset.getString("notice_content"));
				noticeOne.setUpdateDate(rset.getString("update_date"));
				noticeOne.setCreateDate(rset.getString("create_date"));
			}
		} finally {
			if (rset != null) {
				rset.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}
		
		System.out.println("NoticeDao.selectNoticeOne.noticeOne의 값 : " + noticeOne);
		return noticeOne;

	}

}
