<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (session.getAttribute("user") == null) {
	response.sendRedirect(request.getContextPath() + "/loginForm.jsp");

	return;
}
// 로그인한 session이 없으면 loginForm.jsp를 보여줌
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>정보관리</h3>
	<table border="1">
		<tr>
			<td>ID</td>
			<td><%=session.getAttribute("id")%></td>
		</tr>
		<tr>
			<td>고객명</td>
			<td><input type="text"
				placeholder="<%=session.getAttribute("name")%>"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text"
				placeholder="<%=session.getAttribute("address")%>"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text"
				placeholder="<%=session.getAttribute("telephone")%>"></td>
		</tr>
		<tr>
			<td>가입날짜</td>
			<td><%=session.getAttribute("createDate")%></td>
		</tr>
	</table>

	<a
		href="<%=request.getContextPath()%>/remove<%=session.getAttribute("user")%>Form.jsp">
		회원탈퇴 </a>

</body>
</html>