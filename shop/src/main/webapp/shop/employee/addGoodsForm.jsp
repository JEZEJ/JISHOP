<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	if(session.getAttribute("user") != "Employee") { 
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		
	return;
	} 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지추가</title>
</head>
<body>

	<form action="<%=request.getContextPath()%>/admin/addGoodsAction.jsp" method="post" enctype="multipart/form-data">
		<h3>상품 등록</h3>
		<table border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="goods_name" id="goods_name"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="goods_price" id="goods_price"></td>
			</tr>
			<tr>
				<td>상품내용</td>
				<td><textarea rows="5" cols="30" name="goods_content" id="goods_content"></textarea></td>
			</tr>
			<tr>
				<td>이미지파일</td>
				<td><input type="file" name="imgFile"></td>
			</tr>
		</table>
		<button type="submit" id="btn">상품등록</button>
	</form>
</body>
</html>
