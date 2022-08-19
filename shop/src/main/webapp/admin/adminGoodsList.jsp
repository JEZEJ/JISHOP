<%@page import="java.util.ArrayList"%>
<%@page import="vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 상품 이미지 안나옴..

int rowPerPage = 5; //한페이지당 보여줄 행수 
int currentPage = 1; //처음 시작할 현재 페이지
int lastPage = 0;

if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

GoodsService goodsService = new GoodsService();
List<Goods> list = new ArrayList<Goods>();
list = goodsService.getGoodsListByPage(rowPerPage, currentPage); //list보여주기
lastPage = goodsService.getGoodsListLastPage(rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">사원관리</a>
		<a href="<%=request.getContextPath()%>/admin/adminGoodList.jsp">상품관리</a>
		<!-- 상품목록/등록/수정/삭제(주문이 없는경우) -->
		<a href="<%=request.getContextPath()%>/admin/adminOrderList.jsp">주문관리</a>
		<!-- 주문목록/수정 -->
		<a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a>
		<!-- 고객목록/강제탈퇴/비밀번호수정(전달구현x) -->
		<a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
	</div>
	<h1>상품관리</h1>
	<div>
			<table border="1">
				<thead>
					<tr>
						<th>NO</th>
						<th>NAME</th>
						<th>PRICE</th>
						<th>UPDATEDATE</th>
						<th>CREATEDATE</th>
						<th>SOLDOUT</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Goods goods : list) {
					%>
					<tr>
						<td><%=goods.getGoodsNo()%></td>
						<td><a
							href="<%=request.getContextPath()%>/admin/adminGoodsOne.jsp?goodsNo=<%=goods.getGoodsNo()%>"><%=goods.getGoodsName()%></a></td>
						<td><%=goods.getGoodsPrice()%></td>
						<td><%=goods.getUpdateDate()%></td>
						<td><%=goods.getCreateDate()%></td>
						<td><%=goods.getSoldOut()%></td>
						<td>
							<form action="<%=request.getContextPath()%>/admin/adminGoodsSoldoutAction.jsp" method="post">
								<input type="hidden" name="GoodsNo"
									value="<%=goods.getGoodsNo()%>"> <select name="soldOut">
									<%
									if (goods.getSoldOut().equals("N")) {
									%>
									<option>Y</option>
									<option selected="selected">N</option>
									<%
									} else {
									%>
									<option selected="selected">Y</option>
									<option>N</option>
									<%
									}
									%>
								</select>
								<button type="submit">변경</button>
							</form>
						</td>
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
				href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
			<%
			}

			if (currentPage < lastPage) {
			%>
			<a
				href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
			<%
			}
			%>
			<a href="<%=request.getContextPath()%>/admin/addGoodsForm.jsp">상품추가</a>
	</div>
</body>
</html>