<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/shop/customerHeader.jsp" %>

<% //상품구매같은 경우는 비회원도 볼수있기때문에 세션주지말고 템플릿줄때 index로 빼주기

	request.setCharacterEncoding("UTF-8");

    if (session.getAttribute("id") == null) { //id값이 null이라면 (session에 값이 없다면 login하지않은것)
	response.sendRedirect(request.getContextPath() + "/shop/loginForm.jsp"); // 그럼 로그인을 위해서 로그인form으로 넘어감   
	return;
    }
	
	int rowPerPage = 20; //한페이지당 보여줄 행수 
	
	if (request.getParameter("rowPerPage") != null) {
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	}
	
	int currentPage = 1; //처음 시작할 현재 페이지
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int lastPage = 0;
	
	GoodsService goodsService = new GoodsService();
	
	List<Map<String, Object>> list = goodsService.getGoodsListByPage(rowPerPage, currentPage);
	lastPage = goodsService.getGoodsListLastPage(rowPerPage);
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

	<h1>상품구매</h1>
	
	<div>
		<!-- 인기순,판매량순,높은/낮은 가격순,최신순으로 나오게 해야함 -->
		<a href=""> 인기순 </a> 
		<a href=""> 판매량순 </a> 
		<a href=""> 낮은가격순 </a> 
		<a href=""> 높은가격순 </a> 
		<a href=""> 최신순 </a>
	</div>

	 <table class="table table-bordered">
		<tr>
			<%
			int i = 1;
			for (Map<String, Object> m : list) {
			%>
			<td>
				<div>
					<a
						href="<%=request.getContextPath()%>/shop/customer/customerGoodsOne.jsp?goodsNo=<%=m.get("goodsNo")%>">
						<img
						src='<%=request.getContextPath()%>/upload/<%=m.get("filename")%>'
						width="200" height="200" class="img-thumbnail">
					</a>
				</div>
				<div><%=m.get("goodsName")%></div>
				<div><%=m.get("goodsPrice")%></div>

			</td>

			<%
			if (i % 4 == 0) {
			%>
		</tr>
		<tr>
			<%
			}
			i++;

			}

			int tdCnt = 4 - (list.size() % 4);
			if (tdCnt == 4) {
			tdCnt = 0;
			}

			for (int j = 0; j < tdCnt; j++) {
			%>
			<td>&nbsp;</td>

			<%
			}
			%>

		</tr>
	</table>

	<%
	if (currentPage > 1) {
	%>
	<a
		href="<%=request.getContextPath()%>/shop/customer/customerGoodsList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
	<%
	}

	if (currentPage < lastPage) {
	%>
	<a
		href="<%=request.getContextPath()%>/shop/customer/customerGoodsList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
	<%
	}
	%>
<div><%@ include file="/shop/customerFooter.jsp" %></div>
</body>
</html>