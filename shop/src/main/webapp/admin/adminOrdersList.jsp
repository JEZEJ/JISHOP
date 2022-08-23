<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="vo.*"%>
<%@ page import="service.*"%>
<%@ page import="repository.*"%>

<%
	// 인코딩
	request.setCharacterEncoding("utf-8");

	if(session.getAttribute("user") != "Employee") { 
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		
	return;
	} 
	
	// 페이징
	int currentPage = 1;
	final int rowPerPage = 5;
	int lastPage = 0;
	
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	// 주문목록 불러오기 (전체)
	OrdersService ordersService = new OrdersService();
	OrdersDao ordersDao = new OrdersDao();
	
	List<Map<String, Object>> list = ordersService.getOrdersListByEmployee(rowPerPage, currentPage);
	
	lastPage = ordersService.getOrderListByPageLastPage(rowPerPage);
	System.out.print(lastPage);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<h3>고객 주문 관리</h3>

		<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/employeeManagement.jsp">사원관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
			
			</li>
		</ul>
	</nav>
	<br />
	<table class="table">
    <thead class="thead-light">
				<tr>
					<th>주문자아이디</th>
					<th>상품명</th>
					<th>상품수량</th>
					<th>배송주소</th>
					<th>배송상태</th>
					<th>주문날짜</th>
				</tr>
			</thead>

			<tbody>

				<%
				for (Map<String, Object> m : list) {
				%>
				<tr>
					<td><%=m.get("customerId")%></td>
					<td><%=m.get("goodsName")%></td>
					<td><%=m.get("orderQuantity")%></td>
					<td><%=m.get("orderAddr")%></td>
					<td><%=m.get("orderstate")%></td>
					<td><%=m.get("createDateOr")%></td>
					<td><a href="<%=request.getContextPath()%>/admin/adminOrderListOne.jsp?orderNo=<%=m.get("orderNo")%>" class="button">상세보기</a></td>
					
				</tr>

				<%
				}
				%>


			</tbody>
		</table>


	<!--  페이징 -->
	<%
	if (currentPage > 1) {
	%>

	<a
		href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp?currentPage=<%=currentPage - 1%>">
		이전 </a>

	<%
	}

	if (currentPage < lastPage) {
	%>

	<a
		href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp?currentPage=<%=currentPage + 1%>">
		다음 </a>

	<%
	}
	%>



</body>
</html>