<%@page import="service.CustomerService"%>
<%@page import="vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	// 아이디값...받아줘야하는데...
	
	// 인코딩
	request.setCharacterEncoding("UTF-8");

	//변수 받아주기
	String customerName = request.getParameter("customerName");
	String customerAddress = request.getParameter("addr");
	String customerDetailAddress = request.getParameter("detailAddr");
	String customerTelephone = request.getParameter("customerTelephone");
	
	//Customer 객체 생성 후 값들 넣어주기
	Customer paramCustomer = new Customer();
	paramCustomer.setCustomerName(customerName);
	paramCustomer.setCustomerAddress(customerAddress);
	paramCustomer.setCustomerDetailAddress(customerDetailAddress);
	paramCustomer.setCustomerTelephone(customerTelephone);
	
	System.out.println("회원 정보 수정하기위에 넣어준값 : " + paramCustomer);
	
	CustomerService customerService = new CustomerService();
	customerService.modifyCustomer(paramCustomer);
	
	response.sendRedirect(request.getContextPath()+"/customerOne.jsp");
		
%>