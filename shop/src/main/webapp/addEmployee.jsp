<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원회원가입</title>
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