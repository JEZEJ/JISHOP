<%@page import="vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<%@ page import="service.*"%>


<%
// ...

// 변수받아오기
String Pass = request.getParameter("Pass");
String customerId = (String) session.getAttribute("id");

// 디버깅
System.out.println("비밀번호 : " + Pass);
System.out.println("아이디 : " + customerId);

// 1. Customer용
// Customer 객체 만들기	
Customer paramCustomer = new Customer();
paramCustomer.setCustomerId(customerId);
paramCustomer.setCustomerPass(Pass);

// CustomerService 객체 만들기
CustomerService customerService = new CustomerService();
customerService.removeCustomer(paramCustomer);

response.sendRedirect(request.getContextPath() + "/logout.jsp");
%>
