<%@page import="java.util.Map"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	if(session.getAttribute("user") != "Employee") { 
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		
	return;
	} 

	// 값 받아주기
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>상품 수정하기</h1>
	
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
	
	<form
		action="<%=request.getContextPath()%>/admin/adminUpdateGoodsImgAction.jsp"
		method="post" enctype="multipart/form-data" id="imgForm">
		<table>
			<tr>
				<th>상품이미지</th><!-- 이미지까지수정가능하게 해줘야하는데 -->
				<td><input type="hidden" name="goodsNo"
					value="<%=map.get("goodsNo")%>"></td>
				<td><input type="file" name="imgFile" id="imgFile"
					class="form-control"></td>
			</tr>
		</table>
		<button type="button">상품 이미지수정</button>
	</form>

	<form
		action="<%=request.getContextPath()%>/admin/adminGoodsUpdateAction.jsp"
		method="post" id="form">
		<table border="1">
			<tr>
				<th>상품번호</th>
				<td><input type="text" value="<%=map.get("goodsNo")%>"
					name="goodsNo" class="form-control" readonly="readonly"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" value="<%=map.get("goodsName")%>"
					name="goodsName" id="goodsName" class="form-control"></td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td><input type="text" value="<%=map.get("goodsPrice")%>"
					name="goodsPrice" id="goodsPrice" class="form-control"></td>
			</tr>
			<tr>
				<th>상품등록날짜</th>
				<td><input type="text" value="<%=map.get("createDate")%>"
					name="createDate" class="form-control" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>상품수정날짜</th>
				<td><input type="text" value="<%=map.get("updateDate")%>"
					name="updateDate" class="form-control" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>품절여부</th>
				<td><select name="soldOut" class="form-control">
						<%
						if ("Y".equals(map.get("soldOut"))) {
						%>
						<option value="Y">Y</option>
						<option value="N">N</option>
						<%
						} else {
						%>
						<option value="N">N</option>
						<option value="Y">Y</option>
						<%
						}
						%>
				</select></td>
			</tr>
		</table>
		<button type="submit">상품수정</button>
		<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a>

	</form>
</body>
</html>