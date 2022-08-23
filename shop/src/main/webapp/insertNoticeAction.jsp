<%@page import="service.NoticeService"%>
<%@page import="vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	// 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// 변수받아오기 form에 name이랑 일치해야함
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// Notice 객체 생성 한 후에 값 넣어주기
	Notice notice = new Notice();
	notice.setNoticeTitle(title);
	notice.setNoticeContent(content);
	
	System.out.println("공지사항등록 : " + notice);
	
	NoticeService noticeService = new NoticeService();
	noticeService.addNotice(notice);
	
	// 공지사항이 등록되면 공지사항 목록으로 돌아가기
	response.sendRedirect(request.getContextPath()+"/noticeList.jsp");

%>
