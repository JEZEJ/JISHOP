<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<style>
#Login {
	background-color:ghostWhite;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 빈칸검사 -->
</head>

<body>
	<div id="Login">
		<h1>고객 로그인</h1> <!-- 회원가입 한 모든 회원 로그인 가능 -->
		<form action="<%=request.getContextPath()%>/customerloginAction.jsp" method="post">
			<fieldset>
				<legend> 쇼핑몰 고객 로그인 </legend>
				<table border="1">
					<tr>
						<td>ID</td>
						<td><input type="text" name="customerId" id="customerId"></td>
					</tr> <!-- 입력하면 customerId값으로 넘어감 // id=ajax설정-->
					
					<tr>
						<td>PW</td>
						<td><input type="password" name="customerPass" id="customerPass"></td>
					</tr><!-- customerPass값으로 넘어감 // id=ajax설정 -->
				</table>
				<button type="submit" id="customerBtn">고객 로그인</button>
				<a href="<%=request.getContextPath()%>/addCustomer.jsp">일반회원가입</a><!-- 회원가입버튼 누르면 addCustomer로 넘어감 -->
			</fieldset>
		</form>
	</div>
	
	<div id="Login">
		<h1>관리자 로그인</h1> <!-- 관리자 active권한이 Y인 사람만 로그인 가능 -->
		<form id="employeeForm"
			action="<%=request.getContextPath()%>/employeeloginAction.jsp"
			method="post">
			<fieldset>
				<legend> 관리자 로그인</legend>
				<table border="1">
					<tr>
						<td>ID</td>
						<td><input type="text" name="employeeId" id="employeeId"></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" name="employeePass"
							id="employeePass"></td>
					</tr>
				</table>
				<button type="button" id="employeeBtn">스텝 로그인</button>
				<a href="<%=request.getContextPath()%>/addEmployee.jsp">스텝회원가입</a>
				<p>※ 직원인 경우 관리자가 가입승인 후 로그인가능합니다</p>
			</fieldset>
		</form>
	</div>
</body>

<script>
		$('#customerBtn').click(function() {
			if ($('#customerId').val() == '') {
				window.alert('고객 아이디를 입력하세요');
			} else if ($('#customerPass').val() == '') {
				window.alert('고객 비밀번호를 입력하세요');
			} else {
				customerForm.submit();
			}
		});
	
		$('#employeeBtn').click(function() {
			if ($('#employeeId').val() == '') {
				window.alert('스텝 아이디를 입력하세요');
			} else if ($('#employeePass').val() == '') {
				window.alert('스텝 비밀번호를 입력하세요');
			} else {
				employeeForm.submit();
			}
		});
</script>

</html>