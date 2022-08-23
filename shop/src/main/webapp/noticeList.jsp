<%@page import="vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 인코딩
	request.setCharacterEncoding("UTF-8");

	if(session.getAttribute("user") == null) { 
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		
	return;
	} 
	
	int rowPerPage = 5; // 5개씩 보여주기
	int currentPage = 1; // 현재 페이지
	int lastPage = 0;
	
	if ((request.getParameter("currentPage")) != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	NoticeService noticeService = new NoticeService();
	List<Notice> list = new ArrayList<Notice>();
	
	list = noticeService.getNoticeList(rowPerPage, currentPage);
	lastPage = noticeService.getNoticeListLastPage(rowPerPage);
	System.out.println(lastPage);
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

	<div>
		<table class="table">
		<thead class="thead-light">
				<tr>
					<th>Notice No</th>
					<th>Title</th>
					<th>Create Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Notice n : list) {
				%>
				<tr>
					<td><%=n.getNoticeNo()%></td>
					<td><a
						href="<%=request.getContextPath()%>/noticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
					<td><%=n.getCreateDate()%></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<!-- 페이지 이전 다음 -->
		<%
		if (currentPage > 1) {
		%>
		<a
			href="<%=request.getContextPath()%>/noticeList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		<%
		}

		if (currentPage < lastPage) {
		%>
		<a
			href="<%=request.getContextPath()%>/noticeList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		<%
		}
		%>
		<a href="<%=request.getContextPath()%>/index.jsp">홈으로</a>
	</div>


</body>
</html>