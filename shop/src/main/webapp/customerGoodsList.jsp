<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int rowPerPage = 1; //한페이지당 보여줄 행수 
int currentPage = 1; //처음 시작할 현재 페이지
int lastPage = 0;

if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

GoodsService goodsService = new GoodsService();
Map<String, Object> map = goodsService.getGoodsListByPage(rowPerPage, currentPage);
lastPage = goodsService.getGoodsListLastPage(rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 인기순,판매량순,높은/낮은 가격순,최신순으로 나오게 해야함 -->
	<h1>상품구매</h1>

	<div>
		<table border="1">
			<thead>
				<tr>
					<th><img
						src="<%=request.getContextPath()%>/upload/<%=map.get("fileName")%>"
						width="200"></th>
				</tr>
				<tr>
					<td>상품명 : <%=map.get("goodsName")%></td>
				</tr>
				<tr>
					<td>가격 : <%=map.get("goodsPrice")%></td>
				</tr>
			</thead>
		</table>
		<!-- 페이지 이전 다음 -->

		<%
		if (currentPage > 1) {
		%>
		<a
			href="<%=request.getContextPath()%>/customerGoodsList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		<%
		}

		if (currentPage < lastPage) {
		%>
		<a
			href="<%=request.getContextPath()%>/customerGoodsList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		<%
		}
		%>
	</div>
</body>
</html>