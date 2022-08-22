<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="vo.*"%>
<%@ page import="service.*"%>
<%@ page import="repository.*"%>

<%
// 인코딩
request.setCharacterEncoding("utf-8");

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
</head>
<body>




	<h3>고객 주문 관리</h3>

	<div>
		<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a> 
		<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a>
		<a href="<%=request.getContextPath()%>/admin/employeeManagement.jsp">사원관리</a> 
		<a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a>
		<a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
	</div>
	<br />
		<table border="1">
			<thead>
				<tr>
					<td>주문자아이디</td>
					<td>상품명</td>
					<td>상품수량</td>
					<td>상품가격</td>
					<td>배송주소</td>
					<td>배송상태</td>
					<td>주문날짜</td>
					<td>수정</td>
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
					<td><%=m.get("orderPrice")%></td>
					<td><%=m.get("orderAddr")%></td>
					<td><%=m.get("orderstate")%></td>
					<td><%=m.get("createDateOr")%></td>
					<td><a href="<%=request.getContextPath()%>/admin/adminOrderListOne.jsp?orderNo=<%=m.get("orderNo")%>" class="button">변경</a></td>
					
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
		href="<%=request.getContextPath()%>/admin/adminOrderList.jsp?currentPage=<%=currentPage - 1%>">
		이전 </a>

	<%
	}

	if (currentPage < lastPage) {
	%>

	<a
		href="<%=request.getContextPath()%>/admin/adminOrderList.jsp?currentPage=<%=currentPage + 1%>">
		다음 </a>

	<%
	}
	%>



</body>
</html>