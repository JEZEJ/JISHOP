<%@page import="service.CustomerService"%>
<%@page import="vo.Customer"%>
<%@page import="repository.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("customerId"); //name
	
	CustomerService customerService = new CustomerService(); //서비스 안에 DAO호출기능이 있으므로 서비스만 호출해주면 DAO 자동실행
	
	Customer customer = new Customer();
	customer = customerService.customerOne(id);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>정보관리</h3>
	<table border="1">
		<tr>
			<td>ID</td>
			<td><%=customer.getCustomerId()%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=customer.getCustomerName() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=customer.getCustomerAddress()%></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=customer.getCustomerTelephone()%></td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><%=customer.getCreateDate()%></td>
		</tr>
		
	</table>
	<a href="<%=request.getContextPath()%>/modify<%=session.getAttribute("user")%>Form.jsp"> 정보수정 </a>
	<a href="<%=request.getContextPath()%>/remove<%=session.getAttribute("user")%>Form.jsp"> 회원탈퇴 </a>

</body>
</html>