<%@page import="service.CustomerService"%>
<%@page import="vo.Customer"%>
<%@page import="repository.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	
		
	request.setCharacterEncoding("UTF-8"); // 한글 인코딩
	
	String id = request.getParameter("customerId"); //name
	System.out.println("customerOne의 id 값 : " + id);
	// index에서 one페이지로 넘기기위해 customerId=session값을 다시 넣어줌
	// customerOne.jsp?customerId=<%=session.getAttribute("id")
	
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
	<!-- user에 session으로 Customer/Employee를 만들어놨기 때문에 이렇게 주면 로그인 한 값으로 맞는 페이지로 넘어감 -->
	<a href="<%=request.getContextPath()%>/removeCustomerForm.jsp"> 회원탈퇴 </a>

</body>
</html>