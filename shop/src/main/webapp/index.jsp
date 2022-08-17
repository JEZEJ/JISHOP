<%@page import="repository.CustomerDao"%>
<%@page import="service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
       
<%
	if(session.getAttribute("user") == null) { 
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
			
		return;
	} 	
	// 로그인한 session이 없으면 loginForm.jsp를 보여줌
	
	//String id = request.getParameter("id");
%>    
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%=session.getAttribute("name") %>(<%=session.getAttribute("id") %>)님 반갑습니다
	<br>
	<!-- <input type="hidden" id="id" name="id" value="< =session.getAttribute("id")%>"> -->
	<a href="<%=request.getContextPath()%>/logout.jsp"> 로그아웃 </a>
	<a href="<%=request.getContextPath()%>/customerOne.jsp?customerId=<%=session.getAttribute("id")%>">회원정보</a>
	<a href="">구매내역</a>
	
</body>
</html>