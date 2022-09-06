<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="repository.EmployeeDao"%>
<%@page import="service.EmployeeService"%>
<%@page import="vo.Employee"%>

 <%
	   // 인코딩
 	   request.setCharacterEncoding("UTF-8");
	
 	   // loginForm에서 내가 text에 입력한값이 넘어옴
	   String employeeId = request.getParameter("employeeId");
	   String employeePass = request.getParameter("employeePass");
	
	   // 디버깅
	   System.out.println("직원아이디 : " + employeeId);
	   System.out.println("직원비밀번호 : " + employeePass);
	
	   // Employee 객체 만들기
	   Employee myEmployee = new Employee();
	   myEmployee.setEmployeeId(employeeId); // 입력한값을 넣어줌
	   myEmployee.setEmployeePass(employeePass); // 입력한값을 넣어줌
	   
	   // EmployeeService 객체 만들기
	   EmployeeService employeeService = new EmployeeService();
	
	   //  메서드 사용
	   Employee login = employeeService.loginEmployee(myEmployee);
	   System.out.println("action login : " + login);
	
	   if (login != null) {
	   	System.out.println("로그인 성공!");
	   	session.setAttribute("user", "Employee"); // 세션에 넣는거 
	   	session.setAttribute("id", login.getEmployeeId());
	   	session.setAttribute("name", login.getEmployeeName());
	   	// 로그인이 성공하면 정보를 볼수있는 adminIndex 이동 (customer과 다른정보이므로 adminIndex)
	   	response.sendRedirect(request.getContextPath() + "/shop/employee/adminIndex.jsp"); // 다이렉트
	
	   } else { // 로그인 실패
		   
		System.out.println("로그인 실패!");
		// 로그인실패시 loginForm으로가서 다시 재로그인해야함
	   	response.sendRedirect(request.getContextPath() + "/shop/loginForm.jsp");

	   }
   %>