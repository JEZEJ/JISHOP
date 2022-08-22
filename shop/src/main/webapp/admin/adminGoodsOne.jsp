<%@page import="service.GoodsService"%>
<%@page import="vo.Goods"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int goodsNo = Integer.parseInt(request.getParameter("goodsNo")); 
	GoodsService goodsService = new GoodsService();
	Map<String, Object> map = goodsService.getGoodsAndImgOne(goodsNo);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 style="text-align: center;">상품 상세페이지</h2>
	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>NAME</th>
				<th>PRICE</th>
				<th>IMG</th>
				<th>UPDATE DATE</th>
				<th>CREATE DATE</th>
				<th>SOLD OUT</th>
			</tr>	
		</thead>
		<tbody>
			<tr>
				<td><%=map.get("goodsNo")%></td>
				<td><%=map.get("goodsName")%></td>
				<td><%=map.get("goodsPrice")%></td>
				<td><img src="<%=request.getContextPath()%>/upload/<%=map.get("fileName")%>" width="200"></td>
				<td><%=map.get("updateDate")%></td>
				<td><%=map.get("createDate")%></td>
				<td><%=map.get("soldOut")%></td>
			</tr>
		</tbody>
	</table>
</body>
</html>