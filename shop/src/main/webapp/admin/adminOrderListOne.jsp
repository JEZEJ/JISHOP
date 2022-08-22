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

System.out.println(orderNo + "<-orderNo");

OrdersDao ordersDao = new OrdersDao();
OrdersService ordersService = new OrdersService();
Map<String, Object> map = ordersService.getOrdersOne(orderNo);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<h1>주문 상세 보기</h1>

	<div>

		<a href="<%=request.getContextPath()%>/admin/employeeList.jsp">
			사원관리 </a> <a
			href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">
			상품관리 </a> <a
			href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">
			고객관리 </a> <a
			href="<%=request.getContextPath()%>/admin/adminOrderList.jsp">
			주문관리 </a> <a href="<%=request.getContextPath()%>/noticeList.jsp">
			공지관리 </a>

	</div>
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
		<button type="submit">수정완료</button>
	</form>

</body>
</html>