<%@page import="service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원정보수정</h3>
	<form action="<%=request.getContextPath()%>/modifyCustomerAction.jsp"
		method="post">
		<!-- 수정하게되면 action으로 이동해서 처리 -->
		<table border="1">
			<tr>
				<td>ID</td>
				<td><input type="text" value=<%=session.getAttribute("id")%> readonly="readonly"></td> <!-- id는 세션값에 저장되어있으니깐 세션값으로 불러온후 readonly -->
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="customerName" id="customerName"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="customerAddress" id="customerAddress"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="customerTelephone" id="customerTelephone"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="text" name="createDate" id="createDate"></td>
			</tr>
		</table>
	</form>
</body>
</html>