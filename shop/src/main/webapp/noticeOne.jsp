<%@page import="vo.Notice"%>
<%@page import="service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

	NoticeService noticeService = new NoticeService();
	Notice notice = noticeService.getNoticeOne(noticeNo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
		<form>
		<h3>공지사항</h3>
			<table border = "1">
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
		</form>
	</div>
</body>
</html>