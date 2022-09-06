<%@page import="vo.Notice"%>
<%@page import="service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/shop/customerHeader.jsp"%>

<%
if (session.getAttribute("user") == null) {
	response.sendRedirect(request.getContextPath() + "/loginForm.jsp");

	return;
}

int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

NoticeService noticeService = new NoticeService();
Notice notice = noticeService.getNoticeOne(noticeNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<h3>공지사항</h3>
	<table border="1">
		<tr>
			<th>공지번호</th>
			<td><%=notice.getNoticeNo()%></td>
		</tr>
		<tr>
			<th>공지제목</th>
			<td><%=notice.getNoticeTitle()%></td>
		</tr>
		<tr>
			<th>공지내용</th>
			<td><%=notice.getNoticeContent()%></td>
		</tr>
		<tr>
			<th>공지등록날짜</th>
			<td><%=notice.getCreateDate()%></td>
		</tr>

	</table>
	<div>
		<%@ include file="/shop/customerFooter.jsp"%>
	</div>

</body>
</html>