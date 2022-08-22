package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import repository.NoticeDao;
import vo.Notice;

public class NoticeService {

	private NoticeDao noticeDao;

	// 공지 목록보기
	public int getNoticeListLastPage(int rowPerPage) {

		System.out.println("NoticeService안에있는 getNoticeListLastPage 실행");

		Connection conn = null;

		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			// NoticeDao 객체생성
			NoticeDao noticeDao = new NoticeDao();

			// 리턴값에 값 담기위한 메서드 호출
			rowPerPage = noticeDao.lastPage(conn);

			if (rowPerPage == 0) {
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

		return rowPerPage;

	}

	// 공지목록보기 // 페이징할때 다음이 계속 나옴
	public List<Notice> getNoticeList(final int rowPerPage, int currentPage) {

		List<Notice> list = new ArrayList<Notice>();

		NoticeDao noticeDao = new NoticeDao();
		Connection conn = null;

		int beginRow = 0;

		beginRow = (currentPage - 1) * rowPerPage;

		try {
			conn = new DBUtil().getConnection();

			// NoticeDao 객체 생성
			noticeDao = new NoticeDao();

			list = noticeDao.selectNoticeList(conn, rowPerPage, beginRow);

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

		System.out.println("NoticeService.getNoticeList.list값 :" + list);

		return list;

	}

	// 공지사항 등록
	public void addNotice(Notice notice) {

		System.out.println("NoticeService안에있는 addNotice실행");

		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			NoticeDao noticeDao = new NoticeDao();

			try {
				noticeDao.insertNotice(conn, notice);
			} catch (SQLException e) {

				e.printStackTrace();
			}
			conn.commit();

		} catch (Exception e1) {

			e1.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}
	
	// 공지상세보기
	public Notice getNoticeOne(int noticeNo){
		
		Notice noticeOne = null;
		Connection conn = null;
		
		try {
			
			conn = new DBUtil().getConnection();
			NoticeDao noticeDao = new NoticeDao();

			noticeOne = noticeDao.selectNoticeOne(conn, noticeNo);

			if(noticeOne == null) {
				throw new Exception();
			}
			conn.commit();

		}catch(Exception e) {
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
			return noticeOne;
	}
}
