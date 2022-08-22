<%@page import="vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 인코딩
request.setCharacterEncoding("UTF-8");

int rowPerPage = 5; // 5개씩 보여주기
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
</head>
<body>
	<div>
	
			<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a>
			<a href="<%=request.getContextPath()%>/admin/employeeManagement.jsp">사원관리</a>
			<a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a>
			<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a>
			<a href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a>

</div>
<br/>
		<h3>공지사항</h3>

		<a href="<%=request.getContextPath()%>/admin/insertNoticeForm.jsp">글작성</a>
		<div>
			<table border="1">
				<thead>
					<tr>
						<td>Notice No</td>
						<td>Title</td>
						<td>Create Date</td>
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
		

	</div>
</body>
</html>