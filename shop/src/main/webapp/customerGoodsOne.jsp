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
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/customerOne.jsp?customerId=<%=session.getAttribute("id")%>">회원정보</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/customerGoodsList.jsp">상품보기</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/noticeList.jsp">공지사항</a></li>
			<li class="nav-item active"><a class="nav-link" href="">구매내역</a>
			</li>
		</ul>
	</nav>
		<h1>상품 정보</h1>
	<table>
		<tr>
			<th>상품이미지</th>
			<th><img src="<%=request.getContextPath()%>/upload/<%=map.get("fileName")%>" width="200"></th>
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
			
		</tr><!-- 구매하기도 해야함 -->
	</table>
	<a href="<%=request.getContextPath()%>/customerGoodsList.jsp">돌아가기</a>
</body>
</html>