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
		<h1>상품 정보</h1>
	<table>
		<tr>
			<th>상품이미지</th>
			<th><img src="<%=request.getContextPath()%>/upload/<%=map.get("fileName")%>"></th>
		</tr>
		<tr>
			<th>상품번호</th>
			<td><%=map.get("goodsNo")%></td>	
		</tr>
		<tr>
			<th>상품명</th>
			<td><%=map.get("goodsName")%></td>	
		</tr>
		<tr>
			<th>상품가격</th>
			<td><%=map.get("goodsPrice")%></td>	
		</tr>
		<tr>
			<th>상품등록날짜</th>
			<td><%=map.get("createDate")%></td>	
		</tr>
		<tr>
			<th>상품수정날짜</th>
			<td><%=map.get("updateDate")%></td>	
		</tr>
		<tr>
			<th>상품품절여부</th>
			<td><%=map.get("soldOut")%></td>	
		</tr>
	</table>
	<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">돌아가기</a>
</body>
</html>