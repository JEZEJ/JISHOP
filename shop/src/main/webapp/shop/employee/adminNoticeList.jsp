<%@page import="vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 인코딩
request.setCharacterEncoding("UTF-8");

if (session.getAttribute("user") != "Employee") {
	response.sendRedirect(request.getContextPath() + "/loginForm.jsp");

	return;
}

int rowPerPage = 5; // 공지는 5개씩 보여주기 나중에 좀 늘리기
int currentPage = 1;
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
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin/employeeManagement.jsp">사원관리</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>

			</li>
		</ul>
	</nav>
	<br />
	<h3>공지사항</h3>

	<a href="<%=request.getContextPath()%>/admin/insertNoticeForm.jsp">글작성</a>
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
					href="<%=request.getContextPath()%>/noticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>">
						<%=n.getNoticeTitle()%>
				</a></td>
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
		href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
	<%
	}

	if (currentPage < lastPage) {
	%>
	<a
		href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
	<%
	}
	%>


	</div>
</body>
</html>