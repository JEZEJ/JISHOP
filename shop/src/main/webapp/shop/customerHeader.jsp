<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.img-thumbnail {
	padding: .25rem;
	background-color: #fad;
	border: 1px solid #dee2e6;
	border-radius: .25rem;
	max-width: 100%;
	height: auto
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="<%=request.getContextPath()%>/shop/fonts/icomoon/style.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/shop/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/shop/css/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/shop/css/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/shop/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/shop/css/owl.theme.default.min.css">


<link rel="stylesheet" href="<%=request.getContextPath()%>/shop/css/aos.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/shop/css/style.css">
</head>
<body>
	<div class="site-navbar bg-white py-2">

		<div class="search-wrap">
			<div class="container">
				<a href="#" class="search-close js-search-close"><span
					class="icon-close2"></span></a>
				<form action="#" method="post">
					<input type="text" class="form-control"
						placeholder="Search keyword and hit enter...">
				</form>
			</div>
		</div>

					<div class="container">
				<div class="d-flex align-items-center justify-content-between">
					<div class="logo">
						<div class="site-logo">
							<a href="<%=request.getContextPath()%>/shop/index.jsp" class="js-logo-clone">Zebook</a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li><a href="index.jsp">HOME</a></li>
								<li><a href="<%=request.getContextPath()%>/shop/customer/customerGoodsList.jsp">Shop</a></li>
								<li><a href="<%=request.getContextPath()%>/shop/customer/noticeList.jsp">Notice</a></li>
								<li><a href="<%=request.getContextPath()%>/shop/customer/.jsp">QnA</a></li>
								<li><a href="<%=request.getContextPath()%>/contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>
					<div class="icons">
						<a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a> 
						<a href=".jsp" class="icons-btn d-inline-block"><span class="icon-user-o"></span></a><!-- 회원정보보기로 바꿔주기 -->
						<a href="cart.html" class="icons-btn d-inline-block bag"> <span class="icon-shopping-bag"></span> <span class="number">2</span> </a> 
						<a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span class="icon-menu"></span></a>
					</div>
				</div>
			</div>
		</div>
		<br /> <br />
	
	<br/>
</body>
</html>