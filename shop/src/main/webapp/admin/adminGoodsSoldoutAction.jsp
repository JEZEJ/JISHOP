

<%@page import="service.GoodsService"%>
<%@page import="vo.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");			

	String soldOut = request.getParameter("soldOut"); // select name = active값을 받아옴
	int GoodsNo = Integer.parseInt(request.getParameter("GoodsNo")); // name값을 받아옴
	
	Goods goods = new Goods();
	GoodsService goodsService = new GoodsService();
	
	goods.setSoldOut(soldOut);
	goods.setGoodsNo(GoodsNo);
	
	int row = goodsService.GoodssoldOut(goods);
	
	if(row != 0){
		
		response.sendRedirect(request.getContextPath()+"/admin/adminGoodsList.jsp");
		
	} else {
		
		response.sendRedirect(request.getContextPath()+"/admin/adminGoodsList.jsp");
	}

%>
