<%@page import="java.util.Map"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/shop/customerHeader.jsp"%>
<%
int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));

GoodsService goodsService = new GoodsService();
Map<String, Object> map = goodsService.getGoodsAndImgOne(goodsNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="site-wrap">

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="<%=request.getContextPath()%>/shop/index.jsp">Home</a> <span
							class="mx-2 mb-0">/</span> <a
							href="<%=request.getContextPath()%>/shop/customer/customerGoodsList.jsp">Shop</a>
						<span class="mx-2 mb-0">/</span> <strong class="text-black"><%=map.get("goodsName")%></strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="item-entry">
							<p class="product-item md-height bg-gray d-block">
								<img
									src="<%=request.getContextPath()%>/upload/<%=map.get("fileName")%>"
									width="300" alt="Image" class="img-fluid">
							</p>
						</div>

					</div>
					<div class="col-md-6">
						<h2 class="text-black"><%=map.get("goodsName")%></h2>
						<p><%=map.get("goodsContent")%></p>
						<p>
							<strong class="text-primary h4"><%=map.get("goodsPrice")%></strong>
						</p>

						<div class="mb-5">
							<div class="input-group mb-3" style="max-width: 120px;">
								<div class="input-group-prepend">
									<button class="btn btn-outline-primary js-btn-minus"
										type="button">&minus;</button>
								</div>
								<input type="text" class="form-control text-center" value="1"
									placeholder="" aria-label="Example text with button addon"
									aria-describedby="button-addon1">
								<div class="input-group-append">
									<button class="btn btn-outline-primary js-btn-plus"
										type="button">&plus;</button>
								</div>
							</div>

						</div>
						<p>
							<a href="cart.html"
								class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary">Add
								To Cart</a>
						</p>

					</div>
				</div>
			</div>
		</div>
		<div><%@ include file="/shop/customerFooter.jsp"%></div>
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