<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@ page import="vo.*"%>
<%@ page import="service.*"%>
<%@ page import="repository.*"%>


<%
// 인코딩 
	request.setCharacterEncoding("utf-8");
	
	// 변수 받아오기
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	
	System.out.println("orderNo : " + orderNo);
	
	OrdersDao ordersDao = new OrdersDao();
	OrdersService ordersService = new OrdersService();
	Map<String, Object> map = ordersService.getOrdersOne(orderNo);
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

	<h1>주문 상세 보기</h1>

			<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/employeeManagement.jsp">사원관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
			
			</li>
		</ul>
	</nav>
	<br />
	<form
		action="<%=request.getContextPath()%>/admin/adminOrderOneUpAction.jsp"
		method="post">
		<table border="1">
			<thead>
				<tr>
					<td>orderNo</td>
					<td>customerId</td>
					<td>orderQuantity</td>
					<td>orderPrice</td>
					<td>orderAddr</td>
					<td>orderState</td>
					<td>goodsName</td>
					<td>goodsPrice</td>
					<td>customerName</td>
					<td>customerTelephone</td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td><%=map.get("orderNo")%> <input type="hidden"
						value="<%=map.get("goodsNo")%>" name="goodsNo" id="goodsNo">
						<input type="hidden" value="<%=map.get("orderNo")%>"
						name="orderNo" id="orderNo"></td>
					<td><%=map.get("customerId")%></td>
					<td><%=map.get("orderQuantity")%></td>
					<td><%=map.get("orderPrice")%></td>
					<td><%=map.get("orderAddr")%></td>
					<td><%=map.get("orderstate")%></td>
					<td><%=map.get("goodsName")%></td>
					<td><%=map.get("goodsPrice")%></td>
					<td><%=map.get("customerName")%></td>
					<td><%=map.get("customerTelephone")%></td>
				</tr>
			</tbody>

		</table>
	</form>

</body>
</html>