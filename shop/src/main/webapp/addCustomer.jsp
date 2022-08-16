<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객회원가입</title>
</head>
<body>
	<!--  id ck Form -->
	<h1> 고객 회원가입 </h1>
	<form action="<%=request.getContextPath()%>/idCheckAction.jsp" method="post">
	
		<div>
			ID 체크
			<input type="text" name="ckId">
			<button type="submit"> 아이디중복검사 </button>
		</div>
	</form>

	<%
		String ckId="";
		if(request.getParameter("ckId") !=null) {
				ckId = request.getParameter("ckId"); 
		}
	%>
	
	<!--  고객가입 Form -->	
	<form action="<%=request.getContextPath()%>/idAddAction.jsp" method="post">
		<table border="1">
			<tr>
				<td> customerId </td>
				<td><input type="text" name="customerId" id="customerId" 
				readonly="readonly" value="<%=ckId%>"> <!-- 아이디값이 넘어옴 -->
				</td>
			</tr>
			<tr>					
				<td> customerPass </td>
				<td> <input type="password" name="customerPass" id="customerPass"> </td>
			</tr>	
			<tr>
				<td> customerName </td>
				<td> <input type="text" name="customerName" id="customerName"> </td>
			</tr>
			<tr>	
				<td> customerAddress</td>
				<td> <input type="text" name="customerAddress" id="customerAddress"> </td>
			</tr>
			<tr>	
				<td> customerTelephone </td>
				<td> <input type="text" name="customerTelephone" id="customerTelephone"> </td>

			</tr>
		</table>
		<button type="submit"> 회원가입 </button>
	</form>
</body>
</html>