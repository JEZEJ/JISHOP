<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 로그인하지않은 모든사람은 index에서 확인만 할수있다
if (session.getAttribute("id") == null) { //id값이 null이라면 (session에 값이 없다면 login하지않은것)
	response.sendRedirect(request.getContextPath() + "/shop/loginForm.jsp"); // 그럼 로그인을 위해서 로그인form으로 넘어감   
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zebook</title>
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
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">


<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="site-wrap">

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
							<a href="index.jsp" class="js-logo-clone">Zebook</a>
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

		<!-- 서점 광고 start -->
		<div id="demo" class="carousel slide" data-ride="carousel"
			style="text-align: center">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/adv2.PNG" alt="advertisement2"
						class="img-thumbnail">
				</div>
				<div class="carousel-item">
					<img src="images/adv4.PNG" alt="advertisement4"
						class="img-thumbnail">
				</div>
				<div class="carousel-item">
					<img src="images/adv3.PNG" alt="advertisement3"
						class="img-thumbnail">
				</div>
				<div class="carousel-item">
					<img src="images/adv5.PNG" alt="advertisement5"
						class="img-thumbnail">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>

		</div>
		<!-- 서점광고 end -->


		<!-- best seller 보여주기 -->
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="title-section mb-5 col-12">
						<h2 class="text-uppercase">Weekly BestSeller</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-6 item-entry mb-4">
						<a href="#" class="product-item md-height bg-gray d-block"> <img
							src="images/아몬드.png" alt="Image" class="img-fluid">
						</a>
						<h2 class="item-title">
							<a href="#">[도서] 아몬드</a>
						</h2>
						<strong class="item-price">12,000</strong>

						<div class="star-rating">
							<span class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span>
						</div>

					</div>
					<div class="col-lg-4 col-md-6 item-entry mb-4">
						<a href="#" class="product-item md-height bg-gray d-block"> <img
							src="images/미드나잇 라이브러리.png" alt="Image" class="img-fluid">
						</a>
						<h2 class="item-title">
							<a href="#">[도서] 미드나잇 라이브러리</a>
						</h2>
						<strong class="item-price"><del>15,500</del>14,220</strong>

						<div class="star-rating">
							<span class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span>
						</div>

					</div>

					<div class="col-lg-4 col-md-6 item-entry mb-4">
						<a href="#" class="product-item md-height bg-gray d-block"> <img
							src="images/불편한편의점2.png" alt="Image" class="img-fluid">
						</a>
						<h2 class="item-title">
							<a href="#">[도서] 불편한 편의점2</a>
						</h2>
						<strong class="item-price"><del>14,500</del>12,600</strong>

						<div class="star-rating">
							<span class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span>
						</div>

					</div>

					<div class="col-lg-4 col-md-6 item-entry mb-4">
						<a href="#" class="product-item md-height bg-gray d-block"> <img
							src="images/트렌드코리아.png" alt="Image" class="img-fluid">
						</a>
						<h2 class="item-title">
							<a href="#">[도서] 트렌드코리아 2022</a>
						</h2>
						<strong class="item-price"><del>20,000</del>18,600</strong>

						<div class="star-rating">
							<span class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span>
						</div>

					</div>

					<div class="col-lg-4 col-md-6 item-entry mb-4">
						<a href="#" class="product-item md-height bg-gray d-block"> <img
							src="images/자바의정석.png" alt="Image" class="img-fluid">
						</a>
						<h2 class="item-title">
							<a href="#">[도서] 자바의 정석</a>
						</h2>
						<strong class="item-price">22,600</strong>

						<div class="star-rating">
							<span class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span>
						</div>

					</div>

					<div class="col-lg-4 col-md-6 item-entry mb-4">
						<a href="#" class="product-item md-height bg-gray d-block"> <img
							src="images/체리새우 비밀글입니다.png" alt="Image" class="img-fluid">
						</a>
						<h2 class="item-title">
							<a href="#">[도서] 체리새우: 비밀글입니다</a>
						</h2>
						<strong class="item-price"><del>16,500</del>12,800</strong>

						<div class="star-rating">
							<span class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span> <span
								class="icon-star2 text-warning"></span>

						</div>

					</div>


				</div>
			</div>
		</div>

		<div class="site-blocks-cover inner-page py-5" data-aos="fade">
			<div class="container">
				<div class="row">
					<div class="col-md-6 ml-auto order-md-2 align-self-start">
						<div class="site-block-cover-content">
							<h2 class="sub-title">#2022 New Books</h2>
							<h1>New Book</h1>
							<p>
								<a href="#" class="btn btn-black rounded-0">Shop Now</a>
							</p>
						</div>
					</div>
					<div class="col-md-6 order-1 align-self-end">
						<img src="책사진넣어주기" alt="Image" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
<div><%@ include file="customerFooter.jsp" %></div>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>

	<script src="js/main.js"></script>
</body>
</html>