<%@page import="service.CustomerService"%>
<%@page import="vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 인코딩
	request.setCharacterEncoding("UTF-8");

	// 변수 받아오기
	String customerId = request.getParameter("customerId");
	String customerPass = request.getParameter("customerPass");
	String customerName = request.getParameter("customerName");
	String customerAddress = request.getParameter("addr");
	String customerDetailAddress = request.getParameter("detailAddr");
	String customerTelephone = request.getParameter("customerTelephone");
		
	// Customer 객체 생성 후 값들 넣어주기	
	Customer paramCustomer = new Customer();
	paramCustomer.setCustomerId(customerId);
	paramCustomer.setCustomerPass(customerPass);
	paramCustomer.setCustomerName(customerName);
	paramCustomer.setCustomerAddress(customerAddress);
	paramCustomer.setCustomerDetailAddress(customerDetailAddress);
	paramCustomer.setCustomerTelephone(customerTelephone);
	
	System.out.println("내가 회원가입하기위해 입력한 값 : "+paramCustomer);
	//update,create값은 now()로 지정해서 안들어감
	//[customerId=asdf, customerPass=asdf, customerName=asdf, customerAddress=asdf, customerTelephone=adsf, updateDate=null, createDate=null]
	
	// CustomerService 객체 생성 후 메서드실행수 Customer객체 넣어주기
	CustomerService customerService = new CustomerService();
	customerService.signInCustomer(paramCustomer);
	
	//회원가입이 완료되면 로그인폼으로 돌아가기
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
	
%>