<%@page import="service.GoodsService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//상품구매같은 경우는 비회원도 볼수있기때문에 세션주지말고 템플릿줄때 index로 빼주기

request.setCharacterEncoding("UTF-8");

int rowPerPage = 10; //한페이지당 보여줄 행수 

if (request.getParameter("rowPerPage") != null) {
	rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
}

int currentPage = 1; //처음 시작할 현재 페이지
if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

int lastPage = 0;

GoodsService goodsService = new GoodsService();

List<Map<String, Object>> list = goodsService.getGoodsListByPage(rowPerPage, currentPage);
lastPage = goodsService.getGoodsListLastPage(rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>ShopMax &mdash; Colorlib e-Commerce Template</title>
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
							<a href="index.html" class="js-logo-clone">ShopMax</a>
						</div>
					</div>
					<div class="main-nav d-none d-lg-block">
						<nav class="site-navigation text-right text-md-center"
							role="navigation">
							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li class="has-children "><a href="index.html">Home</a>
									<ul class="dropdown">
										<li><a href="#">Menu One</a></li>
										<li><a href="#">Menu Two</a></li>
										<li><a href="#">Menu Three</a></li>
										<li class="has-children"><a href="#">Sub Menu</a>
											<ul class="dropdown">
												<li><a href="#">Menu One</a></li>
												<li><a href="#">Menu Two</a></li>
												<li><a href="#">Menu Three</a></li>
											</ul></li>
									</ul></li>

								<li class="active"><a href="shop.html">Shop</a></li>
								<li><a href="#">Catalogue</a></li>
								<li><a href="#">New Arrivals</a></li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>
					<div class="icons">
						<a href="#" class="icons-btn d-inline-block js-search-open"><span
							class="icon-search"></span></a> <a href="#"
							class="icons-btn d-inline-block"><span class="icon-heart-o"></span></a>
						<a href="cart.html" class="icons-btn d-inline-block bag"> <span
							class="icon-shopping-bag"></span> <span class="number">2</span>
						</a> <a href="#"
							class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
							class="icon-menu"></span></a>
					</div>
				</div>
			</div>
		</div>

		<div class="site-blocks-cover inner-page" data-aos="fade">
			<div class="container">
				<div class="row">
					<div class="col-md-6 ml-auto order-md-2 align-self-start">
						<div class="site-block-cover-content">
							<h2 class="sub-title">#New Book Collection 2022</h2>
							<h1>Arrivals Sales</h1>
							<p>
								<a href="#" class="btn btn-black rounded-0">Shop Now</a>
							</p>
						</div>
					</div>
					<div class="col-md-6 order-1 align-self-end">
						<img src="images/model_4.png" alt="Image" class="img-fluid">
					</div>
				</div>
			</div>
		</div>

		<div class="custom-border-bottom py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Shop</strong>
					</div>
				</div>
			</div>
		</div>


		<div class="site-section">
			<div class="container">

				<div class="row mb-5">
					<div class="col-md-9 order-1">

						<div class="row align">
							<div class="col-md-12 mb-5">
								<div class="float-md-left">
									<h2 class="text-black h5">Shop All</h2>
								</div>
								<div class="d-flex">
									<div class="dropdown mr-1 ml-md-auto">
										<button type="button"
											class="btn btn-white btn-sm dropdown-toggle px-4"
											id="dropdownMenuOffset" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Search</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuOffset">
											<a class="dropdown-item" href="#">최신순</a> <a
												class="dropdown-item" href="#">인기순</a> <a
												class="dropdown-item" href="#">낮은가격순</a>
												<a class="dropdown-item" href="#">높은가격순</a>
												
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="row mb-5">
							<%
							int i = 1;
							for (Map<String, Object> m : list) {
							%>
							<div class="col-lg-6 col-md-6 item-entry mb-4">
							<p class="product-item md-height bg-gray d-block">
								<img
									src="<%=request.getContextPath()%>/upload/<%=m.get("filename")%>"
									alt="Image" class="img-fluid"></p>
								<h2 class="item-title">
									<a
										href="<%=request.getContextPath()%>/shop/customer/customerGoodsOne.jsp?goodsNo=<%=m.get("goodsNo")%>"><%=m.get("goodsName")%></a>
								</h2>
								<strong class="item-price"><%=m.get("goodsPrice")%></strong>
							</div>
							<%
							if (i % 2 == 0) {
							%>

							<%
							}
							i++;
							}

							int tdCnt = 2 - (list.size() % 2);
							if (tdCnt == 2) {
							tdCnt = 0;
							}

							for (int j = 0; j < tdCnt; j++) {
							%>
							<div>&nbsp;</div>

							<%
							}
							%>
						</div>

						<%
						if (currentPage > 1) {
						%>
						<a
							href="<%=request.getContextPath()%>/shop/customer/customerGoodsList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
						<%
						}

						if (currentPage < lastPage) {
						%>
						<a
							href="<%=request.getContextPath()%>/shop/customer/customerGoodsList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
						<%
						}
						%>
					</div>

					<div class="col-md-3 order-2 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
							<ul class="list-unstyled mb-0">
								<li class="mb-1"><a href="#" class="d-flex"><span>Novel</span>
										<span class="text-black ml-auto">(2,220)</span></a></li>
								<li class="mb-1"><a href="#" class="d-flex"><span>Self-help</span>
										<span class="text-black ml-auto">(2,550)</span></a></li>
								<li class="mb-1"><a href="#" class="d-flex"><span>Children</span>
										<span class="text-black ml-auto">(2,124)</span></a></li>
							</ul>
						</div>

						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Filter
									by Price</h3>
								<div id="slider-range" class="border-primary"></div>
								<input type="text" name="text" id="amount"
									class="form-control border-0 pl-0 bg-white" disabled="" />
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
								<label for="s_sm" class="d-flex"> <input type="checkbox"
									id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small
										(2,319)</span>
								</label> <label for="s_md" class="d-flex"> <input
									type="checkbox" id="s_md" class="mr-2 mt-1"> <span
									class="text-black">Medium (1,282)</span>
								</label> <label for="s_lg" class="d-flex"> <input
									type="checkbox" id="s_lg" class="mr-2 mt-1"> <span
									class="text-black">Large (1,392)</span>
								</label>
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
								<a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-danger color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Red (2,429)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-success color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Green (2,298)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-info color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Blue (1,075)</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-primary color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">Purple (1,075)</span>
								</a>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="title-section mb-5">
					<h2 class="text-uppercase">
						<span class="d-block">Discover</span> The Collections
					</h2>
				</div>
				<div class="row align-items-stretch">
					<div class="col-lg-8">
						<div class="product-item sm-height full-height bg-gray">
							<a href="#" class="product-category">Women <span>25
									items</span></a> <img src="images/model_4.png" alt="Image"
								class="img-fluid">
						</div>
					</div>
					<div class="col-lg-4">
						<div class="product-item sm-height bg-gray mb-4">
							<a href="#" class="product-category">Men <span>25
									items</span></a> <img src="images/model_5.png" alt="Image"
								class="img-fluid">
						</div>

						<div class="product-item sm-height bg-gray">
							<a href="#" class="product-category">Shoes <span>25
									items</span></a> <img src="images/model_6.png" alt="Image"
								class="img-fluid">
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer class="site-footer custom-border-top">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
						<h3 class="footer-heading mb-4">Promo</h3>
						<a href="#" class="block-6"> <img src="images/about_1.jpg"
							alt="Image placeholder" class="img-fluid rounded mb-4">
							<h3 class="font-weight-light  mb-0">Finding Your Perfect
								Shirts This Summer</h3>
							<p>Promo from July 15 &mdash; 25, 2019</p>
						</a>
					</div>
					<div class="col-lg-5 ml-auto mb-5 mb-lg-0">
						<div class="row">
							<div class="col-md-12">
								<h3 class="footer-heading mb-4">Quick Links</h3>
							</div>
							<div class="col-md-6 col-lg-4">
								<ul class="list-unstyled">
									<li><a href="#">Sell online</a></li>
									<li><a href="#">Features</a></li>
									<li><a href="#">Shopping cart</a></li>
									<li><a href="#">Store builder</a></li>
								</ul>
							</div>
							<div class="col-md-6 col-lg-4">
								<ul class="list-unstyled">
									<li><a href="#">Mobile commerce</a></li>
									<li><a href="#">Dropshipping</a></li>
									<li><a href="#">Website development</a></li>
								</ul>
							</div>
							<div class="col-md-6 col-lg-4">
								<ul class="list-unstyled">
									<li><a href="#">Point of sale</a></li>
									<li><a href="#">Hardware</a></li>
									<li><a href="#">Software</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3">
						<div class="block-5 mb-5">
							<h3 class="footer-heading mb-4">Contact Info</h3>
							<ul class="list-unstyled">
								<li class="address">203 Fake St. Mountain View, San
									Francisco, California, USA</li>
								<li class="phone"><a href="tel://23923929210">+2 392
										3929 210</a></li>
								<li class="email">emailaddress@domain.com</li>
							</ul>
						</div>

						<div class="block-7">
							<form action="#" method="post">
								<label for="email_subscribe" class="footer-heading">Subscribe</label>
								<div class="form-group">
									<input type="text" class="form-control py-4"
										id="email_subscribe" placeholder="Email"> <input
										type="submit" class="btn btn-sm btn-primary" value="Send">
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row pt-5 mt-5 text-center">
					<div class="col-md-12">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="icon-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>

				</div>
			</div>
		</footer>
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