<%@page import="service.GoodsService"%>
<%@page import="vo.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// 값받기
	Goods goods = new Goods();
	goods.setGoodsNo(Integer.parseInt(request.getParameter("goodsNo")));
	goods.setGoodsName(request.getParameter("goodsName"));
	goods.setGoodsPrice(Integer.parseInt(request.getParameter("goodsPrice")));
	goods.setSoldOut(request.getParameter("soldOut"));
	
	
	// 메서드 호출
	GoodsService goodsService = new GoodsService();
	boolean updateGoods = goodsService.modifyGoods(goods);
	
	if(updateGoods){
		System.out.println("상품 추가 성공 !");
		response.sendRedirect(request.getContextPath() + "/admin/adminGoodsUpdateForm.jsp?goodsNo=" + goods.getGoodsNo());
	} else {
		System.out.println("상품 추가 실패 !");
		
		response.sendRedirect(request.getContextPath() + "/admin/adminGoodsUpdateForm.jsp?goodsNo=" + goods.getGoodsNo() + "&errorMsg=update Fail");
	}
%>