<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
	<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
body {
	background-color: #F3EBF6;
	font-family: 'Ubuntu', sans-serif;
}

.main1 {

	background-color: #FFFFFF;
	width: 400px;
	height: 400px;
	margin: 7em auto;
	border-radius: 1.5em;
	box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
}
.main2 {
	background-color: #FFFFFF;
	width: 400px;
	height: 400px;
	margin: 7em auto;
	border-radius: 1.5em;
	box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
}

.sign {
	padding-top: 40px;
	color: #8C55AA;
	font-family: 'Ubuntu', sans-serif;
	font-weight: bold;
	font-size: 23px;
}

.un {
	width: 76%;
	color: rgb(38, 50, 56);
	font-weight: 700;
	font-size: 14px;
	letter-spacing: 1px;
	background: rgba(136, 126, 126, 0.04);
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.02);
	margin-bottom: 50px;
	margin-left: 46px;
	text-align: center;
	margin-bottom: 27px;
	font-family: 'Ubuntu', sans-serif;
}

form.form1 {
	padding-top: 40px;
}

.pass {
	width: 76%;
	color: rgb(38, 50, 56);
	font-weight: 700;
	font-size: 14px;
	letter-spacing: 1px;
	background: rgba(136, 126, 126, 0.04);
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.02);
	margin-bottom: 50px;
	margin-left: 46px;
	text-align: center;
	margin-bottom: 27px;
	font-family: 'Ubuntu', sans-serif;
}

.un:focus, .pass:focus {
	border: 2px solid rgba(0, 0, 0, 0.18) !important;
}

.submit {
	text-align:center;
	cursor: pointer;
	border-radius: 5em;
	color: #fff;
	background: linear-gradient(to right, #ec6f66, #f3a183);
	border: 0;
	padding-left: 40px;
	padding-right: 40px;
	padding-bottom: 10px;
	padding-top: 10px;
	font-family: 'Ubuntu', sans-serif;
	margin-left: 35%;
	font-size: 13px;
	box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}

.signin {
	text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
	color: #E1BEE7;
	padding-top: 15px;
}
.memo{

font-size:15px;
color : red;
text-align:center;
}

a {
	text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
	color: #E1BEE7;
	text-decoration: none
}

@media ( max-width : 600px) {
	.main {
		border-radius: 0px;
	}
}
</style>
</head>
<body>
	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login-form-1">
				<div class="main1">
					<p class="sign" align="center">회원 로그인</p>
					<form class="form1" action="<%=request.getContextPath()%>/shop/customer/customerloginAction.jsp"
					method="post" >
						<input class="un " type="text" align="center" placeholder="YourID" name="customerId" id="customerId">
						<!-- 입력하면 customerId값으로 넘어감 // id=ajax설정-->
						<input class="pass" type="password" align="center" placeholder="Your Password" name="customerPass" id="customerPass">
							
							<input class="submit" type="submit" class="btnSubmit" value="Login"
							id="customerBtn">
							
						<p class="signin" align="center">
							<a href="<%=request.getContextPath()%>/shop/customer/addCustomer.jsp">customer Sign up</a>
							<!-- 회원가입버튼 누르면 addCustomer로 넘어감 -->
						</p>
					</form>
				</div>
			</div>
			<div class="col-md-6 login-form-2">
				<div class="main2">
					<p class="sign" align="center">직원 로그인</p>
					<form class="form1" action="<%=request.getContextPath()%>/shop/employee/employeeloginAction.jsp" method="post">
						<input class="un " type="text" align="center" placeholder="Your Id" name="employeeId" id="employeeId">
						<input class="pass" type="password" align="center" placeholder="Your Password" name="employeePass" id="employeePass">
							<input class="submit" type="submit" class="btnSubmit" value="Login"
							id="employeeBtn">
							
						<p class="signin" align="center"> 
						<a href="<%=request.getContextPath()%>/shop/employee/addEmployee.jsp">employee Sign up</a> </p>
						<p class="memo">※ 직원인 경우 관리자가 가입승인 후 로그인가능합니다</p>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	//고객 빈칸검사
	$('#customerBtn').click(function() {
		if ($('#customerId').val() == '') {
			window.alert('고객 아이디를 입력하세요');
		} else if ($('#customerPass').val() == '') {
			window.alert('고객 비밀번호를 입력하세요');
		} else {
			customerForm.submit();
		}
	});

	//스태프 빈칸검사
	$('#employeeBtn').click(function() {
		if ($('#employeeId').val() == '') {
			window.alert('직원 아이디를 입력하세요');
		} else if ($('#employeePass').val() == '') {
			window.alert('직원 비밀번호를 입력하세요');
		} else {
			employeeForm.submit();
		}
	});
</script>
</html>