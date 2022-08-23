<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 회원가입</title>
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
<!--  id ck Form -->
<h1> 스텝 회원가입 </h1>
	<form action="<%=request.getContextPath()%>/EmployeeidCheckAction.jsp" method="post">
		<div>
			ID 체크
			<input type="text" name="ckId">
			<button type="submit"> 아이디중복검사 </button>	<!-- 버튼누르면 EmployeeidcheckAction 호출 -->
		</div>
	</form>

	<%
		String ckId="";
		if(request.getParameter("ckId") !=null) {
				ckId = request.getParameter("ckId"); 
		}
	%>
	
	
	<!--  직원가입 Form -->	
	<form action="<%=request.getContextPath()%>/EmployeeidAddAction.jsp" method="post">
		<table border="1">
			<tr>
				<td> employeeId </td>
				<td><input type="text" name="employeeId" id="employeeId" 
				readonly="readonly" value="<%=ckId%>"> <!-- 아이디값이 넘어옴 -->
				</td>
			</tr>
			<tr>					
				<td> employeePass </td>
				<td> <input type="password" name="employeePass" id="employeePass"> </td>
			</tr>	
			<tr>
				<td> employeeName </td>
				<td> <input type="text" name="employeeName" id="employeeName"> </td>
			</tr>		
		</table>
		<button type="submit"> 회원가입 </button>
	</form>
</body>
</html>